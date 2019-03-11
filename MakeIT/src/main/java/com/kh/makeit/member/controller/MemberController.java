package com.kh.makeit.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.PageFactory;
import com.kh.makeit.common.SendMail;
import com.kh.makeit.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	private Logger logger = Logger.getLogger(MemberController.class);

	@RequestMapping("/member/memberEnrollck.do")
	public String memberEnrollck() {
		return "member/memberEnrollck";
	}

	@RequestMapping("/member/memberMyPage.do")
	public ModelAndView memberMyPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<Object, Object> map = new HashMap();
		int buyCount = 0;
		int sellCount = 0;
		double buyAvg = 0;
		double sellAvg = 0;
		ModelAndView mv = new ModelAndView();
		logger.debug(session.getAttribute("member"));
		if(session.getAttribute("member")!=null) {
			Map<Object, Object> member = (Map<Object, Object>) session.getAttribute("member");
			String id = (String) member.get("MEMBERID");
			logger.debug(id);
			map = service.selectOne(id);
			buyCount = service.selectBuyCount(id);
			sellCount = service.boardSellCount(id);
			buyAvg = service.buyAvg(id);
			sellAvg = service.sellAvg(id);
			String[] addressSplit = ((String) map.get("ADDRESS")).split("/");
			String address = addressSplit[0] + " " + addressSplit[1];
			map.put("ADDRESS", address);
			logger.debug(buyCount);
			logger.debug(sellCount);
			logger.debug(buyAvg);
			logger.debug(sellAvg);
			logger.debug(map);
			String birth = map.get("BIRTH").toString().substring(0, 10);
			map.put("BIRTH", birth);
			mv.setViewName("member/memberMyPage");
			mv.addObject("buyCount", buyCount);
			mv.addObject("sellCount", sellCount);
			mv.addObject("buyAvg", buyAvg);
			mv.addObject("sellAvg", sellAvg);
			mv.addObject("map", map);
			mv.addObject("sellcPage",0);
			mv.addObject("buycPage",0);
			mv.addObject("freecPage",0);
			mv.addObject("qnacPage",0);
			mv.addObject("fadeStatus",1);
		} else {
			String msg = "로그인 후 이용해주세요";
			String loc = "/";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		
		
		return mv;
	}

	@RequestMapping("/mainpage/mainpage.do")
	public String mainpage() {

		return "mainpage/mainpage";

	}

	@RequestMapping("/member/memberEnroll")
	public ModelAndView memberEnroll(String memberLevel) {
		logger.debug(memberLevel);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberLevel", memberLevel);
		mv.setViewName("member/memberEnroll");
		return mv;

	}

	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}

	@RequestMapping("/member/duplicateCheck")
	public ModelAndView duplicateCheck(HttpServletRequest request) {
		String memberId = request.getParameter("memberId");
		Map<String, String> map = service.idDuplicate(memberId);
		boolean isAble = false;
		if (map != null) {
			isAble = false;
		} else {
			isAble = true;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("isAble", isAble);
		mv.addObject("memberId", memberId);
		mv.setViewName("member/duplicateCheck");
		return mv;
	}

	@RequestMapping("/member/checkEmail")
	public ModelAndView checkEmail(String email) {
		logger.debug(email);
		int randomNo = SendMail.sendmail(email);
		logger.debug(randomNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("randomNo", randomNo);
		mv.addObject("email", email);
		mv.setViewName("member/checkEmail");
		return mv;
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(HttpServletRequest request, MultipartFile memberProfile, HttpSession session) {
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		String memberId = request.getParameter("memberId");
		String password = pwEncoder.encode(request.getParameter("password"));
		String name = request.getParameter("memberName");
		String birthString = request.getParameter("birth");
		Date birth = Date.valueOf(birthString);
		logger.debug(birth);
		String bankCode = request.getParameter("bank");
		String account = request.getParameter("memberAccount");
		String phone = request.getParameter("memberPhone");
		String email = request.getParameter("memberEmail") + "@" + request.getParameter("joinEmailDomain");
		String address = request.getParameter("addSearch") + "/" + request.getParameter("addDetail");
		String[] interest = request.getParameterValues("interest");
		String memberLevel = request.getParameter("memberLevel");
		Map<Object, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("password", password);
		map.put("name", name);
		map.put("birth", birth);
		map.put("bankCode", bankCode);
		map.put("account", account);
		map.put("phone", phone);
		map.put("email", email);
		map.put("address", address);
		map.put("interest", interest);
		map.put("memberLevel", memberLevel);
		if (!memberProfile.isEmpty()) {
			String oriFileName = memberProfile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// .부터 확장자까지
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int) (Math.random() * 1000);
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
			try {
				memberProfile.transferTo(new File(saveDir + "/" + reName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			map.put("oriImg", oriFileName);
			map.put("reImg", reName);
		}
		logger.debug(map);
		int result = service.insertMember(map);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "회원가입이 완료되었습니다.";
			loc = "/";
		} else {
			msg = "회원가입이 실패했습니다.";
			loc = "/";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/member/loginEnd.do")
	public ModelAndView loginEnd(String memberId, String password, String saveId, HttpServletResponse response,
			HttpSession session) throws ParseException {
		logger.debug(memberId);
		String encodePw = pwEncoder.encode(password);
		logger.debug(encodePw);
		logger.debug(saveId);
		Map<String, String> map = new HashMap();
		map.put("memberId", memberId);
		map.put("password", password);

		Map<Object, Object> result = service.login(map);
		logger.debug(result);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/";
		
		if (result != null) {
			logger.debug(result.get("WITHDRAWYN"));
			if (!result.get("WITHDRAWYN").equals("N")) {
				msg = "회원정보가 없습니다.";
			} else {
				if (pwEncoder.matches(password, (String) result.get("PASSWORD"))) {
					logger.debug(result.get("BIRTH").getClass());
					String birth = result.get("BIRTH").toString().substring(0, 10);
					logger.debug(birth);
					result.put("BIRTH", birth);
					logger.debug(result);
					msg = "로그인 성공했습니다.";

					session.setAttribute("member", result);
					if (saveId != null) {
						Cookie c = new Cookie("saveId", memberId);
						c.setMaxAge(7 * 24 * 60 * 60); // 7일
						response.addCookie(c);
					} else {
						Cookie c = new Cookie("saveId", memberId);
						c.setMaxAge(0);
						response.addCookie(c);
					}
				} else {
					msg = "password가 일치하지 않습니다.";
				}
			}
		} else {
			msg = "id가 존재하지 않습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	@RequestMapping("/member/memberIntroduction.do")
	public ModelAndView memberIntroduction(String appealContent, String appealId) {
		logger.debug(appealContent);
		logger.debug(appealId);
		Map<String, String> map = new HashMap<>();
		map.put("appealContent", appealContent);
		map.put("appealId", appealId);
		int result = service.memberIntroduction(map);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/member/memberMyPage.do";
		if (result > 0) {
			msg = "자기소개란 등록 완료.";
		} else {
			msg = "자기소개란 등록 실패.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/member/findId.do")
	public String findId() {
		return "member/findId";
	}

	@RequestMapping("/findIdCheck.do")
	public ModelAndView findIdCheck(String email) {
		int randomNo = SendMail.sendmail(email);
		logger.debug(randomNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("randomNo", randomNo);
		mv.addObject("email", email);
		mv.setViewName("member/findIdCheck");
		return mv;
	}

	@RequestMapping("/member/findIdEnd.do")
	public ModelAndView findIdEnd(String email) {
		List<String> id = service.searchId(email);
		logger.debug(id);
		List<String> idView = new ArrayList<>();
		for(String i : id) {
			int idLength = i.length();
			String idStr = i.substring(0, 4);
			for(int j = 0; j<idLength-idStr.length();j++) {
				idStr+="*";
			}
			idView.add(idStr);
		}
		int idNo = idView.size();
		ModelAndView mv = new ModelAndView();
		mv.addObject("idNo",idNo);
		mv.addObject("idView", idView);
		mv.setViewName("member/findIdEnd");
		return mv;
	}

	@RequestMapping("/member/findPw.do")
	public String findPw() {
		return "member/findPw";
	}

	@RequestMapping("/findPwCheck.do")
	public ModelAndView findPwCheck(String id) {
		String email = service.searchEmail(id);
		int randomNo = SendMail.sendmail(email);
		logger.debug(randomNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("randomNo", randomNo);
		mv.addObject("id", id);
		mv.setViewName("member/findPwCheck");
		return mv;
	}

	@RequestMapping("/member/findPwUpdate.do")
	public ModelAndView findPwUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("member/findPwUpdate");
		return mv;
	}

	@RequestMapping("/member/findPwEnd.do")
	public ModelAndView findPwEnd(String id, String password) {
		logger.debug(id);
		String encodePw = pwEncoder.encode(password);
		logger.debug(encodePw);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", encodePw);
		int result = service.updatePw(map);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		if (result > 0) {
			msg = "비밀번호 변경 성공";
		} else {
			msg = "비밀번호 변경 실패";
		}
		mv.addObject("msg", msg);
		mv.setViewName("member/findPwEnd");
		return mv;
	}

	@RequestMapping("/member/updateMember.do")
	public ModelAndView updateMember(String updateId) throws ParseException {
		Map<Object, Object> map = service.selectOne(updateId);
		logger.debug(map);
		String[] interest = ((String) map.get("INTERESTNO")).split(",");
		List<String> interestList = new ArrayList();
		for (int i = 0; i < interest.length; i++) {
			interestList.add(interest[i]);
		}
		String[] emailList = ((String) map.get("EMAIL")).split("@");
		String[] addressList = ((String) map.get("ADDRESS")).split("/");
		String firstAdd = addressList[0];
		String addDetail = addressList[1];
		logger.debug(emailList[0]);
		logger.debug(emailList[1]);
		String email = emailList[0];
		String domain = emailList[1];
		String birth = map.get("BIRTH").toString().substring(0, 10);
		logger.debug(birth);
		Date date = Date.valueOf(birth);
		logger.debug(date);
		map.put("BIRTH", date);
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", map);
		mv.addObject("interestList", interestList);
		mv.addObject("email", email);
		mv.addObject("domain", domain);
		mv.addObject("firstAdd", firstAdd);
		mv.addObject("addDetail", addDetail);
		mv.setViewName("member/updateMember");
		return mv;
	}

	@RequestMapping("/member/memberUpdateEnd.do")
	public ModelAndView memberUpdate(HttpServletRequest request, MultipartFile memberProfile, HttpSession session) {
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("memberName");
		String birthString = request.getParameter("birth");
		Date birth = Date.valueOf(birthString);
		logger.debug(birth);
		String bankCode = request.getParameter("bank");
		String account = request.getParameter("memberAccount");
		String phone = request.getParameter("memberPhone");
		String email = request.getParameter("memberEmail") + "@" + request.getParameter("joinEmailDomain");
		String address = request.getParameter("addSearch") + "/" + request.getParameter("addDetail");
		String[] interest = request.getParameterValues("interest");
		Map<Object, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("name", name);
		map.put("birth", birth);
		map.put("bankCode", bankCode);
		map.put("account", account);
		map.put("phone", phone);
		map.put("email", email);
		map.put("address", address);
		map.put("interest", interest);
		Map<Object, Object> oriMember = service.selectOne(memberId);
		if (!(memberProfile.isEmpty()) && memberProfile.getOriginalFilename() != oriMember.get("ORIIMG")) {
			String oriFileName = memberProfile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// .부터 확장자까지
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int) (Math.random() * 1000);
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
			File oriFile = new File(saveDir + "/" + (String) oriMember.get("REIMG"));
			logger.debug(oriFile.exists());
			logger.debug(oriFile.getName());
			oriFile.delete();
			try {
				memberProfile.transferTo(new File(saveDir + "/" + reName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			map.put("oriImg", oriFileName);
			map.put("reImg", reName);
		} else {
			map.put("oriImg", oriMember.get("ORIIMG"));
			map.put("reImg", oriMember.get("REIMG"));
		}
		logger.debug(map);
		int result = service.memberUpdate(map);
		String msg = "";
		String loc = "/member/memberMyPage.do";
		if (result > 0) {
			msg = "회원정보 수정이 완료되었습니다.";
		} else {
			msg = "회원정보 수정이 실패했습니다.";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/member/deleteMember.do")
	public ModelAndView deleteMember(String updateId, HttpServletRequest request) {
		int result = service.deleteMember(updateId);
		String msg = "";
		String loc = "";
		if (result > 0) {
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
			}
			msg = "회원탈퇴가 정상적으로 처리되었습니다. 이용해주셔서 감사합니다.";
			loc = "/";
		} else {
			msg = "회원탈퇴가 실패했습니다. 다시 시도해주십시오.";
			loc = "/member/memberMyPage.do";
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/member/memberInfoAjax.do")
	@ResponseBody
	public ModelAndView memberInfo(String memberId) {
		Map<Object, Object> map = service.selectOne(memberId);
		int fadeStatus = 1;
		int buyCount = service.selectBuyCount(memberId);
		int sellCount = service.boardSellCount(memberId);
		double buyAvg = service.buyAvg(memberId);
		double sellAvg = service.sellAvg(memberId);
		String[] addressSplit = ((String) map.get("ADDRESS")).split("/");
		String address = addressSplit[0] + " " + addressSplit[1];
		map.put("ADDRESS", address);
		String birth = map.get("BIRTH").toString().substring(0, 10);
		map.put("BIRTH", birth);
		ModelAndView mv = new ModelAndView();
		mv.addObject("buyCount", buyCount);
		mv.addObject("sellCount", sellCount);
		mv.addObject("buyAvg", buyAvg);
		mv.addObject("sellAvg", sellAvg);
		mv.addObject("map", map);
		mv.addObject("fadeStatus",fadeStatus);
		mv.setViewName("member/ajaxMemberInfo");
		return mv;
	}
	
	@RequestMapping("/member/memberOutBoxAjax.do")
	@ResponseBody
	public ModelAndView memberOutBox(int buycPage,int sellcPage,String memberId,HttpServletRequest request) {
		Map<Object, Object> map = service.selectOne(memberId);
		int numPerPage = 5;
		buycPage = 1;
		sellcPage = 1;
		List<Map<String,String>> buyOutBoxList = service.buyOutBoxList(memberId,buycPage,numPerPage);
		int totalBuyCount = service.selectOutBoxBuyCount(memberId);
		String buyPageBar = PageFactory.getPageBarAjax(totalBuyCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		List<Map<String,String>> sellOutBoxList = service.sellOutBoxList(memberId,sellcPage,numPerPage);
		int totalSellCount = service.selectOutBoxSellCount(memberId);
		String sellPageBar = PageFactory.getPageBarAjax(totalSellCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		ModelAndView mv = new ModelAndView();
		logger.debug(buyOutBoxList);
		logger.debug(sellOutBoxList);
		logger.debug(sellcPage);
		logger.debug(buycPage);
		mv.addObject("totalBuyCount",totalBuyCount);
		mv.addObject("buyOutBoxList",buyOutBoxList);
		mv.addObject("buyPageBar",buyPageBar);
		mv.addObject("totalSellCount",totalSellCount);
		mv.addObject("sellOutBoxList",sellOutBoxList);
		mv.addObject("sellPageBar",sellPageBar);
		mv.addObject("sellcPage",sellcPage);
		mv.addObject("buycPage",buycPage);
		mv.addObject("map",map);
		mv.addObject("fadeStatus",1);
		mv.setViewName("member/ajaxMemberOutBox");
		return mv;
	}
	
	@RequestMapping("/member/memberWriteAjax.do")
	@ResponseBody
	public ModelAndView memberWriteAjax(int buycPage, int sellcPage, int freecPage, int qnacPage, String memberId, HttpServletRequest request) {
		Map<Object, Object> map = service.selectOne(memberId);
		int numPerPage = 5;
		buycPage = 1;
		sellcPage = 1;
		freecPage = 1;
		qnacPage = 1;
		List<Map<String,String>> buyList = service.buyList(memberId,buycPage,numPerPage);
		int totalBuyCount = service.selectBuyCount(memberId);
		String buyPageBar = PageFactory.getPageBarAjax(totalBuyCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		List<Map<String,String>> sellList = service.sellList(memberId,sellcPage,numPerPage);
		int totalSellCount = service.boardSellCount(memberId);
		String sellPageBar = PageFactory.getPageBarAjax(totalSellCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		List<Map<String,String>> freeList = service.freeList(memberId,freecPage,numPerPage);
		int totalFreeCount = service.selectFreeCount(memberId);
		String freePageBar = PageFactory.getPageBarAjax(totalFreeCount, freecPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		List<Map<String,String>> qnaList = service.qnaList(memberId,qnacPage,numPerPage);
		int totalQnaCount = service.selectQnaCount(memberId);
		String qnaPageBar = PageFactory.getPageBarAjax(totalFreeCount, qnacPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		ModelAndView mv = new ModelAndView();
		logger.debug(sellList);
		mv.addObject("map",map);
		mv.addObject("buyList",buyList);
		mv.addObject("totalBuyCount",totalBuyCount);
		mv.addObject("buyPageBar",buyPageBar);
		mv.addObject("sellList",sellList);
		mv.addObject("totalSellCount",totalSellCount);
		mv.addObject("sellPageBar",sellPageBar);
		mv.addObject("sellcPage",sellcPage);
		mv.addObject("buycPage",buycPage);
		mv.addObject("freeList",freeList);
		mv.addObject("freecPage",freecPage);
		mv.addObject("freePageBar",freePageBar);
		mv.addObject("totalFreeCount",totalFreeCount);
		mv.addObject("totalQnacount",totalQnaCount);
		mv.addObject("qnaList",qnaList);
		mv.addObject("qnaPageBar",qnaPageBar);
		mv.addObject("qnacPage",qnacPage);
		mv.addObject("fadeStatus",1);
		mv.setViewName("member/ajaxMemberWrite");
		return mv;
	}
	
	@RequestMapping("/member/memberMessageAjax.do")
	@ResponseBody
	public ModelAndView memberMessageAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<Object,Object> member = (Map<Object, Object>) session.getAttribute("member");
		String memberId = (String) member.get("MEMBERID");
		Map<Object, Object> map = service.selectOne(memberId);
		int numPerPage = 5;
		int buycPage = 1;	// 보내기
		int sellcPage = 1;	// 받기
		List<Map<String,String>> sendMessage = service.sendMessage(memberId,buycPage,numPerPage);
		List<Map<String,String>> receiveMessage = service.receiveMessage(memberId,sellcPage,numPerPage);
		int totalSendCount = service.totalSendCount(memberId);
		String sendPageBar = PageFactory.getPageBarAjax(totalSendCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		int totalReceiveCount = service.totalReceiveCount(memberId);
		String receivePageBar = PageFactory.getPageBarAjax(totalReceiveCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("sendMessage",sendMessage);
		mv.addObject("totalSendCount",totalSendCount);
		mv.addObject("sendPageBar",sendPageBar);
		mv.addObject("receiveMessage",receiveMessage);
		mv.addObject("totalReceiveCount",totalReceiveCount);
		mv.addObject("receivePageBar",receivePageBar);
		mv.addObject("sellcPage",sellcPage);
		mv.addObject("buycPage",buycPage);
		mv.addObject("fadeStatus",1);
		mv.setViewName("member/ajaxMemberMessage");
		return mv;
	}
	
	@RequestMapping("/member/memberMessageDetailAjax.do")
	public ModelAndView messageDetail(int messageNo, String memberId) {
		Map<Object, Object> map = service.selectOne(memberId);
		logger.debug(messageNo);
		Map<Object, Object> message = service.messageDetail(messageNo);
		logger.debug(message);
		int result = 0;
		if(message.get("RECEIVEID").equals(memberId)) {
			result = service.updateMessageDate(messageNo);
		}
		if(result > 0) {
			message = service.messageDetail(messageNo);
		}
		logger.debug(message);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("message",message);
		mv.setViewName("/member/ajaxMessageDetail");
		return mv;
	}
	
	@RequestMapping("/member/deleteMessage.do")
	public ModelAndView deleteMessage(int messageNo, String memberId) {
		logger.debug(messageNo);
		logger.debug(memberId);
		Map<Object,Object> map = new HashMap();
		map.put("messageNo", messageNo);
		map.put("memberId", memberId);
		Map<Object, Object> message = service.messageDetail(messageNo);
		logger.debug(message);
		logger.debug(memberId);
		logger.debug(message.get("SENDID"));
		logger.debug(message.get("RECEIVEID"));
		int result = 0;
		if(memberId.equals((String)message.get("SENDID"))) {
			result = service.deleteSendMessage(map);
		} else if(memberId.equals((String)message.get("RECEIVEID"))) {
			result = service.deleteReceiveMessage(map);
		}
		String msg = "";
		String loc = "";
		logger.debug(result);
		if(result > 0) {
			msg = "메시지가 정상적으로 삭제되었습니다. 마이페이지로 돌아갑니다.";
			loc = "/member/memberMyPage.do";
		} else {
			msg = "메시지가 정상적으로 삭제되지 않았습니다. 다시 시도해주세요.";
			loc = "/member/memberMyPage.do";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/messageReceiveSelectDel.do")
	public ModelAndView messageReceiveSelectDel(HttpServletRequest request) {
		String[] deleteCk = request.getParameterValues("receiveDeleteCk");
		logger.debug(deleteCk);
		int result = 0;
		int[] delListInt = new int[deleteCk.length];
		for(int i = 0; i < deleteCk.length; i++) {
			delListInt[i] = Integer.parseInt(deleteCk[i]);
			result += service.deleteReceiveMessages(delListInt[i]);
		}
		String msg = "";
		String loc = "";
		logger.debug(result);
		if(result > 0) {
			msg = "메시지가 정상적으로 삭제되었습니다. 마이페이지로 돌아갑니다.";
			loc = "/member/memberMyPage.do";
		} else {
			msg = "메시지가 정상적으로 삭제되지 않았습니다. 다시 시도해주세요.";
			loc = "/member/memberMyPage.do";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/messageSendSelectDel.do")
	public ModelAndView messageSendSelectDel(HttpServletRequest request) {
		String[] delList = request.getParameterValues("sendDeleteCk");
		logger.debug(delList);
		int[] delListInt = new int[delList.length];
		int result = 0;
		for(int i = 0; i < delList.length; i++) {
			delListInt[i] = Integer.parseInt(delList[i]);
			result += service.deleteSendMessages(delListInt[i]);
		}
		String msg = "";
		String loc = "";
		logger.debug(result);
		if(result > 0) {
			msg = "메시지가 정상적으로 삭제되었습니다. 마이페이지로 돌아갑니다.";
			loc = "/member/memberMyPage.do";
		} else {
			msg = "메시지가 정상적으로 삭제되지 않았습니다. 다시 시도해주세요.";
			loc = "/member/memberMyPage.do";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/reSendMessage.do")
	@ResponseBody
	public ModelAndView reSendMessage(String sendId, String memberId, int messageNo) {
		logger.debug(memberId);
		logger.debug(sendId);
		Map<Object, Object> map = service.selectOne(memberId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("messageNo",messageNo);
		mv.addObject("map",map);
		mv.addObject("memberId",memberId);
		mv.addObject("sendId",sendId);
		mv.setViewName("member/ajaxReSendEnd");
		return mv;
	}
	
	@RequestMapping("/member/sendMessage.do")
	@ResponseBody
	public void sendMessage(String sendId, String receiveId, String messageContent) {
		Map<String,String> message = new HashMap();
		message.put("sendId", sendId);
		message.put("receiveId", receiveId);
		message.put("messageContent", messageContent);
		int result = service.sendMessageEnd(message);
	}
	
	@RequestMapping("/member/memberPagingAjax.do")
	@ResponseBody
	public ModelAndView pagingAjax(int naviBarStatus, int fadeStatus, int buycPage,int sellcPage,int freecPage, int qnacPage,String memberId,HttpServletRequest request) {
		Map<Object, Object> map = service.selectOne(memberId);
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		logger.debug(naviBarStatus);
		logger.debug(fadeStatus);
		logger.debug(buycPage);
		logger.debug(sellcPage);
		if(naviBarStatus == 2) {
			if(fadeStatus == 1) {
				sellcPage = 1;
			} else {
				buycPage = 1;
			} 
			logger.debug(buycPage);
			logger.debug(sellcPage);
			List<Map<String,String>> buyOutBoxList = service.buyOutBoxList(memberId,buycPage,numPerPage);
			int totalBuyCount = service.selectOutBoxBuyCount(memberId);
			String buyPageBar = PageFactory.getPageBarAjax(totalBuyCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			List<Map<String,String>> sellOutBoxList = service.sellOutBoxList(memberId,sellcPage,numPerPage);
			int totalSellCount = service.selectOutBoxSellCount(memberId);
			String sellPageBar = PageFactory.getPageBarAjax(totalSellCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			mv.addObject("totalBuyCount",totalBuyCount);
			mv.addObject("buyOutBoxList",buyOutBoxList);
			mv.addObject("buyPageBar",buyPageBar);
			mv.addObject("totalSellCount",totalSellCount);
			mv.addObject("sellOutBoxList",sellOutBoxList);
			mv.addObject("sellPageBar",sellPageBar);
			mv.addObject("sellcPage",sellcPage);
			mv.addObject("buycPage",buycPage);
			mv.addObject("naviBarStatus",naviBarStatus);
			mv.addObject("fadeStatus",fadeStatus);
			mv.setViewName("member/ajaxMemberOutBox");
		} else if(naviBarStatus == 3) {
			if(fadeStatus == 1) {
				sellcPage = 1;
			} else if(fadeStatus == 2) {
				buycPage = 1;
				freecPage = 1;
				qnacPage = 1;
			} else if(fadeStatus == 3) {
				sellcPage = 1;
				buycPage = 1;
				qnacPage = 1;
			} else if(fadeStatus == 4) {
				sellcPage = 1;
				buycPage = 1;
				freecPage = 1;
			}
			logger.debug(buycPage);
			logger.debug(sellcPage);
			List<Map<String,String>> buyList = service.buyList(memberId,buycPage,numPerPage);
			int totalBuyCount = service.selectBuyCount(memberId);
			String buyPageBar = PageFactory.getPageBarAjax(totalBuyCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			List<Map<String,String>> sellList = service.sellList(memberId,sellcPage,numPerPage);
			int totalSellCount = service.boardSellCount(memberId);
			String sellPageBar = PageFactory.getPageBarAjax(totalSellCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			List<Map<String,String>> freeList = service.freeList(memberId,freecPage,numPerPage);
			int totalFreeCount = service.selectFreeCount(memberId);
			String freePageBar = PageFactory.getPageBarAjax(totalFreeCount, freecPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			List<Map<String,String>> qnaList = service.qnaList(memberId,freecPage,numPerPage);
			int totalQnaCount = service.selectQnaCount(memberId);
			String qnaPageBar = PageFactory.getPageBarAjax(totalFreeCount, qnacPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			logger.debug(sellList);
			mv.addObject("buyList",buyList);
			mv.addObject("totalBuyCount",totalBuyCount);
			mv.addObject("buyPageBar",buyPageBar);
			mv.addObject("sellList",sellList);
			mv.addObject("totalSellCount",totalSellCount);
			mv.addObject("sellPageBar",sellPageBar);
			mv.addObject("sellcPage",sellcPage);
			mv.addObject("buycPage",buycPage);
			mv.addObject("freeList",freeList);
			mv.addObject("freecPage",freecPage);
			mv.addObject("freePageBar",freePageBar);
			mv.addObject("totalFreeCount",totalFreeCount);
			mv.addObject("totalQnacount",totalQnaCount);
			mv.addObject("qnaList",qnaList);
			mv.addObject("qnaPageBar",qnaPageBar);
			mv.addObject("qnacPage",qnacPage);
			mv.addObject("fadeStatus",fadeStatus);
			mv.setViewName("member/ajaxMemberWrite");
		} else if(naviBarStatus == 4) {
			if(fadeStatus == 1) {
				sellcPage = 1;
			} else {
				buycPage = 1;
			}
			List<Map<String,String>> sendMessage = service.sendMessage(memberId,buycPage,numPerPage);
			List<Map<String,String>> receiveMessage = service.receiveMessage(memberId,sellcPage,numPerPage);
			int totalSendCount = service.totalSendCount(memberId);
			String sendPageBar = PageFactory.getPageBarAjax(totalSendCount, buycPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			int totalReceiveCount = service.totalReceiveCount(memberId);
			String receivePageBar = PageFactory.getPageBarAjax(totalReceiveCount, sellcPage, numPerPage, request.getContextPath()+"/member/memberPagingAjax.do");
			mv.addObject("sendMessage",sendMessage);
			mv.addObject("totalSendCount",totalSendCount);
			mv.addObject("sendPageBar",sendPageBar);
			mv.addObject("receiveMessage",receiveMessage);
			mv.addObject("totalReceiveCount",totalReceiveCount);
			mv.addObject("receivePageBar",receivePageBar);
			mv.addObject("sellcPage",sellcPage);
			mv.addObject("buycPage",buycPage);
			mv.addObject("fadeStatus",fadeStatus);
			mv.setViewName("member/ajaxMemberMessage");
		}
		mv.addObject("map",map);
		return mv;
	}
}
