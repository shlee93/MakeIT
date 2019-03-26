package com.kh.makeit.board.model.dao;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage, int numPerPage);
	List<Map<String,String>> selectBoardDetailView(String freeNo);
	List<Map<String,String>> selectBoardCommentView(String freeNo);
	List<Map<String,String>> selectBoardImgView(String freeNo);
	int updateboardViews(String freeNo);
}
