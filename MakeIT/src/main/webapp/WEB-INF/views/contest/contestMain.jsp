<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/buywrite/buywrite.css" />
	<style>
		
	</style>

</head>
<<<<<<< HEAD
<body>
 	<div id="total" style='padding:1.1em;'>
=======
 <body>
 	<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="HelloSpring" name="pageTitle"/>
	</jsp:include> --%>
 	
 	<div class='container-fluid' id="total">
>>>>>>> refs/remotes/origin/JCH
  		<div class='row'>
       		<div class='col-md-1' id='nav'></div>
<<<<<<< HEAD
				<div class='col-md-10'>
					<div class='row'>
						<div class='col-md-2'>
							<div class="nav-side-menu">
		                        <div class="brand">Brand Logo</div>
		                        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
		                        <div>
		                            <ul>
		                          		<li class="menu">
		                             		<a href="#">
		                                       <i class="fas fa-cogs"></i> &nbsp;개발자 
		                                    </a>
				                            <ul class="hide">
			                                   <li onclick="fn_changeCtgr">웹</li>
			                                   <li>모바일</li>
			                                   <li>게임</li>
			                                   <li>응용프로그램</li>
			                                   <li>보안프로그램</li>
			                                   <li>DB관리</li>
				                            </ul>
				                        </li>
				                        <li class="menu">
				                            <a href="#">
		                                        <i class="fas fa-pen-fancy"></i> &nbsp;웹 디자이너 
		                                    </a>
				                            <ul class="hide">
			                                    <li>웹 디자인</li>
			                                    <li>웹 퍼블리셔</li>
			                                    <li>게임 디자인</li>
				                            </ul>
				                        </li>
				                        <li class="menu">
				                            <a href="#">
				                                <i class="fas fa-shield-alt"></i> &nbsp;네트워크보안
				                            </a>
			                                <ul class="hide">
			                                    <li>모의해킹</li>
			                                    <li>침해대응</li>
			                                    <li>보안관제</li>
			                                    <li>컨설턴트</li>
			                                    <li><c:out value="${gradeList.INTERESTNO }"/></li>
			                                </ul>
				                        </li>
		                            </ul>
		                        </div>
		                    </div>
		                    <script>
			                    $(document).ready(function(){
	         
							       pageFrm.bCategoryFlag.value="${bCategoryFlag}";
							       pageFrm.sCategoryFlag.value="${sCategoryFlag}";
							       pageFrm.sortFlag.value="${sortFlag}";
							       
							        $(".menu>a").click(function(){
							            var submenu = $(this).next("ul");
							 
							          
							            if( submenu.is(":visible") ){
							                submenu.slideUp();
							            }else{
							                submenu.slideDown();
							            }
							        });
							        
							        $("")
							        
							    });
		                    </script>
						</div>
		            	<div class='col-md-10' id='section'>
		                	<div class="row">
		                		<div class="col-md-2">
			                  		<select class="form-control" id='interestNo' name='interestNo'>
			                    		<option>카테고리</option>
					        			<option value='1'>개발자</option>
					        			<option value='2'>웹디자이너</option>
					        			<option value='3'>네트워크보안</option> 
			                  		</select>
			                	</div>
			                	<div class="col-md-2">
			                    	<select class="form-control" id='detailInterestNo' name='detailInterestNo'>
			                    
			                    	</select>
			                	</div>
			                	<script>
						       		$(function()
					      			{
					            		$("#interestNo").change(function()
					       				{				           				
					           				if(this.value!='카테고리')
					       					{
				            					$.ajax(
		            							{
						            				url:"${path}/categoryOneSel.do",
						            	            data:{"interestNo":this.value},
						            				dataType:"json",
						            	            success:function(data)
						            	            {
						            	               console.log(data);
						            	               var detailInterest=$('#detailInterestNo');
							            	               
					            	               	   for(var i=0; i<data.length; i++)
					            	            	   {
						            	            	   	   
					           	            		   	   optionValue='DETAILINTEREST';
					           	            			   optionInter='DETAILINTERESTNO';
					          	            	   	   	   	   
					           	            	           var option
					           	            	           option+="<option value='"+data[i][optionInter]+"'>"+data[i][optionValue]+"</option>";
					           	            			   
					               	            	   	   detailInterest.html(option);
						            	            		   
					       		   	            	    }
						            	            }
						            			});
					       					 }
					       				 })
					           		 });
					        	</script>
				                <div class="col-md-6"></div>
				                <div class="col-md-2">
				                    <select class="form-control">
				                        <option >정렬방식</option>
				                    </select>
				                </div>
			              </div>
			              <c:forEach items="${contestList}" var="contest">
			              
			              <div class="card" id="contestMain" style='margin-top:2em; margin-bottom:2em; padding: 1em;'>
			                <div class="row ">
			                  <div class="col-md-2" id="${contest.CONTESTNO}" class='imgContainer'>
			                  	  <script>
				                  	  $(function()
						      			{
				                  		  	var contestNo=${contest.CONTESTNO};
				            				$.ajax({
					            				url:"${path}/contest/contestPerFirstImg.do",
					            	            data:{"contestNo": contestNo},
					            				dataType:"json",
					            	            success:function(data)
					            	            {
					            	               console.log(data["contestImgRe"]);
					            	               
					            	               var imgReName=data["contestImgRe"];
					            	               var imgContainer=$('#${contest.CONTESTNO}');
					            	               imgContainer.append("<img src='${path}/resources/upload/contest/"+data["contestImgRe"]+ "' class='w-100' style='max-height: 240px'>");
					            	            }
					            			});			       					    		
						      			 });	
			               	  	</script>
			                  </div>
			                  <div class="col-md-7 ">
			                    <div class="card-block px-3">
			                      <div class="row" style='margin-top:1.2em;'>
			                        <h2 class="card-title">${contest.CONTESTTITLE} </h2>
			                      </div>
			                      <div class="row">
			                        <div class="col-md-12" id="contestdetail"  >
			                            <h4>${contest.MEMBERNAME }</h4>
			                            <p class="card-text" style="overflow: hidden">${contest.CONTESTCONTENT }</p>
			                        </div>
			                        
			                      </div>
			                    </div>
			                  </div>
			                  <div class="col-md-3">
			                    <div class="form-control righthandle" style='margin-top: 1.1em'>
			                      <strong>상금</strong>
			                      <span>${contest.CONTESTPRICE}</span>
			                    </div>
			                    <div class="form-control righthandle" style='margin-top: 1.1em'>
			                        <strong>기한</strong>
			                        <span>${contest.CONTESTDATE} ~ ${contest.CONTESTDEADLINE}</span>
			                    </div>    
			                    <div class="form-control righthandle" style='margin-top: 1.1em'>
			                        <strong>현재 참여자</strong>
			                        <span>00명</span>
			                    </div>                           
			                    <div class="row">
			                      <div class="col-md-12">
			                        <a href="${path}/contest/contestDetail.do?contestNo=${contest.CONTESTNO}" class="btn btn-primary garo-center" style="width: 80%; height:100%; margin-top: 1.1em; margin-bottom:1.1em; margin-left:3.4em ;">상세보기</a>    
			                      </div>
			                    </div>
			                  </div>
			          
			                  </div>
			              </div>
			       		  </c:forEach>	
			       		  <div style='margin-bottom:3em;'>
				              <input type="text" class='form-control' placeholder="검색할 아이디를 입력하세요" style='width: 300px; display: inline;'/>
				              <button class="btn btn-primary" type="submit" style='margin-bottom: 0.3em'>검색</button>
			              </div>
			              ${pageBar}
			    
			            
			                
		            	</div>
		            <div class='col-md-1' id='right-nav' >
		               
		                      
	            	</div>		            
		        </div>   	
	        </div>    
