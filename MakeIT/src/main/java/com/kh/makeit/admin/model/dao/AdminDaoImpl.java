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

	//관리자 페이지 FAQ카테고리 삭제
	@Override
	public int deleteFaqCategoryAdmin(int faqCategoryNo) {
		
		return sqlSession.delete("admin.deleteFaqCategoryAdmin",faqCategoryNo);
	}

	//관리자 페이지 구매 신고 리스트
	@Override
	public List<Map<Object, Object>> selectReportListAdmin(String reportStatus,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectReportListAdmin",reportStatus,rb);
	}

	//관리자 페이지 회원 신고 횟수 증가
	@Override
	public int updateReportCount(String reportId) {
		
		return sqlSession.update("admin.updateReportCount", reportId);
	}
	
	//관리자 페이지 게시글 신고 검토 여부
	@Override
	public int updateReportStatus(Map<Object,Object> report) {
		
		return sqlSession.update("admin.updateReportStatus",report);
	}
	
	//관리자 페이지 신고 리스트 카운트
	@Override
	public int selectReportCountAdmin(String reportStatus) {
		
		return sqlSession.selectOne("admin.selectReportCountAdmin",reportStatus);
	}

	//관리자 페이지 결제현황 리스트 카운트
	@Override
	public int selectPaymentCountAdmin(String paymentStatus) {
		
		return sqlSession.selectOne("admin.selectPaymentCountAdmin", paymentStatus);
	}

	//관리자 페이지 결제현황 리스트
	@Override
	public List<Map<Object, Object>> selectPaymentListAdmin(Map<Object,Object> payment, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectPaymentListAdmin", payment, rb);
	}

	//관리자 페이지 결제 정보 출력
	@Override
	public Map<Object, Object> selectPaymentOne(Map<Object, Object> payment) {
		
		return sqlSession.selectOne("admin.selectPaymentOne", payment);
	}
	//관리자 페이지 결제 현황 구매확정
	@Override
	public int updatePaymentEnd(Map<Object, Object> payment) {
		
		return sqlSession.update("admin.updatePaymentEnd",payment);
	}

	//관리자 페이지 환불 요청 리스트 카운트
	@Override
	public int selectRefundCountAdmin(String refundStatus) {
		
		return sqlSession.selectOne("admin.selectRefundCountAdmin", refundStatus);
	}

	//관리자 페이지 환불 요청 리스트
	@Override
	public List<Map<Object, Object>> selectRefundListAdmin(String refundStatus, int cPage, int numPerPage) {
		
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectRefundListAdmin", refundStatus, rb);
	}

	//관리자 페이지 환불-결제 정보 출력
	@Override
	public Map<Object, Object> selectRefundOne(Map<Object, Object> refund) {
		
		return sqlSession.selectOne("admin.selectRefundOne", refund);
	}

	//관리자 페이지 환불-결제 업데이트
	@Override
	public int updateRefundEnd(Map<Object, Object> refund) {
		
		return sqlSession.update("admin.updateRefundEnd", refund);
	}

	//관리자 페이지 FAQ카테고리 수정
	@Override
	public int updateFaqCategoryAdmin(Map<Object, Object> update) {
		
		return sqlSession.update("admin.updateFaqCategoryAdmin", update);
	}

	//관리자 페이지 회원 수(검색)
	@Override
	public int selectSearchMemberCountAdmin(String searchId) {
		
		return sqlSession.selectOne("admin.selectSearchMemberCountAdmin",searchId);
	}

	//미승인 게시글 리스트
	@Override
	public List<Map<Object, Object>> selectApprovalList(String approvalStatus, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectApprovalList", approvalStatus, rb);
	}

	//삭제된 게시글 리스트
	@Override
	public List<Map<Object, Object>> selectDeleteList(String deleteStatus, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectDeleteList", deleteStatus, rb);
	}

	//미승인 게시글 리스트
	@Override
	public int selectApprovalCount(String approvalStatus) {
		
		return sqlSession.selectOne("admin.selectApprovalCount", approvalStatus);
	}

	//삭제된 게시글 카운트
	@Override
	public int selectDeleteCount(String deleteStatus) {
		
		return sqlSession.selectOne("admin.selectDeleteCount", deleteStatus);
	}

	//검색한 미승인 게시글 리스트
	@Override
	public int selectSearchApprovalCount(Map<String, String> approval) {
		
		return sqlSession.selectOne("admin.selectSearchApprovalCount", approval);
	}

	//검색한 삭제된 게시글 카운트
	@Override
	public int selectSearchDeleteCount(Map<String, String> delete) {
		
		return sqlSession.selectOne("admin.selectSearchDeleteCount", delete);
	}

	//검색한 미승인 게시글 리스트 
	@Override
	public List<Map<Object, Object>> selectSearchApprovalList(Map<String, String> approval, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectSearchApprovalList", approval, rb);
	}

	//검색한 삭제된 게시글 리스트 
	@Override
	public List<Map<Object, Object>> selectSearchDeleteList(Map<String, String> delete, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.selectSearchDeleteList", delete, rb);
	}
	
	
	
	
	
	
	

	
	

}
