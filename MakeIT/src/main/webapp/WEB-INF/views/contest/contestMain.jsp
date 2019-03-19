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

	  .hide
	  {
	  	  display: none;
	  }

      /* 네비 사이드 */    

      .nav-side-menu 
      {
          overflow: auto;
          font-family: verdana;
          font-size: 20px;
          font-weight: 200;
          background-color: #2e353d;
          position: relative;
          top: 0px;
          width: 100%;
          height: 100%;
          color: #e1ffff;
      }
      
      .nav-side-menu .brand 
      {
          background-color: #23282e;
          line-height: 50px;
          display: block;
          text-align: center;
          font-size: 14px;
      }
      
      .nav-side-menu .toggle-btn 
      {
          display: none;
      }
      
      .nav-side-menu ul,      
      .nav-side-menu li 
      {
          list-style: none;
          padding: 0px;
          margin: 0px;
          line-height: 35px;
          cursor: pointer;
          /*    
            .collapsed{
               .arrow:before{
                         font-family: FontAwesome;
                         content: "\f053";
                         display: inline-block;
                         padding-left:10px;
                         padding-right: 10px;
                         vertical-align: middle;
                         float:right;
                    }
             }
          */
      }
      
      .nav-side-menu ul :not(collapsed) .arrow:before,
      .nav-side-menu li :not(collapsed) .arrow:before 
      {
          font-family: FontAwesome;
          content: "\f078";
          display: inline-block;
          padding-left: 10px;
          padding-right: 10px;
          vertical-align: middle;
          float: right;
      }
      
      .nav-side-menu ul .active,
      .nav-side-menu li .active 
      {
          border-left: 3px solid #d19b3d;
          /* background-color: blue; */
      }
      
      .nav-side-menu ul .sub-menu li.active,
      .nav-side-menu li .sub-menu li.active 
      {
          color: #d19b3d;
      }
      
      .nav-side-menu ul .sub-menu li.active a,
      .nav-side-menu li .sub-menu li.active a 
      {
          color: #d19b3d;
      }
      
      .nav-side-menu ul .sub-menu li,
      .nav-side-menu li .sub-menu li 
      {
          background-color: #181c20;
          border: none;
          line-height: 28px;
          border-bottom: 1px solid #23282e;
          margin-left: 0px;
      }
      
      .nav-side-menu ul .sub-menu li:hover,
      .nav-side-menu li .sub-menu li:hover 
      {
          background-color: #020203;
      }
      
      .nav-side-menu ul .sub-menu li:before,
      .nav-side-menu li .sub-menu li:before 
      {
          font-family: FontAwesome;
          content: "\f105";
          display: inline-block;
          padding-left: 10px;
          padding-right: 10px;
          vertical-align: middle;
      }
      
      .nav-side-menu li 
      {
          padding-left: 0px;
          border-left: 3px solid #2e353d;
          border-bottom: 1px solid #23282e;
      }
      
      .nav-side-menu li a 
      {
          text-decoration: none;
          color: #e1ffff;
      }
      
      .nav-side-menu li a i 
      {
          padding-left: 10px;
          width: 20px;
          padding-right: 20px;
      }
      
      .nav-side-menu li:hover 
      {
          border-left: 3px solid #d19b3d;
          /* background-color: blue; */
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
          
          .brand 
          {
              text-align: left !important;
              font-size: 22px;
              padding-left: 20px;
              line-height: 50px !important;
          }
      }
      
      @media (min-width: 767px) 
      {
          .nav-side-menu .menu-list .menu-content 
          {
              display: block;
          }
      }
      
      .side-nav-li
      {
         font-size: 1.5em;
         margin-top: 2em;
      }
      
      .side-nav-li a
      {
         line-height: 4em;   
      }    
		
	</style>

