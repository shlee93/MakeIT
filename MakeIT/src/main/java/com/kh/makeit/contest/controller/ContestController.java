package com.kh.makeit.contest.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.common.ApplicantConfirmMail;
import com.kh.makeit.common.PageFactory;
import com.kh.makeit.common.exception.BoardException;
import com.kh.makeit.contest.service.ContestService;
import com.kh.makeit.contest.vo.ContestImg;

@Controller

public class ContestController 
{
	@Autowired 
	ContestService cs;
	
	
	@RequestMapping("/contest/contestMain.do")
	public ModelAndView contestMain(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpServletRequest request, String sortTypeFlag)
	{
		System.out.println("현재P"+cPage);
		int numPerPage=5;
		ModelAndView mv=new ModelAndView();
		int contentCount=cs.contestCountService();		
		
		List<Map<String,String>> contestList=cs.getContestListService(cPage,numPerPage);
		
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, request.getContextPath()+"/contest/contestMain.do"));
		for(int i=0; i<contestList.size(); i++)
		{
			String contestDate=String.valueOf(contestList.get(i).get("CONTESTDATE")).substring(0, 10);
			contestList.get(i).put("CONTESTDATE", contestDate);
			String contestDeadLine=String.valueOf(contestList.get(i).get("CONTESTDEADLINE")).substring(0, 10);
			contestList.get(i).put("CONTESTDEADLINE", contestDeadLine);
		}
		mv.addObject("contestList", contestList);
		mv.setViewName("contest/contestMain");		
		
		return mv;
	}
	@RequestMapping("/contest/sort.do")
	public ModelAndView sortMain(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpServletRequest request, String interestFlag, String detailInterestFlag, String searchTypeFlag, String searchTypeKeyword, String sortTypeFlag)
	{
		Map searchFlag=new HashMap();
		ModelAndView mv=new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>> contestList = null;
		if(interestFlag!=null)
		{
			System.out.println("인터레스트플래그 : "+interestFlag);
			searchFlag.put("interestFlag",interestFlag);
			mv.addObject("interestFlag", interestFlag);
		}
		if(detailInterestFlag!=null)
		{
			System.out.println("디테일인터레스트플래그 : "+detailInterestFlag);
			searchFlag.put("detailInterestFlag",detailInterestFlag);
			mv.addObject("detailInterestFlag", detailInterestFlag);
		}
		if(sortTypeFlag!=null)
		{
			System.out.println("솔트타입플래그 : "+sortTypeFlag);
			searchFlag.put("sortTypeFlag",sortTypeFlag);
			mv.addObject("sortTypeFlag", sortTypeFlag);
		}
		if(searchTypeFlag!=null)
		{
			System.out.println("서치타입플래그 : "+searchTypeFlag);
			searchFlag.put("searchTypeFlag", searchTypeFlag);
			mv.addObject("searchTypeFlag", searchTypeFlag); 
		}
		if(searchTypeKeyword!=null)
		{
			System.out.println("서치타입키워드 : "+searchTypeKeyword);
			searchFlag.put("searchTypeKeyword",searchTypeKeyword);
			mv.addObject("searchTypeKeyword", searchTypeKeyword);
		}
		
		int contentCount=cs.sortCountService(searchFlag);		
		
		contestList=cs.contestSortService(cPage,numPerPage,searchFlag);
		
		mv.addObject("pageBar",PageFactory.getSearchPageBar(contentCount, cPage, numPerPage, interestFlag,  detailInterestFlag,  searchTypeFlag,  searchTypeKeyword,  sortTypeFlag, request.getContextPath()+"/contest/sort.do"));
		for(int i=0; i<contestList.size(); i++)
		{
			String contestDate=String.valueOf(contestList.get(i).get("CONTESTDATE")).substring(0, 10);
			contestList.get(i).put("CONTESTDATE", contestDate);
			String contestDeadLine=String.valueOf(contestList.get(i).get("CONTESTDEADLINE")).substring(0, 10);
			contestList.get(i).put("CONTESTDEADLINE", contestDeadLine);
		}
		mv.addObject("contestList", contestList);
		mv.setViewName("contest/contestMain");	
		
		return mv;
	}
	
	@RequestMapping("/contest/contestPerFirstImg.do")
	@ResponseBody
	public ContestImg contestPerFirstImg(int contestNo)
	{
		ContestImg contestPerFirstImg=cs.getContestPerFirstImgService(contestNo);
		
		return contestPerFirstImg;
	}
	
	@RequestMapping("/contest/contestDetail.do")
	public ModelAndView contestDetail(HttpServletRequest request, int contestNo)
	{
		HttpSession session= request.getSession();
		Map<String,String> memberMap=(Map)session.getAttribute("member");
		if(memberMap!=null)
		{
			String currentAccessId=memberMap.get("memberId");
		}
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>> contestContainer=cs.contestDetailService(contestNo);
		if(contestContainer.size()>1)
		{
			List<Map<String,String>> contestSubImgList=new ArrayList();
			Map<String,String> contestMainImg=contestContainer.get(0);
			for(int i=0;i<contestContainer.size()-2;i++)
			{
				contestSubImgList.add(i,contestContainer.get(i+1));
				System.out.println("포문 잘 돌아가니?"+contestSubImgList);
			}
			Map<String,String> contestObj= contestContainer.get(contestContainer.size()-1);
			System.out.println(contestObj);
			mv.addObject("contestMainImg", contestMainImg);
			mv.addObject("contestSubImgList", contestSubImgList);
			mv.addObject("contestObj", contestObj);
			mv.addObject("memberMap", memberMap);
			Map outBoxc= new HashMap();
			outBoxc.put("contestNo",contestNo);
			outBoxc.put("loginMember", memberMap.get("memberId"));
			Map outBoxYn=service.sellOutBoxYn(outBoxc);
			mv.addObject("outBoxYn",outBoxYn);
			mv.addObject("session", sessionMap);
		}
		else
		{
			Map<String,String> contestObj= contestContainer.get(contestContainer.size()-1);
			mv.addObject("contestObj",contestObj);
		}
		mv.setViewName("contest/contestDetail");
		return mv;
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
	public String contestFormEnd(String contestTitle, String contestContent, String contestDate, String contestDeadLine, String contestPrice, String detailInterestNo, String interestNo, HttpServletRequest request, int mainImgNo, MultipartFile[] upFile) throws BoardException
	{
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		Map<String,String> memberMap=(Map)session.getAttribute("member");
		Map<String,String> contest=new HashMap();
		String memberId=memberMap.get("MEMBERID");
		
		contest.put("contestTitle", contestTitle);
		contest.put("contestContent", contestContent);
		contest.put("contestDate",contestDate);
		contest.put("contestDeadLine", contestDeadLine);
		contest.put("contestPrice", contestPrice);
		contest.put("detailInterestNo",detailInterestNo);
		contest.put("interestNo", interestNo);
		contest.put("memberId", memberId);
		
		contest.put("memberId",memberId);
		
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/contest");
		ArrayList<ContestImg> files=new ArrayList<>();		
		
		  
		MultipartFile index = upFile[mainImgNo];
		upFile[mainImgNo] = upFile[0];
		upFile[0] = index;
		
		for(MultipartFile f:upFile)
		{  
			ContestImg contestImg=new ContestImg();
			if(!f.isEmpty())
			{
				//파일명을 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				try
				{
					f.transferTo(new File(savDir+"/"+reName));
				}
				catch(IllegalStateException | IOException e)
				{
					e.printStackTrace();
				}
				
				contestImg.setContestImgRe(reName);
				contestImg.setContestImgOri(oriFileName);
				files.add(contestImg);				
			}
		}
		cs.contestFormEndService(contest, files);
		
		return "redirect:/contest/contestMain.do";
	}
	
	//지원 유무 체크
	
	@RequestMapping("/contest/contestApplicantCheck.do")
	@ResponseBody
	public Map<String,String> contestApplicantCheck(String currentId, String contestNo)
	{
		Map<String,String> checkMap=new HashMap();
		checkMap.put("applicantId",currentId);
		
		System.out.println("접속된 아이디"+currentId);
		checkMap.put("contestNo", contestNo);
		if(cs.contestApplicantCheckService(checkMap)==null)
		{
			checkMap.put("modal","modalOpen");
		}
		else
		{
			checkMap.put("modal", "modalNo");
		}
		
		return checkMap;
	}
	
	@RequestMapping("/contest/contestApplicant.do")
	public ModelAndView contestApplicant(String contestNo, String applicantId, MultipartFile upFile, HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		ModelAndView mv=new ModelAndView();
		System.out.println(applicantId);
		System.out.println(contestNo);
		Map<String,String> applicant=new HashMap();
		applicant.put("applicantId",applicantId);
		applicant.put("contestNo", contestNo);
		System.out.println(upFile);
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/contest");
		
		if(upFile!=null)
		{
			//파일명을 생성(rename)
			String applicantFileOri=upFile.getOriginalFilename();
			String ext=applicantFileOri.substring(applicantFileOri.lastIndexOf("."));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv=(int)(Math.random()*1000);
			String applicantFileRe=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			try
			{
				upFile.transferTo(new File(savDir+"/"+applicantFileRe));
			}
			catch(IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
			
			applicant.put("applicantFileOri", applicantFileOri);
			applicant.put("applicantFileRe", applicantFileRe);							
		}	
		
		int result=cs.contestApplicantService(applicant);
		String loc="/contest/contestMain.do";
		String msg=null;
		
		if(result>0)
		{
			msg="지원이 완료되었습니다.";			
		}
		else
		{
			msg="이미 지원하셨습니다!";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");
		
		return mv;
	}
	
	@RequestMapping("/contest/contestApplicantList.do")
	@ResponseBody
	public List<Map> contestApplicantList(int contestNo)
	{		
		return cs.contestApplicantListService(contestNo);
	}
	
	@RequestMapping("/contest/applicantOneSel.do")
	@ResponseBody
	public Map contesApplicantOneSel(String applicantId, String contestNo)
	{
		System.out.println("지원자아이디"+applicantId);
		System.out.println("지원넘버"+contestNo);
		Map applicantInfo=new HashMap<>();
		applicantInfo.put("applicantId", applicantId);
		applicantInfo.put("contestNo", contestNo);
		return cs.contestApplicantOneService(applicantInfo);
	}
	
	@RequestMapping("/contest/fileDownload.do")
	public void fileDownload(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		
		String dir=request.getSession().getServletContext().getRealPath("/resources/upload/contest");
		File savedFile=new File(dir+"/"+rName);
		try
		{
			FileInputStream fis=new FileInputStream(savedFile);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			
			String resFileName="";
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||request.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE)
			{
				resFileName=URLEncoder.encode(oName, "UTF-8");
				resFileName=resFileName.replaceAll("\\+", "%20");
			}
			else
			{
				resFileName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition","attachment;filename=\""+resFileName+"\"");
			//파일 길이 설정
			response.setContentLength((int)savedFile.length());
			
			int read=0;
			while((read=bis.read())!=-1)
			{
				sos.write(read);
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				sos.close();
				bis.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}		
	}
	
	@RequestMapping("/contest/applicantConfirm.do")
	public ModelAndView applicantConfirm(int contestNoHidden, String applicantAcceptTarget, String applicantContestTitle)
	{
		ModelAndView mv=new ModelAndView();
		Map applicantConfirmInfo=new HashMap();
		applicantConfirmInfo.put("contestNo", contestNoHidden);
		applicantConfirmInfo.put("targetId", applicantAcceptTarget);
		int result=cs.applicantConfirmService(applicantConfirmInfo);
		
		String msg=null;
		String loc=null;
		if(result==1)
		{
			ApplicantConfirmMail acm= new ApplicantConfirmMail();
			System.out.println("지원자아이디"+applicantAcceptTarget);
			System.out.println("지원넘버"+contestNoHidden);
			Map applicantInfo=new HashMap<>();
			applicantInfo.put("applicantId", applicantAcceptTarget);
			applicantInfo.put("contestNo", contestNoHidden);
			String applicantEmail=String.valueOf(cs.contestApplicantOneService(applicantInfo).get("EMAIL"));
			
			/*System.out.println(applicantEmail,applicantAcceptTarget, applicantContestTitle);*/
			acm.sendmail(applicantEmail,applicantAcceptTarget, applicantContestTitle);
			msg="승인하였습니다.";
			loc="/contest/contestDetail.do?contestNo="+String.valueOf(contestNoHidden);
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");
		
		return mv;
	}
	
	@RequestMapping("/contest/contestDel.do")
	public String contestDel(int contestDelNo)
	{
		System.out.println(contestDelNo);
		cs.contestDelService(contestDelNo);
		
		return "redirect:/contest/contestMain.do";
	}
	
	@RequestMapping("/contest/contestModify.do")
	public ModelAndView contestModify(int contestDelNo, HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		ModelAndView mv=new ModelAndView();
		Map<String,String> memberMap=(Map)session.getAttribute("member");
		mv.addObject("memberMap", memberMap);	
		Map<String,String> contestObj=cs.contestModifyService(contestDelNo);
		contestObj.put("CONTESTDATE", String.valueOf(contestObj.get("CONTESTDATE")).substring(0, 10));
		contestObj.put("CONTESTDEADLINE", String.valueOf(contestObj.get("CONTESTDEADLINE")).substring(0, 10));
		List<Map<String,String>> contestImgList=cs.contestModifyImgService(contestDelNo); 
		mv.addObject("contest", contestObj);
		mv.addObject("contestImgList", contestImgList);
		mv.setViewName("contest/contestModify");
		
		return mv;
	}
	
	@RequestMapping("/contest/contestModifyEnd.do")
	public String contestModifyEnd(int contestNo, String contestTitle, String contestContent, String contestDate, String contestDeadLine, String contestPrice, String detailInterestNo, String interestNo, HttpServletRequest request, int mainImgNo, MultipartFile[] upFile) throws BoardException
	{
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		Map<String,String> memberMap=(Map)session.getAttribute("member");
		Map contest=new HashMap();
		String memberId=memberMap.get("MEMBERID");
		contest.put("contestNo", contestNo);
		contest.put("contestTitle", contestTitle);
		contest.put("contestContent", contestContent);
		contest.put("contestDate",contestDate);
		contest.put("contestDeadLine", contestDeadLine);
		contest.put("contestPrice", contestPrice);
		contest.put("detailInterestNo",detailInterestNo);
		contest.put("interestNo", interestNo);
		contest.put("memberId", memberId);
		
		if(upFile!=null)
		{
			String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/contest");
			ArrayList<ContestImg> files=new ArrayList<>();		
			  
		      MultipartFile index = upFile[mainImgNo];
		      upFile[mainImgNo] = upFile[0];
		      upFile[0] = index;
			
			for(MultipartFile f:upFile)
			{  
				ContestImg contestImg=new ContestImg();
				if(!f.isEmpty())
				{
					//파일명을 생성(rename)
					String oriFileName=f.getOriginalFilename();
					String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rdv=(int)(Math.random()*1000);
					String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
					
					try
					{
						f.transferTo(new File(savDir+"/"+reName));
					}
					catch(IllegalStateException | IOException e)
					{
						e.printStackTrace();
					}
					contestImg.setContestNo(contestNo);
					contestImg.setContestImgRe(reName);
					contestImg.setContestImgOri(oriFileName);
					files.add(contestImg);				
				}
			}
			cs.contestModifyEndService(contest, files);
		}
		
		return "redirect:/contest/contestMain.do";
	}
}
