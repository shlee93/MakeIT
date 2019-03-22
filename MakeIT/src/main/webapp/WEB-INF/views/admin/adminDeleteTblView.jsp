<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:choose>
  	<c:when test="${not empty deleteList }">
  		<c:forEach items="${deleteList }" var="delete">
  			<c:choose>
  				<c:when test="${delete.CATEGORYCODE eq 'B' }">
  					<tr>
              			<td>
			              	<a>${delete.BUYTITLE }</a>
			              	<input type="hidden" class="number" value="${delete.BUYNO }"/>
			            </td>
			            <td>${delete.MEMBERID }</td>
			            <td>${delete.BUYDATE }</td>
			            <td>${delete.INTEREST }</td>
			            <td><button class="return-content">복구</button></td>
          			</tr>
  				</c:when>
  				<c:when test="${delete.CATEGORYCODE eq 'S' }">
  					<tr>
			            <td>
			              	<a>${delete.SELLTITLE }</a>
			              	<input type="hidden" class="number" value="${delete.SELLNO }"/>
			            </td>
			            <td>${delete.MEMBERID }</td>
			            <td>${delete.SELLDATE }</td>
			            <td>${delete.INTEREST }</td>
			            <td><button class="return-content">복구</button></td>
		          	</tr>
  				</c:when>
  				<c:when test="${delete.CATEGORYCODE eq 'C' }">
  					<tr>
			            <td>
			              	<a>${delete.CONTESTTITLE }</a>
			              	<input type="hidden" class="number" value="${delete.CONTESTNO }"/>
			            </td>
			            <td>${delete.MEMBERID }</td>
			            <td>${delete.CONTESTDATE }</td>
			            <td>${delete.INTEREST }</td>
			            <td><button class="return-content">복구</button></td>
			        </tr>
  				</c:when>
  				
  			</c:choose>
  			
  		</c:forEach>
  	</c:when>
  	<c:otherwise>
	  	<tr>
	  		<td colspan="5">데이터가 없습니다!</td>
	  	<tr>
  	</c:otherwise>
</c:choose>
      
	    <tr>
	    	<td colspan="5">
	      		${pageBarDelete }
	      	</td>
	    </tr>