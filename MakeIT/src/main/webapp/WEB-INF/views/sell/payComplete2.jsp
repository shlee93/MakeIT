<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<%@ page import="java.util.*" %> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<style>
		.sero-center
		{
		    display:flex;
		    align-items:center;
		}
		
		.garo-center
		{
		    display:flex;
		    margin: auto;
		}
	
	</style>
</head>
<body>
	<div class='row'>
		<div class='col-md-1'></div>
		<div class='col-md-10' style='text-align:center'>
			<div style='width: 100%; margin-top:15em; margin-bottom:2em;'>
				<textarea rows='8' cols='61' style='background-color: lightgray;'>
					개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리
					개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리
					개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리개소리
				</textarea>
			</div>
			<div>
				<h3 style='font-weight:600'>결제가 완료되었습니다.</h3>
			</div>
			<div style='margin-top:2em; justify-content:center;'>
				<div>
					<input type='button' class='btn btn-primary' style='margin-right: 1.3em;' value='구매내역 확인'>
					<input type='button' onclick='payComplete();' class='btn btn-primary' value='메인으로 이동'/>
					<script>
						function payComplete()
		               	{
		               		
		               	}
					</script>
				</div>
			</div>
		</div>
		<div class='col-md-1'></div>
	</div>

</body>
</html>