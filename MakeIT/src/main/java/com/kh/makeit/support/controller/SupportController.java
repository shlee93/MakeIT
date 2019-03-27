package com.kh.makeit.support.controller;

import java.io.UnsupportedEncodingException; 
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.net.URLCodec;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.makeit.admin.controller.AdminController;
import com.kh.makeit.admin.model.service.AdminService;
import com.kh.makeit.common.AES256Util;
import com.kh.makeit.common.MakeitException;
import com.kh.makeit.common.PageFactory;
import com.kh.makeit.support.model.service.SupportService;

@Controller
public class SupportController {

	@Autowired
	AdminService adminService;
	@Autowired
	SupportService supportService;
	private Logger logger = Logger.getLogger(SupportController.class);

	@RequestMapping("/support/supportView.do")
	public ModelAndView supportView(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {

		int numPerPage=10;
		//qna 게시물 카운트
		int qnaCount=supportService.selectQnaCount();
		String pageBarQna=PageFactory.getPageBarAdmin(qnaCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		ModelAndView mav=new ModelAndView();

		//FAQ 출력
		List<Map<String,String>> faqList=adminService.selectFaqListAdmin();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();

		//1:1 문의 게시판 출력
		List<Map<String,String>> qnaList=supportService.selectQnaList(cPage,numPerPage);

		mav.addObject("pageBarQna", pageBarQna);
		mav.addObject("qnaList", qnaList);
		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/supportView");

		return mav;
	}

	@RequestMapping("/support/qnaSearch.do")
	public ModelAndView qnaSearch(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {

		Map<String,String> search=new HashMap();
		search.put("searchQna", searchQna);
		search.put("filter", filter);
		search.put("sortCheck", sortCheck);
		int numPerPage=10;
		//qna 게시물 카운트
		int qnaCount=supportService.selectSearchQnaCount(search);
		String pageBarQna=PageFactory.getPageBarAdmin(qnaCount, cPage, numPerPage,"/makeit/admin/adminView.do");

		ModelAndView mav=new ModelAndView();

		//qna List
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		List<Map<String,String>> qnaList=supportService.selectSearchQnaList(search,cPage,numPerPage);

		mav.addObject("pageBarQna", pageBarQna);
		mav.addObject("qnaList", qnaList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaView");
		return mav;
	}

	@RequestMapping("/support/insertQnaView.do")
	public ModelAndView insertQna(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {
		ModelAndView mav=new ModelAndView();

		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();

		mav.addObject("cPage", cPage);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaInsertView");

		return mav;

	}

	//게시글 뷰
	@RequestMapping("/support/detailQnaView.do")
	public ModelAndView selectOneQna(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck,
			int qnaNo
			) {
		ModelAndView mav=new ModelAndView();
		Map<String,String> qna=supportService.selectOneQna(qnaNo);

		mav.addObject("qna", qna);
		mav.addObject("cPage", cPage);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.setViewName("support/qnaDetailView");

		return mav;
	}
	
	//게시글 뷰
	@RequestMapping("/support/detailQnaView2.do")
	public ModelAndView selectOneQna2(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck,
			int qnaNo
			) {
		ModelAndView mav=new ModelAndView();
		Map<String,String> qna=supportService.selectOneQna(qnaNo);

		mav.addObject("qna", qna);
		mav.addObject("cPage", cPage);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.setViewName("support/myQnaView");

		return mav;
	}
	
	//목록 버튼 클릭 화면전환
	@RequestMapping("/support/qnaBack.do")
	public ModelAndView qnaBack(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {

		Map<String,String> search=new HashMap();
		search.put("searchQna", searchQna);
		search.put("filter", filter);
		search.put("sortCheck", sortCheck);
		int numPerPage=10;
		//qna 게시물 카운트
		int qnaCount=supportService.selectSearchQnaCount(search);
		String pageBarQna=PageFactory.getPageBarAdmin(qnaCount, cPage, numPerPage,"/makeit/admin/adminView.do");

		ModelAndView mav=new ModelAndView();

		//qna List
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		List<Map<String,String>> qnaList=supportService.selectSearchQnaList(search,cPage,numPerPage);

		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("pageBarQna", pageBarQna);
		mav.addObject("qnaList", qnaList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaAllView");
		return mav;
	}

	//게시글 등록(회원)
	@RequestMapping("/support/insertQnaEnd.do")
	public ModelAndView insertQnaEnd(
			String writer,String pass,int categoryNo,String title,String content,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, EncoderException {

		String key = "aes256-test-key!!";    //key는 16자 이상
		AES256Util aes256 = new AES256Util(key);
		URLCodec codec = new URLCodec();
		int qnaNo=0;
		Map<Object,Object> insert=new HashMap();
		insert.put("writer", writer);
		insert.put("pass", codec.encode(aes256.aesEncode(pass)));
		insert.put("title", title);
		insert.put("categoryNo", categoryNo);
		insert.put("content", content);
		insert.put("qnaNo", qnaNo);

		ModelAndView mav=new ModelAndView();

		int result=supportService.insertQnaEnd(insert);
		Map<String,String> qna=supportService.selectOneQna(Integer.parseInt(insert.get("qnaNo")+""));
		mav.addObject("qna", qna);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("cPage", cPage);
		mav.setViewName("support/qnaDetailView");
		return mav;
	}
	
	//게시글 등록(관리자) 뷰
	@RequestMapping("/support/repleQna.do")
	public ModelAndView repleQna(
			int qnaNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, DecoderException {
		String key = "aes256-test-key!!";    //key는 16자 이상
		AES256Util aes256 = new AES256Util(key);
		URLCodec codec = new URLCodec();
		ModelAndView mav=new ModelAndView();
		Map<String,String> qna=supportService.selectOneQna(qnaNo);
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		qna.put("QNAPASS", aes256.aesDecode(codec.decode(qna.get("QNAPASS"))));
		mav.addObject("qna", qna);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("cPage", cPage);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaInsertViewAdmin");
		return mav;
	}
	
	//게시글 등록(관리자)
	@RequestMapping("/support/insertQnaEndAdmin.do")
	public ModelAndView insertQnaEnd(
			String writer,String pass,int categoryNo,String title,String content,int qnaRefNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, EncoderException {

		String key = "aes256-test-key!!";    //key는 16자 이상
		AES256Util aes256 = new AES256Util(key);
		URLCodec codec = new URLCodec();
		int qnaNo=0;
		Map<Object,Object> insert=new HashMap();
		insert.put("qnaRefNo", qnaRefNo);
		insert.put("writer", writer);
		insert.put("pass", codec.encode(aes256.aesEncode(pass)));
		insert.put("title", title);
		insert.put("categoryNo", categoryNo);
		insert.put("content", content);
		insert.put("qnaNo", qnaNo);

		ModelAndView mav=new ModelAndView();

		int result=supportService.insertQnaEndAdmin(insert);
		int result1=supportService.updateQnaReple(qnaRefNo);
		Map<String,String> qna=supportService.selectOneQna(Integer.parseInt(insert.get("qnaNo")+""));
		mav.addObject("qna", qna);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("cPage", cPage);
		mav.setViewName("support/qnaDetailView");
		return mav;
	}

	//게시글 수정 뷰
	@RequestMapping("/support/updateQna.do")
	public ModelAndView updateQna(
			int qnaNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {
		ModelAndView mav=new ModelAndView();
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		Map<String,String> qna=supportService.selectOneQna(qnaNo);
		mav.addObject("categoryList", categoryList);
		mav.addObject("qna", qna);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("cPage", cPage);
		mav.setViewName("support/qnaUpdateView");
		return mav;

	}
	
	//게시글 수정
	@RequestMapping("/support/updateQnaEnd.do")
	public ModelAndView updateQnaEnd(
			int qnaNo,String writer,int categoryNo,String title,String content,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {

		Map<Object,Object> update=new HashMap();
		update.put("writer", writer);
		update.put("title", title);
		update.put("categoryNo", categoryNo);
		update.put("content", content);
		update.put("qnaNo", qnaNo);

		ModelAndView mav=new ModelAndView();

		int result=supportService.updateQnaEnd(update);
		Map<String,String> qna=supportService.selectOneQna(qnaNo);
		mav.addObject("qna", qna);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.addObject("cPage", cPage);
		mav.setViewName("support/qnaDetailView");
		return mav;

	}

	//게시글 삭제
	@RequestMapping("/support/deleteQnaEnd.do")
	public ModelAndView deleteQnaEnd(int qnaNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {
		ModelAndView mav=new ModelAndView();

		int result=supportService.deleteQnaEnd(qnaNo);

		Map<String,String> search=new HashMap();
		search.put("searchQna", searchQna);
		search.put("filter", filter);
		search.put("sortCheck", sortCheck);
		int numPerPage=10;
		//qna 게시물 카운트
		int qnaCount=supportService.selectSearchQnaCount(search);
		String pageBarQna=PageFactory.getPageBarAdmin(qnaCount, cPage, numPerPage,"/makeit/admin/adminView.do");

		//qna List
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		List<Map<String,String>> qnaList=supportService.selectSearchQnaList(search,cPage,numPerPage);

		mav.addObject("pageBarQna", pageBarQna);
		mav.addObject("qnaList", qnaList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaAllView");
		return mav;



	}
	
	//미답변 글만 출력
	@RequestMapping("/support/repleCheck.do")
	public ModelAndView repleCheck(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {
		Map<String,String> search=new HashMap();
		search.put("searchQna", searchQna);
		search.put("filter", filter);
		search.put("sortCheck", sortCheck);
		
		ModelAndView mav=new ModelAndView();
		int numPerPage=10;
		//qna 게시물 카운트
		int qnaCount=supportService.selectSearchQnaCheckCount(search);
		String pageBarQna=PageFactory.getPageBarAdmin(qnaCount, cPage, numPerPage,"/makeit/admin/adminView.do");

		//qna List
		List<Map<String,String>> categoryList=adminService.selectFaqCategoryAdmin();
		List<Map<String,String>> qnaList=supportService.selectSearchQnaCheckList(search,cPage,numPerPage);

		mav.addObject("pageBarQna", pageBarQna);
		mav.addObject("qnaList", qnaList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/qnaAllView");
		return mav;
		
	}
	//게시물 비밀번호 체크
	@RequestMapping(value="/support/qnaPassCheck.do",method = RequestMethod.GET)
	@ResponseBody
	public int qnaPassCheck(int qnaNo) throws NumberFormatException, InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, DecoderException {
		
		String key = "aes256-test-key!!";    //key는 16자 이상
		AES256Util aes256 = new AES256Util(key);
		URLCodec codec = new URLCodec();
		String passCk=supportService.selectQnaPassCheck(qnaNo);
		int pass=Integer.parseInt(aes256.aesDecode(codec.decode(passCk)));
		
		return pass;
	}
	
	//게시물 상세화면에서 답변보기
	@RequestMapping("/support/repleQnaView.do")
	public ModelAndView repleQnaView(
			int qnaNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchQna", required=false, defaultValue="") String searchQna,
			@RequestParam(value="filter", required=false, defaultValue="QNATITLE") String filter,
			@RequestParam(value="sortCheck", required=false, defaultValue="0") String sortCheck
			) {
		
		ModelAndView mav=new ModelAndView();

		Map<String,String> qna=supportService.selectOneQna3(qnaNo);

		mav.addObject("qna", qna);
		mav.addObject("cPage", cPage);
		mav.addObject("searchQna", searchQna);
		mav.addObject("filter", filter);
		mav.addObject("sortCheck", sortCheck);
		mav.setViewName("support/qnaDetailView");
		return mav;
	}
	
	//faq 질문 검색
	@RequestMapping("/support/selectFaqSearch.do")
	public ModelAndView selectFaqSearch(
				@RequestParam(value="faqSearch", required=false, defaultValue="") String faqSearch
			) {
		logger.info(faqSearch);
		ModelAndView mav=new ModelAndView();
		//FAQ 출력
		List<Map<String,String>> faqList=supportService.selectFaqSearch(faqSearch);
		List<Map<String,String>> categoryList=supportService.selectFaqCategory(faqSearch);
		
		mav.addObject("faqList", faqList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("support/faqSearchView");
		
		return mav;
		
	}
	

}
