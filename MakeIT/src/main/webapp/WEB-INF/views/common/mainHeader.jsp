<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>재능 마켓</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- 아이콘 CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<!-- Member CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />

<link rel="stylesheet" type="text/css" href="${path }/resources/css/mainpage/mainStyle.css"/>

</head>
<body>
<header>
       <div id="mainVideo"><img src="/"></div>
    <div id="topWrap">
        <div id="logoIcon"><p>LOGO</p></div>
        <div id="loginWrap">
            <a href="${path }/member/memberLogin.do" id="login">Login |</a>
            <a href="${path }/member/memberEnrollck.do" id="join"> Join us</a>
        </div>
    </div>
    <div id="serviceWrap">
        <div id="tradeService"><p>거래 서비스 | </p><p id="tradeNum"></p><p id="tradeUnit">만건+</p></div>
        <div id="enrollService"><p>등록 서비스 | </p><p id="enrollNum"></p><p id="enrollUnit">만건+</p></div>
    </div>

    <div id="mainWrite">
        <p id="write1">국내 최대 IT스토어</p>
        <p id="write2">재능 마켓</p>
    </div>

    <nav id="mainNavi">
        <div id="iconWrap">
            <div id="icon1"></div>
            <div id="icon2"></div>
            <div id="icon3"></div>
            <div id="icon4"></div>
            <div id="icon5"></div>
        </div>
    </nav>
    
      <script>
        $(document).ready(function(){

            // $.ajax{

            // }

            var tradeData = '232325';
            var tradeData2;

            var enrollData ='123363';
            var enrollData2;

            if(tradeData.length == 1){
                $('#tradeUnit').html('건+');
                tradeData2 = 0+""+tradeData;
            }

            if(tradeData.length == 2){
                $('#tradeUnit').html('건+');
                tradeData2 = tradeData;
            }
            if(tradeData.length == 3){
                $('#tradeUnit').html('백건+');
                tradeData2 = 0+""+tradeData.substr(0,1);
            }
            if(tradeData.length == 4){
                $('#tradeUnit').html('천건+');
                tradeData2 = 0+""+tradeData.substr(0,1);
            }
            if(tradeData.length == 5){
                $('#tradeUnit').html('만건+');
                tradeData2 = 0+""+tradeData.substr(0,1);
            }
            if(tradeData.length == 6){
                $('#tradeUnit').html('만건+');
                tradeData2 = tradeData.substr(0,2);
            }



            if(enrollData.length == 1){
                $('#enrollUnit').html('건+');
                enrollData2 = 0+""+enrollData;
            }

            if(enrollData.length == 2){
                $('#enrollUnit').html('건+');
                enrollData2 = enrollData;
            }
            if(enrollData.length == 3){
                $('#enrollUnit').html('백건+');
                enrollData2 = 0+""+enrollData.substr(0,1);
            }
            if(enrollData.length == 4){
                $('#enrollUnit').html('천건+');
                enrollData2 = 0+""+enrollData.substr(0,1);
            }
            if(enrollData.length == 5){
                $('#enrollUnit').html('만건+');
                enrollData2 = 0+""+enrollData.substr(0,1);
            }
            if(enrollData.length == 6){
                $('#enrollUnit').html('만건+');
                enrollData2 = enrollData.substr(0,2);
            }

            
            
            var intervalCheck =0;
            var interval1 = setInterval(function(){
                var random1 = Math.floor(Math.random()*9)+1;
                var random2 = Math.floor(Math.random()*9)+1;
                var random3 = Math.floor(Math.random()*9)+1;
                var random4 = Math.floor(Math.random()*9)+1;
                var random5 = Math.floor(Math.random()*9)+1;
                var random6 = Math.floor(Math.random()*9)+1;
                $('#tradeNum').html(random1+""+random2+""+random3+""+random4+""+random5);

                intervalCheck ++;         
                if(intervalCheck == 100){
                    clearInterval(interval1);
                } 
                      
            },1);
            var intervalCheck1 =0;
            var interval2 = setInterval(function(){
                if(intervalCheck == 100){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;
                    var random3 = Math.floor(Math.random()*9)+1;
                    var random4 = Math.floor(Math.random()*9)+1;
                    var random5 = Math.floor(Math.random()*9)+1;
                    $('#tradeNum').html(random1+""+random2+""+random3+""+random4);

                    intervalCheck1 ++;         
                    if(intervalCheck1 == 15){
                        clearInterval(interval2);
                    }
                }         
            },50);

            var intervalCheck2 =0;
            var interval3 = setInterval(function(){
                if(intervalCheck1 == 15){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;
                    var random3 = Math.floor(Math.random()*9)+1;
                    var random4 = Math.floor(Math.random()*9)+1;
                    var random5 = Math.floor(Math.random()*9)+1;
                    $('#tradeNum').html(random1+""+random2+""+random3);

                    intervalCheck2 ++;         
                    if(intervalCheck2 == 10){
                        clearInterval(interval3);
                    }
                }         
            },100);

            var intervalCheck3 =0;
            var interval4 = setInterval(function(){
                if(intervalCheck2 == 10){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;

                    $('#tradeNum').html(random1+""+random2);

                    intervalCheck3 ++;         
                    if(intervalCheck3 == 10){
                        clearInterval(interval4);
                    }
                }         
            },100);

            var intervalCheck4 =0;
            var interval5 = setInterval(function(){
                if(intervalCheck3 == 10){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;

                    $('#tradeNum').html(random1+""+random2);

                    intervalCheck4++;
                    if(intervalCheck4 == 3){
                        $('#tradeNum').html(tradeData2);

                        clearInterval(interval5);
                    }
                }         
            },200);




            var intervalCheck5 =0;
            var interval6 = setInterval(function(){
                var random1 = Math.floor(Math.random()*9)+1;
                var random2 = Math.floor(Math.random()*9)+1;
                var random3 = Math.floor(Math.random()*9)+1;
                var random4 = Math.floor(Math.random()*9)+1;
                var random5 = Math.floor(Math.random()*9)+1;
                var random6 = Math.floor(Math.random()*9)+1;
                $('#enrollNum').html(random1+""+random2+""+random3+""+random4+""+random5);
 
                intervalCheck5++;         
                if(intervalCheck5 == 100){
                    clearInterval(interval6);
                } 
                      
            },10);
            var intervalCheck6 =0;
            var interval7 = setInterval(function(){
                if(intervalCheck5 == 100){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;
                    var random3 = Math.floor(Math.random()*9)+1;
                    var random4 = Math.floor(Math.random()*9)+1;
                    var random5 = Math.floor(Math.random()*9)+1;
                    $('#enrollNum').html(random1+""+random2+""+random3+""+random4);

                    intervalCheck6++;         
                    if(intervalCheck6 == 15){
                        clearInterval(interval7);
                    }
                }         
            },80);

            var intervalCheck7 =0;
            var interval8 = setInterval(function(){
                if(intervalCheck6 == 15){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;
                    var random3 = Math.floor(Math.random()*9)+1;
                    var random4 = Math.floor(Math.random()*9)+1;
                    var random5 = Math.floor(Math.random()*9)+1;
                    $('#enrollNum').html(random1+""+random2+""+random3);

                    intervalCheck7++;         
                    if(intervalCheck7 == 10){
                        clearInterval(interval8);
                    }
                }         
            },120);

            var intervalCheck8 =0;
            var interval9 = setInterval(function(){
                if(intervalCheck7 == 10){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;

                    $('#enrollNum').html(random1+""+random2);

                    intervalCheck8++;         
                    if(intervalCheck8 == 10){
                        clearInterval(interval9);
                    }
                }         
            },160);

            var intervalCheck9 =0;
            var interval10 = setInterval(function(){
                if(intervalCheck8 == 10){
                    var random1 = Math.floor(Math.random()*9)+1;
                    var random2 = Math.floor(Math.random()*9)+1;

                    $('#enrollNum').html(random1+""+random2);

                    intervalCheck9++;
                    if(intervalCheck9 == 1){
                        $('#enrollNum').html(enrollData2);

                        clearInterval(interval10);
                    }
                }         
            },200);
        });
        </script>
</header>
