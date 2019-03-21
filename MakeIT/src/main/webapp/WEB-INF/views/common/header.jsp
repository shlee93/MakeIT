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


</head>
<body>
<header>

    <div id="navWrap">
        <div id="navBody">
            <div id="logoIcon"></div>
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
            <div id="icon1"></div>
            <div id="icon2"></div>
            <div id="icon3"></div>
            <div id="icon4"></div>
            <div id="icon5"></div>
        </div>
    </nav>
</header>
