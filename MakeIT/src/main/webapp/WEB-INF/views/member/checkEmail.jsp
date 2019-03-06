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
	#checkEmail-container 
	{
		margin-top:3em;
		text-align:center;
	}

</style>

<body>
	<div id="checkEmail-container">
		<input type="text" name="inputRandomNo" id="inputRandomNo" maxlength="6" placeholder="인증번호를 입력하세요."/>
		<input type="hidden" name="randomNo" id="randomNo" value="${randomNo }">
		<input type="button" onclick="checkEmail();" class="btn btn-primary" value="확인">
	</div>
	<script>
  		setTimeout(function(){self.close();},300000);
  		
  		var count = 300;
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
  	</script>
	<div id='timer-container' class='timer-container'>
		<p><span id='timer'></span> 초 이내에 인증을 완료해주세요. 이후에 자동으로 창이 닫힙니다.</p>
	</div>		
	<script>
		
		function checkEmail()
		{
			var frm=opener.document.signupform;
			
			var inputRandomNo = $('#inputRandomNo').val().trim();
			var randomNo = $('#randomNo').val().trim();
			if(inputRandomNo!=randomNo)
			{
				frm.emailValid.value='0';
				alert("번호가 일치하지 않습니다.");
				return;
			}
			else
			{
				frm.emailValid.value='1';
				alert('인증이 완료되었습니다.')
				self.close();
			}
			
				
		}
	</script>
</body>
</html>