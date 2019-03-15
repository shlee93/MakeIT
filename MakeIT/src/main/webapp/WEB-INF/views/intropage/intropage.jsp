<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능 마켓</title>
<!-- jQuery library -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">

    <style>
    html,body{
        margin: 0;
        padding: 0;
        background-color: white;
        overflow: hidden;
    }
    #wrap{
        position: absolute;
        width: 100%;
        height: 100%;
        /* background-color: black; */
    }

    #header{
        position: relative;
        width: 100%;
        height: 10%;
        background-color: white;
        opacity: 0;
    }
    #video{
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0%;
        transform: translateY(0%);
        background-color: black;
    }
    #video img{
        width: 100%;
        height: 100%;
    }
    #whiteImg{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: white;
        opacity: 0;
    }
    #footer{
        position: absolute;
        width: 100%;
        height: 20%;
        top: 70%;
        transform: translateY(70%);
        background-color: white;
        opacity: 0;
    }
    #skip{
        position: absolute;
        left: 50%;
        top: 80%;
        transform: translate(-50%,-80%);
        color: white;
        font-size: 25px;
        display: none;
        opacity: 1;
    }
    #goMain{
    	position:absolute;
    	width: 0px;
    	height: 0px;
    	left: 50%;
    	top: 80%;
    	transform: translate(-50%,-80%);
    	background-color: cornflowerblue;
    	border-radius: 100%;
   		transition: ease-in-out;
        transition-duration: 0.7s;
    	opacity: 0;
    }
    #goMainText{
		position: absolute;
	   	width: max-content;
	    height: max-content;

 	    left: 50%;
 	    top: -45px;
	    transform: translateX(-50%); 
	    font-size: 60px;
	    font-family: 'Sunflower', sans-serif;
	    color: white;
	    cursor: pointer;
    }
    </style>

</head>
<body>

    <div id="wrap">
        <div id="video"> <img id="videoImg"/></div>
        <div id="whiteImg"></div>
        <div id="header"></div>
        <div id="footer"></div>
        
        <div id="goMain"><p id="goMainText">go!</p></div>

        <a id="skip" href="main"><u>SKIP intro</u></a>
    </div> 


    <script>
    $(function (){
      setTimeout(function(){

        $('#skip').css('display','block');
      },2000);
    })
        $(function (){
      setTimeout(function(){

        $('#skip').css('display','none');
      },5000);
    })

    $(function(){
        setTimeout(function(){
 
            $('#videoImg').attr('src','${path }/resources/introSource/video/Intro2GIF.gif');
        },1000);
    })

    $(function(){
        setTimeout(function(){
            $('#whiteImg').css('opacity','1');
        },5000);
    })
    
    $(function(){
    	setTimeout(function(){
    		$('#goMain').css('width','100px');
    		$('#goMain').css('height','100px');
    		$('#goMain').css('opacity','1');
    	},5000)
    })
    
    $('#goMain').click(function(){
    	console.log("gogo!");
    	location.href="${path}/index.jsp";
    });
    </script>

</body>
</html>