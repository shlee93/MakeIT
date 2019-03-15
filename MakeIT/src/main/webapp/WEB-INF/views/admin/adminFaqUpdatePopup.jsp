<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>JSP</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminPopup.css" />
    <script src="${pageContext.request.contextPath }/resources/js/admin/adminPopup.js"></script>	
</head>

<style>

</style>
<body>
	
<div class="container">
    <div>
    	<div>
    		<fieldset>
    			질문 카테고리:
	    		<select id="faq-category">
	    		<c:if test="${not empty categoryList }">
	    			<c:forEach items="${categoryList }" var="category">
		    			<option class="category-name" value="${category.FAQNACATEGORYNO }" ${category.FAQNACATEGORYNO==faq.FAQNACATEGORYNO?'selected':'' }>${category.FAQNACATEGORYNAME }</option>
	    			</c:forEach>
	    		</c:if>
	    		</select>
    		</fieldset>
    	</div>  
        <br style="clear:both">
            <div class="form-group col-md-4 ">                                
                <label id="qnaLabel" for="question">질문 </label>
                <textarea class="form-control input-sm " type="textarea" id="question" placeholder="질문" rows="7">${faq.FAQTITLE }</textarea>
                                    
            </div>
            <div class="form-group col-md-4 ">                                
                <label id="qnaLabel" for="answer">답변 </label>
                <textarea class="form-control input-sm " type="textarea" id="answer" placeholder="답변" rows="7">${faq.FAQCONTENT }</textarea>
                                    
            </div>
        <br style="clear:both">
        <div class="form-group col-md-2">
        	<input type="hidden" id="faq-no" value="${faq.FAQNO }"/>
        	<button class="form-control input-sm btn btn-success" id="updateQna" name="updateQna">등록</button>    
    	</div>
	</div>
</div>
</body>
</html>
