package com.kh.makeit.buy.controller;

import java.util.HashMap;
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
	@RequestMapping("/buy/buyMain")
	public String buyMain()
	{
		return "buy/buymain";
	}
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
	
	@RequestMapping("/buy/buyWriteEnd.do")
	public ModelAndView insertBuy()
	{
		ModelAndView mv = new ModelAndView();
		return mv;
		
	}
	@RequestMapping("/buy/volList.do")
	public ModelAndView selectVolList()
	{
		int buyNo = 1;
		String categoryCode = "B";
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,String> map = new HashMap();
		map.put("buyNo", String.valueOf(buyNo));
		map.put("category", categoryCode);
		
		List<Map<String, String>> volList = service.selectVolList(map);
		mv.addObject("volList", volList);
		mv.setViewName("buy/buyVolList");
		return mv;

	}
	
	@RequestMapping("/buy/buyVolView.do")
	public ModelAndView selectVolView(String memberId, String buyNo, String categoryCode)
	{
		ModelAndView mv = new ModelAndView();
		Map<String,String> map = new HashMap();
		map.put("memberId", memberId);
		map.put("buyNo", buyNo);
		map.put("category", categoryCode);
		
		Map<String,String> vol = service.selectVolView(map);
		mv.addObject("vol", vol);
		mv.setViewName("buy/buyVolView");
		return mv;
	}

}
