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
	
	$(document).ready(function()
	{
		var scmove = $('#mainNavi').offset().top;
		$('html, body').animate( { scrollTop : scmove }, 400 );
	});
	
	var reviewList = new Array();
	<c:forEach items="${reviewList}" var="review">
		reviewList.push("${review.BUYREVIEWSTAR}");
	</c:forEach>
	console.log("${sessionScope.member.MEMBERID}");
 	
	$(document).on('click','#nav-profile-tab',function() 
	{
		var reviewTotal = 0;
		var reviewCnt = ${reviewCnt};
		var reviewAvg = 0;
	
		for(var i = 0; i < reviewCnt; i++)
		{
			reviewTotal += Number(reviewList[i]);
		}
		
		reviewAvg = reviewTotal / reviewCnt;
		
		var html = "<img id='rateStar' src='${path }/resources/image/star.png'>"
		+"<p id='reviewAvg'>" + reviewAvg.toFixed(2) + "</p>"
		+"<p id='reviewCnt'>" + reviewCnt + "명 참여</p>";
		$("#rate-div").html(html);
		reviewCnt = 0;
	});
 
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
        	<div class='col-md-10' id='section' style='padding:50px'>
            	<div class='row'>
                	<div class="col-md-6" id="img-container" style='padding:1px; width: 100%; height: 600px;'>
                		<div class='row mainImgContainer' id='mainImgContainer'>             	
                    		<img id="mainImg" class="mainImg" src="${path}/resources/upload/buy/${mainimgList.BUYIMGRE}" style='max-height: 400px; min-height: 600px; width: 100%;'>
                    	</div>
                    	<div class='row'>              
                      		<c:forEach items="${subimgList}" var="subimgList">                          
                        		<div class="col-md-3 subImg" style='padding:1px;'>
                            		<img class="subImgs" src="${path}/resources/upload/buy/${subimgList.BUYIMGRE}" style="cursor:pointer" >     
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
                              		<textarea class='contentTextArea' rows="34" readonly='readonly'>	
                              			${detailList.BUYCONTENT}
                           			</textarea>
                            	</div>
                            	<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            		<div id="rate-div"></div>
                            		<table id="review-table" class="table" style="width:100%; ">
                            		   	<c:forEach items="${reviewList }" var="review">
	                                		<tr style="font-size:20pt">
	                                			<td class="tab-id">${review.MEMBERID }</td>
	                                			<td class="tab-star">
	                                				<c:forEach begin="1" end="${review.BUYREVIEWSTAR}">
	                                					<img src="${path }/resources/image/star.png">
	                                				</c:forEach>
	                                				<c:forEach begin="1" end="${5 - review.BUYREVIEWSTAR}">
	                                					<img src="${path }/resources/image/emptyStar.png">
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
	                <div class="col-md-6 fixed" style='position:fixed'>
	                	<div class="row " style="text-align:center; margin-left:-5em;" >
                        	<div class="col-md-10">
                        		<h4>${detailList.GRADENAME} ${detailList.MEMBERNAME}</h4>
 			                   	<!-- 똥글뱅이 -->
                        		<div class="row align-items-center" style='margin-bottom: 1em;'>			                  
			                  		<div class="holderCircle">
			                        	<div class="round"></div>
			                        	<div class="dotCircle">
			                           		<span class="itemDot active itemDot1" data-tab="1">
	       			                       		<i class="far fa-heart donggeulI"></i>
				                           		<span class="forActive"></span>
			                           		</span>
				                           <span class="itemDot itemDot2" data-tab="2">
					                           <i class="fa fa-comments donggeulI"></i>
					                           <span class="forActive"></span>
				                           </span>
				                           <span class="itemDot itemDot3" data-tab="3">
					                           <i class="fa fa-user donggeulI"></i>
					                           <span class="forActive"></span>
<<<<<<< HEAD
				                           </span>
=======
				                           </span
				                           >
