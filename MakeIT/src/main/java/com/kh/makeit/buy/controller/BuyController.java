package com.kh.makeit.buy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.buy.model.service.BuyService;
import com.kh.makeit.buy.model.vo.BuyAttach;
import com.kh.makeit.common.PageFactory;
import com.kh.makeit.sell.model.vo.SellAttach;

@Controller
public class BuyController {
	@Autowired
	BuyService service;
	
	@RequestMapping("/buy/buymain.do")
	public ModelAndView buyMain(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage, HttpServletRequest request)
	{
		String sCategoryFlag ="";
		String newValue="1";
		String gradeValue="";
		if(request.getParameter("newValue") != null)
		{
			newValue = request.getParameter("newValue");
		}
		if(request.getParameter("gradeValue") != null)
		{
			gradeValue = request.getParameter("gradeValue");    	  
		}
		if(request.getParameter("sCategoryFlag") != null)
		{
			 sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		System.out.println(sCategoryFlag+"메인에서오는놈");
		Map<String,String> valueMap =new HashMap();
		
		valueMap.put("newValue", newValue);
		valueMap.put("gradeValue", gradeValue);
		Map<String,String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage=6;
		int contentCount=service.buyCount(map);
		System.out.println(contentCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/buy/buymain.do"));
		
		List<Map<String,String>> gradeList = service.buyMainGrade(map,cPage,numPerPage);
		List<Map<String,String>> newList = service.buyMainNew(map,cPage,numPerPage);
		System.out.println("안녕하세요"+newList);
		mv.addObject("gradeList",gradeList);
		mv.addObject("valueMap", valueMap);
		mv.addObject("newList",newList);
		mv.addObject("sCategoryFlag",sCategoryFlag);
		mv.setViewName("buy/buymain");
		return mv;
	}
	  
	@RequestMapping("/imageDiv2.do")
	@ResponseBody
	public BuyAttach imageDiv2(String buyNo)
	{
		BuyAttach imgDiv = service.imageDiv2(buyNo);
		return imgDiv;
	}
	
	@RequestMapping("/buy/buyNewChange.do")
	@ResponseBody
	public ModelAndView newVc(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,HttpServletRequest request)
	{
		String sCategoryFlag ="";	     
		if(request.getParameter("sCategoryFlag") != null)
		{
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		Map<String,String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage=6;
		int contentCount=service.buyCount(map);	     
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> newList = service.buyMainNew(map,cPage,numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/buy/buyNewChange.do"));
		mv.addObject("newList",newList);
		mv.setViewName("buy/buyNewMain");
		return mv;
	}
	
   
	@RequestMapping("/buy/buyGradeChange.do")
	@ResponseBody
	public ModelAndView gradeVc(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,HttpServletRequest request)
	{
		String sCategoryFlag ="";     
		if(request.getParameter("sCategoryFlag") != null)
		{
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		Map<String,String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage=6;
		int contentCount=service.buyCount(map);	     
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> gradeList = service.buyMainGrade(map,cPage,numPerPage);
		
		mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/buy/buyGradeChange.do"));
		mv.addObject("gradeList",gradeList);
		mv.setViewName("buy/buyGradeMain");
		return mv;
	}
	
	@RequestMapping("/buy/buyBuySearch.do")
	@ResponseBody
	public ModelAndView buySearch(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage, String searchtype, String searchValue, String sCategoryFlag, String newValue, String gradeValue) 
	{
		
		Map map = new HashMap();
		map.put("searchtype", searchtype);
		map.put("searchValue", searchValue);
		map.put("sCategoryFlag", sCategoryFlag);
		map.put("newValue", newValue);
		map.put("gradeValue", gradeValue);
		
		Map<String, String> map2 = new HashMap();
		map2.put("searchtype", searchtype);
		map2.put("searchValue", searchValue);
		map2.put("sCategoryFlag", sCategoryFlag);
		map2.put("newValue", newValue);
		map2.put("gradeValue", gradeValue);
		map2.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = 0;
		
		List<Map<String, String>> searchList = service.buySearch(map, numPerPage, contentCount, cPage);
		
		ModelAndView mv = new ModelAndView();
		
		if (newValue.equals("1")) {
			contentCount = service.searchCount(map2);
			
			mv.addObject("newList", searchList);
			mv.setViewName("buy/buyNewMain");
			mv.addObject("pageBar", PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/buy/buyNewChange.do"));
		} 
		else if (gradeValue.equals("1")) {
			contentCount = service.searchCount(map2);
			
			mv.addObject("gradeList", searchList);
			mv.setViewName("buy/buyGradeMain");
			mv.addObject("pageBar", PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/buy/buyGradeChange.do"));
		}

		return mv;
	}
	
	
	@RequestMapping("/buy/buyDetail")
	public ModelAndView buyDetail(int buyNo, HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Map sessionMap=(Map)session.getAttribute("member");
		Map<String,String> specList = new HashMap();
		Map specMap = new HashMap();
		if(sessionMap != null)
		{
			specMap.put("memberId", sessionMap.get("MEMBERID"));
			specMap.put("buyNo", buyNo);
			specList = service.selectSpec(specMap);
			mv.addObject("specList", specList);
		}
		
		
		Map<String,String> detailList = service.buyDetail(buyNo);
		Map<String,String> mainimgList = service.selectMainImg(buyNo); 
		List<Map<String,String>> subimgList = service.selectSubImg(buyNo);
		List<Map<String,String>> reviewList = service.selectReview(buyNo);
		int reviewCnt = service.selectReviewCnt(buyNo);
		
				
		mv.addObject("detailList",detailList);
		mv.addObject("mainimgList", mainimgList);
		mv.addObject("subimgList", subimgList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewCnt", reviewCnt);
		
		mv.setViewName("buy/buydetail2");
		return mv;
	}
	@RequestMapping("/buy/buyWrite.do")
	public String buyWrite()
	{
		return "buy/buywrite";
	}
	
	@RequestMapping("/buy/buyWriteEnd.do")
	public ModelAndView buyWriteEnd(String interest, String detailInterest, String writeTitle, String price, String buyContent, MultipartFile[] input_file, int mainImgNo, HttpServletRequest request)
	{
		System.out.println("대분류" + interest);
		System.out.println("소분류" + detailInterest);
		System.out.println("제목" + writeTitle);
		System.out.println("가격" + price);
		for(MultipartFile a : input_file)
		{
			System.out.println("asdf" + a.getOriginalFilename());
		}
		
		
		
		HttpSession session = request.getSession();
		Map<String,String> sessionMap = (Map)session.getAttribute("member");
		Map<String,String> map = new HashMap();
		map.put("interest", interest);
		map.put("detailInterest", detailInterest);
		map.put("writer", sessionMap.get("MEMBERID"));
		map.put("title", writeTitle);
		map.put("price", price);
		map.put("content", buyContent);
		ArrayList<BuyAttach> files=new ArrayList();
		String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/buy");
		
		MultipartFile index = input_file[mainImgNo];
		input_file[mainImgNo] = input_file[0];
	    input_file[0] = index;
	    
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
					f.transferTo(new File(savDir+"/"+reName)); //저경로에다가 파일을 생성해주는것
				}catch(IllegalStateException | IOException e) {  //일리갈은 세이브디아이알 못찾을때 뜨는것
					e.printStackTrace();
				}
				BuyAttach sa = new BuyAttach();
				sa.setBuyImgRe(reName);
				sa.setBuyImgOri(orifileName);
				files.add(sa);
			}
		}
		
		int result = service.buyWriteEnd(files, map);
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		if(result > 0)
		{
			msg="구매글 작성을 완료하였습니다.";
			loc="/buy/buymain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		else
		{
			msg="구매글 등록에 실패하였습니다. 다시 시도해 주세요.";
			loc="/buy/buyWrite.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		return mv;
	}
	
	@RequestMapping("/buy/writeReview.do")
	public ModelAndView writeReview(String buyNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("buyNo", buyNo);
		mv.setViewName("buy/buyStarPop");
		return mv;
	}
	
	@RequestMapping("/buy/writeReviewEnd.do")
	public ModelAndView writeReviewEnd(String buyNo, String reviewContent, String starCount, HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Map<String,String> sessionMap = (Map)session.getAttribute("member");
		
		Map<String,String> map = new HashMap();
		map.put("buyNo", buyNo);
		map.put("reviewContent", reviewContent);
		map.put("starCount", starCount);
		map.put("memberId", sessionMap.get("MEMBERID"));
		int result = service.insertReview(map);
		
		String msg = "";
		String loc = "";
		
		if(result > 0)
		{
			msg = "후기가 등록되었습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.addObject("script","window.close();opener.location.reload();");
			mv.setViewName("common/msg");
		}
		else
		{
			msg = "후기 등록에 실패하였습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		
		return mv;
	}
	
	@RequestMapping("/buy/buyReviewDel.do")
	public ModelAndView buyReviewDel(String reviewNo, String buyNo)
	{
		ModelAndView mv = new ModelAndView();
		
		Map<String,String> map = new HashMap();
		map.put("reviewNo", reviewNo);
		map.put("buyNo", buyNo);
		
		int result = service.deleteReview(map);
		
		String msg = "";
		String loc = "";
		
		if(result > 0)
		{
			msg = "후기가 삭제되었습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
		}
		else
		{
			msg = "후기 삭제에 실패하였습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/buy/modReview.do")
	public ModelAndView modReview(String buyNo, String reviewNo)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("buyNo", buyNo);
		mv.addObject("reviewNo", reviewNo);
		mv.setViewName("buy/buyStarPop");
		return mv;
	}
	
	@RequestMapping("/buy/modReviewEnd.do")
	public ModelAndView modReviewEnd(String buyNo, String reviewContent, String starCount, String reviewNo, HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Map<String,String> sessionMap = (Map)session.getAttribute("member");
		
		Map<String,String> map = new HashMap();
		map.put("buyNo", buyNo);
		map.put("reviewContent", reviewContent);
		map.put("starCount", starCount);
		map.put("memberId", sessionMap.get("MEMBERID"));
		map.put("reviewNo", reviewNo);
		int result = service.updateReview(map);
		
		String msg = "";
		String loc = "";
		
		if(result > 0)
		{
			msg = "후기가 변경되었습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.addObject("script","window.close();opener.location.reload();");
			mv.setViewName("common/msg");
		}
		else
		{
			msg = "후기 변경에 실패하였습니다.";
			loc = "/buy/buyDetail?buyNo="+buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		
		return mv;
	}
	
	@RequestMapping("/buy/buyVol.do")
	public ModelAndView buyVol(String buyNo)
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("buyNo", buyNo);
		mv.setViewName("buy/buyVol");
		return mv;
	}
	
	@RequestMapping("/buy/buyVolEnd.do")
	public ModelAndView buyVolEnd(String title, String content, String buyNo, MultipartFile[] input_file, HttpServletRequest request)
	{
		System.out.println(title);
		System.out.println(content);
		System.out.println(buyNo);
		for(MultipartFile a : input_file)
		{
			System.out.println("asdf" + a.getOriginalFilename());
		}
		HttpSession session = request.getSession();
		Map<String,String> sessionMap = (Map)session.getAttribute("member");
		Map<String,String> map = new HashMap();
		map.put("title", title);
		map.put("content", content);
		map.put("memberId", sessionMap.get("MEMBERID"));
		map.put("buyNo", buyNo);
	
		List<Map<String,String>> files=new ArrayList();
		String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/buyVol");
		
	    
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
					f.transferTo(new File(savDir+"/"+reName)); //저경로에다가 파일을 생성해주는것
				}catch(IllegalStateException | IOException e) {  //일리갈은 세이브디아이알 못찾을때 뜨는것
					e.printStackTrace();
				}
				Map sa = new HashMap();
				sa.put("reName",reName);
				sa.put("oriName", orifileName);
				sa.put("memberId", sessionMap.get("MEMBERID"));
				sa.put("buyNo", buyNo);
				files.add(sa);
			}
		}
		
		int result = service.buyVolEnd(files, map);
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		if(result > 0)
		{
			msg="지원을 완료하였습니다.";
			loc="/buy/buyDetail.do?buyNo=" + buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		else
		{
			msg="지원에 실패하였습니다. 다시 시도해 주세요.";
			loc="/buy/buyDetail.do?buyNo=" + buyNo;
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		return mv;
	}
	
	@RequestMapping("/buy/volList.do")
	public ModelAndView selectVolList(String buyNo)
	{
		ModelAndView mv = new ModelAndView();
		
		Map<String,String> map = new HashMap();
		map.put("buyNo", buyNo);
		map.put("category", "B");
		
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
	
	@RequestMapping("/buy/anotherView.do")
	@ResponseBody
	public ModelAndView anotherView(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage, String memberId ) 
	{
		
		Map map = new HashMap();
		
		int numPerPage = 6;
		int contentCount = 0;
		
		List<Map<String, String>> anotherList = service.selectAnother(memberId, numPerPage, contentCount, cPage);
		
		ModelAndView mv = new ModelAndView();
		
		contentCount = service.anotherCount(memberId);
		
		mv.addObject("newList", anotherList);
		mv.setViewName("buy/buyAnother");
		mv.addObject("pageBar", PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/buy/anotherView.do"));
		
		return mv;
	}
}
