package com.kh.makeit.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.makeit.board.model.vo.BoardAttach;

public interface BoardDao {
	
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage, int numPerPage);
	List<Map<String,String>> selectBoardDetailView(int freeNo);
	List<Map<String,String>> selectBoardCommentView(int freeNo);
	List<Map<String,String>> selectBoardImgView(int freeNo);
	int updateboardViews(int freeNo);
	int insertComment(Map<Object, Object> insertValue);
	int insertreComment(Map<Object, Object> insertValue);
	int deleteComment(int commentNo);
	int insertBoard(Map<String, String> map);
	int insertBoardImg(BoardAttach ba);
	int updateBoard(Map<Object, Object> map);
	
	//관리자 페이지 회원 수
	int selectMemberCountBoard();
	
	//관리자 페이지 회원 정렬
	List<Map<String,String>> selectMemberSortBoard(Map<Object,Object> sort, int cPage, int numPerPage);
}
