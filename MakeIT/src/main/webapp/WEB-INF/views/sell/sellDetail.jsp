<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 글 보기</title>
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
		#optionT
		{
			text-align:center;
		}    
		
	</style>
</head>
<script>	
	$(document).ready(function()
	{
		var scmove = $('#mainNavi').offset().top;
		$('html, body').animate( { scrollTop : scmove }, 400 );
	});
	
	$(window).scroll(function(){
		if($(this).scrollTop() > 150)
		{
			var windowVal = $(this).scrollTop();
			$('#donggeulNav').css('top',windowVal-150);
		}
		if($(this).scrollTop() < 150) 
        {
			var windowVal = $(this).scrollTop();
			$('#donggeulNav').css('top','100px');
        }		
	})
	
	$(document).on('click','.subImgs',function()
	{
		var imgIndex = $(this).parent('.subImg').prevAll().length;   
       	console.log(imgIndex);
       	/* console.log(('.subImg:eq('+0+') .subImgs').attr('src'));  */
       	console.log($('.mainImg').attr('src'));
       	var url1 = $(this).attr('src');
       	var url2 = $('.mainImg').attr('src');
       	$('.mainImg').attr('src',url1);
       	$(this).attr('src',url2);
	})
	
	//관리자 게시물 승인 이벤트
	$(document).on('click','#approval-btn',function(){
		var sellNo=$('#sellno').val();
		var approvalStatus=$(opener.document).find('#approval-status').val();
		var approvalSearch=$(opener.document).find('#approval-search-inp').val();
		var approvalOption=$(opener.document).find('#approval-select option:selected').val();
		var $approval_tbl=$(opener.document).find('.approval-tbl');
		$.ajax({
			url:"${path}/admin/sellApprovalCheck.do",
			data:{
				"sellNo":sellNo,
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
                               
<div class='container-fluid' id="total">
	<div class='row'>
        <div class='col-md-1' id='nav'>
        	<div style='position:fixed; margin-top: 10em;'>
	    			<span onclick='fn_back()' style='cursor:pointer; font-size: 6em;'><i class="fas fa-arrow-circle-left"></i></span>    				           
	          	 	<script>
	           			function fn_back()
		           		{
		           			history.back();
		           		}
		           	</script>
	           	</div>
        </div>
        <div class='col-md-10' id='section' style='padding:50px'>        	
            <div class='row'>         
                <div class="col-md-6" id="img-container"  style='padding:1px; width: 100%; height: 600px;'>                	
                    <div class='row mainImgContainer' id='mainImgContainer'>
                    	<img id="mainImg" class="mainImg" src="${path}/resources/upload/sell/${mainimgList.get(0).SELLIMGRE}" style='max-height: 400px; min-height: 600px; width: 100%;'>
                    </div>
                    <div class='row'>              
                    	<c:forEach items="${subimgList}" var="subimgList">                          
                        	<div class="col-md-3 subImg" >
                            	<img  class="subImgs" src="${path}/resources/upload/sell/${subimgList.SELLIMGRE}" style="cursor:pointer" >     
                        	</div>
                    	</c:forEach>                                             
                    </div>
                       
                    <div class='row'>
                        <nav id=tab-list>
                            <div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist" style="width:100%; font-size:1.1em;">
                                <a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>
                                <a class="nav-item nav-link detail" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">후기</a>
                                <a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">취소 / 환불규정</a>
                                <a class="nav-item nav-link detail" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">옵션별 가격</a>
                            </div>
                        </nav>
                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" style="width:100%;">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style='width: 100%'>
                            	<textarea class='contentTextArea' rows="34" readonly='readonly'>  
                            		<h4>${detailList.get(0).SELLCONTENT}</h4>
                            	</textarea>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                           	<div id="rate-div"></div>
                              		<table id="review-table" class="table" style="width:690px; ">
                                 
                               		<c:forEach items="${sellReivew }" var="review">
                                   		<tr style="font-size:20pt">
                                      		<td class="tab-id">${review.MEMBERID }</td>
                                      		<td class="tab-star">
                                   		 		<c:forEach begin="1" end="${review.SELLREVIEWSTAR}">
                                            		<img src="${path }/resources/images/star.png">
                                         		</c:forEach>
                                         		<c:forEach begin="1" end="${5 - review.SELLREVIEWSTAR}">
                                            		<img src="${path }/resources/images/emptyStar.png">
                                         		</c:forEach>
                                      		</td>
                                      		<td style="text-align: right">                                         
	                                  			<c:if test="${review.MEMBERID eq sessionScope.member.MEMBERID }">
	                                            	<button class="btn btn-outline-info slidetopleft review-mod" onclick="fn_reviewMod('${review.SELLREVIEWNO}','${review.SELLNO }')">수정</button>
	                                            	<button class="btn btn-outline-info slidetopleft review-del" onclick="fn_reviewDel('${review.SELLREVIEWNO}','${review.SELLNO }')">삭제</button>
	                                         	</c:if>                                         
                                      		</td>
                                   		</tr>
                                   		<tr style="font-size:15pt">
                                      		<td></td>
                                      		<td colspan="2">${review.SELLREVIEWCONTENT }</td>
                                   		</tr>
                                	</c:forEach>
                               	</table>
                           	</div>
                            <script>
	                            var reviewList = new Array();
	                            <c:forEach items="${sellReivew}" var="review">
	                               reviewList.push("${review.SELLREVIEWSTAR}");
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
	                                  var html = "<img id='rateStar' src='${path }/resources/images/star.png'>"
	                                  +"<p id='reviewAvg'>" + reviewAvg.toFixed(2) + "</p>"
	                                  +"<p id='reviewCnt'>" + reviewCnt + "명 참여</p>";
	                                  $("#rate-div").html(html);
	                                  reviewCnt = 0;
	                             });
	                             function fn_reviewMod(reviewNo)
	                             {
	                                  var starPop=open("${path}/sell/modReview.do?sellno=${param.sellno}&reviewNo="+reviewNo,"sellStarForm","top=200px, left=200px, width=400px, height=190px");
	                             }
                               
	                             function fn_reviewDel(reviewNo, sellno)
	                             {
                               		  if(confirm("후기를 삭제하시겠습니까?"))
	                                  location.href="${path}/sell/sellReviewDel.do?reviewNo="+reviewNo +"&sellno="+sellno;                               
                            	 }
                            </script>
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
								<p>1. 서비스 진행 도중 의뢰인의 귀책사유로 인해 환불을 요청할 경우, 사용 금액을 아래와 같이 계산 후 총 금액의 10%를 공제하여 환불합니다.</p> 
								<p>총 작업량의 1/3 경과 전 : 이미 납부한 요금의 2/3해당액</p> 
								<p>총 작업량의 1/2 경과 전 : 이미 납부한 요금의 1/2해당액</p> 
								<p>총 작업량의 1/2 경과 후 : 반환하지 않음</p>
                            </div>
                            <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab"  style='width:100%';text-align="center">
                                <table id="optionT" border="1px solid black" style='width:100%'  >
                               		<tr>
                               			<th>옵션</th>
                                		<th>옵션내용</th>
                                		<th>소요기간</th>
                                		<th>옵션별 가격</th>
                                	</tr>
                                	<c:forEach items="${optionList}"  var="optionList" >
	                                	<%-- <h3> ${optionList.SELLOPTIONNO}  ${optionList.SELLOPTIONCONTENT}  소요기간  ${optionList.SELLDEADLINE} 금액  ${optionList.SELLPRICE } </h3> --%>
	                                	<tr>
	                                		<td> ${optionList.SELLOPTIONNO}</td>
	                                		<td>${optionList.SELLOPTIONCONTENT}</td>
	                                		<td>${optionList.SELLDEADLINE}</td>
	                                		<td>${optionList.SELLPRICE }</td>
	                                	</tr>
                                	
                                	</c:forEach>
                               	</table>
                                                                
                        	</div>
                        </div>
                    </div>                       
                </div>
                <div id='donggeulNav' class="col-md-6" style="position:absolute; margin-left:60%;transition:ease-in-out; transition-duration:0.7s;">                   
                                  
                   	<div class="row " style="text-align:center; margin-left:-5em;" >
              			<div class="col-md-10">
      						<c:if test="${detailList.get(0).GRADENAME == '브론즈' }">
                           		<p style='display: inline;'><img alt="" src="${path }/resources/image/bronzeGrade.png" style="max-width: 50px;max-height: 50px;font-family: 'Sunflower', sans-serif;"></p>
                           	</c:if>
                           	<c:if test="${detailList.get(0).GRADENAME == '실버' }">
                           		<p><img alt="" src="${path }/resources/image/silverGrade.png" style="max-width: 50px;max-height: 50px;"font-family: 'Sunflower', sans-serif;></p>
                           	</c:if>
                           	<c:if test="${detailList.get(0).GRADENAME == '골드' }">
                           		<p><img alt="" src="${path }/resources/image/goldGrade.png" style="max-width: 50px;max-height: 50px;"font-family: 'Sunflower', sans-serif;></p>
                           	</c:if>
                           	<c:if test="${detailList.get(0).GRADENAME == '플래티넘' }">
                           		<p><img alt="" src="${path }/resources/image/platinumGrade.png" style="max-width: 50px;max-height: 50px;"font-family: 'Sunflower', sans-serif;></p>
                           	</c:if>
                           	<c:if test="${detailList.get(0).GRADENAME == '다이아몬드' }">
                           		<p><img alt="" src="${path }/resources/image/diamodeGrade.png" style="max-width: 50px;max-height: 50px;"font-family: 'Sunflower', sans-serif;></p>
                           	</c:if>
                              	
                       		<h4 style="display: inline;font-family: 'Sunflower', sans-serif;"><strong>${detailList.get(0).GRADENAME}</strong>${detailList.get(0).MEMBERNAME}</h4>
              					
 			                   	<!-- 똥글뱅이 -->
                       			<div class="row align-items-center" style='margin-top: -5em;'>			                  
		                  			<div class="holderCircle">
		                        		<div class="round"></div>
		                        		
		                        		<!-- 똥글뱅이 서클 시작 -->
		                        		<div class="dotCircle">
		                        			
		                        			<!-- 첫번째 법륜 -->
		                        			<span class="itemDot active itemDot1" data-tab="1">
			                           	    	<c:if test="${sessionScope.member.MEMBERID eq detailList.get(0).MEMBERID}">
						    	   		   			<i class="fas fa-edit donggeulI"></i>				 			                          										    	   		   
						    	   		   		</c:if>
												<c:if test="${sessionScope.member.MEMBERID ne detailList.get(0).MEMBERID}">
					                        		<i class="fas fa-kiss-wink-heart donggeulI"></i>   				     		
												</c:if>  	
				                           		<span class="forActive"></span>
				                            </span>
			                           		<!-- 첫번째 법륜 끝 -->
			                           		
			                           		<!-- 두번째 법륜 시작 -->
				                            <span class="itemDot itemDot2" data-tab="2">
				                           	    <c:if test="${session.MEMBERID eq detailList.get(0).MEMBERID}">
	 			                          			<i class="fas fa-trash-alt donggeulI"></i>								    	   		   
							    	   		   	</c:if>
												<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">
						                           	<i class="fa fa-comments donggeulI"></i>			     		
												</c:if>	   	
				                           		<span class="forActive"></span>
				                            </span>
				                           	<!-- 두번째 법륜 끝 -->
				                           	
				                           	<!-- 세번째 법륜 시작 -->
				                           	<span class="itemDot itemDot3" data-tab="3">
				                           		<i class="fas fa-shopping-cart donggeulI"></i>
				                           	   	<span class="forActive"></span>
				                           	</span>
				                           	<!-- 세번째 법륜 끝 -->
				                           	
				                           	<!-- 네번째 법륜 시작 -->			
									      	<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID and !empty purchaseList }">
				                           		<c:set var="loop_flag" value="false" />
				                           		<c:forEach var="purchaseList" items="${purchaseList }" varStatus="status">
				                           			<c:if test="${not loop_flag }">
				                           				<c:if test="${purchaseList.STATUSNO eq '3'}">                           		
								                           	<span class="itemDot itemDot4" data-tab="4">
								                           		<i class="fas fa-file-signature donggeulI"></i>
									                           	<span class="forActive"></span>
								                           	</span>
								                           	<c:set var="loop_flag" value="true" />
							                           	</c:if>
						                           	</c:if>
					                           	</c:forEach>
	                           				</c:if>			                           			
				                           	<!-- 네번째 법륜 끝 -->
				                           	
				                           	<!-- 다섯번째 법륜 시작 -->
				                           	<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">	
						                       	<span class="itemDot itemDot5" data-tab="5">
						                       	   	<i class="fas fa-angry donggeulI"></i>
					                           	   	<span class="forActive"></span>
					                           	</span>
				                           	</c:if>
				                           	<!-- 다섯번째 법륜 끝 -->
				                           	
				                           	<!-- 여섯번째 법륜 시작 -->
		                                	<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID and !empty purchaseList }">
		                                		<c:set var="loop_flag" value="false" />
				                           		<c:forEach var="purchaseList" items="${purchaseList }" varStatus="status">
				                           			<c:if test="${not loop_flag }">
				                           				<c:if test="${purchaseList.STATUSNO eq '3'||purchaseList.STATUSNO eq '2'}">                           		
								                           	<span class="itemDot itemDot6" data-tab="6">
									                           	<i class="fas fa-hand-holding-usd donggeulI"></i>
									                           	<span class="forActive"></span>
								                           	</span>
								                           	<c:set var="loop_flag" value="true" />
							                           	</c:if>
						                           	</c:if>
					                           	</c:forEach>	                                		
		                                	</c:if>		                                	
		                                	<!-- 여섯번째 법륜 끝 -->
		                                	
		                                	<!-- 일곱번째 법륜 시작 -->
		                                	
			                           		<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID and !empty purchaseList }">
		                                		<c:set var="loop_flag" value="false" />
				                           		<c:forEach var="purchaseList" items="${purchaseList }" varStatus="status">
				                           			<c:if test="${not loop_flag }">
				                           				<c:if test="${session.MEMBERID eq purchaseList.MEMBERID}">                           		
								                           	<span class="itemDot itemDot7" data-tab="7">
						                           <i class="fa fa-tags donggeulI"></i>
						                           	<span class="forActive"></span>
				                           		</span>
								                           	<c:set var="loop_flag" value="true" />
							                           	</c:if>
						                           	</c:if>
					                           	</c:forEach>	                                		
		                                	</c:if>		                      
				                           	<!-- 일곱번째 법륜 끝 -->
				                           	
				                           	<!-- 여덟번째 법륜 시작 -->
				                           	<!-- <span class="itemDot itemDot8" data-tab="8">
					                           	<i class="fas fa-hand-holding-usd donggeulI"></i>
					                           	<span class="forActive"></span>
				                           	</span>-->
				                           	<!-- 여덟번째 법륜 끝 -->
				                           				                           	
			                        	</div>
			                        	<!-- 똥글뱅이 서클 끝 -->
			                        	
			                        	<div class="contentCircle">
				                        	<!-- 첫번째 법륜 기능 시작 -->
				                           	<div class="CirItem title-box active CirItem1">		                        	
				                        	   	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
												   	<div class="image_outer_container">
												   	   	<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
													   	</div>
												   	</div>
												</div>
											
												<br/>																		
				                          	
				                        		<!-- 수정하기 찜하기 찜풀기 -->
									    		<c:if test="${session.MEMBERID eq detailList.get(0).MEMBERID}">												
													<button class="btn btn-outline-info slidetopleft" onclick="fn_sellModify();" id="sellModify">수정하기</button>										    	
								    			</c:if>
								    				<form id='sellDetailFrm'>
					                                	<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
					                                </form>
									    			<script>
									    				function fn_sellModify(){
															$('#sellDetailFrm').attr('action',"${path}/sell/sellModify");
															$('#sellDetailFrm').submit();
														}								    				
									    			</script>
									    			
									    			<form id="sellOutBoxInFrm">
					                                	<input type="hidden" name="sellno" value="${detailList.get(0).SELLNO}">
					                                </form>
					                                <form id="sellOutBoxDelFrm">
					                                	<input type="hidden" name="sellno" value="${detailList.get(0).SELLNO}">
					                                </form>								    		
													<c:if test="${empty outBoxYn and detailList.get(0).MEMBERID ne session.MEMBERID }">
				                                    	<button class="btn btn-outline-info slidetopleft" onclick="fn_outboxDo();">찜하기</button>
				                                    </c:if>
				                                    <c:if test="${!empty outBoxYn and detailList.get(0).MEMBERID ne session.MEMBERID }">
				                                   		<button class="btn btn-outline-info slidetopleft" onclick="fn_outboxNo();" >찜풀기</button>
				                                   	</c:if>
				                                   	
				                                   	<script>
					                                   	function fn_outboxDo(){
					                            			$('#sellOutBoxInFrm').attr('action',"${path}/sell/sellOutBox.do");
					                            			$('#sellOutBoxInFrm').submit();
					                            		}
					                            	
					                            		function fn_outboxNo(){
					                            			$('#sellOutBoxDelFrm').attr('action',"${path}/sell/sellOutBoxDel.do");
					                            			$('#sellOutBoxDelFrm').submit();
					                            		}
				                                   	</script>		                              	
			                            	</div>
			                            	<!-- 첫번째 법륜 기능 끝 -->
			                            	
			                            	<!-- 두번째 법륜 기능 시작 -->
			                           		<div class="CirItem title-box CirItem2">			                              			                        	
				                        	  	<div class="d-flex justify-content-center h-100" style='margin-bottom:-8em;'>
												 	<div class="image_outer_container">
													 	<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
												 	</div>
											  	</div>
											
										  		</br>
										  													
			                           			<!-- 삭제하기 쪽지보내기 -->			                          
									    		<c:if test="${session.MEMBERID eq detailList.get(0).MEMBERID}">
                                					<button class="btn btn-outline-info slidetopleft" onclick="fn_sellDelete();" id="sellDelete">삭제하기</button>
                                				</c:if>
                                				<script>
	                                				function fn_sellDelete(){
														$("#sellDetailDelete").attr('action',"${path}/sell/sellDelete.do");
														$("#sellDetailDelete").submit();
													}
                                				</script>
										      	<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">
									      			<%-- <form id='contestMsgFrm' action='${path }/message/messagePop.do'> --%>
										      			<input type='hidden' id='sendId' name='sendId' value='${session.MEMBERID}'/>
										      			<input type='hidden' id='receiveId' name='receiveId' value='${detailList.get(0).MEMBERID }'/>
										      		<%-- </form> --%> 
									      			<button class="btn btn-outline-info slidetopleft" onclick='fn_message()'>쪽지보내기</button>
									      			
									      			<script>									      			
									      				function fn_message()
									      				{
									      					var sendId=$('#sendId').val();
									      					if($('#sendId').val()!=null&&$('#sendId').val()!='')
								      						{
										      					var receiveId=$('#receiveId').val();
									                    		var popup=open("${path}/message/messagePop.do?sendId="+sendId+"&receiveId="+receiveId,"contestMsgSendPop","left=250px, top=200px, width=450px, height=350px");									                    	
											      				$('#contestMsgFrm').target=popup;
								      						}
									      					else
								      						{
									      						alert("로그인해주세요");
								      						}
									      				} 
									      			</script>
										      	</c:if>		                              	
		                           			</div>
		                           			<!-- 두번째 법륜 기능 끝 -->
		                           			
		                           			<!-- 세번째 법륜 기능 시작 -->
		                           			<div class="CirItem title-box CirItem3">
			                              				                        	
					                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
													</div>
												</div>
											
												</br>
											
		                           				<!-- 구매자보기 구매하기 -->
											
										    	<c:if test="${session.MEMBERID eq detailList.get(0).MEMBERID}">
										    		<button class="btn btn-outline-info slidetopleft" onclick="fn_purchaseListShow();">구매자 보기</button>											    										    							    	   
										      	   	<form id="buyerShow">
					                         		 	<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
					                               	</form>
										      	</c:if>
											      	<script>
											      		function fn_purchaseListShow(){
															$("#buyerShow").attr('action',"${path}/sell/sellBuyerShow.do");
															$("#buyerShow").submit();
														}
										      		</script>
										      
									      		<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">
			                                		<form id="sellBuyFrm" action="${path}/sell/sellPurchase.do">
			                                    		<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
			                                    		<input type="hidden" id="selcOption" name="selcOption" value="">
			                                    		<input type="hidden" name="sellerId" value="${detailList.get(0).MEMBERID}">			                                    		
			                                    		<select id="optionSelector" required="true" class="form-control required" style="width:100%" onchange="fn_selected(this.value)" >                      
					                                    	<option value="">구매할 옵션을 선택해주세요</option>
					                                        <c:forEach items="${optionList}" var="optionList">
					                                        	<option value="${optionList.SELLOPTIONNO}">${optionList.SELLOPTIONNO}  ${optionList.SELLOPTIONCONTENT}  소요기간  ${optionList.SELLDEADLINE}</option>                             
					                                        </c:forEach>
					                                    </select>
					                                    <script>
						                                    function fn_selected(str) {	   
															    $("#selcOption").attr("value",str)
															    console.log($("#selcOption").val());														
															}
					                                    </script>	
					                                    <input class="btn btn-outline-info slidetopleft" type="submit" value="구매하기">				                                    
			                                    		<!-- <button class="btn btn-outline-info slidetopleft" onclick="fn_sellBoardBuy();">구매하기</button> -->
			                                    	</form>
			                                    </c:if>
			                                 
	                                       		<!-- <script>
				                                    function fn_sellBoardBuy(){
				                            			$("#sellBuyFrm").attr('action',"${path}/sell/sellPurchase.do");
				                            			$("#sellBuyFrm").submit();
				                            		}
		                                    	</script> -->
		                                    	                              		        
		                           			</div>
		                           			<!-- 세번째 법륜 기능 끝 -->
		                           						                           
			                           		<!-- 네번째 법륜 기능 시작 -->
		                           	 		<div class="CirItem title-box CirItem4">
			                        	
					                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
													</div>
												</div>
											
												</br>
												
												<!-- 구매확정 -->
												 <script>	
												 	
												 </script>
												 <c:if test="${!empty purchaseList}"> 
												 
											    	<c:if test="${purchaseList.get(0).MEMBERID eq session.MEMBERID}">											    													    										    							    	   											      											    										      	
										      		
					                                		<form id="sellBuyFrm" action="${path}/sell/sellCommit.do">
					                                    		<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
					                                    		<input type="hidden" id="sellSpecNo" name="sellSpecNo" value="">				                                    					                                    	
					                                    		<select id="specSelector" name="sellSpecNo" required="true" onchange="fn_selectedSpec(this.value)" class="form-control required" style="width:100%" >                      
							                                    												    													    										    							    	   											      											    										      	
							                                    	<option value="">구매확정할 옵션을 선택해주세요</option>
														      		<c:forEach items="${purchaseList}" var="purchaseList">
															      		<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID and purchaseList.STATUSNO=='3'}">									                                        
								                                        	<option value="${purchaseList.SELLSPECNO}">${purchaseList.SELLOPTIONNO}    주문날짜  ${purchaseList.SELLSPECDATE} ${purchaseList.SELLPRICE}원  </option>                             
							                                        	</c:if>
						                                        	</c:forEach>
							                                    </select>
							                                    <script>
								                                    function fn_selectedSpec(str) {	   								                                    	
																	    $("#sellSpecNo").attr("value",str);																	   														
																	}
							                                    </script>	
							                                   
							                                    <input class="btn btn-outline-info slidetopleft" type="submit" value="구매확정">				                                    
					                                    		
					                                    	</form>
					                                    </c:if>
					                                   
			                                 	</c:if>                     			                             
		                           			</div>
		                           			
		                           			<!-- 다섯번째 법륜 기능 시작 -->
			                           		<div class="CirItem title-box CirItem5">			                              	
			                        	
					                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
													</div>
												</div>
											
												</br>
											
			                           			<!-- 신고하기 -->
			                           		
												<button class="btn btn-outline-info slidetopleft" onclick="fn_reportPop();">신고하기</button>
											
												<script>	
													function fn_reportPop(){
														if(${sessionScope.member.MEMBERID!=null}){
															var url="${path}/sell/sellReport";
															var name="판매글 신고";			
															window.open("${path}/sell/sellReport?sellWriter=${detailList.get(0).MEMBERID}&&sellno=${detailList.get(0).SELLNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
														}else{
															alert('로그인 후 이용해 주세요 ');
															location.href="${path}/member/memberLogin.do";
														};			
													}
												</script>
			                              	
		                           			</div>
		                           			<!-- 다섯번째 법륜 기능 끝 -->
		                           		
			                           		<!-- 여섯번째 법륜 기능 시작 -->
				                           	<div class="CirItem title-box CirItem6">
			                              	
					                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
													</div>
												</div>
											
												</br>
																																	    	
			                           			<!-- 환불하기 -->
										      	<c:if test='${!empty purchaseList}'>	
										      		<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">								      		
			                                		<form id="sellRefundFrm" action="${path}/sell/sellRefund.do">
			                                    		<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">				                                    					                                    	
			                                    		<select id="optionRefund" name="sellSpecNo" required="true" class="form-control" style="width:100%" onchange="fn_refundSelected(this.value)" >                      
					                                    	<option value="">환불할 옵션을 선택해주세요</option>
						                                        <c:forEach items="${purchaseList}" var="purchaseList">
									      							<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID and purchaseList.STATUSNO=='3'|| purchaseList.STATUSNO=='2'}">
							                                        	<option value="${purchaseList.SELLSPECNO}">${purchaseList.SELLOPTIONNO} 주문날짜  ${purchaseList.SELLSPECDATE} ${purchaseList.SELLPRICE}원  </option>                             
							                                        </c:if>
						                                        </c:forEach>
					                                    </select>
					                                    <input class="btn btn-outline-info slidetopleft" type="button" onclick='fn_refundPop()' value="환불하기">				                                    
					                                    <script>	
															function fn_refundPop(){
																if(${sessionScope.member.MEMBERID!=null}){
																	var url="${path}/sell/sellRefund.do";
																	var name="환불하기";			
																	window.open("${path}/sell/sellRefund.do?sellWriter=${detailList.get(0).MEMBERID}&&sellno=${detailList.get(0).SELLNO}&&refundId=${purchaseList.get(0).MEMBERID}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
																}else{
																	alert('로그인 후 이용해 주세요 ');
																	location.href="${path}/member/memberLogin.do";
																};			
															}
														</script>
					                                    
			                                    		
			                                    	</form>
			                                    </c:if>
		                                    </c:if>		                                 		                        			                             
		                           			</div>
		                           			<!-- 여섯번째 법륜 기능 끝 -->
		                           			
		                           			<!-- 일곱번째 법륜 기능 시작 -->	                                		
			                           		
			                           		<!-- //후기남기기 -->
		                           	 		<div class="CirItem title-box CirItem7">			                              		                        	
					                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
													<div class="image_outer_container">
														<div class="image_inner_container">
															<img src="${path}/resources/upload/member/${detailList.get(0).REIMG}">
														</div>
													</div>
												</div>
																							
												<br/>
																						
	                                			<button class="btn btn-outline-info slidetopleft" onclick="fn_starPop();">후기남기기</button>
	                                			
				                           	</div>
		                               											
											<script>
												function fn_starPop()
			                                    {                     
			                                        if(${sessionScope.member.MEMBERID==null}){
			                                           alert('로그인 후 이용해 주세요 ');
			                                            location.href="${path}/member/memberLogin.do";
			                                            return;
			                                                
			                                        }		 
			                            
			                                      
			                                        else{
			                                           var starPop=open("${path}/sell/writeReview.do?sellno=${param.sellno}","sellStarForm","top=200px, left=200px, width=400px, height=190px");
			                                        }                              
			                                    }
											</script>                      	 			      		      	                           	
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
								</script>                        	
	                       		<!-- 동글뱅이 스크립트 끝 -->                             	
	                         
                                
                                <form id="sellDetailDelete">
                                	<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
                                </form>
                             
                                <form id="sellRefund">
                                	<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
                                	<c:if test='${puchaseList!=null&&purchaseList!=""}'>
                                		<input type="hidden" id="refundId" name="refundId" value="${purchaseList.get(0).MEMBERID}">
                               		</c:if>
                                </form>
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
   		<div class='col-md-1' id='right-nav'>
   			
   			
   		</div>                   
	</div>
</div>

	<script>		
	
		var loginCheck=$("#loginCheck").val();
		var sellno=$("#sellno").val();		
		
		function fn_sellRefund(){
					
			 window.open("${path}/sell/sellRefund.do?sellWriter=${detailList.get(0).MEMBERID}&&refundId=${sessionScope.member.MEMBERID}&&sellno=${detailList.get(0).SELLNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no'); 
		}
	</script>
</body>
</html>