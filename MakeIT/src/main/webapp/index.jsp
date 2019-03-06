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

<a class="dropdown-item" href="${path }/member/memberEnrollck.do">회원가입</a>
<a class="dropdown-item" href="${path }/member/memberLogin.do">로그인</a>
<a class="dropdown-item" href="${path }/member/memberMyPage.do">마이페이지</a>


<a class="dropdown-item" href="${path }/sell/sellmain.do">판매메인</a>
<a class="dropdown-item" href="${path }/sell/sellDetail.do">판매디테일</a>
<a class="dropdown-item" href="${path }/sell/sellWrite.do">판매글작성</a>
<a class="dropdown-item" href="${path }/buy/buyDetail.do">구매디테일</a>
<a class="dropdown-item" href="${path }/buy/buyWrite.do">구매글작성</a>
<a class="dropdown-item" href="${path }/contest/contestMain.do">컨테스트메인</a>
<a class="dropdown-item" href="${path }/contest/contestDetail.do">컨테스트상세</a>
<a class="dropdown-item" href="${path }/contest/contestWrite.do">컨테스트글작성</a>
<a class="dropdown-item" href="${path }/member/memberMyPage.do">주재범</a>

<a class="dropdown-item" href="${path }/mainpage/mainpage.do">메인페이지</a>
</body>
</html>