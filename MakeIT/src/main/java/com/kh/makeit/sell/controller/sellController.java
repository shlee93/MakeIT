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

import com.kh.makeit.buy.model.vo.BuyAttach;
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
	public String sellDetail() {
		return "sell/sellDetail";
	}

	@RequestMapping("/sell/sellmain.do")
	public ModelAndView sellMain(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			HttpServletRequest request) {
		String sCategoryFlag = "";
		String newValue = "1";
		String gradeValue = "";
		String sellValue = "";
		if (request.getParameter("newValue") != null) {
			newValue = request.getParameter("newValue");
		}
		if (request.getParameter("gradeValue") != null) {
			gradeValue = request.getParameter("gradeValue");
		}
		if (request.getParameter("sellValue") != null) {
			sellValue = request.getParameter("sellValue");
		}

		if (request.getParameter("sCategoryFlag") != null) {
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		System.out.println(sCategoryFlag + "메인에서오는놈");
		Map<String, String> valueMap = new HashMap();

		valueMap.put("newValue", newValue);
		valueMap.put("gradeValue", gradeValue);
		valueMap.put("sellValue", sellValue);
		Map<String, String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = service.sellCount(map);
		System.out.println(contentCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellmain.do"));

		List<Map> gradeList = service.sellMainGrade(map, cPage, numPerPage);
		List<Map> performanceList = service.sellMainPerformance(map, cPage, numPerPage);
		List<Map<String, String>> newList = service.sellMainNew(map, cPage, numPerPage);
		System.out.println("안녕하세요" + newList);
		mv.addObject("gradeList", gradeList);

		mv.addObject("performanceList", performanceList);
		mv.addObject("valueMap", valueMap);
		mv.addObject("newList", newList);
		mv.addObject("sCategoryFlag", sCategoryFlag);
		mv.setViewName("sell/sellmain");
		return mv;
	}

	@RequestMapping("/sell/sellWrite.do")
	public String sellWrite() {
		return "sell/sellwrite";
	}

	@RequestMapping("/sell/sellWriteEnd")
	public ModelAndView sellWriteEnd(String[] price, int interest, int detailInterest, String writeTitle,
			String[] endDate, String[] productOption, String sellContent, MultipartFile[] input_file, int mainImgNo,
			HttpServletRequest request) {
		System.out.println("인풋파일" + input_file);
		System.out.println(mainImgNo + "메인이미지값");
		System.out.println(interest + "대분류");
		System.out.println(detailInterest + "소분류");
		HttpSession session = request.getSession();
		Map sessionMap = (Map) session.getAttribute("member");
		Map dataMap = new HashMap();
		SellOption selloption = new SellOption();
		selloption.setSellPrice(price);
		selloption.setSelldeadline(endDate);
		selloption.setSellOptionContent(productOption);
		dataMap.put("interest", interest);
		dataMap.put("detailInterest", detailInterest);
		dataMap.put("writer", sessionMap.get("MEMBERID"));
		dataMap.put("title", writeTitle);
		dataMap.put("content", sellContent);
		ArrayList<SellAttach> files = new ArrayList();
		String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/sell");
		Map imgMap = new HashMap();

		MultipartFile index = input_file[mainImgNo];
		input_file[mainImgNo] = input_file[0];
		input_file[0] = index;

		for (MultipartFile f : input_file) {
			if (!f.isEmpty()) {
				// 파일명 생성(rename)
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf(".")); // .부터 확장자까지 가져오기
				// rename규칙 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
				int rdv = (int) (Math.random() * 1000); // 랜덤값설정
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext; // 새이름
				// 파일입출력ㅎ
				try {
					System.out.println("파일입출력되니?");
					f.transferTo(new File(savDir + "/" + reName)); // 저경로에다가 파일을 생성해주는것
				} catch (IllegalStateException | IOException e) { // 일리갈은 세이브디아이알 못찾을때 뜨는것
					e.printStackTrace();
				}
				SellAttach sa = new SellAttach();
				sa.setSellImgRe(reName);
				sa.setSellImgOri(orifileName);
				files.add(sa);
			}
		}
		int result = service.sellWriteEnd(files, dataMap, selloption);
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			msg = "판매글 작성을 완료하였습니다.";
			loc = "/sell/sellmain.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "판매글 등록에 실패하였습니다. 다시 시도해 주세요.";
			loc = "/sell/sellWrite.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}

	}

	// ajax 카테고리 분류
	@RequestMapping(value = "/sell/findInterest", produces = "application/text; charset=utf-8")
	@ResponseBody
	public ModelAndView findInterest(int interest, ServletRequest request) throws UnsupportedEncodingException {
		System.out.println("번호번호" + interest);
		List<Map<String, String>> list = service.findInterest(interest);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/imageDiv.do")
	@ResponseBody
	public SellAttach imageDiv(String sellNo) {

		SellAttach imgDiv = service.imageDiv(sellNo);
		return imgDiv;
	}

	@RequestMapping("/sellprice.do")
	@ResponseBody
	public SellmainOption sellPrice(String sellNo) {

		SellmainOption sop = service.sellPrice(sellNo);
		return sop;
	}

	@RequestMapping("/sell/sellNewChange.do")
	@ResponseBody
	public ModelAndView newVc(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			String newValue, String gradeValue, String sellValue, HttpServletRequest request) {
		String sCategoryFlag = "";
		newValue = "1";
		if (request.getParameter("sCategoryFlag") != null) {
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		System.out.println(sCategoryFlag + "EEEEEEEEEEEEEEEE");
		Map<String, String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = service.sellCount(map);
		ModelAndView mv = new ModelAndView();
		List<Map> gradeList = service.sellMainGrade(map, cPage, numPerPage);
		/* List<Map> performanceList = service.sellMainPerformance(map); */
		List<Map<String, String>> newList = service.sellMainNew(map, cPage, numPerPage);
		mv.addObject("pageBar",
				PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellNewChange.do"));
		mv.addObject("newList", newList);
		mv.setViewName("sell/sellNewMain");
		return mv;
	}

	@RequestMapping("/sell/sellGradeChange.do")
	@ResponseBody
	public ModelAndView gradeVc(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			HttpServletRequest request) {
		System.out.println("들어오니???????????????????????????");
		String sCategoryFlag = "";
		if (request.getParameter("sCategoryFlag") != null) {
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}
		System.out.println(sCategoryFlag + "그레이드메인");

		Map<String, String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = service.sellCount(map);
		ModelAndView mv = new ModelAndView();
		List<Map> gradeList = service.sellMainGrade(map, cPage, numPerPage);
		/* List<Map> performanceList = service.sellMainPerformance(map); */
		mv.addObject("gradeList", gradeList);
		mv.addObject("pageBar",
				PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellGradeChange.do"));
		mv.setViewName("sell/sellGradeMain");
		return mv;
	}

	@RequestMapping("/sell/sellSellChange.do")
	@ResponseBody
	public ModelAndView sellSellPageBar(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			HttpServletRequest request) {
		String sCategoryFlag = "";
		String sortFlag = "1";

		if (request.getParameter("sCategoryFlag") != null) {
			sCategoryFlag = request.getParameter("sCategoryFlag");
		}

		Map<String, String> map = new HashMap();
		map.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = service.sellPerCount(map);
		ModelAndView mv = new ModelAndView();

		List<Map> performanceList = service.sellMainPerformance(map, cPage, numPerPage);
		mv.addObject("performanceList", performanceList);
		mv.addObject("pageBar",
				PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellSellChange.do"));
		mv.setViewName("sell/sellPerformanceMain");
		return mv;
	}

	@RequestMapping("/sell/sellSellSearch.do")
	@ResponseBody
	public ModelAndView sellSearch(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			String searchtype, String searchValue, String sCategoryFlag, String newValue, String gradeValue,
			String sellValue) {
		Map map = new HashMap();
		System.out.println("서치타입" + searchtype);
		System.out.println("서치벨류" + searchValue);
		System.out.println("에스카테고리" + sCategoryFlag);
		System.out.println("newValue" + newValue);
		System.out.println("gradeValue" + gradeValue);
		System.out.println("sellValue" + sellValue);
		map.put("searchtype", searchtype);
		map.put("searchValue", searchValue);
		map.put("sCategoryFlag", sCategoryFlag);
		map.put("newValue", newValue);
		map.put("gradeValue", gradeValue);
		map.put("sellValue", sellValue);
		Map<String, String> map2 = new HashMap();
		map2.put("searchtype", searchtype);
		map2.put("searchValue", searchValue);
		map2.put("sCategoryFlag", sCategoryFlag);
		map2.put("newValue", newValue);
		map2.put("gradeValue", gradeValue);
		map2.put("sellValue", sellValue);
		map2.put("sCategoryFlag", sCategoryFlag);
		int numPerPage = 6;
		int contentCount = 0;

		ModelAndView mv = new ModelAndView();

		if (newValue.equals("1")) {
			contentCount = service.searchCount(map2);
			List<Map<String, String>> searchList = service.sellSearch(map, numPerPage, contentCount, cPage);
			mv.addObject("newList", searchList);
			mv.setViewName("sell/sellNewMain");

			mv.addObject("pageBar",
					PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellNewChange.do"));
		} else if (gradeValue.equals("1")) {
			contentCount = service.searchCount(map2);
			List<Map<String, String>> searchList = service.sellSearch(map, numPerPage, contentCount, cPage);
			mv.addObject("gradeList", searchList);
			mv.setViewName("sell/sellGradeMain");

			mv.addObject("pageBar",
					PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellGradeChange.do"));
		} else if (sellValue.equals("1")) {
			contentCount = service.searchPerCount(map2);
			List<Map<String, String>> searchList = service.sellSearch(map, numPerPage, contentCount, cPage);
			mv.addObject("performanceList", searchList);
			mv.setViewName("sell/sellPerformanceMain");

			mv.addObject("pageBar",
					PageFactory.getPageBar2(contentCount, cPage, numPerPage, "/makeit/sell/sellSellChange.do"));
		}

		return mv;
	}

	// 메인페이지에서 이미지클릭해서 상세뷰로
	@RequestMapping("/sell/selldetail")
	public ModelAndView selldeatailView(int sellno, HttpServletRequest request) {
		List<Map<String, String>> detailList = service.selldetailView(sellno);
		System.out.println(detailList + "디테일!!!!!!!!!!!!!!!!!!!!");
		List<Map<String, String>> mainimgList = service.selldetailImg(sellno);
		List<Map<String, String>> optionList = service.selldetailOption(sellno);
		List<Map<String, String>> sellReivew = service.sellReview(sellno);
		List<Map<String, String>> subimgList = service.sellsubImg(sellno);

		int reviewCnt = service.selectReviewCnt(sellno);
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if ((Map) session.getAttribute("member") != null) {
			Map<String, String> sessionMap = (Map) session.getAttribute("member");
			String loginMember = String.valueOf(sessionMap.get("MEMBERID"));
			Map refund = new HashMap();
			refund.put("sellno", sellno);
			refund.put("loginMember", loginMember);
			List<Map<String, String>> purchaseList = service.purchaseList(refund);
			System.out.println(purchaseList + "펄체이스!!@#@!$");

			for (Map map : purchaseList) {
				String date = map.get("SELLSPECDATE").toString().substring(0, 10);
				map.put("SELLSPECDATE", date);
			}

			mv.addObject("purchaseList", purchaseList);
			Map outBoxc = new HashMap();
			outBoxc.put("sellno", sellno);
			outBoxc.put("loginMember", loginMember);
			Map outBoxYn = service.sellOutBoxYn(outBoxc);
			mv.addObject("outBoxYn", outBoxYn);
			mv.addObject("session", sessionMap);
		}

		mv.addObject("subimgList", subimgList);
		mv.addObject("detailList", detailList);
		mv.addObject("mainimgList", mainimgList);
		mv.addObject("optionList", optionList);
		mv.addObject("sellReivew", sellReivew);

		mv.addObject("reviewCnt", reviewCnt);
		mv.setViewName("sell/sellDetail");
		return mv;
	}

	@RequestMapping("/sell/sellModify")
	public ModelAndView sellModify(HttpServletRequest request, int sellno) {
		ModelAndView mv = new ModelAndView();
		Map modifyMap = service.sellModify(sellno);
		List<Map<String, String>> modifyOption = service.sellOptionModify(sellno);
		List<Map<String, String>> modifyImg = service.sellImgModify(sellno);
		mv.addObject("modifyMap", modifyMap);
		mv.addObject("modifyImg", modifyImg);
		mv.addObject("modifyOption", modifyOption);
		mv.setViewName("/sell/sellModify");
		return mv;
	}

	@RequestMapping("/sell/sellModifyEnd")
	public ModelAndView sellModify(int sellno, String[] price, int interest, int detailInterest, String writeTitle,
			String[] endDate, String[] productOption, String sellContent, MultipartFile[] input_file, int mainImgNo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map sessionMap = (Map) session.getAttribute("member");
		Map dataMap = new HashMap();
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

		Map imgMap = new HashMap();

		List<Map<String, String>> imgList = new ArrayList();
		ArrayList<SellAttach> files = new ArrayList();
		// 넘어오는 이미지가 없을때(기존 이미지에서 변경이 없을 경우)-->이미지 변경없이 넘기면 0번 인덱스에 이름 공백으로 뭔가 넘어와서 이렇게
		// 비교함
		if (input_file[0].getOriginalFilename().equals("")) {
			System.out.println("여기1");
			imgList = service.selectSellImg(sellno); // 해당 글의 이미지를 다 가져옴
			Map<String, String> indexMap = new HashMap(); // 메인이미지로 변경할 이미지 임시 저장할 맵
			indexMap = imgList.get(mainImgNo); // 임시 저장
			imgList.remove(mainImgNo); // 그 위치에 있던 이미지 삭제
			imgList.add(0, indexMap); // 0번 위치에 둬서 메인이미지로 설정

		} else// 이미지를 싹 변경할 경우 (원래하던 방법)
		{
			System.out.println("여기2");
			String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/sell");

			MultipartFile index = input_file[mainImgNo];
			input_file[mainImgNo] = input_file[0];
			input_file[0] = index;

			for (MultipartFile f : input_file) {
				if (!f.isEmpty()) {
					// 파일명 생성(rename)
					String orifileName = f.getOriginalFilename();
					String ext = orifileName.substring(orifileName.lastIndexOf(".")); // .부터 확장자까지 가져오기
					// rename규칙 설정
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
					int rdv = (int) (Math.random() * 1000); // 랜덤값설정
					String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext; // 새이름
					// 파일입출력ㅎ
					try {
						System.out.println("파일입출력되니?");
						f.transferTo(new File(savDir + "/" + reName)); // 저경로에다가 파일을 생성해주는것
					} catch (IllegalStateException | IOException e) { // 일리갈은 세이브디아이알 못찾을때 뜨는것
						e.printStackTrace();
					}
					SellAttach sa = new SellAttach();
					sa.setSellImgRe(reName);
					sa.setSellImgOri(orifileName);
					files.add(sa);
				}
			}
		}
		int result = service.sellModifyEnd(files,imgList, dataMap, selloption);
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			msg = "판매글 수정을 완료하였습니다.";
			loc = "/sell/sellmain.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "판매글 수정에 실패하였습니다. 다시 시도해 주세요";
			loc = "/sell/sellModify";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}

	}

	// 찜하기 메소드 ㅎ
	@RequestMapping("sell/sellOutBox.do")
	public ModelAndView sellOutBoxInsert(int sellno, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map sessionMap = (Map) session.getAttribute("member");
		Map outBoxInsert = new HashMap();
		outBoxInsert.put("sellno", sellno);
		outBoxInsert.put("memberId", sessionMap.get("MEMBERID"));
		int result = service.sellOutBoxInsert(outBoxInsert);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "판매글 찜을 완료하였습니다.";
			loc = "/sell/selldetail.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "판매글 찜에 실패하였습니다. 다시 시도해 주세요";
			loc = "/sell/selldetail.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}

	}

	// 찜풀기 메소드 ㅎ
	@RequestMapping("/sell/sellOutBoxDel.do")
	public ModelAndView sellOutBoxDelete(int sellno, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map sessionMap = (Map) session.getAttribute("member");
		Map outBoxDelete = new HashMap();
		outBoxDelete.put("sellno", sellno);
		outBoxDelete.put("memberId", sessionMap.get("MEMBERID"));
		int result = service.sellOutBoxDelete(outBoxDelete);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "판매글 찜을 해제하였습니다.";
			loc = "/sell/selldetail.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "판매글 찜을 해제하지 못하였습니다. 다시 시도해 주세요 ";
			loc = "/sell/selldetail.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
	}

	// 신고하는창 띄워주기
	@RequestMapping("/sell/sellReport")
	public ModelAndView sellReportPop(int sellno, HttpServletRequest request, String sellWriter) {
		System.out.println(sellno + sellWriter);
		ModelAndView mv = new ModelAndView();
		Map reportMap = new HashMap();
		/*
		 * reportMap.put("sellno", sellno); reportMap.put("sellWriter",sellWriter );
		 */
		mv.addObject("sellno", sellno);
		mv.addObject("sellWriter", sellWriter);
		mv.setViewName("sell/sellReport");
		return mv;
	}

	// 신고하는것 처리
	@RequestMapping("/sell/sellReportEnd")
	public ModelAndView sellReprotEnd(int sellno, String reportId, String reportContent) {
		ModelAndView mv = new ModelAndView();
		Map reportMap = new HashMap();
		String msg = "";
		reportMap.put("sellno", sellno);
		reportMap.put("reportId", reportId);
		reportMap.put("reportContent", reportContent);
		int result = service.insertReport(reportMap);
		msg = "신고내용이 접수되었습니다.";
		mv.addObject("msg", msg);
		mv.addObject("script", "window.close();opener.location.reload();");
		mv.setViewName("common/msg");

		return mv;
	}

	// 구매하기 눌러서 결제 정보창으로 넘어가는것
	@RequestMapping("/sell/sellPurchase.do")
	public ModelAndView sellPurchase(int sellno, String selcOption, String sellerId) {
		ModelAndView mv = new ModelAndView();
		Map optionMap = new HashMap();
		optionMap.put("sellno", sellno);
		optionMap.put("selcOption", selcOption);
		optionMap.put("sellerId", sellerId);
		Map purchase = service.selectedOption(optionMap);
		Map seller = service.selectSeller(optionMap);
		mv.addObject("purchase", purchase);
		mv.addObject("purchaseMember", seller);
		mv.setViewName("sell/payInfoPage2");
		return mv;
	}

	@RequestMapping("/sell/sellDelete.do")
	public ModelAndView sellDelete(int sellno) {
		ModelAndView mv = new ModelAndView();
		int result = service.sellDetailDelete(sellno);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "판매글 삭제를 완료하였습니다.";
			loc = "/sell/sellmain.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "판매글 삭제에 실패하였습니다. 다시 시도해 주세요.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
	}

	@RequestMapping("/sell/purchaseComplete.do")
	public ModelAndView purchaseComplete(int sellno, int optionCode, int amount, int su, String memberId,
			String optionNo) {
		System.out.println("셀노" + sellno);
		System.out.println("옵코" + optionCode);
		System.out.println("금액" + amount);
		System.out.println("수량" + su);
		System.out.println("아이디" + memberId);
		System.out.println("옵셔번호" + optionNo);
		Map purchaseInfo = new HashMap();
		purchaseInfo.put("sellno", sellno);
		purchaseInfo.put("optionCode", optionCode);
		purchaseInfo.put("amount", amount);
		purchaseInfo.put("su", su);
		purchaseInfo.put("memberId", memberId);
		purchaseInfo.put("optionNo", optionNo);
		int result = service.purchaseComplete(purchaseInfo);
		Map optionInfo = service.optionInfo(purchaseInfo);
		List<Map<String, String>> detailList = service.selldetailView(sellno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseInfo", purchaseInfo);
		mv.addObject("detailList", detailList);
		mv.addObject("optionInfo", optionInfo);
		mv.setViewName("sell/payComplete2");
		return mv;
	}

	// 구매자들 보는창연결
	@RequestMapping("/sell/sellBuyerShow.do")
	public ModelAndView sellBuyerShow(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			int sellno) {
		System.out.println(cPage);
		ModelAndView mv = new ModelAndView();
		int contentCount = service.sellBuyerCount(sellno);
		int numPerPage = 6;
		List<Map<String, String>> buyerList = service.sellBuyerShow(sellno, cPage, numPerPage);
		mv.addObject("buyerList", buyerList);
		mv.addObject("pageBar",
				PageFactory.getPageBar3(contentCount, cPage, numPerPage, "/makeit/sell/sellBuyerShow.do", sellno));
		mv.setViewName("sell/sellBuyerShow");
		return mv;
	}

	@RequestMapping("sell/sellSpecUpdate.do")
	public ModelAndView sellSpecUpdate(int sellno, int specNo) {
		int result = service.sellSpecUpdate(specNo);
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			msg = "작업완료가 반영되었습니다.";
			loc = "/sell/sellBuyerShow.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "요청하신 응답에 실패하였습니다. 다시 시도해주세요.";
			loc = "/sell/sellBuyerShow.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
	}

	@RequestMapping("/sell/sellRefund.do")
	public ModelAndView sellRefund(int sellSpecNo, String refundId, String sellWriter) {
		ModelAndView mv = new ModelAndView();
		Map refundMap = new HashMap();
		refundMap.put("sellSpecNo", sellSpecNo);
		refundMap.put("refundId", refundId);
		refundMap.put("sellWriter", sellWriter);
		mv.addObject("refundMap", refundMap);
		mv.setViewName("sell/sellRefund");
		return mv;
	}

	@RequestMapping("/sell/sellRefundEnd")
	public ModelAndView sellRefundEnd(int sellSpecNo, String refundId) {
		System.out.println(sellSpecNo);
		System.out.println("shdjkfljksdl" + refundId);
		ModelAndView mv = new ModelAndView();
		Map payBack = new HashMap();
		payBack.put("sellSpecNo", sellSpecNo);
		payBack.put("refundId", refundId);
		int result = service.sellRefundEnd(payBack);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "환불요청을 접수하였습니다..";
			mv.addObject("msg", msg);
			mv.addObject("script", "window.close();opener.location.reload();");
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "환불요청 실패하였습니다. 다시 시도해 주세요.";

			mv.addObject("msg", msg);
			mv.addObject("script", "window.close();opener.location.reload();");
			mv.setViewName("common/msg");
			return mv;
		}

	}

	@RequestMapping("/sell/writeReview.do")
	public ModelAndView writeReview(String sellno) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellno", sellno);
		System.out.println(sellno + "글쓰기에서 바로온놈");
		mv.setViewName("sell/sellStarPop");
		return mv;
	}

	@RequestMapping("/sell/writeReviewEnd.do")
	public ModelAndView writeReviewEnd(String sellno, String reviewContent, String starCount,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		Map<String, String> sessionMap = (Map) session.getAttribute("member");
		System.out.println(sellno + "엔드!");
		Map<String, String> map = new HashMap();
		map.put("sellno", sellno);
		map.put("reviewContent", reviewContent);
		map.put("starCount", starCount);
		map.put("memberId", sessionMap.get("MEMBERID"));
		int result = service.insertReview(map);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "후기가 등록되었습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.addObject("script", "window.close();opener.location.reload();");
			mv.setViewName("common/msg");
		} else {
			msg = "후기 등록에 실패하였습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}

		return mv;
	}

	@RequestMapping("/sell/modReview.do")
	public ModelAndView modReview(String sellno, String reviewNo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellno", sellno);
		mv.addObject("reviewNo", reviewNo);
		mv.setViewName("sell/sellStarPop");
		return mv;
	}

	@RequestMapping("/sell/modReviewEnd.do")
	public ModelAndView modReviewEnd(String sellno, String reviewContent, String starCount, String reviewNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		Map<String, String> sessionMap = (Map) session.getAttribute("member");

		Map<String, String> map = new HashMap();
		map.put("sellno", sellno);
		map.put("reviewContent", reviewContent);
		map.put("starCount", starCount);
		map.put("memberId", sessionMap.get("MEMBERID"));
		map.put("reviewNo", reviewNo);
		int result = service.updateReview(map);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "후기가 변경되었습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.addObject("script", "window.close();opener.location.reload();");
			mv.setViewName("common/msg");
		} else {
			msg = "후기 변경에 실패하였습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}

		return mv;
	}

	@RequestMapping("/sell/sellReviewDel.do")
	public ModelAndView sellReviewDel(String reviewNo, String sellno) {
		ModelAndView mv = new ModelAndView();

		Map<String, String> map = new HashMap();
		map.put("reviewNo", reviewNo);
		map.put("sellno", sellno);

		int result = service.deleteReview(map);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "후기가 삭제되었습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
		} else {
			msg = "후기 삭제에 실패하였습니다.";
			loc = "/sell/selldetail?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
		}
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/sell/sellCommit.do")
	public ModelAndView sellCommit(int sellSpecNo, int sellno) {
		ModelAndView mv = new ModelAndView();
		int result = service.sellCommit(sellSpecNo);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "구매확정을 완료하였습니다.";
			loc = "/sell/sellmain.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		} else {
			msg = "구매확정을 실패하였습니다. 다시 시도해 주세요.";
			loc = "/sell/selldetail.do?sellno=" + sellno;
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
	}
}
