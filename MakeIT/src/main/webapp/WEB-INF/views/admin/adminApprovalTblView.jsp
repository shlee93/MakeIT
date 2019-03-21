<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:choose>
	<c:when test="${not empty approvalList }">
		<c:forEach items="${approvalList }" var="approval">
			<c:choose>
				<c:when test="${approval.CATEGORYCODE eq 'B' }">
				<tr>
		        	<td>
			         	<a>${approval.BUYTITLE }</a>
			         	<input type="hidden" class="number" value="${approval.BUYNO }"/>
			        </td>
			        <td>${approval.MEMBERID }</td>
			        <td>${approval.BUYDATE }</td>
			        <td>${approval.INTEREST }</td>
			    </tr>
				</c:when>
				<c:when test="${approval.CATEGORYCODE eq 'S' }">
				<tr>
			        <td>
			        	<a>${approval.SELLTITLE }</a>
			         	<input type="hidden" class="number" value="${approval.SELLNO }"/>
			        </td>
			        <td>${approval.MEMBERID }</td>
			        <td>${approval.SELLDATE }</td>
			        <td>${approval.INTEREST }</td>
		    	</tr>
				</c:when>
				<c:when test="${approval.CATEGORYCODE eq 'C' }">
				<tr>
			        <td>
			        	<a>${approval.CONTESTTITLE }</a>
			         	<input type="hidden" class="number" value="${approval.CONTESTNO }"/>
			        </td>
			        <td>${approval.MEMBERID }</td>
			        <td>${approval.CONTESTDATE }</td>
			        <td>${approval.INTEREST }</td>
		        </tr>
				</c:when>
				
			</c:choose>
			
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="4">데이터가 없습니다!</td>
		<tr>
	</c:otherwise>
</c:choose>
		<tr>
	    	<td colspan="4">
	    		${pageBarApproval }
	 		</td>
	 	</tr>