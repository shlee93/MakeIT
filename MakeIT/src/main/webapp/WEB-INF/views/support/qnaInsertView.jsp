<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div class="col-md-12 insert-form">
	<fieldset>
	
	<!-- Form Name -->
	<legend>QNA</legend>
	<div class="form-group">
		<label class="col-md-6 control-label" for="qna-writer"><strong>작성자:</strong></label>
		<div class="col-md-6">
	    	<span id="qna-writer">${sessionScope.member.MEMBERID }</span>	
	  	</div>
	</div>
	
	<!-- PASSWORD INPUT -->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-pass"><strong>비밀번호:</strong></label>  
	  <div class="col-md-6">
	  	<input id="qna-pass" name="qna-pass" class="form-control input-md" type="password"/>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-pass-ck"><strong>비밀번호 확인:</strong></label>  
	  <div class="col-md-6">
	  	<input id="qna-pass-ck" name="qna-pass-ck" class="form-control input-md" type="password"/>
	  </div>
	</div>
	
	<!-- Select Category -->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="category"><strong>질문 유형</strong></label>
	  <div class="col-md-6">
	    <select id="category" name="category" class="form-control">
	    	<option class="category-option" value="0">선택</option>
	    	<c:if test="${not empty categoryList }">
	    		<c:forEach items="${categoryList }" var="qna">
	    			<option class="category-option" value="${qna.FAQNACATEGORYNO }">${qna.FAQNACATEGORYNAME }</option>
	    		</c:forEach>
	    	</c:if>
	      
	    </select>
	  </div>
	</div>
	
	<!-- Title input-->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-title"><strong>제목</strong></label>  
	  <div class="col-md-6">
	  	<input id="qna-title" name="qna-title" placeholder="제목을 입력해주세요" class="form-control input-md" type="text"/>
	  </div>
	</div>
	
	<!-- Content input-->
	<div class="form-group">
	  <label class="col-md-6 control-label" for="qna-content"><strong>내용</strong></label>  
	  <div class="col-md-6">
	  	<textarea rows="10" cols="100" placeholder="질문을 입력해주세요" id="qna-content" name="qna-content"></textarea>
	  </div>
	</div>
	
	<div class="form-group">
	  	<button id="insert-qna" class="btn btn-outline-info slidetopleft">등록</button>
	  	<button id="back-list" class="btn btn-outline-info slidetopleft">목록</button>
	  	<input type="hidden" id="cPage" value="${cPage }"/>
		<input type="hidden" id="search-qna" value="${searchQna }"/>
		<input type="hidden" id="filter" value="${filter }"/>
		<input type="hidden" id="sortCheck" value="${sortCheck }"/>
	</div>
</fieldset>
</div>