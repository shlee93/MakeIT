package com.kh.makeit.contest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class ContestController 
{
	@RequestMapping("/contest/contestMain.do")
	public String contestMain()
	{
		return "contest/contestMain";
	}
	@RequestMapping("/contest/contestDetail.do")
	public String contestDetail()
	{
		return "contest/contestDetail";
	}
	@RequestMapping("/contest/contestWrite.do")
	public ModelAndView contestWrite(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		ModelAndView mv=new ModelAndView();
		System.out.println(session.getAttribute("memberId"));
		String memberId=(String)session.getAttribute("memberId");
		mv.addObject("memberId", memberId);
		mv.setViewName("/contest/contestWrite");
		return mv;
	}	

}
