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
	
	//관리자 페이지 FAQ카테고리 셀렉트
	List<Map<String,String>> selectFaqCategoryAdmin();
	
	//관리자 페이지 FAQ 질문 답변 등록
	int insertFaqnaAdmin(Map<Object,Object> faq);
	
	//관리자 페이지 FAQ 셀렉트
	List<Map<String,String>> selectFaqListAdmin();
	
	//관리자 페이지 FAQ 셀렉트원
	Map<String,String> selectFaqAdmin(int faqNo);
	
	//관리자 페이지 FAQ 질문 답변 수정
	int updateFaqnaAdmin(Map<Object,Object> faq);
	
	//관리자 페이지 FAQ 삭제
	int deleteFaqnaAdmin(int faqNo);
	
	//관리자 페이지 FAQ카테고리 삭제
	int deleteFaqCategoryAdmin(int faqCategoryNo);
	
	//관리자 페이지 구매 신고 리스트
	List<Map<Object,Object>> selectReportListAdmin(String reportStatus,int cPage,int numPerPage);
	
	//관리자 페이지 회원 신고 횟수 증가
	int updateReportCount(String reportId);
	
	//관리자 페이지 게시글 신고 검토 여부
	int updateReportStatus(Map<Object,Object> report);
	
	//관리자 페이지 신고 리스트 카운트
	int selectReportCountAdmin(String reportStatus);
	
	//관리자 페이지 결제현황 리스트 카운트
	int selectPaymentCountAdmin(String paymentStatus);
	
	//관리자 페이지 결제현황 리스트
	List<Map<Object,Object>> selectPaymentListAdmin(Map<Object,Object> payment,int cPage,int numPerPage);
	
	//관리자 페이지 결제 정보 출력
	Map<Object,Object> selectPaymentOne(Map<Object,Object> payment);
	
	//관리자 페이지 결제 현황 구매확정
	int updatePaymentEnd(Map<Object,Object> payment);
	
	//관리자 페이지 환불 요청 리스트 카운트
	int selectRefundCountAdmin(String refundStatus);
	
	//관리자 페이지 환불요청 리스트
	List<Map<Object,Object>> selectRefundListAdmin(String refundStatus,int cPage,int numPerPage);
	
	//관리자 페이지 환불-결제 정보 출력
	Map<Object,Object> selectRefundOne(Map<Object,Object> refund);
}
