<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>지원자 리스트 화면</title>
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
div{border:1px solid black}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-1"></div>
		<div id="vol-container" class="col-sm-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>제목</th>
						<th>지원 날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
					<tr>
						<td>조충현</td>
						<td>내가 나를 이긴다 그럼 나는 너를 이기는가</td>
						<td>2018/02/27</td>
					</tr>
				</tbody>
			</table>
			<div>
			<input type="text" class="form-group" id="title"
				value="내가 나를 이긴다 그럼 나는 너를 이기는가" readonly /> <input type="text"
				class="form-group" id="writer" value="조충현" readonly />
			<br>
			<textarea class="form-group" id="content" rows="10" style="width:90%;">
				내가 나를 이긴다 고로 나는 너를 이긴다. 왜냐하면 나느 천하무적이기 때문이다. 누가 나를 이길 쏘냐? 그건 너도 나도 우리도 심지어 하늘도 모르는 것이다.
			</textarea>
			<div>
			<button class="btn btn-secondary">결정하기</button>
			<button class="btn btn-secondary">뒤로가기</button>
			</div>

			<table class="table table-hover">
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
		</div>
		</div>
		
		<div class="col-sm-1"></div>
	</div>
</body>
</html>
