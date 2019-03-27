<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:if test="${not empty categoryList }">
	<c:forEach items="${categoryList }" var="category">
		<div class="faq-back">
		    <div class="faq-category btn btn-outline-info slidetopleft">●&nbsp;${category.FAQNACATEGORYNAME }
		
		  <button class="faq-slide btn btn-outline-info slidetopleft">▼</button>
		
		    </div>
		    <div class="faq-list-back">
		        <ul class="faq-list">
		        <c:forEach items="${faqList }" var="faq">
		        	<c:if test="${faq.FAQNACATEGORYNO==category.FAQNACATEGORYNO }">
		        	
		            <li class="faq-question">
		            	<textarea cols="65" style="resize:none; border:0;" readonly="readonly">●&nbsp;${faq.FAQTITLE }</textarea>
		
		               	<button class="answer-slide">▼</button>
		               
		               	<hr>
		               	<div class="faq-answer">
		               		<textarea cols="90" rows='12' style="resize:none; border:0; width:100%;" readonly="readonly">○&nbsp;${faq.FAQCONTENT }</textarea>
		                	</div>
		                 
		             </li>
		         	</c:if>
		             
		         </c:forEach>
		         </ul>
		         
		     </div>
		 </div>
	
	</c:forEach>
</c:if>
<c:if test="${empty categoryList }">
	<div class="col-md-12">
		준비중입니다.
	</div>
</c:if>
