package com.kh.makeit.common.interest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.makeit.common.interest.service.InterestService;

@Controller
public class InterestController 
{	
	@Autowired
	InterestService is;
	
	@RequestMapping("/categoryOneSel.do")
    @ResponseBody
	public List interestSel(int interestNo)
	{
		System.out.println(interestNo);
		List interestDetailList=is.interestSelService(interestNo);
		
		return interestDetailList;
	}

}
