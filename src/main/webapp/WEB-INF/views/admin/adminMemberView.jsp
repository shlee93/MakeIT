<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when test="${not empty memberList }">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>등급
				<th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList }" var="member">
				<c:if test="${member.MEMBERLEVEL eq 1 or member.MEMBERLEVEL eq 2 }">

					<tr>
						<td><a href="#" class="member-id">${member.get("MEMBERID")}</a></td>
						<td>${member.MEMBERNAME}</td>
						<td>${member.PHONE}</td>
						<td>${member.ADDRESS}</td>
						<td>${member.ENTDATE}</td>
						<td>${member.BIRTH}</td>
						<td>${member.GRADENAME}</td>
					</tr>

				</c:if>
			</c:forEach>
			<tr>
				<td colspan="7">${pageBar }</td>
			</tr>
		</tbody>
		
	</c:when>
	<c:otherwise>
		
			<tr>
				<th>회원정보가 없습니다.</th>
			</tr>
		</tbody>
	</c:otherwise>


</c:choose>