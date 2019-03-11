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
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
</head>

<body>
	
<div class="container">
    <div>        
        <br style="clear:both">
            <div class="form-group col-md-4 ">                                
                <label id="messageLabel" for="message">질문 </label>
                <textarea class="form-control input-sm " type="textarea" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
                                    
            </div>
            <div class="form-group col-md-4 ">                                
                <label id="messageLabel" for="message">답변 </label>
                <textarea class="form-control input-sm " type="textarea" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
                                    
            </div>
        <br style="clear:both">
        <div class="form-group col-md-2">
        	<button class="form-control input-sm btn btn-success disabled" id="btnSubmit" name="btnSubmit" type="button" style="height:35px"> Send</button>    
    	</div>
	</div>
</div>
</body>
</html>
