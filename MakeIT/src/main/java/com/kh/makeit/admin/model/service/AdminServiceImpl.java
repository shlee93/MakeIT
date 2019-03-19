package com.kh.makeit.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao dao;

	//관리자 페이지 회원 리스트
	@Override
	public List<Map<String, String>> selectMemberListAdmin(int cPage, int numPerPage) {

		return dao.selectMemberListAdmin(cPage,numPerPage);
	}

	//관리자 페이지 회원 검색 리스트
	@Override
	public List<Map<String, String>> selectMemberSearchAdmin(String searchId,int cPage, int numPerPage) {

		return dao.selectMemberSearchAdmin(searchId,cPage,numPerPage);
	}

	//관리자 페이지 회원 검색 리스트
	@Override
	public Map<Object, Object> selectMemberDetailAdmin(String id) {

		return dao.selectMemberDetailAdmin(id);
	}

	//관리자 페이지 회원 상세보기
	@Override
	public int updateMemberDetailAdmin(Map<Object, Object> update) {

		return dao.updateMemberDetailAdmin(update);
	}

	//관리자 페이지 회원 정렬
	@Override
	public List<Map<String,String>> selectMemberSortAdmin(Map<Object,Object> sort,int cPage, int numPerPage) {

		return dao.selectMemberSortAdmin(sort,cPage,numPerPage);
	}

	//관리자 페이지 회원 수
	@Override
	public int selectMemberCountAdmin() {

		return dao.selectMemberCountAdmin();
	}

	//관리자 페이지 카테고리 리스트
	@Override
	public List<Map<String, String>> selectDeInterestAdmin() {
		
		return dao.selectDeInterestAdmin();
	}

	@Override
	public List<Map<String, String>> selectInterestAdmin() {
		
		return dao.selectInterestAdmin();
	}

	@Override
	public List<Map<String, String>> selectDeInterestAdmin2(int interestNo) {
		
		return dao.selectDeInterestAdmin2(interestNo);
	}

	//관리자 페이지 카테고리 수정
	@Override
	public int updateInterestAdmin(Map<Object, Object> update) {
		
		return dao.updateInterestAdmin(update);
	}
	
	//관리자 페이지 카테고리 삭제
	@Override
	public int deleteInterestAdmin(int deInterestNo) {
		
		return dao.deleteInterestAdmin(deInterestNo);
	}

	//관리자 페이지 카테고리 등록
	@Override
	public int insertInterestAdmin(Map<Object, Object> insert) {
		
		return dao.insertInterestAdmin(insert);
	}

	//관리자 페이지 FAQ카테고리 등록
	@Override
	public int insertFaqCategory(String category) {
		
		return dao.insertFaqCategory(category);
	}

	//관리자 페이지 FAQ카테고리 셀렉트
	@Override
	public List<Map<String, String>> selectFaqCategoryAdmin() {
		
		return dao.selectFaqCategoryAdmin();
	}
	//관리자 페이지 FAQ 질문 답변 등록
	@Override
	public int insertFaqnaAdmin(Map<Object, Object> faq) {
		
		return dao.insertFaqnaAdmin(faq);
	}
	
	//관리자 페이지 FAQ 셀렉트
	@Override
	public List<Map<String, String>> selectFaqListAdmin() {
		
		return dao.selectFaqListAdmin();
	}

	//관리자 페이지 FAQ 셀렉트원
	@Override
	public Map<String, String> selectFaqAdmin(int faqNo) {
		
		return dao.selectFaqAdmin(faqNo);
	}

	//관리자 페이지 FAQ 질문 답변 수정
	@Override
	public int updateFaqnaAdmin(Map<Object, Object> faq) {
		
		return dao.updateFaqnaAdmin(faq);
	}

	//관리자 페이지 FAQ 삭제 
	@Override
	public int deleteFaqnaAdmin(int faqNo) {
		
		return dao.deleteFaqnaAdmin(faqNo);
	}

	//관리자 페이지 FAQ 카테고리 삭제
	@Override
	public int deleteFaqCategoryAdmin(int faqCategoryNo) {
		
		return dao.deleteFaqCategoryAdmin(faqCategoryNo);
	}
	
	//관리자 페이지 구매 신고 리스트
	@Override
	public List<Map<Object, Object>> selectReportListAdmin(String reportStatus,int cPage,int numPerPage) {
		
		return dao.selectReportListAdmin(reportStatus,cPage,numPerPage);
	}

	//관리자 페이지 회원 신고 횟수 증가
	@Override
	public int updateReportCount(String reportId) {
		
		return dao.updateReportCount(reportId);
	}

	//관리자 페이지 게시글 신고 검토 여부
	@Override
	public int updateReportStatus(Map<Object,Object> report) {
		
		return dao.updateReportStatus(report);
	}
	
	//관리자 페이지 신고 리스트 카운트
	@Override
	public int selectReportCountAdmin(String reportStatus) {
		
		return dao.selectReportCountAdmin(reportStatus);
	}

	//관리자 페이지 결제현황 리스트 카운트
	@Override
	public int selectPaymentCountAdmin(String paymentStatus) {
		
		return dao.selectPaymentCountAdmin(paymentStatus);
	}

	//관리자 페이지 결제현황 리스트
	@Override
	public List<Map<Object, Object>> selectPaymentListAdmin(Map<Object,Object> payment, int cPage, int numPerPage) {
		
		return dao.selectPaymentListAdmin(payment, cPage, numPerPage);
	}

	//관리자 페이지 결제 정보 출력
	@Override
	public Map<Object, Object> selectPaymentOne(Map<Object, Object> payment) {
		
		return dao.selectPaymentOne(payment);
	}

	//관리자 페이지 결제 현황 구매확정
	@Override
	public int updatePaymentEnd(Map<Object, Object> payment) {
		
		return dao.updatePaymentEnd(payment);
	}

	//관리자 페이지 환불 요청 리스트 카운트
	@Override
	public int selectRefundCountAdmin(String refundStatus) {
		
		return dao.selectRefundCountAdmin(refundStatus);
	}
	
	//관리자 페이지 환불요청 리스트
	@Override
	public List<Map<Object, Object>> selectRefundListAdmin(String refundStatus, int cPage, int numPerPage) {
		
		return dao.selectRefundListAdmin(refundStatus, cPage, numPerPage);
	}
	
	//관리자 페이지 환불-결제 정보 출력
	@Override
	public Map<Object, Object> selectRefundOne(Map<Object, Object> refund) {
		
		return dao.selectRefundOne(refund);
	}
	
	//관리자 페이지 환불 확정 업데이트
	@Override
	public int updateRefundEnd(Map<Object, Object> refund) {
		
		return dao.updateRefundEnd(refund);
	}

	//관리자 페이지 FAQ카테고리 수정
	@Override
	public int updateFaqCategoryAdmin(Map<Object, Object> update) {
		
		return dao.updateFaqCategoryAdmin(update);
	}

	//관리자 페이지 회원 수(검색)
	@Override
	public int selectSearchMemberCountAdmin(String searchId) {
		
		return dao.selectSearchMemberCountAdmin(searchId);
	}
	
	
}
