package com.kh.makeit.buy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyController {

	@RequestMapping("/buy/buyDetail")
	public String buyDetail()
	{
		return "buy/buydetail";
	}
	@RequestMapping("/buy/buyWrite.do")
	public String buyWrite()
	{
		return "buy/buywrite";
	}
}