=======

            <div class='col-md-10' id='section' >
              <div class="row">
                <div class="col-md-2">
                  <select class="form-control">
                      <option >상위 카테고리</option>
                  </select>
                </div>
                <div class="col-md-2">
                    <select class="form-control">
                        <option >하위 카테고리</option>
                    </select>
                </div>
                <div class="col-md-6"></div>
                <div class="col-md-2">
                    <select class="form-control">
                        <option >정렬방식</option>
                    </select>
                </div>
              </div>
              <div class="card" id="contestMain">
                <div class="row ">
                  <div class="col-md-2" id="imgContainer">
                      <img id="contestimg" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3" class="w-100">
                    </div>
                    <div class="col-md-7 ">
                      <div class="card-block px-3">
                        <div class="row">
                          <h2 class="card-title">콘테스트 이름을 작성해요 </h4>
                        </div>
                        <div class="row">
                          <div class="col-md-12" id="contestdetail"  >
                              <h4>회사이름</h4>
                              <p class="card-text" style="overflow: hidden">상세설명 적는곳 Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.</p>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-control righthandle">
                          <strong>상금</strong>
                          <span>50000만원</span>
                        </div>
                        <div class="form-control righthandle">
                            <strong>기한</strong>
                            <span>2019/03/04</span>
                        </div>    
                        <div class="form-control righthandle">
                            <strong>현재 참여자</strong>
                            <span>00명</span>
                        </div>                           
                          <div class="row">
                            <div class="col-md-12">
                              <a href="#" class="btn btn-primary" style="width: 80%; margin-left:5% ;">상세보기</a>    
                            </div>
                          </div>
                      </div>
          
                  </div>
              </div>
       
              <input type="text" name="searchKeyword" size="25" placeholder="검색할 아이디를 입력하세요" />
              <button class="btn btn-primary" type="submit">검색</button>  
    
            
                
            </div>
            <div class='col-md-1' id='right-nav' >
               
                      
            </div>
            
>>>>>>> refs/remotes/origin/JCH
        </div>
    </div>       
</body>
</html>