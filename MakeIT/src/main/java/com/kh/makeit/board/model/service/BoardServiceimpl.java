package com.kh.makeit.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.board.model.dao.BoardDao;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public int selectBoardCount() {

		return dao.selectBoardCount();
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {

		return dao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public List<Map<String,String>> selectBoardDetailView(String freeNo) {

		return dao.selectBoardDetailView(freeNo);
	}

	@Override
	public List<Map<String,String>> selectBoardCommentView(String freeNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardCommentView(freeNo);
	}

	@Override
	public List<Map<String,String>> selectBoardImgView(String freeNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardImgView(freeNo);
	}

	@Override
	public int updateboardViews(String freeNo) {
		// TODO Auto-generated method stub
		return dao.updateboardViews(freeNo);
	}

}
