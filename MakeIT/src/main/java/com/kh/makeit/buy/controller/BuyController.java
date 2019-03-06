package com.kh.makeit.buy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.buy.model.service.BuyService;

@Controller
public class BuyController {
	@Autowired
	BuyService service;
	
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
	@RequestMapping("/buy/volList.do")
	public ModelAndView selectVolList()
	{
		int buyNo = 1;
		String categoryCode = "B";
		
		ModelAndView mv = new ModelAndView();
		List<Map<String, String>> volList = service.selectVolList(buyNo, categoryCode);
		mv.addObject("volList", volList);
		mv.setViewName("buy/buyVolList");
		return mv;

	}

}
