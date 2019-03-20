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
   
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/buydetail/buydetail.css" />
	 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
      
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
	     
</script>
 
<body>

<div class='container-fluid' id="total">
    <div class='row'>
        <div class='col-md-1' id='nav'></div>
        <div class='col-md-10' id='section' >
            <div class='row'>
                <div class="col-md-7" id="img-container">                	
                    <img id="mainImg" class="mainImg" src="${path}/resources/upload/buy/${mainimgList.BUYIMGRE}" style="min-height:600px;max-height:400px;">
                    
                    <div class='row'>              
                      <c:forEach items="${subimgList}" var="subimgList">                          
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src="${path}/resources/upload/buy/${subimgList.BUYIMGRE}" style="cursor:pointer" >     
                        </div>
                      </c:forEach>                                             
                    </div>
                       
                    <div class='row'>
                        <nav id=tab-list>
                            <div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>
                                <a class="nav-item nav-link detail" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">후기</a>
                                <a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">취소 / 환불규정</a>
                            </div>
                        </nav>
                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style='min-width: 656px'>
                              
                               <h4>${detailList.BUYCONTENT}</h4>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            	<div id="rate-div"></div>
                            	<table id="review-table" class="table" style="; ">
                            		
                                <c:forEach items="${reviewList }" var="review">
                                	<tr style="font-size:20pt">
                                		<td class="tab-id">${review.MEMBERID }</td>
                                		<td class="tab-star">
                                			<c:forEach begin="1" end="${review.BUYREVIEWSTAR}">
                                				<img src="${path }/resources/images/star.png">
                                			</c:forEach>
                                			<c:forEach begin="1" end="${5 - review.BUYREVIEWSTAR}">
                                				<img src="${path }/resources/images/emptyStar.png">
                                			</c:forEach>
                                		</td>
                                		<td style="text-align: right">
                                			
                                			<c:if test="${review.MEMBERID eq sessionScope.member.MEMBERID }">
                                				<button class="btn btn-primary review-mod" onclick="fn_reviewMod('${review.BUYREVIEWNO}','${review.BUYNO }')">수정</button>
                                				<button class="btn btn-primary review-del" onclick="fn_reviewDel('${review.BUYREVIEWNO}','${review.BUYNO }')">삭제</button>
                                			</c:if>
                                			
                                		</td>
                                	</tr>
                                	<tr style="font-size:15pt">
                                		<td></td>
                                		<td colspan="2">${review.BUYREVIEWCONTENT }</td>
                                	</tr>
                                </c:forEach>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                Et et dkjflksdnn djsklfjlkdsdddddddddddddddddddddddjsdklfjsdlkjl jsdklfjlk  jdkf jdk  djkfsdjfk jdskl sdjklf jdslkf jlsdjf klj sjdklf jsdklfj kl jsdklf jklsdf jlkdsjflkjsdlkf jjsdklfjsldkjflksdjflksdjflksdjflksdjlkf jdk jlc jsd klfjldk  ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex 이대형앝나.
                            </div>
                        </div>
                    </div>                       
                        
                </div>
				<div id='donggeulNav' class="col-md-6" style="position:absolute; margin-left:60%;transition:ease-in-out; transition-duration:0.7s;">                   
                      <div class="row " style="text-align:center; margin-left:-5em;" >
                       <div class="col-md-10">
                        <c:if test="${detailList.GRADENAME == '브론즈' }">
                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/bronzeGrade.png" style="max-width: 50px;max-height: 50px;"><c:out value="${detailList.GRADENAME }"></c:out></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '실버' }">
                                 <p><img alt="" src="${path }/resources/image/silverGrade.png" style="max-width: 50px;max-height: 50px;"><c:out value="${detailList.GRADENAME }"></c:out></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '골드' }">
                                 <p><img alt="" src="${path }/resources/image/goldGrade.png" style="max-width: 50px;max-height: 50px;"><c:out value="${detailList.GRADENAME }"></c:out></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '플래티넘' }">
                                 <p><img alt="" src="${path }/resources/image/platinumGrade.png" style="max-width: 50px;max-height: 50px;"><c:out value="${detailList.GRADENAME }"></c:out></p>
                              </c:if>
                              <c:if test="${detailList.GRADENAME == '다이아몬드' }">
                                 <p><img alt="" src="${path }/resources/image/diamodeGrade.png" style="max-width: 50px;max-height: 50px;"><c:out value="${detailList.GRADENAME }"></c:out></p>
                              </c:if>
                                 
                             <h4 style='display: inline;'><strong>${detailList.GRADENAME}</strong>${detailList.MEMBERNAME}</h4>
                             
                                <!-- 똥글뱅이 -->
                                <div class="row align-items-center" style='margin-top: -5em;'>                           
                                 <div class="holderCircle">
                                    <div class="round"></div>
                                    
                                    <!-- 똥글뱅이 서클 시작 -->
										<div class="dotCircle">

											<!-- 첫번째 법륜 (수정)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="1"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												<span class="forActive"></span>
											</span>
											</c:if> 
											<!-- 첫번째 법륜 끝 -->
											<!-- 두번째 법륜 (찜)-->
											<c:if test="${sessionScope.member != null and sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="2"> 
												<!-- 작성자가 아니면 -->
												
													<i class="fas fa-kiss-wink-heart donggeulI"></i>
												 <span class="forActive"></span>
											</span>
											</c:if>
											<!-- 두번째 법륜 끝 -->
											<!-- 세번째 법륜 (삭제하기)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="3"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												<span class="forActive"></span>
											</span>
											</c:if> 
											<!-- 세번째 법륜 끝 -->
											<!-- 네번째 법륜 (쪽지)-->
											<c:if test="${sessionScope.member != null and sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="4"> 
											<!-- 작성자가 아니면 -->
												
												<i class="fas fa-kiss-wink-heart donggeulI"></i> 
												
												<span class="forActive"></span>
											</span>
											</c:if>
											<!-- 네번째 법륜 끝 -->
											<!-- 다섯번째 법륜 (지원자보기)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID }">
											<span class="itemDot active itemDot1" data-tab="5">
											 <!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												 <span class="forActive"></span>
											</span>
											</c:if>
											<!-- 다섯번째 법륜 끝 -->
											<!-- 여섯번째 법륜 (지원하기)-->
											<c:if test="${sessionScope.member != null and sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="6"> 
											<!-- 작성자가 아니면 --> 
												
													<i class="fas fa-kiss-wink-heart donggeulI"></i>
												 <span class="forActive"></span>
											</span>
											</c:if>
											<!-- 여섯번째 법륜 끝 -->
											<!-- 일곱번째 법륜 (환불요청)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and specList2.STATUSNO == 3}">
											<span class="itemDot active itemDot1" data-tab="7"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												
												<span class="forActive"></span>
											</span>
											</c:if>
											<!-- 일곱번째 법륜 끝 -->
											<!-- 여덟번째 법륜 (신고하기)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID}">
											<span class="itemDot active itemDot1" data-tab="8"> 
												<!-- 작성자가 아니면 --> 
												
													<i class="fas fa-kiss-wink-heart donggeulI"></i>
												 <span class="forActive"></span>
											</span>
											</c:if>
											<!-- 여덟번째 법륜 끝 -->
											<!-- 아홉번째 법륜 (구매확정)-->
											<c:if test="${sessionScope.member.MEMBERID eq detailList.MEMBERID and specList2.STATUSNO == 3}">
											<span class="itemDot active itemDot1" data-tab="9"> 
												<!-- 작성자면 -->
												
													<i class="fas fa-edit donggeulI"></i>
												
												<span class="forActive"></span>
											</span>
											</c:if> 
											<!-- 아홉번째 법륜 끝 -->
											<!-- 열번째 법륜 (작업완료)-->
											<c:if test="${sessionScope.member.MEMBERID ne detailList.MEMBERID and specList.STATUS == 2}">
											<span class="itemDot active itemDot1" data-tab="10">
												<!-- 작성자가 아니면 -->
												
													<i class="fas fa-kiss-wink-heart donggeulI"></i>
												<span class="forActive"></span>
											</span>
											</c:if> 
											<!-- 열번째 법륜 끝 -->


										</div>
										<!-- 똥글뱅이 서클 끝 -->
                                    
                                    <div class="contentCircle">
											<!-- 첫번째 법륜 기능 시작 (수정)-->
											<div class="CirItem title-box active CirItem1">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-primary" >수정하기</button>
											</div>
											<!-- 두번째 법륜 기능 시작 (찜)-->
											<div class="CirItem title-box active CirItem2">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
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
													<button class="btn btn-primary" onclick="fn_outboxDo();">찜하기</button>
												</c:if>
												<c:if test="${!empty outBoxYn and detailList.MEMBERID ne sessionScope.member.MEMBERID }">
													<button class="btn btn-primary" onclick="fn_outboxNo();">찜풀기</button>
												</c:if>
											</div>
											<!-- 세번째 법륜 기능 시작 (삭제)-->
											<div class="CirItem title-box active CirItem3">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-primary" >삭제하기</button>
											</div>
											<!-- 네번째 법륜 기능 시작 (쪽지)-->
											<div class="CirItem title-box active CirItem4">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-primary" >쪽지보내기</button>
											</div>
											<!-- 다섯번째 법륜 기능 시작 (지원자보기)-->
											<div class="CirItem title-box active CirItem5">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button onclick='location.href="${path}/buy/volList.do?buyNo=${detailList.BUYNO }"' class='btn btn-primary'>지원자보기</button>
											</div>
											<!-- 여섯번째 법륜 기능 시작 (지원하기)-->
											<div class="CirItem title-box active CirItem6">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button onclick='location.href="${path}/buy/buyVol.do?buyNo=${detailList.BUYNO}"' class="btn btn-primary">지원하기</button>
											</div>
											<!-- 일곱번째 법륜 기능 시작 (환불요청)-->
											<div class="CirItem title-box active CirItem7">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="bn btn-primary" onclick="fn_refundPop()">환불하기</button>
											</div>
											<!-- 여덟번째 법륜 기능 시작 (신고하기)-->
											<div class="CirItem title-box active CirItem8">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="btn btn-primary" onclick="fn_reportPop();">신고하기</button>
											</div>
											<!-- 아홉번째 법륜 기능 시작 (구매확정)-->
											<div class="CirItem title-box active CirItem9">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="bn btn-primary" onclick="fn_buyCommit()">구매확정</button>
											</div>
											<!-- 열번째 법륜 기능 시작 (작업완료)-->
											<div class="CirItem title-box active CirItem10">
												<!-- 작성자 이미지 컨테이너 -->
												<div class="d-flex justify-content-center h-100"
													style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img
																src="${path}/resources/upload/member/${detailList.REIMG}">
														</div>
													</div>
												</div>
												<br />
												<button class="bn btn-primary" onclick="location.href='${path}/buy/finishWork.do?buyNo=${detailList.BUYNO }&sellerId=${sessionScope.member.MEMBERID }'">작업완료</button> 
											</div>
											
											
										</div>
                                 </div>                           
                              </div>                        
                                 <!-- 동글뱅이 끝-->   
                        
                              <!-- 동글뱅이 스크립트 -->
				               	<script>			               
						        	let i=2;						
								
									$(document).ready(function()
									{
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
									/* 찜하기 */
				                    function fn_outboxDo(){
				                		$('#buyOutBoxInFrm').attr('action',"${path}/buy/buyOutBox.do");
				                   		$('#buyOutBoxInFrm').submit();
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
				                          window.open("${path}/buy/buyRefundView.do?sellerId=${specList2.MEMBERID}&&buyNo=${detailList.BUYNO}&&specNo=${specList2.BUYSPECNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
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
				                           window.open("${path}/buy/buyReport?buyWriter=${detailList.MEMBERID}&&buyNo=${detailList.BUYNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
				                        }else{
				                           alert('로그인 후 이용해 주세요 ');
				                           location.href="${path}/member/memberLogin.do";
				                        };        
				                        
				                   	}      
				                	
				                	function fn_starPop()
				                    {                  	
				                        if(${sessionScope.member.MEMBERID==null}){
				                        	alert('로그인 후 이용해 주세요 ');
				                            location.href="${path}/member/memberLogin.do";
				                            return;
				                        		  
				                        }
				                        else if(${specList.STATUSNO != '4' || specList.STATUSNO != '5'})
				                        {
				                        	alert("구매 이후에 작성할 수 있습니다.");
				                        	return;
				                        }
				                        else{
				                        	var starPop=open("${path}/buy/writeReview.do?buyNo=${param.buyNo}","buyStarForm","top=200px, left=200px, width=400px, height=190px");
				                        }
				                        
				                    }
								</script>                        	
	                       		<!-- 동글뱅이 스크립트 끝 -->                            
                            
                                
                              
                             <div class='row' style='margin-top: -4em;'>
                              <div class='col-md-2'></div>
                              
                              <!-- 작성자 소개 -->     
                                <div class='col-md-8'>
                                   <p>${contestObj.INTRODUCTION}</p>
                                </div>
                                <!-- 작성자 소개 끝 -->
                                
                                <div class='col-md-2'></div>                                
                            </div>                             
                         </div>                       
                   </div>                      
              </div>
		</div>
	</div>   
	<div class='col-md-1' id='right-nav' ></div>                   
</div>
</div>
</body>
</html>