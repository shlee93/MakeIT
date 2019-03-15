
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
	div
	{
		/* border: 1px solid yellow; */
	}
</style>
</head>
<body>
	<div class='row'>
		<div class='col-md-1'></div>
		<div class='col-md-10'>
			<div style='width: 100%; min-height: 350px; padding: 2em;'>
				<div class='row'>
					<div class='col-md-6'>
						<div class='row' style='padding: 1em;'>
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHelJu84DeOFYM_f_HuWC_dVEoYwyqW3z1Tdz6xeYYmzTGS6Q" style='width: 100%; height: 350px;'>
						</div>
						<div class='row'>
							<div class='col-md-3' style='padding: 1px;'>
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 100px;'>
							</div>
							<div class='col-md-3' style='padding: 1px;'>
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 100px;'>
							</div>
							<div class='col-md-3' style='padding: 1px;'>
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 100px;'>
							</div>
							<div class='col-md-3' style='padding: 1px;'>
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 100px;'>
							</div>
						</div>
					</div>
					<div class='col-md-6'style='padding-top: 70px;'>
						<div style='text-align:center;'>
							<img src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg" style='width: 21%; height: 100px; border-radius: 1800px;'>
						</div>
						<div style='padding-right: 100px; padding-left: 100px; padding-top: 30px;'>
							<p>개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리</p>
						</div>
					</div>
				</div>		
			</div>
			<div style='width: 100%; margin-top: 3em; margin-bottom:3em;'>
				<h1 style='text-align:center; margin-bottom:1em;'>선택 상품 정보</h1>
				<div style='width:100%; border-top: 1px solid black; border-bottom:1px solid black; padding:20px;' >
					<div class='row'>
						<div class='col-md-6' style='padding-left: 100px;'>
							<h4>선택옵션 : <p style='display:inline; float:right; margin-right: 3.5em;'><%= "프리미엄(400,000)" %></p></h4>
							
						</div>
						<div class='col-md-6' style='padding-left: 100px;'>
							<h4>구매수량 : <input type='number' class='form-control' style='width: 30%; float:right; margin-right: 5em;'></h4>
							<h4 style='margin-top: 1.2em;'>금액 : <p style='display:inline; float:right; margin-right: 3.5em;'><%= "800,000원" %></p></h4>
						</div>						
					</div>
				</div>
			</div>	
			<div style='width: 100%; margin-bottom:3em;'>
				<h1 style='text-align:center; margin-bottom:1em;'>결제 수단 선택</h1>
				<div style='width:100%; border-top: 1px solid black; border-bottom:1px solid black; padding:20px;'  >
					<div class='row' style='width: 100%;'>
						<div class='col-md-4' style='text-align:center'>
							<input type='radio' name='pay' id='kakao'/>
							<label for='kakao'>카카오페이</label>
						</div>
						<div class='col-md-4' style='text-align:center'>
							<input type='radio' name='pay' id='nobank'/>
							<label for='kakao'>무통장입금</label>
						</div>
						<div class='col-md-4' style='text-align:center'>
							<input type='radio' name='pay' id='account'/>
							<label for='account'>계좌결제</label>
						</div>
					</div>
				</div>
			</div>
			<div class='row' style='margin-top:4em; justify-content:center;'>
				<div>
					<input type='button' class='btn btn-primary' style='margin-right: 1.3em; width: 5.3em;' value='취소'>
					<input type='button' onclick='payPop();' class='btn btn-primary' value='구매결정'/>
					<script>
						function payPop()
	                	{
	                		var popup=open("${path}/views/payPop.jsp","paypage","left=200px, top=100px, width=350px, height=450px");
	                	}
					</script>
				</div>
			</div>			
		</div>
		<div class='col-md-1'></div>
	</div>

</body>
</html>