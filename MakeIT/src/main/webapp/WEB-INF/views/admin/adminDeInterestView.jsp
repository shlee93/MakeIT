<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:forEach items="${deInterestList }" var="deInterest">
	<tr class="interest-back">
		<td class="deInterest-info">
			<input type="text" class="deInterest-val" value="${deInterest.DETAILINTEREST }" /> 
			<input type="hidden" class="deInterest-no" value="${deInterest.DETAILINTERESTNO }" />
			<input type="hidden" class="interest-no" value="${deInterest.INTERESTNO }" />
		</td>
		<td class="interest-info">
			<select class="change-interest">
				<c:forEach items="${interestList }" var="interest">
					<option value="${interest.INTERESTNO }"
						${interest.INTERESTNO==deInterest.INTERESTNO?'selected':'' }>
						${interest.INTEREST }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<!-- 2차 카테고리명, 1차 카테고리 변경 -->
			<button class='btn btn-primary update-interest'>수정</button>
		</td>
		<td>
			<!-- 2차 카테고리 삭제 -->
			<button class='btn btn-primary delete-btn-view'>삭제</button>
		</td>
	</tr>
	<tr class='delete-btn-back-tr'>
		<td colspan="4">
			<div class='delete-btn-back'>
				정말 삭제하시겠습니까?
				<button class="btn btn-primary category-delete-btn">삭제</button>
				<button class='btn btn-primary category-delete-cancel'>취소</button>
			</div>
		</td>
	</tr>
</c:forEach>
<tr>
	<td colspan="4">
		<button class="btn btn-primary" id="insert-interest-view">+추가</button>
	</td>
</tr>
<tr id="insert-interest-back">
	<td id="insert-interest-input" colspan="4">
		<div id="insert-interest-div">
			<input type="text" id="insert-deInterest-val" size="30" placeholder="등록할 카테고리를 입력해 주세요" />
			<button class="btn btn-primary" id="insert-interest-btn">등록</button>
			<button class="btn btn-primary" id="insert-interest-btn-cansel">취소</button>
		</div>
	</td>
</tr>
