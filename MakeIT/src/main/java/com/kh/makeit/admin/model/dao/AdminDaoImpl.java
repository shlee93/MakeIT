package com.kh.makeit.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//관리자 페이지 회원리스트
	@Override
	public List<Map<String, String>> selectMemberListAdmin(int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectMemberAdmin",null,rb);
	}

	//관리자 페이지 회원리스트
	@Override
	public List<Map<String, String>> selectMemberSearchAdmin(String searchId,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectSearchAdmin",searchId,rb);
	}

	//관리자 페이지 회원 상세보기
	@Override
	public Map<Object, Object> selectMemberDetailAdmin(String id) {

		return sqlSession.selectOne("admin.selectMemberDetail",id);
	}

	//관리자 페이지 회원 업데이트
	@Override
	public int updateMemberDetailAdmin(Map<Object, Object> update) {

		return sqlSession.update("admin.updateMemberAdmin",update);
	}

	//관리자 페이지 회원 리스트 정렬
	@Override
	public List<Map<String, String>> selectMemberSortAdmin(Map<Object,Object> sort,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectMemberSortAdmin",sort,rb);
	}

	//관리자 페이지 회원 수
	@Override
	public int selectMemberCountAdmin() {

		return sqlSession.selectOne("admin.selectMemberCountAdmin");
	}

	//관리자 페이지 카테고리 리스트
	@Override
	public List<Map<String, String>> selectDeInterestAdmin() {
		
		return sqlSession.selectList("admin.selectDeInterestAdmin");
	}

	@Override
	public List<Map<String, String>> selectInterestAdmin() {
		
		return sqlSession.selectList("admin.selectInterestAdmin");
	}

	@Override
	public List<Map<String, String>> selectDeInterestAdmin2(int interestNo) {
		
		return sqlSession.selectList("admin.selectDeInterestAdmin2",interestNo);
	}

	//관리자 페이지 카테고리 수정
	@Override
	public int updateInterestAdmin(Map<Object, Object> update) {
		
		return sqlSession.update("admin.updateInterestAdmin",update);
	}

	//관리자 페이지 카테고리 삭제
	@Override
	public int deleteInterestAdmin(int deInterestNo) {

		return sqlSession.delete("admin.deleteInterestAdmin",deInterestNo);
	}

	//관리자 페이지 카테고리 등록
	@Override
	public int insertInterestAdmin(Map<Object, Object> insert) {
		
		return sqlSession.insert("admin.insertInterestAdmin",insert);
	}

	//관리자 페이지 FAQ카테고리 등록
	@Override
	public int insertFaqCategory(String category) {
		
		return sqlSession.insert("admin.insertFaqCategory",category);
	}

	//관리자 페이지 FAQ카테고리 셀렉트
	@Override
	public List<Map<String, String>> selectFaqCategoryAdmin() {
		
		return sqlSession.selectList("admin.selectFaqCategoryAdmin");
	}

	//관리자 페이지 FAQ 질문 답변 등록
	@Override
	public int insertFaqnaAdmin(Map<Object, Object> faq) {
		
		return sqlSession.insert("admin.insertFaqnaAdmin", faq);
	}

	//관리자 페이지 FAQ 셀렉트
	@Override
	public List<Map<String, String>> selectFaqListAdmin() {

		return sqlSession.selectList("admin.selectFaqListAdmin");
	}

	//관리자 페이지 FAQ 셀렉트
	@Override
	public Map<String, String> selectFaqAdmin(int faqNo) {
		
		return sqlSession.selectOne("admin.selectFaqAdmin", faqNo);
	}

	//관리자 페이지 FAQ 질문 답변 수정
	@Override
	public int updateFaqnaAdmin(Map<Object, Object> faq) {
		
		return sqlSession.update("admin.updateFaqnaAdmin",faq);
	}

	//관리자 페이지 FAQ 삭제
	@Override
	public int deleteFaqnaAdmin(int faqNo) {
		
		return sqlSession.delete("admin.deleteFaqnaAdmin", faqNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
