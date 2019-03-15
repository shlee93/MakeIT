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
		<form action="${path }/member/findPwEnd.do" id="emailFrm" method="post"onsubmit='return fn_enroll_validate()'>
			<input type="password" id='password' name='password' class='form-control' value='' placeholder="새 비밀번호 입력" required>
			<input type="hidden" name="id" id="id" value="${id }">
		</form>
		<input type="button" onclick="closeView();" class="btn btn-outline-info slidetopleft" value="확인">
	</div>
	<script>
	function closeView(){
		if($('#password').val().trim().length!=0){
			$('#emailFrm').submit();

		}
	}
	function fn_enroll_validate()
    {
        if($('#password').val().trim().length==0)
        {
            alert("패스워드를 입력하세요!");
            $('#password').focus();
            return false;
        }
        
        var joinPw=$("#password").val().trim();
        

        if(!/^[a-zA-Z0-9]{8,20}$/.test(joinPw))
        { 
            alert('비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.'); 
            $('#password').focus();
            return false;
        }
        return true;
    }
	</script>
</body>
</html>