>>>>>>> refs/remotes/origin/JCH
				                           <span class="itemDot itemDot4" data-tab="4">
					                           <i class="fa fa-tags donggeulI"></i>
					                           <span class="forActive"></span>
				                           </span>
					                       <span class="itemDot itemDot5" data-tab="5">
					                           <i class="fa fa-upload donggeulI"></i>
				                           	   <span class="forActive"></span>
				                           </span>
				                           <span class="itemDot itemDot6" data-tab="6">
					                           <i class="fa fa-briefcase donggeulI"></i>
				                           	   <span class="forActive"></span>
				                           </span>
				                        </div>
			                        	<div class="contentCircle">
				                           <div class="CirItem title-box active CirItem1">
			                           		   <!-- 작성자 이미지 컨테이너 -->			                        	
				                        	   <div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
											   <div class="image_outer_container">
											   	   <div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
												   </div>
											   </div>
											</div>
											<br/>
											
		                                    <button class="btn btn-primary" onclick="fn_outbox();">찜하기</button>
			                                 
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-clock-o"></i> -->
			                            </div>
			                           
			                           	<div class="CirItem title-box active CirItem2">
			                              	<!-- 작성자 이미지 컨테이너 -->			                        	
			                        	  	<div class="d-flex justify-content-center h-100" style='margin-bottom:-8em;'>
											 	<div class="image_outer_container">
												 	<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
													</div>
											 	</div>
										  	</div>
											
										  	</br>
											
											<c:set var='currentId' value='${memberMap.get("MEMBERID")}'/>								
				                          	<c:choose>
										    	<c:when test="${currentId eq contestObj.MEMBERID}">
										    		<form id='contestDetailFrm'>
										    			<input id='contestDelNo' name='contestDelNo' type='hidden' value='${contestObj.CONTESTNO}'/>
										    		</form>
											    	<input type='button' class='btn btn-primary' onclick='fn_contestDelSubmit()' value='삭제하기'/>
											    	
											    	<!-- 컨테스트 삭제 스크립트 -->
											    	
											    	<script>
											    		function fn_contestDelSubmit()
											    		{
											    			$('#contestDetailFrm').attr('action','${path}/contest/contestDel.do');
											    			$('#contestDetailFrm').submit();
											    		}
											    	</script> 
											    	  
										      	</c:when>
										      	<c:otherwise>
										      		<button class="btn btn-primary">쪽지보내기</button>
										      	</c:otherwise>
										 	</c:choose>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-clock-o"></i> -->
		                           		</div>
			                           
			                           	<div class="CirItem title-box CirItem3">
		                              		
		                              		<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
													</div>
												</div>
											</div>
											
											<br/>
											
											<button onclick='fn_starPop();' class='btn btn-primary'>후기남기기</button>
											<script>
			                                    function fn_starPop()
			                                    {
			                                        var starPop=open("${path}/buy/writeReview.do?buyNo=${param.buyNo}","buyStarForm","top=200px, left=200px, width=400px, height=190px");
			                                    }		                                    
			                                </script>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-user"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem4">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
													</div>
												</div>
											</div>
											
											</br>
											<button type='button' class='btn btn-primary' href="#">다른글보기</a>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-tags"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem5">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -5em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
													</div>
												</div>
											</div>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-upload"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem6">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${detailList.REIMG}">
													</div>
												</div>
											</div>
											
											</br>
											
											<c:choose>
										    	<c:when test="${currentId eq contestObj.MEMBERID}">
											    	<button type="button" class='btn btn-primary' onclick='fn_contestModify()'>수정하기</button>
											    	<script>
											    		function fn_contestModify()
											    		{
											    			$('#contestDetailFrm').attr('action','${path}/contest/contestModify.do');
											    			$('#contestDetailFrm').submit();
											    		}
											    	</script>									    							    	   
										      	</c:when>
									      		<c:otherwise>
									      			<button class="btn btn-primary">구매하기</button>									      			
									      		</c:otherwise>
									 		</c:choose>
			                              <!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->			                              
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
							</script>                        	
                        	<!-- 동글뱅이 스크립트 끝 -->                             	
	                        
                          	<div class='row' style='margin-top: -4em;'>
                       			<div class='col-md-2'></div>
	                        	
	                        	<!-- 작성자 소개 -->  	
                          		<div class='col-md-8'>
                      				<p> ${detailList.INTRODUCTION}</p>
                          		</div>
                          		<!-- 작성자 소개 끝 -->
                          		
                       			<div class='col-md-2'></div>                          		
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