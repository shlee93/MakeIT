package com.kh.makeit.buy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BuyController {

	@RequestMapping("/buy/volList.do")
	public ModelAndView selectVolList()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("buy/buy_volList");
		return mv;
	}
}
