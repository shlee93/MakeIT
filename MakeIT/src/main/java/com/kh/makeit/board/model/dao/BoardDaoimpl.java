package com.kh.makeit.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.makeit.board.model.vo.BoardAttach;

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
	public List<Map<String,String>> selectBoardDetailView(int freeNo) {

		return sqlSession.selectList("board.selectBoardDetailViewList",freeNo);
	}
	@Override
	public List<Map<String,String>> selectBoardCommentView(int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectBoardCommentViewList",freeNo);
	}
	@Override
	public List<Map<String,String>> selectBoardImgView(int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectBoardImgViewList",freeNo);
	}
	@Override
	public int updateboardViews(int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateboardViews",freeNo);
	}
	@Override
	public int insertComment(Map<Object, Object> insertValue) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertComment", insertValue);
	}
	@Override
	public int insertreComment(Map<Object, Object> insertValue) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertreComment", insertValue);
	}
	@Override
	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.deleteComment", commentNo);
	}

	@Override
	public int selectMemberCountBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectMemberCountBoard");
	}
	@Override
	public int selectSearchCountBoard(String searchId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectSearchCountBoard",searchId);
	}
	@Override
	public List<Map<String, String>>selectMemberSortBoard(Map<String,String> sort, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("board.selectMemberSortBoard",sort,rb);
	}
	@Override
	public int insertBoard(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertBoard", map);
	}
	@Override
	public int insertBoardImg(BoardAttach ba) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertBoardImg", ba);
	}
	@Override
	public int updateBoard(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateBoard", map);
	}

}
