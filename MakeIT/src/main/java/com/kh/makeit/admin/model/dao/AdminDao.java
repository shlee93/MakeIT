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
	
	//관리자 페이지 회원 수(검색)
	int selectSearchMemberCountAdmin(String searchId);
	
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
	
	//관리자 페이지 FAQ카테고리 수정
	int updateFaqCategoryAdmin(Map<Object,Object> update);
	
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
	
	//관리자 페이지 환불 확정 업데이트
	int updateRefundEnd(Map<Object,Object> refund);
	
	//미승인 게시글 리스트
	List<Map<Object,Object>> selectApprovalList(String approvalStatus,int cPage, int numPerPage);
		
	//삭제된 게시글 리스트
	List<Map<Object,Object>> selectDeleteList(String deleteStatus,int cPage,int numPerPage);
	
	//미승인 게시글 카운트
	int selectApprovalCount(String approvalStatus);
		
	//삭제된 게시글 카운트
	int selectDeleteCount(String deleteStatus);
	
	//검색한 미승인 게시글 카운트
	int selectSearchApprovalCount(Map<String,String> approval);
	
	//검색한 미승인 게시글 리스트
	List<Map<Object,Object>> selectSearchApprovalList(Map<String,String> approval,int cPage,int numPerPage);
	
	//검색한 삭제된 게시글 카운트
	int selectSearchDeleteCount(Map<String,String> delete);
	
	//검색한 삭제된 게시글 리스트
	List<Map<Object,Object>> selectSearchDeleteList(Map<String,String> delete,int cPage,int numPerPage);
	
	//구매글 승인
	int updateBuyCheck(int buyNo);
	
	//판매글 승인
	int updateSellCheck(int sellNo);
		
	//컨테스트글 승인
	int updateContestCheck(int contestNo);
	
	//삭제된 게시글 복구
	int updateDeleteCheck(Map<Object,Object> returnD);
	
	//환불 사유 셀렉트
	Map<Object,Object> selectRefundReason(Map<Object,Object> refundParam);
	
	//구매게시판 판매량 셀렉트
	int selectPaymentBuyCount(String targetId);
	
	//판매게시판 판매량 셀렉트
	int selectPaymentSellCount(String targetId);
	
	//등급 업데이트
	int updateGradeUpdate(Map<Object,Object> perform);
	
	//환불 거부
	int updateRefundNegativeEnd(Map<Object,Object> negative);
	
	//구매확정 카운트
	int selectPaymentListCountAdmin(String paymentStatus);
}
