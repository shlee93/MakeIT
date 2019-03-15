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
	var reviewTotal = 0;
	var reviewCnt = ${reviewCnt};
	var reviewAvg = 0;
	console.log("리뷰총합 : " + reviewTotal);
	console.log("리뷰수 : " + reviewCnt);
	console.log("리뷰평균 : " + reviewAvg); 
	
	 $(document).on('click','#nav-profile-tab',function() {
		for(var i = 0; i < reviewCnt; i++)
		{
			reviewTotal += ${reviewList.get(i).BUYREVIEWSTAR};
		}
		reviewAvg = reviewTotal / reviewCnt;
		
		var html = "<img src='${path }/resources/image/star.png'>"
		+ "<p id='reviewAvg'>" + reviewAvg + "</p>";
		$("#rateTd").append(html);
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
                            
                            	<table id="review-table" class="table" style="width:100%;">
                            		<tr>
                            			<td id="rateTd" colspan="3">
                            				
                            			</td>
                            		</tr>
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
                                		<td></td>
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
                                <a class="nav-item nav-link active xx" href="#">다른 글보기</a>                                
                            </div>
                        </div>                                            
                    </nav>
                    <div class="row " style="text-align:center">
                        <div class="col-md-10">
                        
                            <img  class="userImg" src="${path}/resources/upload/member/${detailList.REIMG}">     
                            <br/>
                            <div class='row' style='margin-top: 1.2em'>
                                <div class='col-md-7'>
                                    <button class="btn btn-primary" onclick="fn_outbox();" style='padding-left:17px; padding-right:17px; float:right;'><i class='far fa-star'></i>찜하기</button>
                                </div>
                                
                                            
                            </div>
                            <br/>
                            <p> ${detailList.INTRODUCTION}</p>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class='col-md-1'></div>
                            </div>
                            <div class='row' style='margin-top: 1.2em'>
                                <div class='col-md-6'>
                                    <button class="btn btn-primary" style='padding-left:17px; padding-right:17px; float:right;'>구매하기</button>
                                </div>
                                <div class='col-md-6' style='float:left'>
                                    <button onclick='fn_starPop();' class='btn btn-primary' style='float:left;'>후기남기기</button>
                                </div>
                                <script>
                                    function fn_starPop()
                                    {
                                        var starPop=open("${path}/buy/writeReview.do?buyNo=${param.buyNo}","buyStarForm","top=200px, left=200px, width=400px, height=190px");
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