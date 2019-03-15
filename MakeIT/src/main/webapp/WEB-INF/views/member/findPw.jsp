
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find ID</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- 아이콘 CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<style>
.checkMail-container
{
	margin-top:3em;
	text-align:center;
}
.emailBody{
	width: 97%;
}
</style>
<body class='emailBody'>
	<div class='checkMail-container'>
		<form name="contact-form" action="${path }/findPwCheck.do" method="POST">
	    	<div class="row">
	    		<div class="col-md-12">
	    			<h5>비밀번호 찾기</h5>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-md-1"></div>
	    		<div class="col-md-6">
	    			<input type="text" name="id" placeholder="가입시 등록한 아이디를 입력하세요." class="form-control">
	    		</div>
	    		<div class="col-md-5">
	    			<input type="submit" class="btn btn-outline-info slidetopleft" value="인증번호 발송">
	    		</div>
	    	</div>
		</form>
	</div>	  
	
</body>
</html>