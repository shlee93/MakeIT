<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>지원자 상세 보기</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<style>
</style>
</head>
<body>
	<input type="text" class="form-group" id="title" value="내가 나를 이긴다 그럼 나는 너를 이기는가" readonly/>
	<input type="text" class="form-group" id="writer" value="조충현" readonly/>
	<textarea class="form-group" id="content" value="내가 나를 이긴다 고로 나는 너를 이긴다. 왜냐하면 나느 천하무적이기 때문이다. 누가 나를 이길 쏘냐? 그건 너도 나도 우리도 심지어 하늘도 모르는 것이다." readonly/>
	<button class="btn btn-secondary">결정하기</button>
	<button class="btn btn-secondary">뒤로가기</button>
	
	<table>
		<tr>
			<td>이전</td>
			<td>창과 방패가 서로 강하기를 주장하니 어찌 세상이 평화로울 수 있겠습니까</td>
			<td>제갈공명</td>
		</tr>
		<tr>
			<td>다음</td>
			<td>암튼 다이아몬드가 젤 단단함 반박시 빙시</td>
			<td>관종</td>
		</tr>
		
	</table>
	
</body>
</html>