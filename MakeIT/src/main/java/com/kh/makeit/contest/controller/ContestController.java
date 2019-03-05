package com.kh.makeit.contest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String contestWrite()
	{
		return "contest/contestWrite";
	}	
}
