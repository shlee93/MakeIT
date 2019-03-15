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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.PageFactory;
import com.kh.makeit.sell.model.service.sellService;
import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;
import com.kh.makeit.sell.model.vo.SellmainOption;

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
   public ModelAndView sellMain(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage, HttpServletRequest request)
   {
      String sCategoryFlag ="";
      String newValue="1";
      String gradeValue="";
      String sellValue="";
      if(request.getParameter("newValue") != null)
      {
         newValue = request.getParameter("newValue");
      }
      if(request.getParameter("gradeValue") != null)
      {
    	  gradeValue = request.getParameter("gradeValue");    	  
      }
      if(request.getParameter("sellValue") != null)
      {
    	  sellValue = request.getParameter("sellValue");
      }

      if(request.getParameter("sCategoryFlag") != null)
      {
         sCategoryFlag = request.getParameter("sCategoryFlag");
      }
      System.out.println(sCategoryFlag+"메인에서오는놈");
      Map<String,String> valueMap =new HashMap();
      

	   valueMap.put("newValue", newValue);
	   valueMap.put("gradeValue", gradeValue);
	   valueMap.put("sellValue", sellValue);
      Map<String,String> map = new HashMap();
      map.put("sCategoryFlag", sCategoryFlag);
      int numPerPage=6;
      int contentCount=service.sellCount(map);
      System.out.println(contentCount);
      ModelAndView mv = new ModelAndView();
      mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellmain.do"));
      
      List<Map> gradeList = service.sellMainGrade(map,cPage,numPerPage);
      List<Map> performanceList = service.sellMainPerformance(map,cPage,numPerPage);
      List<Map<String,String>> newList = service.sellMainNew(map,cPage,numPerPage);
      System.out.println("안녕하세요"+newList);
      mv.addObject("gradeList",gradeList);

      mv.addObject("performanceList",performanceList);
      mv.addObject("valueMap", valueMap);
      mv.addObject("newList",newList);
      mv.addObject("sCategoryFlag",sCategoryFlag);
      mv.setViewName("sell/sellmain");
      return mv;
   }
   
   @RequestMapping("/sell/sellWrite.do")
   public String sellWrite()
   {
      return "sell/sellwrite";
   }
   @RequestMapping("/sell/sellWriteEnd")
   public ModelAndView sellWriteEnd(String[] price,int interest, int detailInterest,String writeTitle,String[] endDate,String[] productOption,String sellContent,MultipartFile[] input_file, int mainImgNo, HttpServletRequest request )
   {   
     System.out.println(mainImgNo + "메인이미지값");
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
   
   @RequestMapping("/imageDiv.do")
   @ResponseBody
   public SellAttach imageDiv(String sellNo)
   {
	   
	   SellAttach imgDiv = service.imageDiv(sellNo);
	   return imgDiv;
   }
   
   @RequestMapping("/sellprice.do")
   @ResponseBody
   public SellmainOption sellPrice(String sellNo)
   {
	   
	SellmainOption sop=service.sellPrice(sellNo);
	return sop;
   }
   
   @RequestMapping("/sell/sellNewChange.do")
   @ResponseBody
   public ModelAndView newVc(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String newValue,String gradeValue,String sellValue,HttpServletRequest request)
   {
	      String sCategoryFlag ="";
	      newValue="1";	     
	      if(request.getParameter("sCategoryFlag") != null)
	      {
	         sCategoryFlag = request.getParameter("sCategoryFlag");
	      }
	      System.out.println(sCategoryFlag+"EEEEEEEEEEEEEEEE");
	      Map<String,String> map = new HashMap();
	      map.put("sCategoryFlag", sCategoryFlag);
	      int numPerPage=6;
	      int contentCount=service.sellCount(map);	     
	      ModelAndView mv = new ModelAndView();	      
	      List<Map> gradeList = service.sellMainGrade(map,cPage,numPerPage);
	      /*List<Map> performanceList = service.sellMainPerformance(map);*/
	      List<Map<String,String>> newList = service.sellMainNew(map,cPage,numPerPage);
	      mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellNewChange.do"));
	      mv.addObject("newList",newList);
	   mv.setViewName("sell/sellNewMain");
	   return mv;
   }
   @RequestMapping("/sell/sellGradeChange.do")
   @ResponseBody
   public ModelAndView gradeVc(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,HttpServletRequest request)
   {	   
	    System.out.println("들어오니???????????????????????????");
	   	String sCategoryFlag ="";      	      	      
	      if(request.getParameter("sCategoryFlag") != null)
	      {
	         sCategoryFlag = request.getParameter("sCategoryFlag");
	      }
	      System.out.println(sCategoryFlag+"그레이드메인");
	  
	      Map<String,String> map = new HashMap();
	      map.put("sCategoryFlag", sCategoryFlag);
	      int numPerPage=6;
	      int contentCount=service.sellCount(map);	     
	      ModelAndView mv = new ModelAndView();	      
	      List<Map> gradeList = service.sellMainGrade(map,cPage,numPerPage);
	      /*List<Map> performanceList = service.sellMainPerformance(map);*/
	      mv.addObject("gradeList",gradeList);
	      mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellGradeChange.do"));	      
	   mv.setViewName("sell/sellGradeMain");
	   return mv;
   }

   @RequestMapping("/sell/sellSellChange.do")
   @ResponseBody
   public ModelAndView sellSellPageBar(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,HttpServletRequest request)
   {	   	  
	      String sCategoryFlag ="";
	      String sortFlag = "1";
	   
	
	      if(request.getParameter("sCategoryFlag") != null)
	      {
	         sCategoryFlag = request.getParameter("sCategoryFlag");
	      }
	    
	  
	      Map<String,String> map = new HashMap();
	      map.put("sCategoryFlag", sCategoryFlag);
	      int numPerPage=6;
	      int contentCount=service.sellPerCount(map);
	      ModelAndView mv = new ModelAndView();
	      
	      List<Map> performanceList = service.sellMainPerformance(map,cPage,numPerPage);
	      mv.addObject("performanceList",performanceList);
	      mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellSellChange.do"));
	      mv.setViewName("sell/sellPerformanceMain");
	      return mv;
   }
   @RequestMapping("/sell/sellSellSearch.do")
   @ResponseBody
   public ModelAndView sellSearch(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String searchtype,String searchValue,String sCategoryFlag,String newValue,String gradeValue,String sellValue)
   {
	   Map map=new HashMap();
	   System.out.println("서치타입"+searchtype);
	   System.out.println("서치벨류"+searchValue);
	   System.out.println("에스카테고리"+sCategoryFlag);
	   System.out.println("newValue"+newValue);
	   System.out.println("gradeValue"+gradeValue);
	   System.out.println("sellValue"+sellValue);
	   map.put("searchtype", searchtype);
	   map.put("searchValue", searchValue);
	   map.put("sCategoryFlag",sCategoryFlag);
	   map.put("newValue",newValue);
	   map.put("gradeValue", gradeValue);
	   map.put("sellValue", sellValue);
	   Map<String,String> map2 = new HashMap();
	   map2.put("searchtype", searchtype);
	   map2.put("searchValue", searchValue);
	   map2.put("sCategoryFlag",sCategoryFlag);
	   map2.put("newValue",newValue);
	   map2.put("gradeValue", gradeValue);
	   map2.put("sellValue", sellValue);
	   map2.put("sCategoryFlag", sCategoryFlag);
	   int numPerPage=6;
	   int contentCount=0;
	   
	   ModelAndView mv = new ModelAndView();
	   
	   if(newValue.equals("1"))
	   {
		   contentCount=service.searchCount(map2);
		   List<Map<String,String>> searchList = service.sellSearch(map,numPerPage,contentCount,cPage);
		   mv.addObject("newList",searchList);
		   mv.setViewName("sell/sellNewMain");
		   
		   mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellNewChange.do"));
	   }
	   else if(gradeValue.equals("1"))
	   {
		   contentCount=service.searchCount(map2);
		   List<Map<String,String>> searchList = service.sellSearch(map,numPerPage,contentCount,cPage);
		   mv.addObject("gradeList",searchList);
		   mv.setViewName("sell/sellGradeMain");
		   
		   mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellGradeChange.do"));
	   }
	   else if(sellValue.equals("1"))
	   {
		   contentCount=service.searchPerCount(map2);
		   List<Map<String,String>> searchList = service.sellSearch(map,numPerPage,contentCount,cPage);
		   mv.addObject("performanceList",searchList);
		   mv.setViewName("sell/sellPerformanceMain");
		   
		   mv.addObject("pageBar",PageFactory.getPageBar2(contentCount, cPage, numPerPage,"/makeit/sell/sellSellChange.do"));
	   }
	   
	   return mv;
   }
   //메인페이지에서 이미지클릭해서 상세뷰로
   @RequestMapping("/sell/selldetail")
   public ModelAndView selldeatailView(int sellno,HttpServletRequest request)
   {
	   List<Map<String,String>> detailList=service.selldetailView(sellno);
	   List<Map<String,String>> mainimgList=service.selldetailImg(sellno);
	   List<Map<String,String>> optionList=service.selldetailOption(sellno);
	   List<Map<String,String>> sellReivew=service.sellReview(sellno);
	   List<Map<String,String>> subimgList=service.sellsubImg(sellno);
	  
	   HttpSession session = request.getSession();
	   ModelAndView mv = new ModelAndView();
	   if((Map)session.getAttribute("member")!=null)
	   {
		   
		   Map<String,String> sessionMap=(Map)session.getAttribute("member");
		   String loginMember=String.valueOf(sessionMap.get("MEMBERID"));
		   Map outBoxc= new HashMap();
		   outBoxc.put("sellno",sellno);
		   outBoxc.put("loginMember", loginMember);
		   Map outBoxYn=service.sellOutBoxYn(outBoxc);
		   mv.addObject("outBoxYn",outBoxYn);
		   mv.addObject("session", sessionMap);
	   }
	  
	   mv.addObject("subimgList",subimgList);
	   mv.addObject("detailList",detailList);
	   mv.addObject("mainimgList",mainimgList);
	   mv.addObject("optionList",optionList);
	   mv.addObject("sellReivew",sellReivew);
	   mv.setViewName("sell/sellDetail");
	   return mv;
   }
   @RequestMapping("/sell/sellModify")
   public ModelAndView sellModify(HttpServletRequest request,int sellno)
   {
	  /* sellno=request.getParameter("sellno");*/
	  System.out.println(sellno);
	  ModelAndView mv = new ModelAndView();
	  Map modifyMap=service.sellModify(sellno);
	  List<Map<String,String>> modifyOption=service.sellOptionModify(sellno);
	  List<Map<String,String>> modifyImg=service.sellImgModify(sellno); 
	  mv.addObject("modifyMap",modifyMap);
	  mv.addObject("modifyImg",modifyImg);
	  mv.addObject("modifyOption",modifyOption);
	  mv.setViewName("/sell/sellModify");
	  return mv;
   }
   @RequestMapping("/sell/sellModifyEnd")
   public ModelAndView sellModify(int sellno,String[] price,int interest, int detailInterest,String writeTitle,String[] endDate,String[] productOption,String sellContent,MultipartFile[] input_file, int mainImgNo, HttpServletRequest request)
   {
	   	  HttpSession session = request.getSession();
	   	  Map sessionMap=(Map)session.getAttribute("member");
	      Map dataMap=new HashMap();
	      SellOption selloption = new SellOption();
	      selloption.setSellPrice(price);
	      selloption.setSelldeadline(endDate);
	      selloption.setSellOptionContent(productOption);
	      dataMap.put("sellno", sellno);
	      dataMap.put("interest", interest);
	      dataMap.put("detailInterest", detailInterest);
	      dataMap.put("writer", sessionMap.get("MEMBERID"));
	      dataMap.put("title", writeTitle);
	      dataMap.put("content", sellContent);
	      ArrayList<SellAttach> files=new ArrayList();
	      String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/sell");
	      Map imgMap=new HashMap();
	      
	      
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
	      int result=service.sellModifyEnd(files,dataMap,selloption);
	      String msg="";
	      String loc="";
	      ModelAndView mv = new ModelAndView();
	      if(result>0)
	      {
	         msg="판매글 수정을 완료하였습니다.";
	         loc="/sell/sellmain.do";
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }else {
	         msg="판매글 수정에 실패하였습니다. 다시 시도해 주세요";
	         loc="/sell/sellModify";
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }
 
   }
  
   //찜하기 메소드 ㅎ
   @RequestMapping("sell/sellOutBox.do")
   public ModelAndView sellOutBoxInsert(int sellno,HttpServletRequest request)
   {
	   ModelAndView mv= new ModelAndView();
	   HttpSession session = request.getSession();
	   Map sessionMap=(Map)session.getAttribute("member");
	   Map outBoxInsert =new HashMap();
	   outBoxInsert.put("sellno", sellno);
	   outBoxInsert.put("memberId", sessionMap.get("MEMBERID"));
	   int result =service.sellOutBoxInsert(outBoxInsert);
	   		String msg="";
	      String loc="";
	     
	      if(result>0)
	      {
	         msg="판매글 찜을 완료하였습니다.";
	         loc="/sell/selldetail.do?sellno="+sellno;
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }else {
	         msg="판매글 찜에 실패하였습니다. 다시 시도해 주세요";
	         loc="/sell/selldetail.do?sellno="+sellno;
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }
	   
   }
   //찜풀기 메소드 ㅎ
   @RequestMapping("/sell/sellOutBoxDel.do")
   public ModelAndView sellOutBoxDelete(int sellno,HttpServletRequest request)
   {
	   ModelAndView mv= new ModelAndView();
	   HttpSession session = request.getSession();
	   Map sessionMap=(Map)session.getAttribute("member");
	   Map outBoxDelete =new HashMap();
	   outBoxDelete.put("sellno", sellno);
	   outBoxDelete.put("memberId", sessionMap.get("MEMBERID"));
	   int result =service.sellOutBoxDelete(outBoxDelete);
	   		String msg="";
	      String loc="";
	     
	      if(result>0)
	      {
	         msg="판매글 찜을 해제하였습니다.";
	         loc="/sell/selldetail.do?sellno="+sellno;
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }else {
	         msg="판매글 찜을 해제하지 못하였습니다. 다시 시도해 주세요 ";
	         loc="/sell/selldetail.do?sellno="+sellno;
	         mv.addObject("msg",msg);
	         mv.addObject("loc",loc);
	         mv.setViewName("common/msg");
	         return mv;
	      }
   }
   //신고하는창 띄워주기
   @RequestMapping("/sell/sellReport")
   public ModelAndView sellReportPop(int sellno,HttpServletRequest request,String sellWriter)
   {
	   System.out.println(sellno+sellWriter);
	   ModelAndView mv = new ModelAndView();	   
	   Map reportMap=new HashMap();
	   /*reportMap.put("sellno", sellno);
	   reportMap.put("sellWriter",sellWriter );*/
	   mv.addObject("sellno",sellno);
	   mv.addObject("sellWriter",sellWriter);
	   mv.setViewName("sell/sellReport");
	   return mv;
   }
   
}