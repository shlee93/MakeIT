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
		/* 어드민 네비 */

      #nav{
          padding-left: 0;
      }
      
      .nav-side-menu {
          overflow: auto;
          font-size: 0.9em;
          font-weight: 550;
          background-color: #2e353d;
          position: fixed;
          top: 0px;
          width: 14%;
          height: 100%;
          color: #e1ffff;
      }
      .nav-side-menu .brand {
          background-color: #23282e;
          line-height: 50px;
          display: block;
          text-align: center;
          font-size: 1em;
      }
      .nav-side-menu .toggle-btn {
          display: none;
      }
      .nav-side-menu ul,
      .nav-side-menu li {
          list-style: none;
          margin: 0px;
          line-height: 3.5em;
          cursor: pointer;
      }
      .nav-side-menu ul :not(collapsed) .arrow:before,
      .nav-side-menu li :not(collapsed) .arrow:before {
          display: inline-block;
          padding-left: 10px;
          padding-right: 10px;
          vertical-align: middle;
      }
      .nav-side-menu ul .active,
      .nav-side-menu li .active {
          border-left: 3px solid #c8d8a8;
          background-color: #4f5b69;
      }
      .nav-side-menu ul .sub-menu li.active,
      .nav-side-menu li .sub-menu li.active {
          color: #c8d8a8;
          
      }
      .nav-side-menu ul .sub-menu li.active a,
      .nav-side-menu li .sub-menu li.active a {
          color: #c8d8a8;
      
      }
      .nav-side-menu ul .sub-menu li,
      .nav-side-menu li .sub-menu li {
          background-color: #181c20;
          border: none;
          line-height: 28px;
          border-bottom: 1px solid #23282e;
          margin-left: 0px;
      }
      .nav-side-menu ul .sub-menu li:hover,
      .nav-side-menu li .sub-menu li:hover {
          background-color: #020203;
      }
      .nav-side-menu ul .sub-menu li:before,
      .nav-side-menu li .sub-menu li:before {
          display: inline-block;
          padding-left: 10px;
          padding-right: 10px;
          vertical-align: middle;
      }
      .nav-side-menu li {
          padding-left: 0.8em;
          border-left: 3px solid #2e353d;
          border-bottom: 1px solid #23282e;
      }
      .nav-side-menu li a {
          text-decoration: none;
          color: #e1ffff;
      }
      .nav-side-menu li a i {
          width: 20px;
          padding-right: 20px;
      }
      .nav-side-menu li:hover {
          border-left: 3px solid #c8d8a8;
          background-color: #4f5b69;
          -webkit-transition: all 1s ease;
          -moz-transition: all 1s ease;
          -o-transition: all 1s ease;
          -ms-transition: all 1s ease;
          transition: all 1s ease;
      }
      
      @media (max-width: 767px) 
      {
          .nav-side-menu 
          {
              position: relative;
              width: 100%;
              margin-bottom: 10px;
          }   
          
          .nav-side-menu .toggle-btn 
          {
              display: block;
              cursor: pointer;
              position: absolute;
              right: 10px;
              top: 10px;
              z-index: 10 !important;
              padding: 3px;
              background-color: #ffffff;
              color: #000;
              width: 40px;
              text-align: center;
          }
      } 
		
	</style>

</head>
<body>
 	<div id="total" style='padding:1.1em;'>
  		<div class='row'>
       		<div class='col-md-1' id='nav'></div>
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
        </div>
    </div>       
</body>
</html>