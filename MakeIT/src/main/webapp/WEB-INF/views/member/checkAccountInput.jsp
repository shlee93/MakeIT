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
<title>Insert title here</title>

       
<!-- 공용 CSS JS -->
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
	#checkAccount-container 
	{
		margin-top:3em;
		text-align:center;
	}

</style>

<body>
	<div id="checkAccount-container">
		<c:if test="${account != null }">
			<form action="${path }/member/accountCheckEnd">
				<span>예금주 이름</span><input type="text" name="accountName" id="accountName" placeholder="예금주명을 입력하세요."/>
				<span>예금주 생년월일</span><input type="date" name="accountBirth" id="accountBirth"/>
				<input type="hidden" name="accountNo" id="accountNo" value="${account.ACCOUNTNO }">
				<input type="hidden" name="bankCode" id="bankCode" value="${account.BANKCODE }">
				<input type="submit" class="btn btn-outline-info slidetopleft" value="확인">
			</form>
		</c:if>
		<c:if test="${account == null }">
			<h4>계좌가 존재 하지 않습니다.</h4>
		</c:if>
	</div>

</body>
</html>