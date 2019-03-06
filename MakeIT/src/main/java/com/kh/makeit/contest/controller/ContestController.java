package com.kh.makeit.contest.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.exception.BoardException;
import com.kh.makeit.contest.vo.Contest;
import com.kh.makeit.contest.vo.ContestImg;
import com.sun.xml.internal.ws.api.message.Attachment;

@Controller

public class ContestController 
{
	/*@Autowired 
	ContestService cs;*/
	
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
		Map<String,String> memberMap=(Map)session.getAttribute("member");
		mv.addObject("memberMap", memberMap);	
		mv.setViewName("/contest/contestWrite");
		return mv;
	}	
	@RequestMapping("/contest/contestFormEnd.do")
	public String contestFormEnd(Contest contest, MultipartFile[] upFile) throws BoardException
	{
		System.out.println(contest);
		Contest contestImg=new ContestImg();
		ArrayList<Attachment> files=new ArrayList<>();
		
		return "redirect:/contest/contestMain";
	}

}
