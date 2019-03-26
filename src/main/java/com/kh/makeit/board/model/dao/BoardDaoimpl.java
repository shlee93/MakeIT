package com.kh.makeit.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoimpl implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public int selectBoardCount() {

		return sqlSession.selectOne("board.selectBoardCount");
	}
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("board.selectBoardList",null,rb);
	}
	@Override
	public List<Map<String,String>> selectBoardDetailView(String freeNo) {

		return sqlSession.selectList("board.selectBoardDetailViewList",freeNo);
	}
	@Override
	public List<Map<String,String>> selectBoardCommentView(String freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectBoardCommentViewList",freeNo);
	}
	@Override
	public List<Map<String,String>> selectBoardImgView(String freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectBoardImgViewList",freeNo);
	}
	@Override
	public int updateboardViews(String freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateboardViews",freeNo);
	}

}
