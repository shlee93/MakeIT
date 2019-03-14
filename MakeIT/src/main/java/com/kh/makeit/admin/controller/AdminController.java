package com.kh.makeit.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				@RequestParam(value="reportStatus", required=false, defaultValue="BUY") String reportStatus,
				@RequestParam(value="paymentStatus",required=false,defaultValue="BUY") String paymentStatus,
				@RequestParam(value="sortCheck", required=false, defaultValue="0") int sortCheck,
				@RequestParam(value="refundStatus", required=false, defaultValue="BUY") String refundStatus
			) {
		
		//회원 리스트 출력
		int numPerPage=5;
		int memberCount=adminService.selectMemberCountAdmin();
		int reportCount=adminService.selectReportCountAdmin(reportStatus);
		int paymentCount=adminService.selectPaymentCountAdmin(paymentStatus);
		int refundCount=adminService.selectRefundCountAdmin(refundStatus);
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		String pageBarReport=PageFactory.getPageBarAdmin(reportCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		String pageBarPayment=PageFactory.getPageBarAdmin(paymentCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		String pageBarRefund=PageFactory.getPageBarAdmin(refundCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		//회원정보 출력
		List<Map<String,String>> memberList=adminService.selectMemberListAdmin(cPage,numPerPage);		
		//카테고리 출력
		List<Map<String,String>> interestList=adminService.selectInterestAdmin();
		List<Map<String,String>> deInterestList=adminService.selectDeInterestAdmin();
		//FAQ 출력
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		//신고회원 출력
		List<Map<Object,Object>> reportList=adminService.selectReportListAdmin(reportStatus,cPage,numPerPage);
		//결제현황 출력
		Map<Object,Object> payment=new HashMap();
		payment.put("paymentStatus", paymentStatus);
		payment.put("sortCheck", sortCheck);
		List<Map<Object,Object>> paymentList=adminService.selectPaymentListAdmin(payment,cPage,numPerPage);
		//환불요청 리스트 출력
		List<Map<Object,Object>> refundList=adminService.selectRefundListAdmin(refundStatus,cPage,numPerPage);
		
		mav.addObject("pageBarRefund", pageBarRefund);
		mav.addObject("refundList", refundList);
		mav.addObject("pageBarPayment", pageBarPayment);
		mav.addObject("paymentList", paymentList);
		mav.addObject("pageBarReport", pageBarReport);
		mav.addObject("reportList", reportList);
		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
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
	
	//관리자 페이지 FAQ 카테고리 등록
	@RequestMapping("/admin/insertFaqCategory")
	public ModelAndView insertFaqCategory(String category) {
		ModelAndView mav=new ModelAndView();
		
		int result=adminService.insertFaqCategory(category);
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		
		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqView");
		return mav;
	}
	
	//관리자 페이지 FAQ 질문 답변 등록 팝업 띄우기
	@RequestMapping("/admin/insertFaqQna.do")
	public ModelAndView insertFaqQna() {
		ModelAndView mav=new ModelAndView();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqAddPopup");
		
		return mav;
	}
	
	//관리자 페이지 FAQ 질문 답변 등록
	@RequestMapping("/admin/insertFaqnaEndAdmin.do")
	public ModelAndView insertFaqnaEnd(String question,String answer,int faqCategory) {
		
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> faq=new HashMap();
		faq.put("question", question);
		faq.put("answer", answer);
		faq.put("faqCategory", faqCategory);
		int result=adminService.insertFaqnaAdmin(faq);
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		
		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqView");
		
		return mav;
	}
	
	//관리자 페이지 FAQ 수정 팝업
	@RequestMapping("/admin/updateFaqQna.do")
	public ModelAndView updateFaqQna(int faqNo) {
		
		ModelAndView mav=new ModelAndView();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		Map<String,String> faq=adminService.selectFaqAdmin(faqNo);
		mav.addObject("categoryList", categoryList);
		mav.addObject("faq", faq);
		mav.setViewName("admin/adminFaqUpdatePopup");
		
		return mav;
	}
	
	//관리자 페이지 FAQ 질문 답변 수정
	@RequestMapping("/admin/updateFaqnaEndAdmin.do")
	public ModelAndView updateFaqnaEnd(String question,String answer,int faqCategory,int faqNo) {

		ModelAndView mav=new ModelAndView();
		Map<Object,Object> faq=new HashMap();
		faq.put("question", question);
		faq.put("answer", answer);
		faq.put("faqCategory", faqCategory);
		faq.put("faqNo", faqNo);
		int result=adminService.updateFaqnaAdmin(faq);
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();

		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqView");

		return mav;
	}
	
	//관리자 페이지 FAQ 삭제 이벤트
	@RequestMapping("/admin/deleteFaqnaAdmin.do")
	public ModelAndView deleteFaqnaAdmin(int faqNo) {
		
		ModelAndView mav=new ModelAndView();
		int result=adminService.deleteFaqnaAdmin(faqNo);
		
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();

		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqView");

		return mav;
	}
	
	//관리자 페이지 FAQ 카테고리 삭제
	@RequestMapping("/admin/deleteFaqCategoryAdmin.do")
	public ModelAndView deleteFaqCategoryAdmin(int faqCategoryNo) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=adminService.deleteFaqCategoryAdmin(faqCategoryNo);
		
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();

		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("admin/adminFaqView");

		return mav;
	}
	//신고승인, 카운트 증가, 신고데이터 스테이터스 변경
	@RequestMapping("/admin/updateReportCount.do")
	public ModelAndView updateReportCount(String reportStatus,int contentNo,String reportId,
			@RequestParam(value="reportFlag",required=false,defaultValue="true") boolean reportFlag,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		int numPerPage=5;
		int reportCount=adminService.selectReportCountAdmin(reportStatus);
		String pageBarReport=PageFactory.getPageBarAdmin(reportCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		int result=0;
		int result2=0;
		Map<Object,Object> report=new HashMap();
		if(reportFlag) {
			
			result2=adminService.updateReportCount(reportId);
			
		}
		report.put("reportId", reportId);
		report.put("reportStatus", reportStatus);
		report.put("contentNo", contentNo);
		result=adminService.updateReportStatus(report);
		
		List<Map<Object,Object>> reportList=adminService.selectReportListAdmin(reportStatus,cPage,numPerPage);
		mav.addObject("pageBarReport", pageBarReport);
		mav.addObject("reportList", reportList);
		mav.setViewName("admin/adminReportView");
		
		return mav;
	}
	
	//신고 페이징 처리
	@RequestMapping("/admin/selectReportListView.do")
	public ModelAndView selectReportListView(String reportStatus,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		int numPerPage=5;
		int reportCount=adminService.selectReportCountAdmin(reportStatus);
		String pageBarReport=PageFactory.getPageBarAdmin(reportCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		List<Map<Object,Object>> reportList=adminService.selectReportListAdmin(reportStatus,cPage,numPerPage);
		mav.addObject("pageBarReport", pageBarReport);
		mav.addObject("reportList", reportList);
		mav.setViewName("admin/adminReportView");
		
		return mav;
		
	}
	
	//결제현황 출력
	@RequestMapping("/admin/selectPaymentListView.do")
	public ModelAndView selectPaymentListView(String paymentStatus,
			
			@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			@RequestParam(value="sortCheck",required=false, defaultValue="0") int sortCheck
			) {
		int numPerPage=5;
		int paymentCount=adminService.selectPaymentCountAdmin(paymentStatus);
		String pageBarPayment=PageFactory.getPageBarAdmin(paymentCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> payment=new HashMap();
		payment.put("paymentStatus", paymentStatus);
		payment.put("sortCheck", sortCheck);
		
		//결제현황 출력
		List<Map<Object,Object>> paymentList=adminService.selectPaymentListAdmin(payment,cPage,numPerPage);
				
		mav.addObject("pageBarPayment", pageBarPayment);
		mav.addObject("paymentList", paymentList);
		mav.setViewName("/admin/adminPaymentView");
		
		return mav;
	}
	
	//결제 모달 띄우기
	@RequestMapping("/admin/paymentPopupView.do")
	public ModelAndView paymentPopupView(int specNo,String paymentStatus) {
		
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> payment=new HashMap();
		payment.put("specNo", specNo);
		payment.put("paymentStatus", paymentStatus);
		Map<Object,Object> paymentInfo=adminService.selectPaymentOne(payment);
		
		mav.addObject("paymentInfo", paymentInfo);
		mav.setViewName("admin/adminPaymentPopup");
		
		return mav;
	}
	
	//결제완료 spec status 업데이트
	@RequestMapping("/admin/updatePaymentEnd")
	public ModelAndView updatePaymentEnd(int specNo,String paymentStatus,
			@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			@RequestParam(value="sortCheck",required=false, defaultValue="0") int sortCheck
			) {
		int numPerPage=5;
		int paymentCount=adminService.selectPaymentCountAdmin(paymentStatus);
		String pageBarPayment=PageFactory.getPageBarAdmin(paymentCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> payment=new HashMap();
		payment.put("specNo", specNo);
		payment.put("paymentStatus", paymentStatus);
		int result=adminService.updatePaymentEnd(payment);
		
		//결제현황 출력
		List<Map<Object,Object>> paymentList=adminService.selectPaymentListAdmin(payment,cPage,numPerPage);
						
		mav.addObject("pageBarPayment", pageBarPayment);
		mav.addObject("paymentList", paymentList);
		mav.setViewName("/admin/adminPaymentView");
				
		return mav;
		
	}
	//환불 요청 리스트 출력
	@RequestMapping("/admin/selectRefundListView.do")
	public ModelAndView selectPaymentListView(String refundStatus,
			
			@RequestParam(value="cPage",required=false, defaultValue="1") int cPage
			) {
		int numPerPage=5;
		int refundCount=adminService.selectRefundCountAdmin(refundStatus);
		String pageBarRefund=PageFactory.getPageBarAdmin(refundCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();
		
		//환불요청 리스트 출력
		List<Map<Object,Object>> refundList=adminService.selectRefundListAdmin(refundStatus,cPage,numPerPage);
				
		mav.addObject("pageBarRefund", pageBarRefund);
		mav.addObject("refundList", refundList);
		mav.setViewName("/admin/adminRefundView");
		
		return mav;
	}
	
	//환불-결제 모달 띄우기
	@RequestMapping("/admin/refundPopupView.do")
	public ModelAndView refundPopupView(int specNo,String refundStatus) {
			
		ModelAndView mav=new ModelAndView();
		Map<Object,Object> refund=new HashMap();
		refund.put("specNo", specNo);
		refund.put("refundStatus", refundStatus);
		Map<Object,Object> refundInfo=adminService.selectRefundOne(refund);

		mav.addObject("refundInfo", refundInfo);
		mav.setViewName("admin/adminRefundPopup");

		return mav;
	}

	
}
