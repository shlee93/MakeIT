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
                <div class="col-md-5 fixed" style='position:fixed'>            
                    <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        <span>작성자 정보확인</span>
                        </button>
                        
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                            	<br/>
                                <h4>${detailList.GRADENAME} ${detailList.MEMBERNAME}</h4>
                                <a class="nav-item nav-link active xx" href="#">쪽지보내기</a>
                                <a class="nav-item nav-link active xx" href="${path}/buy/anotherView.do?memberId=${detailList.MEMBERID }">다른 글보기</a>                                
                            </div>
                        </div>                                            
                    </nav>
                    <div class="row " style="text-align:center">
                        <div class="col-md-10">
                        
                            <img  class="userImg" src="${path}/resources/upload/member/${detailList.REIMG}">     
                            <br/>
                           
                            <br/>
                            <p> ${detailList.INTRODUCTION}</p>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class='col-md-1'></div>
                            </div>
                            <div class='row' style='margin-top: 1.2em'>
                            	<div class='col-md-4'>
									<form id="buyOutBoxInFrm">
										<input type="hidden" name="buyNo" value="${detailList.BUYNO}">
									</form>
									<form id="buyOutBoxDelFrm">
										<input type="hidden" name="buyNo" value="${detailList.BUYNO}">
									</form>
									<c:if
										test="${empty outBoxYn and detailList.MEMBERID ne sessionScope.member.MEMBERID }">
										<button class="btn btn-primary" onclick="fn_outboxDo();">찜하기</button>
									</c:if>
									<c:if
										test="${!empty outBoxYn and detailList.MEMBERID ne sessionScope.member.MEMBERID }">
										<button class="btn btn-primary" onclick="fn_outboxNo();">찜풀기</button>
									</c:if>
									<!-- 환불신청 -->
									<button class="bn btn-primary" onclick="fn_refundPop()">환불하기</button>
									<!-- 작업완료 -->
									<button class="bn btn-primary" onclick="location.href='${path}/buy/finishWork.do?buyNo=${detailList.BUYNO }&sellerId=${sessionScope.member.MEMBERID }'">작업완료</button>
									<script>
                                    function fn_outboxDo(){
                                		$('#buyOutBoxInFrm').attr('action',"${path}/buy/buyOutBox.do");
                                   		$('#buyOutBoxInFrm').submit();
                               		}
                             
                                	function fn_outboxNo(){
                                   		$('#buyOutBoxDelFrm').attr('action',"${path}/buy/buyOutBoxDel.do");
                                   		$('#buyOutBoxDelFrm').submit();
                               		}
                                	
                                    function fn_refundPop(){
                                       if(${sessionScope.member.MEMBERID!=null}){
                                          var name="환불하기";         
                                          window.open("${path}/buy/buyRefundView.do?sellerId=${specList.MEMBERID}&&buyNo=${detailList.BUYNO}&&specNo=${specList.BUYSPECNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
                                       }else{
                                          alert('로그인 후 이용해 주세요 ');
                                          location.href="${path}/member/memberLogin.do";
                                       };         
                                    }
                                 
                                	
                                 </script>
                                 	<button class="btn btn-primary" onclick="fn_reportPop();">신고하기</button>
                                 
                                    <script>   
                                       function fn_reportPop(){
                                          if(${sessionScope.member.MEMBERID!=null}){
                                             var name="구매글 신고";         
                                             window.open("${path}/buy/buyReport?buyWriter=${detailList.MEMBERID}&&buyNo=${detailList.BUYNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
                                          }else{
                                             alert('로그인 후 이용해 주세요 ');
                                             location.href="${path}/member/memberLogin.do";
                                          };        
                                          
                                       }
                                    </script>
									</div>
                                <div class='col-md-4'>
                                    <button onclick='location.href="${path}/buy/buyVol.do?buyNo=${detailList.BUYNO}"' class="btn btn-primary" style='padding-left:17px; padding-right:17px; float:right;'>지원하기</button>
                                </div>
                                <div class='col-md-4' style='float:left'>
                                	<c:if test="${sessionScope.member.MEMBERID == detailList.MEMBERID }">
                                		<button onclick='location.href="${path}/buy/volList.do?buyNo=${detailList.BUYNO }"' class='btn btn-primary' style='float:left;'>지원자보기</button>
                                	</c:if>
                                    <c:if test="${sessionScope.member.MEMBERID != detailList.MEMBERID }">
                                   		<button onclick='fn_starPop();' class='btn btn-primary' style='float:left;'>후기남기기</button>
                                    </c:if>
                                </div>
                                <script>
                                    function fn_starPop()
                                    {                  	
                                        if(${sessionScope.member.MEMBERID==null}){
                                        	alert('로그인 후 이용해 주세요 ');
                                            location.href="${path}/member/memberLogin.do";
                                            return;
                                        		  
                                        }
                                        else if(${specList.STATUSNO != '4' || specList.STATUSNO != '5'})
                                        {
                                        	alert("구매 확정 이후에 작성할 수 있습니다.");
                                        	return;
                                        }
                                        else{
                                        	var starPop=open("${path}/buy/writeReview.do?buyNo=${param.buyNo}","buyStarForm","top=200px, left=200px, width=400px, height=190px");
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                </script>                              
                            </div>
                        <div class="col-md-2"></div>
                    </div>                      
               </div>        
          </div>
      </div>
    <div class='col-md-1' id='right-nav' ></div>                   
</div>   
</div>
</div>
</body>
</html>