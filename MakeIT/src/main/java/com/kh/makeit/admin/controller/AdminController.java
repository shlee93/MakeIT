package com.kh.makeit.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin/adminView.do")
	public String adminView() {
		
		
		
		return "admin/adminMain";
	}
}
