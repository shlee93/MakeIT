<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div class="col-md-12 insert-form">
	
	<fieldset>
	
	<!-- Form Name -->
	<div class="form-group">
		<div class="col-md-6 qna-logo">
			<h2>1:1 문의</h2>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-6 control-label" for="qna-writer"><strong>작성자</strong></label>
		<div class="col-md-6">
		<c:choose>
			<c:when test="${qna.GRADENO==1 }">
				<img class="grade-icon" src="${path }/resources/image/bronzeGrade.png"/>
			</c:when>
			<c:when test="${qna.GRADENO==2 }">
				<img class="grade-icon" src="${path }/resources/image/silverGrade.png"/>
			</c:when>
			<c:when test="${qna.GRADENO==3 }">
				<img class="grade-icon" src="${path }/resources/image/goldGrade.png"/>
			</c:when>
			<c:when test="${qna.GRADENO==4 }">
				<img class="grade-icon" src="${path }/resources/image/platinumGrade.png"/>
			</c:when>
			<c:when test="${qna.GRADENO==5 }">
				<img class="grade-icon" src="${path }/resources/image/diamondGrade.png"/>
			</c:when>
		</c:choose>
	    	<span id="qna-writer">${qna.MEMBERID }</span>	
	  	</div>
	</div>
	<!-- Select Category -->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="category"><strong>질문 유형</strong></label>
	  <div class="col-md-6">
	  	<span id="qna-categroy">${qna.FAQNACATEGORYNAME }</span>
	  </div>
	</div>
	
	<!-- Title input-->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-title"><strong>제목</strong></label>  
	  <div class="col-md-6">
	  	<input id="qna-title" name="qna-title" placeholder="제목을 입력해주세요" class="form-control input-md" type="text" value="${qna.QNATITLE }" readonly/>
	  </div>
	</div>
	
	<!-- Content input-->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-content"><strong>내용</strong></label>  
	  <div class="col-md-6">
	  	<textarea rows="10" cols="100" placeholder="질문을 입력해주세요" id="qna-content" name="qna-content" readonly >${qna.QNACONTENT }</textarea>
	  </div>
	</div>
	
	<div class="form-group">
	<c:if test="${member.MEMBERLEVEL==0 and qna.QNALEVEL!=2 and qna.ANSWERYN=='N'}">
		<button id="reple-qna" class="btn btn-outline-info slidetopleft">답변하기</button>
	</c:if>
	<c:if test="${member.MEMBERID eq qna.MEMBERID and qna.QNALEVEL!=2 and qna.ANSWERYN=='Y'}">
		<button id="reple-qna-view" class="btn btn-outline-info slidetopleft">답변보기</button>
	</c:if>
	<c:if test="${member.MEMBERID eq qna.MEMBERID }">
	
	    <button id="update-qna" class="btn btn-outline-info slidetopleft">수정</button>
	    <button id="delete-qna" class="btn btn-outline-info slidetopleft">삭제</button>
	</c:if>
		<button id="back-list" class="btn btn-outline-info slidetopleft">목록</button>
		<input type="hidden" id="qnaNo" value="${qna.QNANO }"/>
		<input type="hidden" id="cPage" value="${cPage }"/>
		<input type="hidden" id="search-qna" value="${searchQna }"/>
		<input type="hidden" id="filter" value="${filter }"/>
		<input type="hidden" id="sortCheck" value="${sortCheck }"/>
	</div>
</fieldset>
</div>