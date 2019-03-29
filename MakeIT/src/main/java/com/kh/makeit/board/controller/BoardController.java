	package com.kh.makeit.board.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.kh.makeit.board.model.vo.BoardAttach;
import com.kh.makeit.common.PageFactory;

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
		int numPerPage=20;
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
	    System.out.println("도냐??????????????");
	    
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
	
	//게시판 수정 가기
	@RequestMapping("/board/boardModify.do")
	public ModelAndView boardModifyView(HttpServletRequest request,String freeNo) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+freeNo);
		
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    List<Map<String,String>> boardList = boardService.selectBoardDetailView(Integer.parseInt(freeNo));
	    List<Map<String,String>> boardImgList = boardService.selectBoardImgView(Integer.parseInt(freeNo)); 
	    logger.debug("보드 리스트! : "+boardList);
		logger.debug("보드 리스트 모디 : "+boardImgList);
	    mav.addObject("memberId", memberId);
	    mav.addObject("boardList",boardList);
	    mav.addObject("boardImgList",boardImgList);
		mav.setViewName("/board/boardModify");	
		return mav;
	}
	
	//게시판 글쓰기 정보 업로드
	@RequestMapping("/board/insertWriteBoardEnd.do")
	public ModelAndView insertWriteBoardEnd(String writeTitle, String writeContent, MultipartFile[] input_file, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
	       Map sessionMap = (Map) session.getAttribute("member");
	       String memberId = (String)sessionMap.get("MEMBERID");
	       
	      System.out.println("인풋파일" + input_file);
	      System.out.println("타이틀" + writeTitle);
	      System.out.println("내용" + writeContent);
	      System.out.println("아이디 값" + memberId);
	      
	      ArrayList<BoardAttach> files=new ArrayList();
	      Map<String, String> map = new HashMap();
	      
	      map.put("memberId", memberId);
	      map.put("writeTitle", writeTitle);
	      map.put("writeContent", writeContent);
	      
	      for(MultipartFile a : input_file)
	      {
	         System.out.println("asdf   " + a.getOriginalFilename());
	      }
	      
	      String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/board");
	      logger.debug("sssssssssssssssssssssssssssssssssssssssssssssssssssss///////"+savDir);
	      for(MultipartFile f: input_file)
	      {
	         if(!f.isEmpty()) {
	            //파일명 생성(rename)
	            String freeImgOri=f.getOriginalFilename();
	            String ext=freeImgOri.substring(freeImgOri.lastIndexOf(".")); //.부터 확장자까지 가져오기
	            //rename규칙 설정
	            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
	            int rdv=(int)(Math.random()*1000); //랜덤값설정
	            String freeImgRe=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;  //새이름
	            //파일입출력ㅎ
	            try {
	               f.transferTo(new File(savDir+"/"+freeImgRe)); //저경로에다가 파일을 생성해주는것
	            }catch(IllegalStateException | IOException e) {  //일리갈은 세이브디아이알 못찾을때 뜨는것
	               e.printStackTrace();
	            }

	            BoardAttach ba = new BoardAttach();
	            System.out.println(" 경로 !!!!!  "+freeImgRe);
	            System.out.println(" 경로 !!!!!!!!!!!!  "+freeImgOri);   
	            ba.setFreeImgRe(freeImgRe);
	            ba.setFreeImgOri(freeImgOri);
	            files.add(ba);

	            
	         }
	      }
	      int result = boardService.insertBoardList(files, map);
	      
	      String msg = "";
	      String loc = "";

	      if(result > 0)
	      {
	         msg="작성을 완료하였습니다.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	      }
	      else
	      {
	         msg="등록에 실패하였습니다. 다시 시도해 주세요.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	         
	      }
	      System.out.println("결과1 : "+result);

	      return mav;
	}
	
	@RequestMapping("/board/modifyWriteBoardEnd.do")
	public ModelAndView modifyWriteBoardEnd(String freeNo,String writeTitle, String writeContent, MultipartFile[] input_file, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    Map sessionMap = (Map) session.getAttribute("member");
	    String memberId = (String)sessionMap.get("MEMBERID");
	    ModelAndView mav = new ModelAndView();
	    
		System.out.println("타이틀    " + writeTitle);
		System.out.println("내용    " + writeContent);
		System.out.println("아이디 값    " + memberId);
		System.out.println("피드 넘버 값   " + freeNo);
		Map<Object, Object> map = new HashMap();
		map.put("freeNo", Integer.parseInt(freeNo));
		map.put("memberId", memberId);
		map.put("writeTitle", writeTitle);
		map.put("writeContent", writeContent);
		System.out.println("되니??~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(Integer.parseInt(freeNo));

		
		int result = boardService.updateBoardList(map);
		System.out.println("결과1 : "+result);

		
		for(MultipartFile file1 : input_file) {
			logger.debug("      새로운 값 받아와서 실행~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			logger.debug(file1.getOriginalFilename());
		}
		
		
		String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/board");
		ArrayList<BoardAttach> files=new ArrayList();

		boolean checkFile = false;
		for(MultipartFile file: input_file)
		{
			if(!file.isEmpty()) {
				
				checkFile = true;
				//파일명 생성(rename)
				String freeImgOri=file.getOriginalFilename();
				String ext=freeImgOri.substring(freeImgOri.lastIndexOf(".")); //.부터 확장자까지 가져오기
				//rename규칙 설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
				int rdv=(int)(Math.random()*1000); //랜덤값설정
				String freeImgRe2=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;  //새이름
				//파일입출력ㅎ
				try {
					file.transferTo(new File(savDir+"/"+freeImgRe2)); //저경로에다가 파일을 생성해주는것
				}catch(IllegalStateException | IOException e) {  //일리갈은 세이브디아이알 못찾을때 뜨는것
					e.printStackTrace();
				}
				BoardAttach ba = new BoardAttach();

			    try {
					System.out.println(" ㅎㅇㅎㅇㅇㅎㅇ2");
					ba.setFreeNo(Integer.parseInt(freeNo));
					System.out.println(" ㅎㅇㅎㅇㅇㅎㅇ3");
					ba.setFreeImgRe(freeImgRe2);
					System.out.println(" ㅎㅇㅎㅇㅇㅎㅇ4");
					ba.setFreeImgOri(freeImgOri);
					System.out.println(" ㅎㅇㅎㅇㅇㅎㅇ5");
					files.add(ba);

				}catch(Exception e) {
			    	e.printStackTrace();
			    }

				System.out.println("eeeeeeeeee : "+ ba);
				
			}
		}

		if(checkFile == true) {
			ArrayList<BoardAttach> files2=new ArrayList();
			List<Map<Object,Object>> selectBoardImg = boardService.selectBoardImg2(Integer.parseInt(freeNo));
			System.out.println(selectBoardImg);
			if(selectBoardImg.size() > 0) {

				for(int i=0; i<selectBoardImg.size(); i++) {
					BoardAttach ba = new BoardAttach();
					ba.setFreeImgNo(Integer.parseInt(selectBoardImg.get(i).get("FREEIMGNO").toString()));
					files2.add(ba);
				}
/*				//업로드 이미지 삭제
				var index = $('.writeImg').length;
				for(var i=0; i<index; i++){
					console.log($('.writeImg:eq('+i+')').attr('src'));
					var path =$('.writeImg:eq('+i+')').attr('src');
				}*/
		         
/*		        if( file.exists() ){
		        if(file.delete()){*/

				int deleteResult = boardService.deleteModifyBoardImg(files2);
				if(deleteResult > 0) {
					for(int i=0; i<selectBoardImg.size(); i++) {
						String deleteDir = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
				        File file = new File(deleteDir+selectBoardImg.get(i).get("FREEIMGRE").toString());
				        System.out.println("파일 경로 : "+file);
				        
				        if( file.exists() ){
				        	file.delete();
				        }
					}

				}

			}


			logger.debug(" 업로드 실행~");

			int insertResult = boardService.insertModifyBoardImg(files);
		}else {
			logger.debug(" 업로드 실패 ㅠㅠ~");
		}
		
		
		
	    String msg = "";
	    String loc = "";
		
	    if(result > 0)
	      {
	         msg="수정을 완료하였습니다.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	      }
	      else
	      {
	         msg="수정을 실패하였습니다. 다시 시도해 주세요.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	         
	      }

		return mav;
	}
	
	@RequestMapping("board/boardDelete.do")
	public ModelAndView boardDelete(String freeNo) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("들어옴~~");
		System.out.println("들어옴~~" + Integer.parseInt(freeNo));
		int result = boardService.deleteBoardList(Integer.parseInt(freeNo));
		System.out.println(result);
	    String msg = "";
	    String loc = "";
		
	    if(result > 0)
	      {
	         msg="삭제를 완료하였습니다.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	      }
	      else
	      {
	         msg="삭제를 실패하였습니다. 다시 시도해 주세요.";
	         loc="/board/boardMain.do";
	         mav.addObject("msg",msg);
	         mav.addObject("loc",loc);
	         mav.setViewName("common/msg");
	         
	      }

		return mav;
		
	}

	
	 //페이징
	@RequestMapping("/board/memberSortboard.do")
	public ModelAndView memberSortAdmin(

				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,String memberSort
			) {
		//회원 리스트 정렬
		int numPerPage=20;
		int memberCount= boardService.selectMemberCountBoard();
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		
		logger.debug("assssssssssssssssssssssssss"+memberSort);
		Map<String,String> sort=new HashMap();
		sort.put("memberSort", memberSort);
		List<Map<String,String>> memberList=boardService.selectMemberSortBoard(sort,cPage,numPerPage);
		logger.info(memberList);
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberPageBar", pageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	
	//회원 아이디 검색
	@RequestMapping("/board/boardSearch.do")
	public ModelAndView memberSearch(
				String searchId,
				String memberSort,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) { 	
	
		int numPerPage=20;
		int memberCount= boardService.selectSearchCountBoard(searchId);
		Map<String,String> sort=new HashMap();
		sort.put("searchId", searchId);
		sort.put("memberSort", memberSort);
		
		logger.debug("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa /    "+searchId);
		logger.debug("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb /    "+memberSort);
		String pageBar=PageFactory.getPageBarAdmin(memberCount, cPage, numPerPage,"/makeit/admin/adminView.do");
		List<Map<String,String>> memberList=boardService.selectSearchBoard(sort,cPage,numPerPage);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberPageBar", pageBar);
		mav.addObject("memberList",memberList);
		mav.setViewName("board/boardView");
		
		return mav;
	}


}

