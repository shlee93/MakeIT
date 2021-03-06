<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
	


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
	
	<style>
		 #payT{
			margin-left:40%;
		 }
	 
	</style>


	<div class='row' style="width:100%">
		<div class='col-md-1'></div>
		<div class='col-md-10' style='text-align:center'>
			
			<div style='width: 100%; margin-top:0em; margin-bottom:2em;text-align:center '>
				<img src="${path}/resources/image/logo1.png" style="widht:200px;height:200px;">
				<br><br>
				<table id="payT" >
					<tr>
						<td><h4>판매자 : ${detailList.get(0).MEMBERID}</h4></td>
						
					</tr>
					<tr>
						<td><h4>구매한 내역 : ${optionInfo.SELLOPTIONNO} ${optionInfo.SELLOPTIONCONTENT} </h4></td>
					</tr>
					<tr>
						<td><h4>기한 : ${optionInfo.SELLDEADLINE} </h4></td>
					</tr>
					<tr>	
						<td><h4>금액 : ${purchaseInfo.amount} 원</h4></td>
					</tr>
				</table>

			</div>
			<div>
				<h3 style="font-weight:600; font-family: Sunflower, sans-serif;" >결제가 완료되었습니다.</h3>
			</div>
			<div style='margin-top:2em; justify-content:center;'>
				<div>					
					<input type='button' onclick='payComplete();' class='btn btn-outline-info slidetopleft' value='메인으로 이동'/>					
				</div>
			</div>
		</div>
		<div class='col-md-1'></div>
	</div>
	<script>
	 function payComplete(){
		 location.href="${paht}/makeit";
	 }
	</script>
</body>
</html>