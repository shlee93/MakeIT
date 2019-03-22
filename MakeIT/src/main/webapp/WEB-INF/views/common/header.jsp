<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>재능 마켓</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
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


<!-- Member CSS -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" /> --%>

<link rel="stylesheet" type="text/css" href="${path }/resources/css/mainpage/style.css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">	

<!-- 관리자 CSS,JS -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/admin.css" /> --%>
<script src="${pageContext.request.contextPath }/resources/js/admin/admin.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">

</head>
<body>
<header>

    <div id="navWrap">
        <div id="navBody">
            <div id="logoIcon"><img src="${path }/resources/image/logo1main.png"/></div>
            <p id="logoWrite">재능 마켓</p>
        </div>
        <%if(session.getAttribute("member") == null){ %>
        <div id="loginWrap">
            <a href="${path }/member/memberLogin.do" id="login">Login |</a>
            <a href="${path }/member/memberEnrollck.do" id="join"> Join us :)</a>
        </div>
        <%}else{ %>
        <div id="loginWrap">
            <a href="${path }/member/memberMyPage.do" id="login">Mypage |</a>
            <a href="${path }/member/memberLogout.do" id="join"> Logout :(</a>
        </div>
        <%} %>

    </div>

 <nav id="mainNavi">
        <div id="iconWrap">
            <div id="icon1">
            	<img src="${path }/resources/mainSource/image/sell.png"/>
            	<p>판매하기</p>
            </div>
            <div id="icon2">
            	<img src="${path }/resources/mainSource/image/buy.png"/>
            	<p>구매하기</p>
            </div>
            <div id="icon3">
            	<img src="${path }/resources/mainSource/image/contest.png"/>
            	<p>콘테스트</p>
            </div>
            <div id="icon4">
            	<img src="${path }/resources/mainSource/image/board.png"/>
            	<p>게시판</p>
            </div>
            <div id="icon5">
            	<img src="${path }/resources/mainSource/image/qna.png"/>
            	<p>QNA</p>
            </div>
        </div>
    </nav>
    
    <script>
		$('#icon1').mouseenter(function(){
			$('#icon1 p').css('color','#138496');
			$('#icon1 p').css('top','-22px');
			$('#icon1 p').css('transform','scale(1.5)');
			$('#icon1 img').css('transform','scale(1.5)');
				$('#icon1 img').css('top','-35px'); 
	  	})
	  	$('#icon1').mouseleave(function(){
			$('#icon1 p').css('color','black');
			$('#icon1 p').css('top','0px');
			$('#icon1 p').css('transform','scale(1)');
			$('#icon1 img').css('transform','scale(1)');
				$('#icon1 img').css('top','0px'); 
	  	})
	  	
	  	$('#icon2').mouseenter(function(){
			$('#icon2 p').css('color','#138496');
			$('#icon2 p').css('top','-22px');
			$('#icon2 p').css('transform','scale(1.5)');
			$('#icon2 img').css('transform','scale(1.5)');
			$('#icon2 img').css('top','-35px')
	  	})
	  	$('#icon2').mouseleave(function(){
			$('#icon2 p').css('color','black');
			$('#icon2 p').css('top','0px');
			$('#icon2 p').css('transform','scale(1)');
			$('#icon2 img').css('transform','scale(1)');
			$('#icon2 img').css('top','0px');
	  	})
	  	      	
	  	$('#icon3').mouseenter(function(){
			$('#icon3 p').css('color','#138496');
			$('#icon3 p').css('top','-22px');
			$('#icon3 p').css('transform','scale(1.5)');
			$('#icon3 img').css('transform','scale(1.5)');
			$('#icon3 img').css('top','-35px')
	  	})
	  	$('#icon3').mouseleave(function(){
			$('#icon3 p').css('color','black');
			$('#icon3 p').css('top','0px');
			$('#icon3 p').css('transform','scale(1)');
			$('#icon3 img').css('transform','scale(1)');
			$('#icon3 img').css('top','0px');
	  	})
	  	      	
	  	$('#icon4').mouseenter(function(){
			$('#icon4 p').css('color','#138496');
			$('#icon4 p').css('top','-22px');
			$('#icon4 p').css('transform','scale(1.5)');
			$('#icon4 img').css('transform','scale(1.5)');
			$('#icon4 img').css('top','-35px')
	  	})
	  	$('#icon4').mouseleave(function(){
			$('#icon4 p').css('color','black');
			$('#icon4 p').css('top','0px');
			$('#icon4 p').css('transform','scale(1)');
			$('#icon4 img').css('transform','scale(1)');
			$('#icon4 img').css('top','0px');
	  	})
	  	      	
	  	$('#icon5').mouseenter(function(){
			$('#icon5 p').css('color','#138496');
			$('#icon5 p').css('top','-22px');
			$('#icon5 p').css('transform','scale(1.5)');
			$('#icon5 img').css('transform','scale(1.5)');
			$('#icon5 img').css('top','-35px')
	  	})
	  	$('#icon5').mouseleave(function(){
			$('#icon5 p').css('color','black');
			$('#icon5 p').css('top','0px');
			$('#icon5 p').css('transform','scale(1)');
			$('#icon5 img').css('transform','scale(1)');
			$('#icon5 img').css('top','0px');
	  	})
	  	
	  	$('#icon1').click(function(){
	  		location.href="${path}/sell/sellmain.do";
	  	})
	  	$('#icon2').click(function(){
	  		location.href="${path}/buy/buymain.do";
	  	})
	  	$('#icon3').click(function(){
	  		location.href="${path}/contest/contestMain.do";
	  	})
	  	$('#icon4').click(function(){
	  		location.href="${path}/board.jsp";
	  	})
	  	$('#icon5').click(function(){
	  		location.href="${path}/qna.jsp";
	  	})
	  	$('#logoicon img').click(function(){
    		location.href="${path}/index.jsp";
    	})
    </script>
</header>
