
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
    			<h5>아이디 찾기</h5>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-md-1"></div>
    		<div class="col-md-6">
    			<c:if test="${id!=null }">
    				<p>찾으신 ID는 [<c:out value="${id }"></c:out>] 입니다.</p>
    			</c:if>
    			<c:if test="${id==null }">
    				<p>찾으신 ID가 없습니다.</p>
    			</c:if>
    		</div>
    		<div class="col-md-5">
    			<input type="button" onclick="closeView();" value="닫기">
    		</div>
    	</div>
    	<script>
  		setTimeout(function(){self.close();},10000);
  		
  		var count = 10;
  		var counter = setInterval(timer,1000);
  		function timer()
  		{
  			count--;
  			if(count<=0)
 				{
  				clearInterval(counter);
  				
  				document.getElementById('timer').innerHTML="";
  				return
 				}
  			document.getElementById('timer').innerHTML=count;
  		}
  		function closeView(){
  			self.close();
  		}
  	</script>
	<div id='timer-container' class='timer-container'>
		<p><span id='timer'></span> 초 이내에 자동으로 창이 닫힙니다.</p>
	</div>	
	</div>	  
	
</body>
</html>