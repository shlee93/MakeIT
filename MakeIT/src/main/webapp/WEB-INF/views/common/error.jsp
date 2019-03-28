<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   	
   <c:set var="path" value="${pageContext.request.contextPath}"/>
   <%@ page import="java.util.*" %> 
   
   
	
<!DOCTYPE html>
<html>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<!---- Icon link local ----->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<!-------    font awesome online plug --------------->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
	#logo{
    max-width: 40%;
    max-height: 30%;
    width: auto;
    height: auto;
	}
	#error-back{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    text-align: center;
	    
	}
	.error-container{
		margin-top:1%;
	    height:50%;
	    background-color: rgba(0,130,153,0.2);
	
	}
	.triangle-border {
		font-family: 'Sunflower', sans-serif;
	  	width: 50%;
	  	margin-left: 45%;
	  	margin-top:1%;
		position:relative;
		font-size:40px;
		padding:30px;
		/* margin:1em 0 3em; */
		/* border:1px solid gray; */
		color:#333;
		background:#fff;
		/* css3 */
		-webkit-border-radius:100px;
		-moz-border-radius:100px;
		border-radius:100px;
	}
	
	/* Variant : for left positioned triangle
	------------------------------------------ */
	
	.triangle-border.left {
	  	margin-left:30px;
	}
	
	/* Variant : for right positioned triangle
	------------------------------------------ */
	
	.triangle-border.right {
	  	margin-right:30px;
	}
	
	/* THE TRIANGLE
	------------------------------------------------------------------------------------------------------------------------------- */
	
	.triangle-border:before {
		content:"";
		position:absolute;
		bottom:-20px; /* value = - border-top-width - border-bottom-width */
		left:40px; /* controls horizontal position */
		border-width:1px 1px 0;
		border-style:solid;
		border-color:#fff transparent;
		/* reduce the damage in FF3.0 */
		display:block;
		width:0;
	}
	
	/* creates the smaller  triangle */
	.triangle-border:after {
		content:"";
		position:absolute;
		bottom:-13px; /* value = - border-top-width - border-bottom-width */
		left:47px; /* value = (:before left) + (:before border-left) - (:after border-left) */
		border-width:13px 13px 0;
		border-style:solid;
		border-color:#fff transparent;
		/* reduce the damage in FF3.0 */
		display:block;
		width:0;
	}
	.back-btn{
		width:30%;
		padding:1%;
		font-size:30px;
	}
	 
</style>
</head>
<body>	
	<div id="error-back" class="col-md-12">
		<div class="col-md-1"></div>
        <div class="error-container col-md-10">
        	<p class="triangle-border">시스템에 오류가...죄송해요</p>
            <img id="logo" src="${path }/resources/image/logo3.png"/>
            <h1></h1>
            <button class="btn btn-outline-info slidetopleft back-btn" onclick="back();">뒤로 가기</button>
        </div>
        <div class="col-md-1"></div>
    </div>
    
    <script>
     function back(){
    	 window.history.back();
     }
    </script>
</body>
</html>