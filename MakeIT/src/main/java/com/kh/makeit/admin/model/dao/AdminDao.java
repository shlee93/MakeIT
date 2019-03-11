package com.kh.makeit.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	//관리자 페이지 회원리스트
	List<Map<String,String>> selectMemberListAdmin(int cPage, int numPerPage);

	//관리자 페이지 회원 검색 리스트
	List<Map<String,String>> selectMemberSearchAdmin(String searchId,int cPage, int numPerPage);

	//관리자 페이지 회원 상세보기
	Map<Object, Object> selectMemberDetailAdmin(String id);

	//관리자 페이지 회원 정렬
	List<Map<String,String>> selectMemberSortAdmin(Map<Object,Object> sort,int cPage, int numPerPage);

	//관리자 회원 정보 업데이트
	int updateMemberDetailAdmin(Map<Object,Object> update);

	//관리자 페이지 회원 수
	int selectMemberCountAdmin();
	
	//관리자 페이지 카테고리 리스트
	List<Map<String,String>> selectDeInterestAdmin();
	List<Map<String,String>> selectInterestAdmin();
	List<Map<String,String>> selectDeInterestAdmin2(int interestNo);
	
	//관리자 페이지 카테고리 수정
	int updateInterestAdmin(Map<Object,Object> update);
	
	//관리자 페이지 카테고리 삭제
	int deleteInterestAdmin(int deInterestNo);
	
	//관리자 페이지 카테고리 등록
	int insertInterestAdmin(Map<Object,Object> insert);
	
	//관리자 페이지 FAQ카테고리 등록
	int insertFaqCategory(String category);
}
