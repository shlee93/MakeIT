	package com.kh.makeit.board.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.makeit.board.model.service.BoardService;
import com.kh.makeit.common.PageFactory;

import sun.print.resources.serviceui;

@Controller
public class BoardController {
	
	private Logger logger = Logger.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;
	
	//자유게시판 가기
	@RequestMapping("/board/boardMain.do")
	public ModelAndView boardView(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
		int numPerPage=30;
		int numPerPage2=10;
		int memberCount = boardService.selectBoardCount();
		String memberPageBar = PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/board/boardMain.do");
		
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> memberList = boardService.selectBoardList(cPage,numPerPage);
		
		logger.debug(memberList);
		mav.addObject("memberPageBar",memberPageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("/board/boardMain");
		
		return mav;
	}
	
	//내정보에서 자유게시판 들어올때
	@RequestMapping("/board/boardInfoView.do")
	public ModelAndView boardInfoView(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String freeNo
		) {
	int numPerPage=30;
	int numPerPage2=10;
	int memberCount = boardService.selectBoardCount();
	String memberPageBar = PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/board/boardMain.do");
	
	ModelAndView mav = new ModelAndView();
	List<Map<String,String>> memberList = boardService.selectBoardList(cPage,numPerPage);
	
	logger.debug(memberList);
	mav.addObject("memberPageBar",memberPageBar);
	mav.addObject("memberList",memberList);
	mav.addObject("infoFreeNo",freeNo);
	mav.setViewName("/board/boardMain");
	
	return mav;
	}
	
	
	//게시판디테일 정보 불러오기
	@RequestMapping(value="/board/freeboardView.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String freeboardView(HttpServletRequest request,int freeNo) {

		Map<Object,Object> allList = new HashMap();
		int updateViews = boardService.updateboardViews(freeNo);
		List<Map<String,String>> boardList = boardService.selectBoardDetailView(freeNo);
		List<Map<String,String>> boardCommentList = boardService.selectBoardCommentView(freeNo);
		List<Map<String,String>> boardImgList = boardService.selectBoardImgView(freeNo);
		
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
		logger.debug(memberId);

		logger.debug("보드 리스트 : "+boardList);
		logger.debug("코멘트 리스트 : "+boardCommentList);
		logger.debug("이미지 리스트 : "+boardImgList);
		
		allList.put("boardList", boardList);
		allList.put("boardCommentList", boardCommentList);
		allList.put("boardImgList", boardImgList);
		allList.put("memberId",memberId);
		
		Gson gson = new Gson();
		String data = gson.toJson(allList);
		
		return data;
	}
	
	//댓글 정보 저장
	@RequestMapping(value="/board/insertComment.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String insertComment(String inputText, int freeNo, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    Map<Object, Object> insertValue = new HashMap();
	    
	    insertValue.put("memberId", memberId);
	    insertValue.put("inputText", inputText);
	    insertValue.put("freeNo", freeNo);
	    
	    Map<Object,Object> allList = new HashMap();
	    int updateComment = boardService.insertComment(insertValue);
	    List<Map<String,String>> boardCommentList = boardService.selectBoardCommentView(freeNo);
	    allList.put("boardCommentList", boardCommentList);
	    allList.put("memberId",memberId);
	    
	    Gson gson = new Gson();
		String data = gson.toJson(allList);
		
		return data;
	}
	
	//대댓글 정보 저장
	@RequestMapping(value="/board/insertreComment.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String insertreComment(String inputText, int freeNo,int commentNo, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    Map<Object, Object> insertValue = new HashMap();
	    
	    insertValue.put("memberId", memberId);
	    insertValue.put("inputText", inputText);
	    insertValue.put("freeNo", freeNo);
	    insertValue.put("commentNo", commentNo);
	    
	    Map<Object,Object> allList = new HashMap();
	    int updateComment = boardService.insertreComment(insertValue);
	    List<Map<String,String>> boardCommentList = boardService.selectBoardCommentView(freeNo);
	    allList.put("boardCommentList", boardCommentList);
	    allList.put("memberId",memberId);
	    
	    Gson gson = new Gson();
		String data = gson.toJson(allList);
		
		return data;
	}
	
	//댓삭
	@RequestMapping(value="/board/commentDelete.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteComment(int commentNo, int freeNo, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    
	    logger.debug("코멘트 노!!!!!!!!!!!!!!!!!!!!! : "+commentNo);
	    int deleteComment = boardService.deleteComment(commentNo);
	    logger.debug(deleteComment);
	    
	    Map<Object,Object> allList = new HashMap();
	    List<Map<String,String>> boardCommentList = boardService.selectBoardCommentView(freeNo);
	    allList.put("boardCommentList", boardCommentList);
	    allList.put("memberId",memberId);
	    
	    Gson gson = new Gson();
	    String data = gson.toJson(allList);
	    
	    return data;
	}
	
	//게시판 글쓰기 가기
	@RequestMapping("/board/writeBoard.do")
	public ModelAndView writeBoardView(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    
		
	    mav.addObject("memberId", memberId);
		mav.setViewName("/board/writeBoard");
		
		return mav;
	}
	
	//게시판 글쓰기 정보 업로드
	@RequestMapping("/board/insertWriteBoardEnd.do")
	public ModelAndView insertWriteBoardEnd(String writeTitle, String writeContent, MultipartFile[] input_file, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("인풋파일" + input_file);
		System.out.println("타이틀" + writeTitle);
		System.out.println("내용" + writeContent);
		
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
		
	    Map<Object, Object> allList = new HashMap();
	    allList.put("memberId", memberId);
		allList.put("writeTitle", writeTitle);
		allList.put("writeContent", writeContent);
		
		
		
		return mav;
	}


}
