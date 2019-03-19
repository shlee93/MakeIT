package com.kh.makeit.support.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SupportDaoImpl implements SupportDao {

	@Autowired
	SqlSession sqlSession;
	
	//qna 리스트 셀렉트
	@Override
	public List<Map<String, String>> selectQnaList(int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("support.selectQnaList",null,rb);
	}

	//qna 게시물 카운트
	@Override
	public int selectQnaCount() {
		
		return sqlSession.selectOne("support.selectQnaCount");
	}

	//qna 검색 게시물 카운트
	@Override
	public int selectSearchQnaCount(Map<String, String> search) {
		
		return sqlSession.selectOne("support.selectSearchQnaCount", search);
	}

	//qna 검색 게시물 리스트
	@Override
	public List<Map<String, String>> selectSearchQnaList(Map<String,String> search,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("support.selectSearchQnaList", search, rb);
	}

	//qna 게시글 상세보기
	@Override
	public Map<String, String> selectOneQna(int qnaNo) {
		
		return sqlSession.selectOne("support.selectOneQna", qnaNo);
	}

	//qna 게시글 등록(회원)
	@Override
	public int insertQnaEnd(Map<Object, Object> insert) {

		return sqlSession.insert("support.insertQnaEnd", insert);
	}
	
	//qna 게시글 등록(관리자)
	@Override
	public int insertQnaEndAdmin(Map<Object, Object> insert) {
		
		return sqlSession.insert("support.insertQnaEndAdmin", insert);
	}

	//qna 게시글 수정
	@Override
	public int updateQnaEnd(Map<Object, Object> update) {
		
		return sqlSession.update("support.updateQnaEnd", update);
	}

	//qna 게시글 삭제
	@Override
	public int deleteQnaEnd(int qnaNo) {
		
		return sqlSession.update("support.deleteQnaEnd", qnaNo);
	}

	//qna 게시글 답변 여부 변경
	@Override
	public int updateQnaReple(int qnaRefNo) {
		
		return sqlSession.update("support.updateQnaReple", qnaRefNo);
	}
	
	
	
	
	
	
}
