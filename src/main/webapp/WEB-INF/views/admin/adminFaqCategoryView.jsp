<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:if test="${not empty categoryList }">
	<c:forEach items="${categoryList }" var="faq">
		<tr class="interest-back">
			<td class="deInterest-info">
				<input type="text" class="category-val" value="${faq.FAQNACATEGORYNAME }" /> 
				<input type="hidden" class="category-no" value="${faq.FAQNACATEGORYNO }" />
			</td>
			<td>
			
			</td>
			<td>
				<!-- 2차 카테고리명, 1차 카테고리 변경 -->
				<button class='btn btn-outline-info slidetopleft update-category'>수정</button>
			</td>
			<td>
				<!-- 2차 카테고리 삭제 -->
				<button class='btn btn-outline-info slidetopleft delete-btn-view'>삭제</button>
			</td>
		</tr>
		<tr class='delete-btn-back-tr'>
			<td colspan="4">
				<div class='delete-btn-back'>
					카테고리에 해당하는 모든 질문이 삭제 됩니다.
					<button class="btn btn-outline-info slidetopleft faq-category-delete-btn">삭제</button>
					<button class='btn btn-outline-info slidetopleft category-delete-cancel'>취소</button>
				</div>
			</td>
		</tr>
	</c:forEach>
</c:if>
<tr>
	<td colspan="4">
		<button class="btn btn-outline-info slidetopleft" id="insert-interest-view">+추가</button>
	</td>
</tr>
<tr id="insert-interest-back">
	<td id="insert-interest-input" colspan="4">
		<div id="insert-interest-div">
			<input type="text" id="insert-category-val" size="30" placeholder="등록할 카테고리를 입력해 주세요" />
			<button class="btn btn-outline-info slidetopleft" id="insert-category-btn">등록</button>
			<button class="btn btn-outline-info slidetopleft" id="insert-interest-btn-cancel">취소</button>
		</div>
	</td>
</tr>