</head>
<body>
	<form id='sortFrm' action='${path}/contest/sort.do'>
		<input type='hidden' id='interestFlag' name='interestFlag' value='${interestFlag}'/>
		<input type='hidden' id='detailInterestFlag' name='detailInterestFlag' value='${detailInterestFlag }'/>
		<input type='hidden' id='sortTypeFlag' name='sortTypeFlag' value='${sortTypeFlag }'/>
		<input type='hidden' id='searchTypeFlag' name='searchTypeFlag' value='${searchTypeFlag }'/>
		<input type='hidden' id='searchTypeKeyword' name='searchTypeKeyword' value='${searchTypeKeyword }'/>
	</form>
	<div id="total" style='padding:1.1em;'>

 	<div class='container-fluid' id="total">
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
			                                   <li onclick='fn_interest_flag_Search(1)'>웹</li>
			                                   <li onclick='fn_interest_flag_Search(2)'>모바일</li>
			                                   <li onclick='fn_interest_flag_Search(3)'>게임</li>
			                                   <li onclick='fn_interest_flag_Search(4)'>응용프로그램</li>
			                                   <li onclick='fn_interest_flag_Search(5)'>보안프로그램</li>
			                                   <li onclick='fn_interest_flag_Search(6)'>DB관리</li>
				                            </ul>
				                        </li>
				                        <li class="menu">
				                            <a href="#">
		                                        <i class="fas fa-pen-fancy"></i> &nbsp;웹 디자이너 
		                                    </a>
				                            <ul class="hide">
			                                    <li onclick='fn_interest_flag_Search(7)'>웹 디자인</li>
			                                    <li onclick='fn_interest_flag_Search(8)'>웹 퍼블리셔</li>
			                                    <li onclick='fn_interest_flag_Search(9)'>게임 디자인</li>
				                            </ul>
				                        </li>
				                        <li class="menu">
				                            <a href="#">
				                                <i class="fas fa-shield-alt"></i> &nbsp;네트워크보안
				                            </a>
			                                <ul class="hide">
			                                    <li onclick='fn_interest_flag_Search(10)'>모의해킹</li>
			                                    <li onclick='fn_interest_flag_Search(11)'>침해대응</li>
			                                    <li onclick='fn_interest_flag_Search(12)'>보안관제</li>
			                                    <li onclick='fn_interest_flag_Search(13)'>컨설턴트</li>			                                    
			                                </ul>
				                        </li>
		                            </ul>
		                            <script>
		                            	function fn_interest_flag_Search(interestFlagNo)
		                            	{
		                            		/* console.log(typeof(interestFlagNo)); */
		                            		if(0<interestFlagNo && interestFlagNo<7 )
	                            			{	
		                            			$('#interestFlag').attr('value',1);
	                            			}
		                            		else if(6<interestFlagNo && interestFlagNo<10)
	                            			{
		                            			$('#interestFlag').attr('value',2);
	                            			}
		                            		else if(9<interestFlagNo && interestFlagNo<14)
	                            			{
		                            			$('#interestFlag').attr('value',3);
	                            			} 
		                            		
		                            		$('#detailInterestFlag').attr('value',interestFlagNo);
		                            		
		                            		console.log($('#detailInterestFlag').val());
		                            		
		                            		$('#sortFrm').submit();
		                            	}
		                            </script>
		                        </div>
		                    </div>
		                    <script>
			                    $(document).ready(function(){
	         
							        $(".menu>a").click(function(){
							            var submenu = $(this).next("ul");
							 			console.log(submenu)
							          
							            if( submenu.is(":visible") ){
							                submenu.slideUp();
							            }else{
							                submenu.slideDown();
							            }
							        });							        
							    });
		                    </script>
						</div>
		            	<div class='col-md-10' id='section'>
	            			<div class='row'>
			       		  	    <div class='col-md-8'>	
					       		    <div style='margin-left:2em;'>
					       		    	<select id='searchTypeSel' class='form-control' style='display:inline; width: 100px;'>
					       		    		<option value=''>검색</option>
					       		    		<option value='title'>제목</option>
					       		    		<option value='name'>주최자</option>
					       		    	</select>
					       		    	<script>
						       		    	$(function()
				       		    			{
						       		    		$('#searchTypeSel').change(function()
						       		    		{
						       		    			$('#searchTypeFlag').attr('value',this.value);
						       		    			/* console.log($('#searchTypeFlag').val()); */
						       		    		})
				       		    			});
					       		    	</script>
						                <input type="text" id='contestKeywordInput' class='form-control' placeholder="검색할 아이디를 입력하세요" style='width: 300px; display: inline;'/>
						                <input class="btn btn-primary" type='button' id='contestSearchBtn' style='margin-bottom: 0.3em' value='검색'/>
						                <script>
						                	$(function()
				                			{
						                		$('#contestSearchBtn').click(function()
				                				{
						                			var keyword=$('#contestKeywordInput').val();
						                			console.log(keyword);
						                			$('#searchTypeKeyword').attr('value',keyword);
						                			$('#sortFrm').submit();
				                				})
						                	});
						                </script>
					                </div>
				                </div>
				                <div class='col-md-2'></div>
				              	<div class='col-md-2'>
			                        <select id='sortTypeSel'class="form-control">
			                            <option value=''>정렬방식</option>
			                            <option value='new'>새글순</option>
			                            <option value='endDate'>마감순</option>
			                            <option value='price'>상금순</option>
			                        </select>
			                        <script>
				                        $(function()
			       		    			{
					       		    		$('#sortTypeSel').change(function()
					       		    		{
					       		    			$('#sortTypeFlag').attr('value',this.value);
					       		    			/* console.log($('#searchTypeFlag').val()); */
					       		    			$('#sortFrm').submit();
					       		    		})
			       		    			});
			                        </script>
				                </div>
			              	</div>	
		                	<div class="row">		                		
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
				                <div class="col-md-2"></div>
			                </div>
			               	<c:forEach items="${contestList}" var="contest">
			              
			              	<div class="card" id="contestMain" style='margin-top:1em; margin-left:2em; margin-bottom:2em; padding: 1em;'>
			                  	<div class="row ">
			                  	<div class="col-md-3" id="${contest.CONTESTNO}" class='imgContainer'>
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
				            	               imgContainer.append("<img src='${path}/resources/upload/contest/"+data["contestImgRe"]+ "' class='w-100' style='height:100%'>");
				            	            }
				            			});			       					    		
					      			 });	
			               	  	</script>
			                    </div>
			                    <div class='col-md-9'>
			                       <div class="row" style='margin-top:0.3em;'>
			                       <h5 class="card-title" >컨테스트 제목: ${contest.CONTESTTITLE} </h5>
			                    </div>
			                    <div class='row'>
			                    	<div class='col-md-6'>
			                    		<strong>주최자: ${contest.MEMBERNAME }</strong>
			                            <p class="card-text" style="overflow:auto; height:200px;">${contest.CONTESTCONTENT }</p>
			                    	</div>
			                    	<div class='col-md-6'>
			                    		<div class="form-control righthandle" >
					                        <strong>상금</strong>
					                        <span>${contest.CONTESTPRICE}</span>
					                    </div>
					                    <div class="form-control righthandle" style='margin-top: 1.1em'>
					                        <strong>기한</strong>
					                        <span>${contest.CONTESTDATE} ~ ${contest.CONTESTDEADLINE}</span>
					                    </div>    
					                    <div class="form-control righthandle" style='margin-top: 1.1em'>
					                        <strong>현재 참여자</strong>
					                        <span>${contest.CONTESTAPPLICANTCOUNT}명</span>
					                    </div>                           
					                    <div class="row">
					                        <div class="col-md-12">
					                        	<a href="${path}/contest/contestDetail.do?contestNo=${contest.CONTESTNO}" class="btn btn-primary garo-center" style="width: 100%; height:45%; margin-top: 3em;">상세보기</a>    
					                        </div>
					                    </div>
			                    	 </div>			                   
			                      </div>			                    
			                  </div>
			                  <div class="col-md-4">
			                    
			                  </div>
			          
			                  </div>
			              </div>
			       		  </c:forEach>				       		  	              
			              <div class='row' style='margin-bottom:1em;'>
			              	  <div class='col-md-10'></div>
			              	  <div class='col-md-2'>
			              	  	  <a class="btn btn-primary" style='float:right;'href="${path }/contest/contestWrite.do">글작성</a>
			              	  </div>
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