package com.kh.makeit.buy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.buy.model.service.BuyService;
import com.kh.makeit.common.PageFactory;

@Controller
public class BuyController {
	@Autowired
	BuyService service;
	@RequestMapping("/buy/buymain.do")
	   public ModelAndView buyMain(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage, HttpServletRequest request)
	   {

		  String bCategoryFlag = "1";
	      String sCategoryFlag ="";
	      String sortFlag = "1";
	      String newValue="1";
	      String gradeValue="";
	      //String sellValue="";
	      if(request.getParameter("newValue") != null)
	      {
	         newValue = request.getParameter("newValue");
	      }
	      if(request.getParameter("gradeValue") != null)
	      {
	    	  gradeValue = request.getParameter("gradeValue");
	    	  System.out.println("넘어오라고!!!!"+gradeValue);
	      }
	      /*if(request.getParameter("sellValue") != null)
	      {
	    	  sellValue = request.getParameter("sellValue");
	      }*/
	      if(request.getParameter("bCategoryFlag") != null)
	      {
	         bCategoryFlag = request.getParameter("bCategoryFlag");
	      }
	      if(request.getParameter("sCategoryFlag") != null)
	      {
	         sCategoryFlag = request.getParameter("sCategoryFlag");
	      }
	      if(request.getParameter("sortFlag") != null)
	      {
	         sortFlag = request.getParameter("sortFlag");
	      }
	      Map<String,String> valueMap =new HashMap();
	      
	      
		   valueMap.put("newValue", newValue);
		   valueMap.put("gradeValue", gradeValue);
//		   valueMap.put("sellValue", sellValue);
	      Map<String,String> map = new HashMap();
	      map.put("bCategoryFlag", bCategoryFlag);
	      map.put("sCategoryFlag", sCategoryFlag);
	      int numPerPage=6;
	      int contentCount=service.buyCount(map);
	      System.out.println(contentCount);
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage,"/makeit/buy/buymain.do"));
	      
	      List<Map> gradeList = service.sellMainGrade(map,cPage,numPerPage);
//	      List<Map> performanceList = service.sellMainPerformance(map,cPage,numPerPage);
	      List<Map<String,String>> newList = service.sellMainNew(map,cPage,numPerPage);
	      System.out.println("안녕하세요"+newList);
	      mv.addObject("gradeList",gradeList);
	      System.out.println(newList+"뉴리스트!!!!!");
//	      mv.addObject("performanceList",performanceList);
	      mv.addObject("valueMap", valueMap);
	      mv.addObject("newList",newList);
	      mv.addObject("bCategoryFlag",bCategoryFlag);
	      mv.addObject("sCategoryFlag",sCategoryFlag);
	      mv.addObject("sortFlag",sortFlag);
	      mv.setViewName("buy/buymain");
	      return mv;
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
