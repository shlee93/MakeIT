package com.kh.makeit.support.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.support.model.dao.SupportDao;

@Service
public class SupportServiceImpl implements SupportService {

	@Autowired
	SupportDao dao;

	//qna 리스트 셀렉트
	@Override
	public List<Map<String, String>> selectQnaList(int cPage,int numPerPage) {
		
		return dao.selectQnaList(cPage,numPerPage);
	}

	//qna 게시물 카운트
	@Override
	public int selectQnaCount() {
		
		return dao.selectQnaCount();
	}

	//qna 검색 게시물 카운트
	@Override
	public int selectSearchQnaCount(Map<String, String> search) {

		return dao.selectSearchQnaCount(search);
	}

	//qna 검색 게시물 리스트
	@Override
	public List<Map<String, String>> selectSearchQnaList(Map<String,String> search,int cPage, int numPerPage) {
		
		return dao.selectSearchQnaList(search,cPage,numPerPage);
	}

	//qna 게시글 상세보기
	@Override
	public Map<String, String> selectOneQna(int qnaNo) {
		
		return dao.selectOneQna(qnaNo);
	}

	//qna 게시글 등록(회원)
	@Override
	public int insertQnaEnd(Map<Object, Object> insert) {
		
		return dao.insertQnaEnd(insert);
	}
	
	//qna 게시글 등록(관리자)
	@Override
	public int insertQnaEndAdmin(Map<Object, Object> insert) {
		
		return dao.insertQnaEndAdmin(insert);
	}

	//qna 게시글 수정
	@Override
	public int updateQnaEnd(Map<Object, Object> update) {
		
		return dao.updateQnaEnd(update);
	}

	//qna 게시글 삭제
	@Override
	public int deleteQnaEnd(int qnaNo) {
		
		return dao.deleteQnaEnd(qnaNo);
	}

	//qna 게시글 답변 여부 변경
	@Override
	public int updateQnaReple(int qnaRefNo) {
		
		return dao.updateQnaReple(qnaRefNo);
	}

	//qna 게시글 미답변 카운트
	@Override
	public int selectSearchQnaCheckCount(Map<String, String> search) {
		
		return dao.selectSearchQnaCheckCount(search);
	}

	//qna 게시글 미답변 리스트
	@Override
	public List<Map<String, String>> selectSearchQnaCheckList(Map<String, String> search, int cPage, int numPerPage) {
		
		return dao.selectSearchQnaCheckList(search,cPage,numPerPage);
	}

	//게시글 비밀번호 체크
	@Override
	public String selectQnaPassCheck(int qnaNo) {
		
		return dao.selectQnaPassCheck(qnaNo);
	}

	//게시글 상세보기에서 답변보기
	@Override
	public Map<String, String> selectOneQna3(int qnaNo) {
		
		return dao.selectOneQna3(qnaNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
