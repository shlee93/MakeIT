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

<link rel="stylesheet" type="text/css" href="${path }/resources/css/mainpage/mainStyle.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">

</head>
<body>
<header>
     <div id="mainVideo"></div>
     <div id="illusWrap1">
        <img id="alien1" src="${path }/resources/image/alien1.png">;
        <img id="bubble1" src="${path }/resources/image/bubble1.png">;
        <img id="alien2" src="${path }/resources/image/alien2.png">;
        <img id="bubble2" src="${path }/resources/image/bubble2.png">;
        <img id="alien3" src="${path }/resources/image/alien3.png">; 
        <img id="bubble3" src="${path }/resources/image/bubble1.png">; 
        <img id="dog" src="${path }/resources/image/dog.png">;

        <img id="planet1" src="${path }/resources/image/planet1.png">;
        <img id="planet2" src="${path }/resources/image/planet2.png">;
        <img id="planet3" src="${path }/resources/image/planet1.png">;
        <img id="planet4" src="${path }/resources/image/planet2.png">;
        <img id="blackhole" src="${path }/resources/image/blackhole.png">;
        <img id="planet5" src="${path }/resources/image/planet1.png">;
        <img id="planet6" src="${path }/resources/image/planet1.png">;
        <img id="planet7" src="${path }/resources/image/planet2.png">;

        <img id="ship" src="${path }/resources/image/ship.png">;
        <img id="star1" src="${path }/resources/image/dropstar.png">;
        <img id="star2" src="${path }/resources/image/dropstar.png">;
        <img id="star3" src="${path }/resources/image/dropstar.png">;
        <img id="star4" src="${path }/resources/image/dropstar.png">;
        <img id="star5" src="${path }/resources/image/dropstar.png">;
        <img id="star6" src="${path }/resources/image/dropstar.png">;
        <img id="star7" src="${path }/resources/image/dropstar.png">;
        <img id="star8" src="${path }/resources/image/dropstar.png">;

        <img id="starfire1" src="${path }/resources/image/starfire.png">;
        <img id="starfire2" src="${path }/resources/image/starfire.png">;
        <img id="starfire3" src="${path }/resources/image/starfire.png">;
        <img id="starfire4" src="${path }/resources/image/starfire.png">;
    </div>
    
    <div id="topWrap">
        <div id="logoIcon"><img src="${path }/resources/image/logo1main.png"/></div>
        <%if(session.getAttribute("member") == null){%>
        <div id="loginWrap">

            	<a href="${path }/member/memberLogin.do" id="login">Login |</a>
            	<a href="${path }/member/memberEnrollck.do" id="join"> Join us :) </a>
        </div>
        <%}else{%>
        <div id="loginWrap">
            <a href="${path }/member/memberMyPage.do" id="login">Mypage |</a>
            <a href="${path }/member/memberLogout.do" id="join"> Logout :(</a>
        </div>
        <%} %>

    </div>
    <div id="serviceWrap">
        <div id="tradeService"><p>거래 서비스 | </p><p id="tradeNum"></p><p id="tradeUnit">만건+</p></div>
        <div id="enrollService"><p>등록 서비스 | </p><p id="enrollNum"></p><p id="enrollUnit">만건+</p></div>
    </div>

    <div id="mainWrite">
        <p id="write1">국내 최대 IT스토어</p>
        <p id="write2">MAKE&nbsp;&nbsp;IT</p>
    </div>

    <c:if test="${sessionScope.member.MEMBERLEVEL != 0}">
        <nav id="mainNavi">
	        <div id="iconWrap">
	            <div id="icon1">
	            	<img src="${path }/resources/mainSource/image/sell.png"/>
	            	<p>판매하기</p>
	            </div>
	            <div id="icon2">
	            	<img src="${path }/resources/mainSource/image/buy.png"/>
	            	<p>구매하기</p>
	            </div>
	            <div id="icon3">
	            	<img src="${path }/resources/mainSource/image/contest.png"/>
	            	<p>콘테스트</p>
	            </div>
	            <div id="icon4">
	            	<img src="${path }/resources/mainSource/image/board.png"/>
	            	<p>게시판</p>
	            </div>
	            <div id="icon5">
	            	<img src="${path }/resources/mainSource/image/qna.png"/>
	            	<p>QNA</p>
	            </div>
	        </div>
    	</nav>
    </c:if>
    
    <c:if test="${sessionScope.member.MEMBERLEVEL == 0}">
        <nav id="mainNavi">
	        <div id="iconWrap">
	            <div id="icon1">
	            	<img src="${path }/resources/mainSource/image/sell.png"/>
	            	<p>판매하기</p>
	            </div>
	            <div id="icon2">
	            	<img src="${path }/resources/mainSource/image/buy.png"/>
	            	<p>구매하기</p>
	            </div>
	            <div id="icon3">
	            	<img src="${path }/resources/mainSource/image/contest.png"/>
	            	<p>콘테스트</p>
	            </div>
	            <div id="icon4">
	            	<img src="${path }/resources/mainSource/image/board.png"/>
	            	<p>게시판</p>
	            </div>
	            <div id="icon5">
	            	<img src="${path }/resources/mainSource/image/qna.png"/>
	            	<p>QNA</p>
	            </div>
	            <div id="icon6">
	            	<img src="${path }/resources/mainSource/image/manager.png"/>
	            	<p>관리자</p>
	            </div>
	        </div>
    	</nav>
    </c:if>
    
    	<%
    		Cookie[] cookies = request.getCookies();
    		boolean cCheck = false;
			if(cookies != null) {
				for(int i=0; i<cookies.length; i++) {
					Cookie c = cookies[i];
					String cName = c.getName();
					System.out.println("쿠키 이름 ~~ : "+cName);
					
					if(cName == "intro"){
						cCheck = true;
					}
				}
				
				if(cCheck == true){
			    	%>
			    	<script>location.href="${path }/intropage/intropage.do";</script>
			    	<%
				}
				
			}
			else{
		    	%>
		    	<script>location.href="${path }/intropage/intropage.do";</script>
		    	<%
			}
    	%>
<%--     <%
	    Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		boolean cCheck = false;
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie c = cookies[i];
				String cName = c.getName();
				System.out.println("쿠키 이름 ~~ : "+cName);
				if(cName == "intro") {
					cCheck = true;
	
				}
			}
			
			if(cCheck == false) {
				System.out.println("펄스~~ 실행~~~~~~~~~");
				
				Cookie cookie = new Cookie("intro", "intro");
		    	cookie.setMaxAge(60*60);
		    	response.addCookie(cookie);
		    	%>
		    	<script>location.href="${path }/intropage/intropage.do";</script>
		    	<%
			}
			else {
				System.out.println("트루 실행~~~~~~~~~");
			}
		}
		else{
			System.out.println("널값 뜸~~~~~~~~~~~~~~~~~~~~~~");
			Cookie cookie = new Cookie("intro", "intro");
	    	cookie.setMaxAge(60*60);
	    	response.addCookie(cookie);
	    	%>
	    	<script>location.href="${path }/intropage/intropage.do";</script>
	    	<%
		}
    %> --%>

    
      <script>
      	var reportCount = ${empty sessionScope.member?0:sessionScope.member.REPORTCOUNT};
      	$(function(){
      		setTimeout(function(){
          		$('#bubble1').css({'width':'75px','height':'auto'});
          		$('#bubble2').css({'width':'50px','height':'auto'});
          		$('#bubble3').css({'width':'50px','height':'auto'});
			}, 1000);
      	})
      
      	$('#icon1').mouseenter(function(){
			$('#icon1 p').css('color','#138496');
			$('#icon1 p').css('top','-22px');
			$('#icon1 p').css('transform','scale(1.5)');
			$('#icon1 img').css('transform','scale(1.5)');
 			$('#icon1 img').css('top','-35px'); 
      	})
      	$('#icon1').mouseleave(function(){
			$('#icon1 p').css('color','black');
			$('#icon1 p').css('top','0px');
			$('#icon1 p').css('transform','scale(1)');
			$('#icon1 img').css('transform','scale(1)');
 			$('#icon1 img').css('top','0px'); 
      	})
      	
      	$('#icon2').mouseenter(function(){
			$('#icon2 p').css('color','#138496');
			$('#icon2 p').css('top','-22px');
			$('#icon2 p').css('transform','scale(1.5)');
			$('#icon2 img').css('transform','scale(1.5)');
			$('#icon2 img').css('top','-35px')
      	})
      	$('#icon2').mouseleave(function(){
			$('#icon2 p').css('color','black');
			$('#icon2 p').css('top','0px');
			$('#icon2 p').css('transform','scale(1)');
			$('#icon2 img').css('transform','scale(1)');
			$('#icon2 img').css('top','0px');
      	})
      	      	
      	$('#icon3').mouseenter(function(){
			$('#icon3 p').css('color','#138496');
			$('#icon3 p').css('top','-22px');
			$('#icon3 p').css('transform','scale(1.5)');
			$('#icon3 img').css('transform','scale(1.5)');
			$('#icon3 img').css('top','-35px')
      	})
      	$('#icon3').mouseleave(function(){
			$('#icon3 p').css('color','black');
			$('#icon3 p').css('top','0px');
			$('#icon3 p').css('transform','scale(1)');
			$('#icon3 img').css('transform','scale(1)');
			$('#icon3 img').css('top','0px');
      	})
      	      	
      	$('#icon4').mouseenter(function(){
			$('#icon4 p').css('color','#138496');
			$('#icon4 p').css('top','-22px');
			$('#icon4 p').css('transform','scale(1.5)');
			$('#icon4 img').css('transform','scale(1.5)');
			$('#icon4 img').css('top','-35px')
      	})
      	$('#icon4').mouseleave(function(){
			$('#icon4 p').css('color','black');
			$('#icon4 p').css('top','0px');
			$('#icon4 p').css('transform','scale(1)');
			$('#icon4 img').css('transform','scale(1)');
			$('#icon4 img').css('top','0px');
      	})
      	      	
      	$('#icon5').mouseenter(function(){
			$('#icon5 p').css('color','#138496');
			$('#icon5 p').css('top','-22px');
			$('#icon5 p').css('transform','scale(1.5)');
			$('#icon5 img').css('transform','scale(1.5)');
			$('#icon5 img').css('top','-35px')
      	})
      	$('#icon5').mouseleave(function(){
			$('#icon5 p').css('color','black');
			$('#icon5 p').css('top','0px');
			$('#icon5 p').css('transform','scale(1)');
			$('#icon5 img').css('transform','scale(1)');
			$('#icon5 img').css('top','0px');
      	})
      	
      	$('#icon6').mouseenter(function(){
			$('#icon6 p').css('color','#138496');
			$('#icon6 p').css('top','-22px');
			$('#icon6 p').css('transform','scale(1.5)');
			$('#icon6 img').css('transform','scale(1.5)');
			$('#icon6 img').css('top','-35px')
      	})
      	$('#icon6').mouseleave(function(){
			$('#icon6 p').css('color','black');
			$('#icon6 p').css('top','0px');
			$('#icon6 p').css('transform','scale(1)');
			$('#icon6 img').css('transform','scale(1)');
			$('#icon6 img').css('top','0px');
      	})
      	
      	$('#icon1').click(function(){
      		
      		if(reportCount == 5)
      		{
      			alert("신고누적으로 서비스가 제한된 회원입니다. 관리자에게 문의해주세요.");
                location.href="${path}/support/supportView.do";
      		}
      		else
      		{
      			location.href="${path}/sell/sellmain.do";
      		}
                  		
      	})
      	$('#icon2').click(function(){
      		if(reportCount == 5)
      		{
      			alert("신고누적으로 서비스가 제한된 회원입니다. 관리자에게 문의해주세요.");
                location.href="${path}";
      		}
      		else
      		{
      			location.href="${path}/buy/buymain.do";
      		}
            
         
      	})
      	$('#icon3').click(function(){
      		if(reportCount == 5)
      		{
      			alert("신고누적으로 서비스가 제한된 회원입니다. 관리자에게 문의해주세요.");
                location.href="${path}/support/supportView.do";
      		}
      		else
      		{
      			location.href="${path}/contest/contestMain.do";
      		}
      	
      	})
      	$('#icon4').click(function(){
      		if(reportCount == 5)
      		{
      			alert("신고누적으로 서비스가 제한된 회원입니다. 관리자에게 문의해주세요.");
                location.href="${path}/support/supportView.do";
      		}
      		else
      		{
      			location.href="${path}/board.jsp";
      		}
      	
      	})
      	$('#icon5').click(function(){
      		location.href="${path}/support/supportView.do";
      	})
      	$('#icon6').click(function(){
      		location.href="${path }/admin/adminView.do";
      	})
        $(document).ready(function(){
        	

            $.ajax({
				url:"${path}/member/mainajax.do",
				/* dataType:'JSON', */
				success: function(data){
					
		            var tradeData = data.trade;
		            var tradeData2;

		        	var enrollData = data.service;
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
				},
				error: function(){
					console.log("통신 실패");
				}
            });
             
        });
        </script>
</header>
