<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   	
   <c:set var="path" value="${pageContext.request.contextPath}"/>
   <%@ page import="java.util.*" %> 
   
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<script src="js/jq.js"></script>
		<!---- for moving objects make this first always after boootstrap.css ----->
	
		<link rel="stylesheet" href="css/bootstrap.css">
		<!---- Bootstrap.min link local project skeleton ----->
	
		<link rel="stylesheet" href="css/w3.css">
		<!--- This is the local w3css extended --->
		
		<link rel="stylesheet" href="css/animate.css">
		
		<link rel="stylesheet" href="css/style.css">
		<!---- my own link local for customizing ----->
	
		<script src="js/bootstrap.min.js"></script>
		<!---- Bootstrap js link local for well and modal + panels ----->
		
		<link rel="icon" href="images/a.png" type="images/water.png" />
		<!---- Icon link local ----->
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<!-------    font awesome online plug --------------->
 		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
	body {
		background-image: url("../images/.jpg");
		background-color:white;
		background-attachment:scroll;
		background-repeat:no-repeat;
		background-position:center;
		background-size:cover;
		line-height:5px; 
	}
	.display-1 {text-align:center;color:#e1b7b7;}
	.display-1 .fa {animation:fa-spin 5s infinite linear;}
	.display-3 {text-align:center;color:#df726a;}
	.lower-case {text-align:center;}
	 
</style>
</head>
<body>	
	<div class="wrapper">
			<div class="container-fluid" id="top-container-fluid-nav">
				<div class="container">	
					<!---- for nav container ----->	
				</div>
			</div> 
			
					
			<div class="container-fluid" id="body-container-fluid">
				<div class="container">
					<!---- for body container ---->
						
						
						<div class="jumbotron">
						<!-- <img src="http://www.iei.or.kr/upload/teacher/bsyoo_teacher.jpg"> -->
						<img style='text-align:center' src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg">
						<h1 class="display-1"><i class="fa  fa-spin fa-cog fa-3x"></i></h1>
						<h1 class="display-3">ERROR</h1>
						<h1 style='color:red; text-align:center'><a href="${path}/">메인 페이지 이동</a></h1>
						<h1><%=exception.getMessage() %></h1>
						<p class="lower-case">Maybe the page is under maintenance</p>

						</div>
						
						 <!-------mother container middle class------------------->
				</div>
			</div>
				
						
 
			<div class="container-fluid" id="footer-container-fluid">
				<div class="container">
					<!---- for footer container ---->
 				</div>
			</div>
  			
				
			
		</div>
</body>
</html>