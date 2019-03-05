package com.kh.makeit.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.SendMail;
import com.kh.makeit.member.model.service.MemberService;

@SessionAttributes("memberId")

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
	public String memberMyPage() {
		return "member/memberMyPage";
	}

	@RequestMapping("/mainpage/mainpage.do")
	public String mainpage() {

		return "mainpage/mainpage";

	}

	@RequestMapping("/member/memberEnroll")
	public ModelAndView memberEnroll(String memberLevel) {
		logger.debug(memberLevel);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberLevel",memberLevel);
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
		String birth = request.getParameter("birth");
		String bankCode = request.getParameter("bank");
		String account = request.getParameter("memberAccount");
		String phone = request.getParameter("memberPhone");
		String email = request.getParameter("memberEmail") + "@" + request.getParameter("joinEmailDomain");
		String address = request.getParameter("addSearch") + " " + request.getParameter("addDetail");
		String[] interest = request.getParameterValues("interest");
		String memberLevel = request.getParameter("memberLevel");
		Map<Object,Object> map = new HashMap<>();
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
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "회원가입이 완료되었습니다.";
			loc = "/";
		} else {
			msg = "회원가입이 실패했습니다.";
			loc = "/";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/loginEnd.do")
	public ModelAndView loginEnd(String memberId, String password, String saveId, HttpServletResponse response) {
		logger.debug(memberId);
		String encodePw = pwEncoder.encode(password);
		logger.debug(encodePw);
		logger.debug(saveId);
		Map<String,String> map = new HashMap();
		map.put("memberId", memberId);
		map.put("password", password);
		
		Map<String,String> result = service.login(map);
		logger.debug(result);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/";
		if(result != null) {
			if(pwEncoder.matches(password, result.get("PASSWORD"))) {
				msg = "로그인 성공했습니다.";
				mv.addObject("memberId",result.get("MEMBERID"));
				if(saveId!=null) {
					Cookie c=new Cookie("saveId",memberId);
					c.setMaxAge(7*24*60*60); //7일
					response.addCookie(c);
				} else {
					Cookie c=new Cookie("saveId",memberId);
					c.setMaxAge(0);
					response.addCookie(c);
				}
			} else {
				msg="password가 일치하지 않습니다.";
			}
		} else {
			msg="id가 존재하지 않습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
}
