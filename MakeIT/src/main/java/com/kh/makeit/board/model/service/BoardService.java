package com.kh.makeit.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.makeit.board.model.vo.BoardAttach;

public interface BoardService {
	//자유게시판 갯수
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage, int numPerPage);
	List<Map<String,String>> selectBoardDetailView(int freeNo);
	List<Map<String,String>> selectBoardCommentView(int freeNo);
	List<Map<String,String>> selectBoardImgView(int freeNo);
	int updateboardViews(int freeNo);
	int insertComment(Map<Object, Object> insertValue);
	int insertreComment(Map<Object, Object> insertValue);
	int deleteComment(int commentNo);
	int insertBoardList(ArrayList<BoardAttach> files, Map<String, String> map);
	int updateBoardList(ArrayList<BoardAttach> files, Map<Object, Object> map,int freeNo);

	
	//관리자 페이지 회원 정렬
	List<Map<String,String>> selectMemberSortBoard(Map<String,String> sort, int cPage, int numPerPage);
	List<Map<String,String>> selectSearchBoard(Map<String,String> sort, int cPage, int numPerPage);
	//관리자 페이지 회원 수
	int selectMemberCountBoard();
	int selectSearchCountBoard(String searchId);
}
