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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.makeit.board.model.service.BoardService;
import com.kh.makeit.common.PageFactory;

@Controller
public class BoardController {
	
	private Logger logger = Logger.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;
	
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
	
	
	
	@RequestMapping(value="/board/freeboardView.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String freeboardView(HttpServletRequest request,String freeNo) {

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

}
