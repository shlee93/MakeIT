<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매 글 보기</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	    <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contestdetail/contestDetail.css" />
	 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
<style>
      /* div
      {
         border:1px solid red;
      } */
      
	header
	{
		margin-bottom:-150px;
	}
          
	html,body
	{
		height: 100%;
	}  
</style>
</head>



<script>
	
	
	var reviewList = new Array();
	<c:forEach items="${reviewList}" var="review">
		reviewList.push("${review.BUYREVIEWSTAR}");
	</c:forEach>
	console.log("${sessionScope.member.MEMBERID}");
	 $(document).on('click','#nav-profile-tab',function() {
		 var reviewTotal = 0;
			var reviewCnt = 0;
			var reviewAvg = 0;
		
			if(${reviewCnt != null})
			{
				reviewCnt = ${reviewCnt};
			}
			for(var i = 0; i < reviewCnt; i++)
			{
				reviewTotal += Number(reviewList[i]);
			}
			if(reviewCnt != 0)
			{
				reviewAvg = (reviewTotal / reviewCnt);	
			}
			
			console.log(reviewCnt);
			console.log(reviewAvg);
			var html = "<img id='rateStar' src='${path }/resources/image/star.png'>"
			+"<p id='reviewAvg'>" + reviewAvg.toFixed(2) + "</p>"
			+"<p id='reviewCnt'>" + reviewCnt + "명 참여</p>";
			$("#rate-div").html(html);
			reviewCnt = 0;
	 });
 
     $(document).on('click','.subImgs',function(){
       var imgIndex = $(this).parent('.subImg').prevAll().length;   
       console.log(imgIndex);
       /* console.log(('.subImg:eq('+0+') .subImgs').attr('src'));  */
       console.log($('.mainImg').attr('src'));
       var url1 = $(this).attr('src');
       var url2 = $('.mainImg').attr('src');
       $('.mainImg').attr('src',url1);
       $(this).attr('src',url2);
                             
	})
	
	function fn_reviewMod(reviewNo)
	{
    	 var starPop=open("${path}/buy/modReview.do?buyNo=${param.buyNo}&reviewNo="+reviewNo,"buyStarForm","top=200px, left=200px, width=400px, height=190px");
	}
     
     function fn_reviewDel(reviewNo, buyNo)
     {
    	 if(confirm("후기를 삭제하시겠습니까?"))
    	 location.href="${path}/buy/buyReviewDel.do?reviewNo="+reviewNo +"&buyNo="+buyNo;
    	 
     }
     
     $(document).ready(function()
	 {
		var scmove = $('#mainNavi').offset().top;
		$('html, body').animate( { scrollTop : scmove }, 400 );
		
	});
	
	/* $(window).scroll(function(){
        if($(this).scrollTop() < 140) 
        {
    		$('#donggeulNav').addClass("fixed");
    		$('#donggeulNav').removeClass("fixed-fixed")
        }
        if($(this).scrollTop() > 140) 
        {
    		$('#donggeulNav').addClass("fixed-fixed");
    		$('#donggeulNav').removeClass("fixed")
        }
	}); */
	
	$(window).scroll(function(){
	      if($(this).scrollTop() > 150)
	      {
	         var windowVal = $(this).scrollTop();
	         $('#donggeulNav').css('top',windowVal-300);
	      }
	      if($(this).scrollTop() < 150) 
	        {
	         var windowVal = $(this).scrollTop();
	         $('#donggeulNav').css('top','100px');
	        }      
	   })
	     
</script>
 
<body style="overflow-x:hidden">

