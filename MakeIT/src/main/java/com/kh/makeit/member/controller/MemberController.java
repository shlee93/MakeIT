package com.kh.makeit.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.SendMail;
import com.kh.makeit.member.model.service.MemberService;

@SessionAttributes("userId")

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	private Logger logger = Logger.getLogger(MemberController.class);

	@RequestMapping("/member/memberEnroll.do")
	public String memberEnrollck() {
		return "member/memberEnrollck";
	}

	@RequestMapping("/member/memberMyPage.do")
	public String memberMyPage() {
		return "member/memberMyPage";
	}

	@RequestMapping("/mainpage/mainpage.do")
	public String mainpage() {

		return "mainpage/mainpage";

	}

	@RequestMapping("/member/individualMember")
	public String memberEnroll() {
		return "member/memberEnroll";

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
		mv.addObject("randomNo",randomNo);
		mv.addObject("email",email);
		mv.setViewName("member/checkEmail");
		return mv;
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(HttpServletRequest request, MultipartFile memberProfile) {
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		String memberId = request.getParameter("memberId");
		String password = pwEncoder.encode(request.getParameter("password"));
		String name = request.getParameter("memberName");
		String memberRegNoCk = request.getParameter("memberNo") + "-" + request.getParameter("memberNo2");
		String memberRegNo = memberRegNoCk.substring(0, 8) + "******";
		String gender = "";
		if (memberRegNo.charAt(7) == '1' || memberRegNo.charAt(7) == '3') {
			gender = "M";
		} else {
			gender = "F";
		}
		String bankCode = request.getParameter("bank");
		String account = request.getParameter("memberAccount");
		String phone = request.getParameter("memberPhone");
		String email = request.getParameter("memberEmail") + "@" + request.getParameter("joinEmailDomain");
		String address = request.getParameter("addSearch") + " " + request.getParameter("addDetail");
		String[] interest = request.getParameterValues("interest");
		Map<Object,Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("password", password);
		map.put("name", name);
		map.put("memberRegNo", memberRegNo);
		map.put("gender", gender);
		map.put("bankCode", bankCode);
		map.put("account", account);
		map.put("phone", phone);
		map.put("email", email);
		map.put("address", address);
		map.put("interest", interest);
		if(!memberProfile.isEmpty()) {
			String oriFileName = memberProfile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));//.부터 확장자까지
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int)(Math.random()*1000);
			String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			try {
				memberProfile.transferTo(new File(saveDir+"/"+reName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			map.put("oriImg", oriFileName);
			map.put("reImg", reName);
		}
		logger.debug(map);
		int result = service.insertMember(map);
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
