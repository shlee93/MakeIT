<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:if test="${not empty qnaList }">
	<% int i=0; %>
	<c:forEach items="${qnaList }" var="qna">
		<c:choose>
			<c:when test="${qna.QNALEVEL==1 }">
				<tr>
					<td><%=i %></td>
					<td>${qna.FAQNACATEGORYNAME }</td>
					<td colspan="3">
						<a class="qna-pass ${sessionScope.member.MEMBERLEVEL==0?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
						<input type="hidden" value="${qna.QNANO }"/>
					</td>
					<td>${qna.MEMBERID }</td>
					<td>${qna.QNADATE }</td>
				</tr>
				<%i++; %>

			</c:when>
			<c:when test="${qna.QNALEVEL==2 }">
				<tr>
					<td><%=i %></td>
					<td></td>
					<td colspan="3" style="color:gray;">
						&nbsp;&nbsp;→[답변]<a class="qna-title-reple qna-pass ${sessionScope.member.MEMBERLEVEL==0?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
						<input type="hidden" value="${qna.QNANO }"/>
					</td>
					<td>&nbsp;&nbsp;${qna.MEMBERID }</td>
					<td>&nbsp;&nbsp;${qna.QNADATE }</td>
				</tr>
				<%i++; %>
			</c:when>

		</c:choose>
	</c:forEach>
	<tr>
		<td colspan="7">${pageBarQna }</td>
	</tr>

</c:if>
<c:if test="${empty qnaList }">
	<tr>
		<td colspan="7">첫 게시물을 등록해주세요!</td>
	</tr>
</c:if>