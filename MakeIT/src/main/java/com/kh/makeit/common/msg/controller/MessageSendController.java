package com.kh.makeit.common.msg.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.msg.service.MessageSendService;

@Controller
public class MessageSendController 
{
	@Autowired 
	MessageSendService mss;
	
	@RequestMapping("/message/messagePop.do")
	public ModelAndView msgPop(String sendId, String receiveId)
	{
		System.out.println(sendId);
		System.out.println(receiveId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("sendId", sendId);
		mv.addObject("receiveId", receiveId);
		mv.setViewName("common/messageSendPop");
		return mv;
	}
	
	@RequestMapping("/message/messageSend.do")
	public ModelAndView messageSend(String sendId, String receiveId, String messageContent)
	{		
		Map<String,String> messageSendMap= new HashMap();
		messageSendMap.put("sendId", sendId);
		messageSendMap.put("receiveId", receiveId);
		messageSendMap.put("messageContent", messageContent);
		mss.messageSendService(messageSendMap);
		ModelAndView mv= new ModelAndView();
		mv.addObject("receiveId", receiveId);
		mv.setViewName("common/messageSendPopEnd");
		return mv;
	}
}
