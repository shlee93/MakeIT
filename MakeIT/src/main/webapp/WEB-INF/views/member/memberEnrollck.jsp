<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	 <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />
   <style>
	#individual{
		text-align: center;	
		margin-top: 20%;
	}
	#company{
		text-align: center;
		margin-top: 20%;
	}
	#welcome{
		text-align: center;
		margin-top: 5%;
	}
	.fas{
		display: block;
	}
	.signUp{
		margin-top: 2%;
	}
   </style>
</head>
<body>
<div class="container-fluid">
        <div class="row">
            <div class="col-md-1">
                nav
            </div>
            <div class="col-md-10">
            	<div class="row">
            		<div class="col-md-12" id="welcome">
            			<h1><b>MakeIT</b>의 회원가입을 환영합니다!</h1>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-md-6" id="individual">
            			<form action="${path }/member/individualMember" method="post">
            				<i class="fas fa-user fa-10x"></i>
            				<h3>당신의 재능을 <b>MakeIT</b>와 함께</h3>
            				<input type="submit" class="btn btn-primary signUp" value="개인 회원가입">
            			</form>
            		</div>
            		<div class="col-md-6" id="company">
            			<form action="${path }/member/companyMember">
            				<i class="fas fa-user-tie fa-10x"></i>
            				<h3>많은 인재들이 기다리는 <b>MakeIT</b>입니다.</h3>
            				<input type="submit" class="btn btn-primary signUp" value="기업 회원가입">
            			</form>
            		</div>
            	</div>
                
                
               
            </div>
            <div class="col-md-1">
                aside
            </div>
        </div>
    </div>
</body>
</html>