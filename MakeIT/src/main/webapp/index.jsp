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
</head>
<body>

<a class="dropdown-item" href="${path }/member/memberEnroll.do">회원가입</a>
<a class="dropdown-item" href="${path }/member/memberLogin.do">로그인</a>
<a class="dropdown-item" href="${path }/member/memberMyPage.do">마이페이지</a>
<a class="dropdown-item" href="${path }/member/memberMyPage.do">주재범</a>
</body>
</html>