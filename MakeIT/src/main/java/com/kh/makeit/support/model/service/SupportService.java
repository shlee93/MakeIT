package com.kh.makeit.support.model.service;

import java.util.List;
import java.util.Map;

public interface SupportService {
	
	//qna 리스트 셀렉트
	List<Map<String,String>> selectQnaList(int cPage,int numPerPage);
	
	//qna 게시물 카운트
	int selectQnaCount();
	
	//qna 검색 게시물 카운트
	int selectSearchQnaCount(Map<String,String> search);
	
	//qna 검색 게시물 리스트
	List<Map<String,String>> selectSearchQnaList(Map<String,String> search ,int cPage,int numPerPage);
	
	//qna 게시글 상세보기
	Map<String,String> selectOneQna(int qnaNo);
	
	//qna 게시글 등록(회원)
	int insertQnaEnd(Map<Object,Object> insert);
	
	//qna 게시글 등록(관리자)
	int insertQnaEndAdmin(Map<Object,Object> insert);
	
	//qna 게시글 수정
	int updateQnaEnd(Map<Object,Object> update);
	
	//qna 게시글 삭제
	int deleteQnaEnd(int qnaNo);
	
	//qna 게시글 답변 여부 변경
	int updateQnaReple(int qnaRefNo);
	
	//qna 게시글 미답변 카운트
	int selectSearchQnaCheckCount(Map<String,String> search);
	
	//qna 게시글 미답변 리스트
	List<Map<String,String>> selectSearchQnaCheckList(Map<String,String> search,int cPage,int numPerPage);

	//qna 게시글 비밀번호 체크
	String selectQnaPassCheck(int qnaNo);
}
