package com.kh.makeit.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	@RequestMapping("/member/individualMember")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
}
