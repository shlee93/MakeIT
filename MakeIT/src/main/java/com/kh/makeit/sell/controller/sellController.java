package com.kh.makeit.sell.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.sell.model.service.sellService;
import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;

@Controller
public class sellController {

	@Autowired
	sellService service;
	@RequestMapping("/sell/sellDetail.do")
	public String sellDetail()
	{
		return "sell/sellDetail"; 
	}
	
	@RequestMapping("/sell/sellmain.do")
	public ModelAndView sellMain(HttpServletRequest request)
	{
		String bCategoryFlag = "1";
		String sCategoryFlag = "";
		String sortFlag = "1";
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
		
		Map<String,String> map = new HashMap();
		map.put("bCategoryFlag", bCategoryFlag);
		map.put("sCategoryFlag", sCategoryFlag);
		
		ModelAndView mv = new ModelAndView();
		
		List<Map> gradeList = service.sellMainGrade(map);
		List<Map> performanceList = service.sellMainPerformance(map);
		List<Map> newList = service.sellMainNew(map);
		
		mv.addObject(gradeList);
		mv.addObject(performanceList);
		mv.addObject(newList);
		mv.addObject(bCategoryFlag);
		mv.addObject(sCategoryFlag);
		mv.addObject(sortFlag);
		
		//System.out.println(performanceList);
		mv.setViewName("sell/sellmain");
		return mv;
	}
	
	@RequestMapping("/sell/sellWrite.do")
	public String sellWrite()
	{
		return "sell/sellwrite";
	}
	@RequestMapping("/sell/sellWriteEnd")
	public ModelAndView sellWriteEnd(String[] price,int interest, int detailInterest,String writeTitle,String[] endDate,String[] productOption,String sellContent,MultipartFile[] input_file,HttpServletRequest request )
	{	
		System.out.println(interest+"대분류");
		System.out.println(detailInterest+"소분류");
		HttpSession session = request.getSession();
		Map sessionMap=(Map)session.getAttribute("member");
		Map dataMap=new HashMap();
		SellOption selloption = new SellOption();
		selloption.setSellPrice(price);
		selloption.setSelldeadline(endDate);
		selloption.setSellOptionContent(productOption);
		dataMap.put("interest", interest);
		dataMap.put("detailInterest", detailInterest);
		dataMap.put("writer", sessionMap.get("MEMBERID"));
		dataMap.put("title", writeTitle);
		dataMap.put("content", sellContent);
		ArrayList<SellAttach> files=new ArrayList();
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/sell");
		Map imgMap=new HashMap();
		for(MultipartFile f: input_file)
		{
			if(!f.isEmpty()) {
				//파일명 생성(rename)
				String orifileName=f.getOriginalFilename();
				String ext=orifileName.substring(orifileName.lastIndexOf(".")); //.부터 확장자까지 가져오기
				//rename규칙 설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
				int rdv=(int)(Math.random()*1000); //랜덤값설정
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;  //새이름
				//파일입출력ㅎ
				try {
					System.out.println("파일입출력되니?");
					f.transferTo(new File(savDir+"/"+reName)); //저경로에다가 파일을 생성해주는것
				}catch(IllegalStateException | IOException e) {  //일리갈은 세이브디아이알 못찾을때 뜨는것
					e.printStackTrace();
				}
				SellAttach sa = new SellAttach();
				sa.setSellImgRe(reName);
				sa.setSellImgOri(orifileName);
				files.add(sa);
			}
		}
		int result=service.sellWriteEnd(files,dataMap,selloption);
		String msg="";
		String loc="";
		ModelAndView mv = new ModelAndView();
		if(result>0)
		{
			msg="판매글 작성을 완료하였습니다.";
			loc="/sell/sellmain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			return mv;
		}else {
			msg="판매글 등록에 실패하였습니다. 다시 시도해 주세요";
			loc="/sell/sellWrite.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			return mv;
		}
		
	}
	//ajax 카테고리 분류
	@RequestMapping(value="/sell/findInterest", produces = "application/text; charset=utf-8")
	@ResponseBody
	public ModelAndView findInterest(int interest, ServletRequest request) throws UnsupportedEncodingException
	{	
		System.out.println("번호번호"+interest);
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
