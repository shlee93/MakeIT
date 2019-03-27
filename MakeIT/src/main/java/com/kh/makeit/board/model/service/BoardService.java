package com.kh.makeit.board.model.service;

import java.util.List;
import java.util.Map;

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
}
