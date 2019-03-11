package com.kh.makeit.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.admin.model.service.AdminService;
import com.kh.makeit.common.PageFactory;
import com.kh.makeit.member.model.service.MemberService;

@Controller
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	
	private Logger logger = Logger.getLogger(AdminController.class);
	
	@RequestMapping("/admin/adminView.do")
	public ModelAndView adminView(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		//회원 리스트 출력
		int numPerPage=5;
		int memberCount=adminService.selectMemberCountAdmin();
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		List<Map<String,String>> memberList=adminService.selectMemberListAdmin(cPage,numPerPage);
		
		ModelAndView mav=new ModelAndView();
		//카테고리 출력
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin();
		
		mav.addObject("interestList",interestList);
		mav.addObject("deInterestList",deInterestList);
		mav.addObject("memberPageBar", pageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("admin/adminMain");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView memberSearch(
				String searchId,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		//회원 아이디 검색
		
		int numPerPage=5;
		int memberCount=adminService.selectMemberCountAdmin();
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		List<Map<String,String>> memberList=adminService.selectMemberSearchAdmin(searchId,cPage,numPerPage);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageBar", pageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("admin/adminMemberView");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberSortAdmin.do")
	public ModelAndView memberSortAdmin(
				String memberSort, 
				int ascDesc,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		//회원 리스트 정렬
		int numPerPage=5;
		int memberCount=adminService.selectMemberCountAdmin();
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		
		Map<Object,Object> sort=new HashMap();
		sort.put("memberSort", memberSort);
		sort.put("ascDesc", ascDesc);
		List<Map<String,String>> memberList=adminService.selectMemberSortAdmin(sort,cPage,numPerPage);
		logger.info(memberList);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageBar", pageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("admin/adminMemberView");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberDetailView.do")
	public ModelAndView memberDetailView(String memberId) {
		//회원 정보 상세보기
		ModelAndView mav=new ModelAndView();
		Map<Object, Object> member=adminService.selectMemberDetailAdmin(memberId);
		logger.info(member);
		mav.addObject("member", member);
		mav.setViewName("admin/memberDetailView");
		return mav;
	}
	
	@RequestMapping("/admin/memberUpdateAdmin.do")
	public ModelAndView memberUpdateAdmin(
				String memberId, 
				String phone, 
				String email,
				String address, 
				int reportCount,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			
			) {
		//회원정보 수정하기
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> update=new HashMap();
		update.put("memberId", memberId);
		update.put("phone", phone);
		update.put("email", email);
		update.put("address", address);
		update.put("reportCount", reportCount);
		logger.info(update);
		int result=adminService.updateMemberDetailAdmin(update);
		logger.info(result);
		if(result>0) {
			int numPerPage=5;
			int memberCount=adminService.selectMemberCountAdmin();
			String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
			List<Map<String,String>> memberList=adminService.selectMemberListAdmin(cPage,numPerPage);
			mav.addObject("pageBar", pageBar);
			mav.addObject("result", result);
			mav.addObject("memberList",memberList);
			mav.setViewName("admin/adminMemberView");
		}else {
			mav.addObject("result", result);
		}
		
		return mav;
	}
	
	@RequestMapping("/admin/adminFirstInterestView.do")
	public ModelAndView firstInterestView(int interestNo) {
		// 1차 카테고리 클릭 이벤트 화면전환
		ModelAndView mav=new ModelAndView();
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin2(interestNo);
		
		mav.addObject("interestList",interestList);
		mav.addObject("deInterestList",deInterestList);
		mav.setViewName("admin/adminDeInterestView");
		return mav;
		
	}
	
	@RequestMapping("/admin/updateInterestAdmin.do")
	public ModelAndView updateInterestAdmin(int currInterest, int interestNo, int deInterestNo, String deInterestVal) {
		ModelAndView mav=new ModelAndView();
		
		Map<Object,Object> update=new HashMap();
		
		update.put("interestNo", interestNo);
		update.put("deInterestNo", deInterestNo);
		update.put("deInterestVal", deInterestVal);
		logger.info(update);
		int result=adminService.updateInterestAdmin(update);
		
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin2(currInterest);
		
		mav.addObject("interestList",interestList);
		mav.addObject("deInterestList",deInterestList);
		mav.setViewName("admin/adminDeInterestView");
		
		return mav;
		
		
		
	}
	
	//관리자 페이지 카테고리 삭제
	@RequestMapping("/admin/deleteInterestAdmin.do")
	public ModelAndView deleteInterestAdmin(int deInterestNo,int currInterest) {
		
		ModelAndView mav=new ModelAndView();
		int result=adminService.deleteInterestAdmin(deInterestNo);
		
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin2(currInterest);
		
		mav.addObject("interestList",interestList);
		mav.addObject("deInterestList",deInterestList);
		mav.setViewName("admin/adminDeInterestView");
		
		return mav;
		
	}
	
	//관리자 페이지 카테고리 등록
	@RequestMapping("/admin/insertInterestAdmin.do")
	public ModelAndView insertInterestAdmin(String deInterestVal, int currInterest) {
		
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> insert=new HashMap();
		insert.put("interestNo", currInterest);
		insert.put("deInterestVal", deInterestVal);
		int result=adminService.insertInterestAdmin(insert);
		
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin2(currInterest);
		
		mav.addObject("interestList",interestList);
		mav.addObject("deInterestList",deInterestList);
		mav.setViewName("admin/adminDeInterestView");
		
		return mav;
	}
	
	@RequestMapping("/admin/insertFaqCategory")
	public ModelAndView insertFaqCategory(String category) {
		ModelAndView mav=new ModelAndView();
		
		int result=adminService.insertFaqCategory(category);
		return mav;
	}
	
	@RequestMapping("/admin/insertFaqQna.do")
	public ModelAndView insertFaqQna() {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("admin/adminFaqAddPopup");
		
		return mav;
	}
	
	
	
}
