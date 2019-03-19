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
<title>JSP</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
        crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminPopup.css" />
    <script src="${pageContext.request.contextPath }/resources/js/admin/adminPopup.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">

				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${member.get('MEMBERID') }</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3" align="center">
								<img id='user-img' alt="User Pic"
									src="C:\Users\Ncu422\Documents\HTMLVS\한효주.png"
									class="img-circle img-responsive">
							</div>

					
							<div class=" col-md-9 col-lg-9 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><strong>이름</strong></td>
											<td>${member.get('MEMBERNAME') }</td>
										</tr>
										<tr>
											<td><strong>생년월일</strong></td>
											<td>${member.get('BIRTH') }</td>
										</tr>
										<tr>
											<td><strong>관심분야</strong></td>
											<td>${member.get('INTERESTNO') }</td>
										</tr>
										<tr>
											<td><strong>등급</strong></td>
											<td>${member.get('GRADENAME') }</td>
										</tr>


										<tr>
										<tr>
											<td><strong>전화번호</strong></td>
											<td>
												<input type="text" name="phone" id="phone" value="${member.get('PHONE') }" />
											</td>
										</tr>
										<tr>
											<td><strong>이메일</strong></td>
											<td>
												<input type="text" name="email" id="email" value="${member.get('EMAIL') }" />
											</td>
										</tr>
										<tr>
											<td><strong>주소</strong></td>
											<td>
												<input type="text" name="address" id="address" value="${member.get('ADDRESS') }" />
											</td>
										</tr>
										<tr>
											<td><strong>신고횟수</strong></td>
											<td>
												<input type="text" name="reportCount" id="reportCount" value="${member.get('REPORTCOUNT') }" />
											</td>
										</tr>


										</tr>

									</tbody>
								</table>
								<button class="btn btn-outline-info slidetopleft">닫기</button>
								<button class="btn btn-outline-info slidetopleft" id="member-update">수정</button>

							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


</body>
</html>
