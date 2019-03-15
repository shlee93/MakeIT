
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
    	<div class="row">
    		<div class="col-md-12">
    			<h5>계좌 조회 결과</h5>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-md-1"></div>
    		<div class="col-md-6">
				<p><c:out value="${msg }"></c:out></p>
				<input type="hidden" name="isAble" id="isAble" value="${isAble }">
    		</div>
    		<div class="col-md-5">
    			<input type="button" class="btn btn-outline-info slidetopleft" onclick="closeView();" value="닫기">
    		</div>
    	</div>
    	<script>  		
  		function closeView(){
			var frm=opener.document.signupform;
			
			var isAble = $('#isAble').val().trim();
			if(isAble == 'false')
			{
				frm.accountValid.value='0';
				alert("인증이 실패하였습니다. 다시 시도해주세요.");
				self.close();
			}
			else
			{
				frm.accountValid.value='1';
				alert('인증이 완료되었습니다.')
				self.close();
			}
  		}
  	</script>
	</div>	  
	
</body>
</html>