<div class='container-fluid' id="total" >
    <div class='row'>
        <div class='col-md-1' id='nav'>
        	<div style='position:fixed;'>
				<span onclick='fn_back()' style='cursor:pointer; font-size: 4em;'><i class="fas fa-arrow-circle-left"></i></span>                           
				<script>
				function fn_back()
				{
				   history.back();
				}
				</script>
			</div>
        </div>
        <div class='col-md-10' id='section' style='padding:50px' >
       		
            <div class='row' style='padding:1px; width: 100%; '>
            	<div class="col-md-6" id="img-container">
            		<h4 style="font-family: 'Sunflower',sans-serif;">${detailList.BUYTITLE }</h4>
            		<div class='row mainImgContainer' id='mainImgContainer'>  	                	
	                   <img id="mainImg" class="mainImg" src="${path}/resources/upload/buy/${mainimgList.BUYIMGRE}" style="min-height:600px;max-height:400px;">
	               	</div>
                    <div class='row'>              
                      <c:forEach items="${subimgList}" var="subimgList">                          
                        <div class="col-md-3 subImg">
                            <img  class="subImgs" src="${path}/resources/upload/buy/${subimgList.BUYIMGRE}" style="cursor:pointer" >     
                        </div>
                      </c:forEach>                                             
                    </div>
                       
                    <div class='row'>
                        <nav id=tab-list>
                            <div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist" style="width:100%; font-size:1.1em;">
                                <a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>
                                <a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">취소 / 환불규정</a>
                            </div>
                        </nav>
                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" style="width:100%;">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style='width: 100%'>
                            	<pre style="font-weight:bold; white-space: pre-wrap;">${detailList.BUYCONTENT}</pre>
                              	<%-- <textarea class='contentTextArea' rows="34" readonly='readonly' style="border:0px">${detailList.BUYCONTENT}</textarea> --%>
                            </div>
                            
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                              
								<p style="text-align:center">취소 및 환불 규정취소 및 환불 규정</p>
								<p>가. 기본 환불 규정</p>                     
								<p>1. 전문가와 의뢰인의 상호 협의하에 청약 철회 및 환불이 가능합니다.</p> 
								<p>2. 작업이 완료된 이후 또는 자료, 프로그램 등 서비스가 제공된 이후에는 환불이 불가합니다.</p> 
								<p>( 소비자보호법 17조 2항의 5조. 용역 또는 「문화산업진흥 기본법」 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우에 해당)</p> 
								<br/>                            
								<p>나. 전문가 책임 사유</p> 
								<p>1. 전문가의 귀책사유로 당초 약정했던 서비스 미이행 혹은 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.</p> 
								<br/>
								<p>다. 의뢰인 책임 사유</p> 
								<p>1. 작업물 수령 후 단순 변심 및 불분명한 사유로 인한 경우 결제 금액은 환불이 불가합니다.</p> 
                            </div>
                        </div>
                    </div>                       
                        
                </div>
				<div id='donggeulNav' class="col-md-6" style="position:absolute; margin-left:60%;transition:ease-in-out; transition-duration:0.7s;">                   
                      <div class="row " style="text-align:center; margin-left:-5em;" >
                       <div class="col-md-10">
                        <c:if test="${detailList.GRADENAME == '브론즈' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/bronzeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '실버' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/silverGrade.png" style="max-width: 50px;max-height: 50px;"></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '골드' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/goldGrade.png" style="max-width: 50px;max-height: 50px;"></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '플래티넘' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/platinumGrade.png" style="max-width: 50px;max-height: 50px;"></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '다이아' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/diamodeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
                              </c:if>
                                 
                             <h4 style="display: inline; font-family: 'Sunflower', sans-serif; "><strong>${detailList.GRADENAME}</strong> ${detailList.MEMBERNAME}</h4>
                             
                                <!-- 똥글뱅이 -->
                                <div class="row align-items-center" style='margin-top: -5em;'>                           
                                 <div class="holderCircle">
                                    <div class="round"></div>
                                    
                                    <!-- 똥글뱅이 서클 시작 -->
										<div class="dotCircle">

											<!-- 첫번째 법륜 (수정)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and empty specList3 }">
											<span class="itemDot itemDot1" data-tab="1"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												<span class="forActive"></span>
												<div class="icon-title">
													<p>수정하기</p>
												</div>
											</span>
											</c:if> 
											<!-- 첫번째 법륜 끝 -->
											<!-- 두번째 법륜 (찜)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot itemDot1" data-tab="2"> 
												<!-- 작성자가 아니면 -->
												
													<i class="fas fa-kiss-wink-heart donggeulI"></i>
												 <span class="forActive"></span>
												 <div class="icon-title">
													<p>찜설정</p>
												</div>
											</span>
											</c:if>
											<!-- 두번째 법륜 끝 -->
											<!-- 세번째 법륜 (삭제하기)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and empty specList3}">
											<span class="itemDot itemDot1" data-tab="3"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-trash-alt donggeulI"></i>
												<span class="forActive"></span>
												<div class="icon-title">
													<p>삭제하기</p>
												</div>
											</span>
											</c:if> 
											<!-- 세번째 법륜 끝 -->
											<!-- 네번째 법륜 (쪽지)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot ${sessionScope.member.MEMBERID ne detailList.MEMBERID? !empty specList3?"active":volFlag==false?"":"active":"" } itemDot1" data-tab="4"> 
											<!-- 작성자가 아니면 -->
												
												<i class="fas fa-comments donggeulI"></i> 
												
												<span class="forActive"></span>
												<div class="icon-title">
													<p>쪽지하기</p>
												</div>
											</span>
											</c:if>
											<!-- 네번째 법륜 끝 -->
											<!-- 다섯번째 법륜 (지원자보기)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID }">
											<span class="itemDot ${sessionScope.member.MEMBERID ne detailList.MEMBERID?"":"active" } itemDot1" data-tab="5">
											 <!-- 작성자면 -->
												
													<i class="fas fa-briefcase donggeulI"></i>
												 <span class="forActive"></span>
												 <div class="icon-title">
													<p>지원자보기</p>
												</div>
											</span>
											</c:if>
											<!-- 다섯번째 법륜 끝 -->
											<!-- 여섯번째 법륜 (지원하기)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID and empty specList3 and volFlag == false}">
											<span class="itemDot ${sessionScope.member.MEMBERID ne detailList.MEMBERID?"active":"" } itemDot1" data-tab="6"> 
											<!-- 작성자가 아니면 --> 
												
													<i class="fas fa-briefcase donggeulI"></i>
												 <span class="forActive"></span>
												 <div class="icon-title">
													<p>지원하기</p>
												</div>
											</span>
											</c:if>
											<!-- 여섯번째 법륜 끝 -->
											<!-- 일곱번째 법륜 (환불요청)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and specList2.STATUSNO == 3}">
											<span class="itemDot itemDot1" data-tab="7"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-hand-holding-usd donggeulI"></i>
												
												<span class="forActive"></span>
												<div class="icon-title">
													<p>환불하기</p>
												</div>
											</span>
											</c:if>
											<!-- 일곱번째 법륜 끝 -->
											<!-- 여덟번째 법륜 (신고하기)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot itemDot1" data-tab="8"> 
												<!-- 작성자가 아니면 --> 
												
													<i class="fas fa-angry donggeulI"></i>
												 <span class="forActive"></span>
												 <div class="icon-title">
													<p>신고하기</p>
												</div>
											</span>
											</c:if>
											<!-- 여덟번째 법륜 끝 -->
											<!-- 아홉번째 법륜 (구매확정)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and specList2.STATUSNO == 3}">
											<span class="itemDot itemDot1" data-tab="9"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-file-signature donggeulI"></i>
												
												<span class="forActive"></span>
												<div class="icon-title">
													<p>구매확정</p>
												</div>
											</span>
											</c:if> 
											<!-- 아홉번째 법륜 끝 -->
											<!-- 열번째 법륜 (작업완료)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID and specList.STATUSNO == 2}">
											<span class="itemDot itemDot1" data-tab="10">
												<!-- 작성자가 아니면 -->
												
													<i class="fas fa-briefcase donggeulI"></i>
													
												<span class="forActive"></span>
												<div class="icon-title">
													<p>작업완료</p>
												</div>
											</span>
											</c:if> 
											<!-- 열번째 법륜 끝 -->


										</div>
										<!-- 똥글뱅이 서클 끝 -->
                                    
                                    <div class="contentCircle">
											<!-- 첫번째 법륜 기능 시작 (수정)-->
											<div class="CirItem title-box CirItem1">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="location.href='${path}/buy/buyModify.do?buyNo=${detailList.BUYNO }'">수정하기</button>
											</div>
											<!-- 두번째 법륜 기능 시작 (찜)-->
											<div class="CirItem title-box CirItem2">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<form id="buyOutBoxInFrm">
													<input type="hidden" name="buyNo" value="${detailList.BUYNO}">
												</form>
												<form id="buyOutBoxDelFrm">
													<input type="hidden" name="buyNo" value="${detailList.BUYNO}">
												</form>
												<c:if test="${empty outBoxYn and detailList.MEMBERID ne sessionScope.member.MEMBERID }">
													<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_outboxDo();">찜하기</button>
												</c:if>
												<c:if test="${!empty outBoxYn and detailList.MEMBERID ne sessionScope.member.MEMBERID }">
													<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_outboxNo();">찜풀기</button>
												</c:if>
											</div>
											<!-- 세번째 법륜 기능 시작 (삭제)-->
											<div class="CirItem title-box CirItem3">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_delete();">삭제하기</button>
											</div>
											<!-- 네번째 법륜 기능 시작 (쪽지)-->
											<div class="CirItem title-box ${sessionScope.member.MEMBERID ne detailList.MEMBERID? !empty specList3?"active":volFlag==false?"":"active":"" } CirItem4">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick='fn_message()'>쪽지보내기</button>
											</div>
											<!-- 다섯번째 법륜 기능 시작 (지원자보기)-->
											<div class="CirItem title-box ${sessionScope.member.MEMBERID ne detailList.MEMBERID?"":"active" } CirItem5">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button onclick='location.href="${path}/buy/volList.do?buyNo=${detailList.BUYNO }&specFlag=${empty specList3?"false":"true" }"' class='btn btn-outline-info slidetopleft donggeulInnerBtn'>지원자보기</button>
											</div>
											<!-- 여섯번째 법륜 기능 시작 (지원하기)-->
											<div class="CirItem title-box ${sessionScope.member.MEMBERID ne detailList.MEMBERID and empty specList3 and volFlag == false? "active":"" } CirItem6">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button onclick='fn_buyVol()' class="btn btn-outline-info slidetopleft donggeulInnerBtn">지원하기</button>
												
											</div>
											<!-- 일곱번째 법륜 기능 시작 (환불요청)-->
											<div class="CirItem title-box CirItem7">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_refundPop()">환불하기</button>
											</div>
											<!-- 여덟번째 법륜 기능 시작 (신고하기)-->
											<div class="CirItem title-box CirItem8">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_reportPop();">신고하기</button>
											</div>
											<!-- 아홉번째 법륜 기능 시작 (구매확정)-->
											<div class="CirItem title-box CirItem9">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_buyCommit()">구매확정</button>
											</div>
											<!-- 열번째 법륜 기능 시작 (작업완료)-->
											<div class="CirItem title-box CirItem10">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center "
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-outline-info slidetopleft donggeulInnerBtn" onclick="fn_finishWork()">작업완료</button> 
											</div>
											
											
										</div>
                                 </div>                           
                              </div>                        
                                 <!-- 동글뱅이 끝-->   
                        
                              <!-- 동글뱅이 스크립트 -->
				               	<script>			        
				               	var reportCount = ${empty sessionScope.member?0:sessionScope.member.REPORTCOUNT};
						        	let i=2;						
								
									$(document).ready(function()
									{
										if(reportCount == 5)
										{
											alert("신고누적으로 서비스가 제한된 회원입니다. 관리자에게 문의해주세요.");
							      			location.href="${path}/support/supportView.do";
										}
										if(${!empty specList3})
										{ 
											console.log("여까진 들어오겠지");
											if(${sessionScope.member.MEMBERID ne detailList.MEMBERID and sessionScope.member.MEMBERID ne specList3.MEMBERID })
											{
												alert("이 구매 게시글은 현재 거래중입니다. 구매 게시판으로 이동합니다.")
												location.href="${path}/buy/buymain.do";
											}
										}
										
										var radius = 200;
										var fields = $('.itemDot');
										var container = $('.dotCircle');
										var width = container.width();
								 		radius = width/2.5;
								 
									    var height = container.height();
										var angle = 0, step = (2*Math.PI) / fields.length;
										
										fields.each(function() 
										{
											var x = Math.round(width/2 + radius * Math.cos(angle) - $(this).width()/2);
											var y = Math.round(height/2 + radius * Math.sin(angle) - $(this).height()/2);									
										
											$(this).css(
											{
												left: x + 'px',
												top: y + 'px'
											});
											angle += step;
										});
									
									
										$('.itemDot').click(function()
										{									
											var dataTab= $(this).data("tab");
											$('.itemDot').removeClass('active');
											$(this).addClass('active');
											$('.CirItem').removeClass('active');
											$( '.CirItem'+ dataTab).addClass('active');
											i=dataTab;
										
											$('.dotCircle').css(
											{
												"transform":"rotate("+(360-(i-1)*36)+"deg)",
												"transition":"2s"
											});
											
											$('.itemDot').css(
											{
												"transform":"rotate("+((i-1)*36)+"deg)",
												"transition":"1s"
											});									
										});								
									});	
									/* 지원하기 */
									function fn_buyVol()
									{
										
										if(${sessionScope.member.MEMBERID!=null}){
											
											location.href="${path}/buy/buyVol.do?buyNo=${detailList.BUYNO}"
					                   		
				                    	}
				                    	else{
				                    		alert('로그인 후 이용해 주세요 ');
					                        location.href="${path}/member/memberLogin.do";
				                    	}
									}
									/* 삭제 */
				                	function fn_delete()
				                	{
				                		if(confirm("게시글을 삭제하시겠습니까?"))
				                		{
				                			location.href="${path}/buy/buyDelete.do?buyNo=${detailList.BUYNO }";
				                			
				                		}
				                	}
									/* 찜하기 */
				                    function fn_outboxDo(){
				                    	if(${sessionScope.member.MEMBERID!=null}){
				                    		$('#buyOutBoxInFrm').attr('action',"${path}/buy/buyOutBox.do");
					                   		$('#buyOutBoxInFrm').submit();
				                    	}
				                    	else{
				                    		alert('로그인 후 이용해 주세요 ');
					                        location.href="${path}/member/memberLogin.do";
				                    	}
				                	
				               		}
				             		/* 찜풀기 */
				                	function fn_outboxNo(){
				                   		$('#buyOutBoxDelFrm').attr('action',"${path}/buy/buyOutBoxDel.do");
				                   		$('#buyOutBoxDelFrm').submit();
				               		}
				                	/* 환불신청 */
				                    function fn_refundPop(){
				                       if(${sessionScope.member.MEMBERID!=null}){
				                          var name="환불신청";         
				                          window.open('${path}/buy/buyRefundView.do?sellerId=${specList2.MEMBERID}&&buyNo=${detailList.BUYNO}&&specNo=${specList2.BUYSPECNO}',name,'width=490, height=300, menubar=no, status=no, toolbar=no');
				                       }else{
				                          alert('로그인 후 이용해 주세요 ');
				                          location.href="${path}/member/memberLogin.do";
				                       };         
				                    }
				                	/* 구매확정 */
				                	function fn_buyCommit()
				                	{
				                		if(confirm("구매 확정하시겠습니까? 확정한 이후에는 환불이 불가합니다."))
				                		{
				                			location.href="${path}/buy/buyCommit.do?buyNo=${detailList.BUYNO }&specNo=${specList2.BUYSPECNO }";
				                			
				                		}
				                	}
				                	/* 신고하기 */
				                	function fn_reportPop(){
				                        if(${sessionScope.member.MEMBERID!=null}){
				                           var name="구매글 신고";         
				                           window.open("${path}/buy/buyReport?buyWriter=${detailList.MEMBERID}&&buyNo=${detailList.BUYNO}",name,'width=490, height=300, toolbar=no, menubar=no, status=no');
				                        }else{
				                           alert('로그인 후 이용해 주세요 ');
				                           location.href="${path}/member/memberLogin.do";
				                        };        
				                        
				                   	}   
				                	/* 쪽지보내기 */
				                	function fn_message()
				      				{
				      					
				      					if(${sessionScope.member.MEMBERID!=null})
			      						{
				      						var sendId="${sessionScope.member.MEMBERID}";
					      					var receiveId="${detailList.MEMBERID}";
				                    		var popup=open("${path}/message/messagePop.do?sendId="+sendId+"&receiveId="+receiveId,"contestMsgSendPop","left=250px, top=200px, width=450px, height=350px");									                    	
						      				
			      						}
				      					else
			      						{
				      						alert("로그인해주세요");
				      						location.href="${path}/member/memberLogin.do";
			      						}
				      				} 
				                	
				                	function fn_finishWork()
				                	{
				                		if(confirm("작업 완료 처리하시겠습니까?"))
				                		{
				                			location.href="${path}/buy/finishWork.do?buyNo=${detailList.BUYNO }&sellerId=${sessionScope.member.MEMBERID }";
				                			
				                		}
				                	}
								</script>                        	
	                       		<!-- 동글뱅이 스크립트 끝 -->                            
                            
                                
                              
                             <div class='row' style='margin-top: -4em;'>
                              <div class='col-md-1'></div>
                              
                              <!-- 작성자 소개 -->     
                                <div class='col-md-10'>
                                   <textarea class='form-control' rows='6'style='width:100%; height: 100%; margin-top:30px;'readonly>${detailList.INTRODUCTION}</textarea>
                                </div>
                                <!-- 작성자 소개 끝 -->
                                
                                <div class='col-md-1'></div>                                
                            </div>                             
                         </div>                       
                   </div>                      
              </div>
		</div>
	</div>   
	<div class='col-md-1' id='right-nav' >
		<c:if test="${sessionScope.member.MEMBERLEVEL == 0 and detailList.BUYCHECKYN=='N'}">
			<div style='position:fixed;'>
				<span id='approval-btn' style='cursor:pointer; font-size: 4em;'><i class="fas fa-check-circle"></i></span>                    
			</div>
		</c:if>
	</div>                   
</div>
</div>

	<script>
		//관리자 게시물 승인 이벤트
		$(document).on('click','#approval-btn',function(){
			var buyNo=${detailList.BUYNO};
			var approvalStatus=$(opener.document).find('#approval-status').val();
			var approvalSearch=$(opener.document).find('#approval-search-inp').val();
			var approvalOption=$(opener.document).find('#approval-select option:selected').val();
			var $approval_tbl=$(opener.document).find('.approval-tbl');
			$.ajax({
				url:"${path}/admin/buyApprovalCheck.do",
				data:{
					"buyNo":buyNo,
					"approvalStatus":approvalStatus,
					"approvalSearch":approvalSearch,
					"approvalOption":approvalOption
					
				},
				dataType:"html",
				success:function(data){
					alert("승인 되었습니다!");
					$approval_tbl.html(data);
					self.close();
				}
			})
		})
	</script>   
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>