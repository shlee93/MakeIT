<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/selldetail/selldetail.css" />   
   <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
</head>

<script>
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
<style>
#optionT{
  font-size:20px;
  text-align:center;
  min-width:656px;
 } 
 
</style>   
 

 
                               
<div class='container-fluid' id="total" style=min-height:1700px; >
    <div class='row'>
        <div class='col-md-1' id='nav'></div>
        <div class='col-md-10' id='section' >
            <div class='row'>
                <div class="col-md-7" id="img-container">                	
                    <img  id="mainImg" class="mainImg" src="${path}/resources/upload/sell/${mainimgList.get(0).SELLIMGRE}" style="min-height:600px;max-height:400px;">
                    
                    <div class='row'>              
                      <c:forEach items="${subimgList}" var="subimgList">                          
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src="${path}/resources/upload/sell/${subimgList.SELLIMGRE}" >     
                        </div>
                      </c:forEach>                                             
                    </div>
                       
                    <div class='row'>
                        <nav id=tab-list>
                            <div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>
                                <a class="nav-item nav-link detail" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">후기</a>
                                <a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">취소 / 환불규정</a>
                                <a class="nav-item nav-link detail" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">옵션별 가격</a>
                            </div>
                        </nav>
                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style='min-width: 656px'>
                              
                               <h4>${detailList.get(0).SELLCONTENT}</h4>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                Et et dkjflksdnn djsklfjlkdsdddddddddddddddddddddddjsdklfjsdlkjl jsdklfjlk  jdkf jdk  djkfsdjfk jdskl sdjklf jdslkf jlsdjf klj sjdklf jsdklfj kl jsdklf jklsdf jlkdsjflkjsdlkf jjsdklfjsldkjflksdjflksdjflksdjflksdjlkf jdk jlc jsd klfjldk  ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex 이대형앝나.
                            </div>
                            <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab"  style='min-width:656px'>
                                <table id="optionT" border="1px solid black"   >
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
                <div class="col-md-5 fixed" style='position:fixed'>            
                    <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        <span>작성자 정보확인</span>
                        </button>
                        
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                            	<br/>
                                <h4>${detailList.get(0).GRADENAME} ${detailList.get(0).MEMBERNAME}</h4>
                                <a class="nav-item nav-link active xx" href="#">쪽지보내기</a>
                                <a class="nav-item nav-link active xx" href="#">다른 글보기</a>   
                                <a class="nav-item nav-link active xx" href="#" onclick="fn_reportPop(); return false;">신고하기</a>                                
                            </div>
                        </div>                                            
                    </nav>
                    <div class="row " style="text-align:center">
                        <div class="col-md-10">
                        
                            <img  class="userImg" src="${path}/resources/upload/member/${detailList.get(0).REIMG}" style="max-width:200px;max-height:200px;">     
                            <br/>
                            <div class='row' style='margin-top: 1.2em'>
                                <div class='col-md-7'>
                                	<c:if test="${empty outBoxYn and detailList.get(0).MEMBERID ne session.MEMBERID }">
                                    	<button class="btn btn-primary" onclick="fn_outboxDo();" style='padding-left:17px; padding-right:17px; float:right;'><i class='far fa-star'></i>찜하기</button>
                                    </c:if>
                                    <c:if test="${!empty outBoxYn and detailList.get(0).MEMBERID ne session.MEMBERID }">
                                   		<button class="btn btn-primary" onclick="fn_outboxNo();" style='padding-left:17px; padding-right:17px; float:right;'><i class='far fa-star'></i>찜풀기</button>
                                   	</c:if>
                                   	<c:if test="${detailList.get(0).MEMBERID eq session.MEMBERID and session!=null}">
                                   		<button class="btn btn-primary" onclick=";" style='padding-left:17px; padding-right:17px; float:right;'><i class='far fa-star'></i>구매자 보기</button>
                                   	</c:if>
                                </div>
                                
                                            
                            </div>
                            <br/>
                            <p> ${detailList.get(0).INTRODUCTION}</p>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" style="text-align:center;">
                                    <select class="form-control" style="width:100%">
                                        <c:forEach items="${optionList}" var="optionList" >
                                        <option value="${optionList.SELLOPTIONNO}">${optionList.SELLOPTIONNO}  ${optionList.SELLOPTIONCONTENT}  소요기간  ${optionList.SELLDEADLINE}</option>
                                        
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class='col-md-1'></div>
                            </div>
                            <div class='row' style='margin-top: 1.2em'>
                                <div class='col-md-6'>
                               
                                	<c:if test="${session.MEMBERID eq detailList.get(0).MEMBERID}">
                                		<button class="btn btn-primary" onclick="fn_sellModify();" id="sellModify" style='padding-left:17px; padding-right:17px; float:right;'>수정하기</button>
                                	</c:if>
                                	<c:if test="${session.MEMBERID ne detailList.get(0).MEMBERID}">
                                    	<button class="btn btn-primary" style='padding-left:17px; padding-right:17px; float:right;'>구매하기</button>
                                    </c:if>
                                </div>
                                <div class='col-md-6' style='float:left'>
                                    <button onclick='fn_starPop()'; class='btn btn-primary' style='float:left;' disabled>후기남기기</button>
                                </div>
                                <form id='sellDetailFrm'>
                                	<input type="hidden" id="sellno" name="sellno" value="${detailList.get(0).SELLNO}">
                                </form>
                                <form id="sellOutBoxInFrm">
                                	<input type="hidden" name="sellno" value="${detailList.get(0).SELLNO}">
                                </form>
                                <form id="sellOutBoxDelFrm">
                                	<input type="hidden" name="sellno" value="${detailList.get(0).SELLNO}">
                                </form>
                                <script>
                                	console.log($("#sellno").val());
                                	
                                    function fn_starPop()
                                    {
                                        var starPop=open("starPop.html","별점/후기","top=200px, left=200px, width=400px, height=150px");
                                    }                                                                       
                                </script>
                                <input type="hidden" id="loginCheck" name="sellWriter" value="${session.MEMBERID}">                                                             
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
	<script>
		var loginCheck=$("#loginCheck").val();
		var sellno=$("#sellno").val();
		function fn_sellModify(){
			$('#sellDetailFrm').attr('action',"${path}/sell/sellModify");
			$('#sellDetailFrm').submit();
		}
		function fn_outboxDo(){
			$('#sellOutBoxInFrm').attr('action',"${path}/sell/sellOutBox.do");
			$('#sellOutBoxInFrm').submit();
		}
	
		function fn_outboxNo(){
			$('#sellOutBoxDelFrm').attr('action',"${path}/sell/sellOutBoxDel.do");
			$('#sellOutBoxDelFrm').submit();
		}
		function fn_reportPop(){
			if(${sessionScope.member.MEMBERID!=null}){
				var url="${path}/sell/sellReport";
				var name="판매글 신고";			
				window.open("${path}/sell/sellReport?sellWriter=${detailList.get(0).MEMBERID}&&sellno=${detailList.get(0).SELLNO}",name,'width=490, height=300, menubar=no, status=no, toolbar=no');
			}else{
				alert('로그인 후 이용해 주세요 ');
				location.href="${path}/member/memberLogin.do";
			}
			
		}
	</script>
</body>
</html>