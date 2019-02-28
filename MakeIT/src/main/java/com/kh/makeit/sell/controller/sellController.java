package com.kh.makeit.sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
