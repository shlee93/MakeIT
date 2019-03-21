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
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
	    	    
</head>
<style>
	.checkEmail-container 
	{
		margin-top:3em;
		text-align:center;
		font-family: 'Sunflower', sans-serif;
	}

</style>

<body>
	<div class="container-fluid checkEmail-container">
		<div class="row">
    		<div class="col-md-12">
    			<h5>비밀번호 찾기</h5>
    		</div>
    	</div>
		<form action="${path }/member/findPwEnd.do" id="emailFrm" method="post"onsubmit='return fn_enroll_validate()'>
			<div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>비밀번호</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="password" id='password' name='password' class='form-control' value='' placeholder="비밀번호 입력" required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>비밀번호확인</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="password" id='cpassword' name='cpassword' class='form-control' value='' placeholder="비밀번호 확인" required>
                    </div>
                    <div class="col-md-3 mb-2" id="ck_password">
						<div id="alert-success" style="color: green;">비밀번호가 일치합니다.</div>
						<div id="alert-danger" style="color: red;">비밀번호가 일치하지 않습니다. 비밀번호는 영문, 숫자, 특수문자 조합 8~20자리 입니다.</div>
                    </div>
                </div>
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
        

        if(!/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(joinPw))
        { 
            alert('비밀번호는 숫자와 영문자, 특수문자 조합으로 8~20자리를 사용해야 합니다.'); 
            $('#password').focus();
            return false;
        }
        
        var chk_num = joinPw.search(/[0-9]/g); 
        var chk_eng = joinPw.search(/[a-z]/ig);
        var chk_spe = joinPw.search(/[$@$!%*#?&]/);
    
        if(chk_num < 0 || chk_eng < 0 || chk_spe < 0)
    
        { 
            alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
            $('#password').focus();
            return false;
        }    

        if($('#cpassword').val().trim().length==0)
        {
            alert("패스워드를 입력하세요!");
            $('#cpassword').focus();
            return false;
        }
        
        var joincPw=$("#cpassword").val().trim();
        
        if(!/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(joincPw))
        { 
            alert('비밀번호는 숫자와 영문자, 특수문자 조합으로 8~20자리를 사용해야 합니다.'); 
            $('#cpassword').focus();
            return false;
        }
        return true;
    }
	$(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
    	$("input").keyup(function(){
    		var joincPw=$("#cpassword").val().trim();
			var joinPw=$("#password").val().trim();
			var chk_num = joinPw.search(/[0-9]/g); 
            var chk_eng = joinPw.search(/[a-z]/ig);
            var chk_spe = joinPw.search(/[$@$!%*#?&]/);
            
            if(chk_num < 0 && chk_eng < 0 && chk_spe < 0){
            	$("#alert-success").hide();
	            $("#alert-danger").show();
            } else{
            	if(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(joinPw))
                { 
                	if(joincPw != "" || joinPw != ""){
            	        if(joinPw == joincPw){
            	            $("#alert-success").show();
            	            $("#alert-danger").hide();
            	        }else{
            	            $("#alert-success").hide();
            	            $("#alert-danger").show();
            	        }    
            	    }
                } else{
                	$("#alert-success").hide();
     	            $("#alert-danger").show();
                }
    			
                if(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(joincPw))
                { 
                	if(joinPw != "" || joincPw != ""){
            	        if(joinPw == joincPw){
            	            $("#alert-success").show();
            	            $("#alert-danger").hide();
            	        }else{
            	            $("#alert-success").hide();
            	            $("#alert-danger").show();
            	        }    
            	    }
                } else{
               		$("#alert-success").hide();
     	            $("#alert-danger").show();
                }
            	
            }
            
    	    
    	});
    });
	</script>
</body>
</html>