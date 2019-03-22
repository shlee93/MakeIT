
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
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">	
<style>
.hide {
	display: none;
}
#container{
 width:97%;
}

.btn-outline-info{
	position:relative;
	left:83%;
	top:3px;
}
</style>
</head>
<body>
	<div id="container">
		<form id="refundForm">
			<div>
				<div class="row" >
					<div class="col-md-12" style="text-align:center" >
						<h3 style="font-family: 'Sunflower', sans-serif;">환불하기</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" >
						
					</div>
					<div class="col-md-9">
						<label>환불대상</label> 
						
						<input class="form-control" type="text" name="sellWriter" readonly value="${refundMap.sellWriter}" style="width:40%;">
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-3">
						<label style="">환불사유</label> 
					</div>
					<div class="col-md-9">
						<textarea id="reportConten" name="reportContent" class="form-control" rows="5"></textarea>
					</div>
				</div>
				<div class="row">
					<br/>
					<button type="button" onclick="fn_sellRefundEnd();" class="btn btn-outline-info">환불하기</button>

				</div>
				
						<input type="hidden" name="sellno" value="${refundMap.sellno}">	
		<input type="hidden" name="refundId" value="${refundMap.refundId}">
	
			</div>
		</form>
		
	</div>
	<script>
		function fn_sellRefundEnd()
		{
		    $('#refundForm').attr('action',"${path}/sell/sellRefundEnd");
			$('#refundForm').submit();
		}
		$(document).ready(function() {

			
		$('#reportConten').on('keyup', function() {
		      if($(this).val().length > 1339) {
		    	  console.log($(this).val());
		         alert("글자수는 1339자로 이내로 제한됩니다.");
		         $(this).val($(this).val().substring(0, 1339));
		      }
		   
		   });
		})
	</script>
</body>
</html>



