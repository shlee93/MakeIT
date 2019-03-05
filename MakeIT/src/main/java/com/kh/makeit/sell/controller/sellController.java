package com.kh.makeit.sell.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.sell.model.service.sellService;

@Controller
public class sellController {

	@Autowired
	sellService service;
	@RequestMapping("/sell/sellDetail.do")
	public String sellDetail()
	{
		System.out.println("왔니?");
		return "sell/sellDetail"; 
	}
	
	@RequestMapping("/sell/sellmain.do")
	public String sellMain()
	{
		return "sell/sellmain";
	}
	
	@RequestMapping("/sell/sellWrite.do")
	public String sellWrite()
	{
		return "sell/sellwrite";
	}
	@RequestMapping("/sell/sellWriteEnd")
	public String sellWriteEnd(int[] price)
	{	for(int i=0;i<price.length;i++)
		{
			System.out.println(price[i]);
		}
		
		return "sell/sellmain";
	}
	//ajax 카테고리 분류
	@RequestMapping(value="/sell/findInterest", produces = "application/text; charset=utf-8")
	public ModelAndView findInterest(int interest, ServletRequest request) throws UnsupportedEncodingException
	{	
		List<Map<String,String>> list=service.findInterest(interest);
		for(int i=0;i<list.size();i++)
		{
			System.out.println(list.get(i));
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		return mv;
	}
}
