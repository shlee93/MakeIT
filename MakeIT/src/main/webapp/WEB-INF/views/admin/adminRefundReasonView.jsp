<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매페이지</title>

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

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/admin.js"></script>
<style>
.hide {
	display: none;
}
#container{
 width:97%;
}
.btn-primary{
	position:relative;
	left:83%;
	top:3px;
}
</style>
</head>
<body>
	<div id="container">
	<c:choose>
		<c:when test="${refund.CATEGORYCODE=='S' }">
			<form id="refundForm">
			<div>
				<div class="row" >
					<div class="col-md-12" style="text-align:center" >
						<h3 >환불</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>게시글 제목</label> 
						
						<input class="form-control" type="text" id="refund-title" style="width:100%;" readonly value="${refund.SELLTITLE}">
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>환불대상</label> 
						
						<input class="form-control" type="text" id="refund-target" readonly value="${refund.TARGETID}" style="width:40%;">
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>금액</label> 
						
						<input class="form-control" type="text" id="refund-price" readonly value="${refund.SELLPRICE}" style="width:40%;">
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<br/>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label for="reportContent">환불사유</label> 
						<textarea name="reportContent" class="form-control" rows="5">${refund.SELLREASONREFUND}</textarea>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">					
						<button type="button" class="btn btn-outline-info slidetopleft" id="refund-btn">환불하기</button>
						<button type="button" class="btn btn-outline-info slidetopleft" id="negative-btn">환불거부</button>
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<input type="hidden" id="no" value="${refund.SELLNO}">
				<input type="hidden" id="cPage" value="${cPage}">
				<input type="hidden" id="refundStatus" value="${refundStatus}">	
	
			</div>
		</form>
		</c:when>
		<c:otherwise>
		<form id="refundForm">
			<div>
				<div class="row" >
					<div class="col-md-12" style="text-align:center" >
						<h3 >환불</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>게시글 제목</label> 
						
						<input class="form-control" type="text" id="refund-title" style="width:100%;" readonly value="${refund.BUYTITLE}">
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>환불대상</label> 
						
						<input class="form-control" type="text" id="refund-target" readonly value="${refund.BUYID}" style="width:40%;">
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label>금액</label> 
						
						<input class="form-control" type="text" id="refund-price" readonly value="${refund.BUYPRICE}" style="width:40%;">
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<br/>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<label for="reportContent">환불사유</label> 
						<textarea name="reportContent" class="form-control" rows="5">${refund.BUYREASONREFUND}</textarea>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">					
						<button type="button" class="btn btn-outline-info slidetopleft" id="refund-btn">환불하기</button>
						<button type="button" class="btn btn-outline-info slidetopleft" id="negative-btn">환불거부</button>
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<input type="hidden" id="no" value="${refund.BUYNO}">
				<input type="hidden" id="cPage" value="${cPage}">
				<input type="hidden" id="refundStatus" value="${refundStatus}">	
	
			</div>
		</form>
		</c:otherwise>
	</c:choose>
		
		
	</div>
	
</body>
</html>



