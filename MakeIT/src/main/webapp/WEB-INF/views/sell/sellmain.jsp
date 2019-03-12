
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
   <c:set var="path" value="${pageContext.request.contextPath}"/>
   <%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매페이지</title>

   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sellmain/sellmain.css" />
<style>
.hide
{
   display:none;
}

</style>
</head>
<body>
<script>

    $(document).on("click",".sell-page",function(){
    	var cPage=$(this).children('.nextNum').val();
    	console.log(cPage);
    	console.log($("#gradeValue").val()+"셀그레이드!!!")
    	if($("#newValue").val()=='1'){
    	$.ajax({
     		url:"${path}/sell/sellNewChange.do",
     		data:{
     			"cPage":cPage
     		},
            dataType:"html",
               success:function(data){                        	          	  
            	   $("#nav-home").html(data);             	
               }
     		});
    	}else if($("#gradeValue").val()=='1'){
    		$.ajax({
         		url:"${path}/sell/sellGradeChange.do",
         		data:{
         			"cPage":cPage
         		},
                dataType:"html",
                   success:function(data){                        	          	  
                	   $("#nav-profile").html(data);             	
                   }
         		});
    	}else if ($("#sellValue").val()=='1'){  
    		$.ajax({
         		url:"${path}/sell/sellSellChange.do",
         		data:{
         			"cPage":cPage
         		},
                dataType:"html",
                   success:function(data){                        	          	  
                	   $("#nav-contact").html(data);             	
                   }
         		});
    	}
    });

   
    
    $(document).ready(function(){
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
          
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }

        });        		        

    });
    
    function fn_changeCategory(bCtgr, sCtgr)
    {

       var url="${path}/sell/sellMain.do";
      
      pageFrm.bCategoryFlag.value=bCtgr;
      pageFrm.sCategoryFlag.value=sCtgr;
      
      pageFrm.action=url;
      pageFrm.method="post";
      pageFrm.submit();

    }
    
    
</script>
<form action="" name="pageFrm">

   <input type="hidden" name="bCategoryFlag" value="1"/>
   <input type="hidden" name="sCategoryFlag" value=""/>
   <input type="hidden" name="sortFlag" value="1"/>
</form>
<input type="hidden" id="newValue" value="1">
<input type="hidden" id="gradeValue" value="0">
<input type="hidden" id="sellValue" value="0">
   <div class='row'>
      <div class='col-md-1'></div>
      <div class='col-md-10'>
         <div class='row'>               
            <div class='col-md-2 col-xs-2'>

               <!-- 네비 사이드 -->
               
                    <div class="nav-side-menu">
                        <div class="brand">Brand Logo</div>
                        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                        <div >
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

                              </ul>
                        </li>
                   </ul>
                        </div>
                    </div>
                   
                   <!-- 네비 사이드 끝 -->
                   
            </div>
            
            <!-- 앨범뷰 -->
            
            <div class='col-md-10 col-xs-10' style='position:relative; min-width: 400px'>               
               
               <!-- 앨범 뷰 상단 탭 -->
                            
               <nav>
                  <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">

                       <a class="nav-item nav-link active" id="nav-home-tab" onclick="fn_valueChangeNew();" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">신규등록</a>
                     <a class="nav-item nav-link" id="nav-profile-tab" onclick="fn_valueChangeGrade();" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">등급별</a>
                     <a class="nav-item nav-link" id="nav-contact-tab"  onclick="fn_valueChangePerformance();" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">실적별</a>                      

                  </div>
               </nav>
               <script>
               function fn_valueChangeNew()
               {
            	   var pageBarCon="";
             	   var html ="";                   	   
            	    $.ajax({
                 		url:"${path}/sell/sellNewChange.do",                  		
                        dataType:"html",
                           success:function(data){                        	  
                        	  html+=data;                        	  
                        	   $("#nav-home").html(html);                        
                           }
                 		});    
            	    $("#newValue").attr("value","1");
            	    $("#gradeValue").attr("value","0");
            	    $("#sellValue").attr("value","0");
               } 
              function fn_valueChangeGrade()
               {
            	   var pageBarCon="";
             	   var html ="";                   	  
            	    $.ajax({
                 		url:"${path}/sell/sellGradeChange.do",                  		
                        dataType:"html",
                           success:function(data){                        	  
                        	  html+=data;                        	  
                        	   $("#nav-profile").html(html);                        
                           }
                 		});
            	    $("#newValue").attr("value","0");
            	    $("#gradeValue").attr("value","1");
            	    $("#sellValue").attr("value","0");
               } 
               function fn_valueChangePerformance()
               {
            	   var pageBarCon="";
             	   var html ="";                   	  
            	    $.ajax({
                 		url:"${path}/sell/sellSellChange.do",                  		
                        dataType:"html",
                           success:function(data){                        	  
                        	  html+=data;                        	  
                        	   $("#nav-contact").html(html);                        
                           }
                 		});
            	    $("#newValue").attr("value","0");
            	    $("#gradeValue").attr("value","0");
            	    $("#sellValue").attr("value","1");
               } 
              
               </script>
               <!-- 엘범 뷰 상단 탭 끝 -->
               
                
               <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" style='border-top:2px solid #337ab7;'>
                  
                  <!-- 앨범 뷰 탭 컨텐츠1 -->
                  
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                     
                      <!-- 앨범 뷰 상단 네비 -->
                      
                      <div class='row'>
                           <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                             </ul>
                             <div style="margin-right:0;">
                                <form class="form-inline my-2 my-lg-0">
                                      <i class='fa fa-search'></i>&nbsp;
                                   <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                                   <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                               </form>
                            </div>
                        </nav>
                     </div>
                     
                     <!-- 앨범 뷰 상단 네비 끝 -->
                     
                     <div class="container mt-40">                              
                        <h3 class="text-center">신규등록</h3>
                           <div class="row mt-30">                                                   
                           	  
                              <c:forEach items="${newList}" var="newList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <div id="${newList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${newList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/imageDiv.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                
                                                               var imgReName=data["sellImgRe"];
                                                               var imgContainer=$('#${newList.SELLNO}');
                                                               imgContainer.append("<img src='${path}/resources/upload/sell/"+data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");
                                                      
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>                                       	
                                       </div>
                                       <div class="box-content">
                                            <h3 class="title">${newList.MEMBERID}</h3>                                                                                      
                                           <p class="description">
                                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad adipisci pariatur qui.
                                           </p>
                                           <ul class="icon">
                                               <li><a href="#" class="fa fa-search"></a></li>
                                               <li><a href="#" class="fa fa-link"></a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <div class='sub-description'>
                                      <div style='float:left;'>
                                           <p>${newList.SELLTITLE}</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <div id="price${newList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${newList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/sellprice.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                
                                                               var sellPrice=data["sellPrice"];
                                                               var priceContainer=$('#price${newList.SELLNO}');
                                                               priceContainer.append("<p>최저가:"+sellPrice+"</p>")                                                               
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>
                                         
                                       </div>
                                        <p id="gradep">등급: ${newList.GRADENAME} </p>
                                      </div>                                       
                                   </div>
                               </div>
                                </c:forEach>
                                 
                            </div>                              
                       </div>
                         <div id="pageBarCon">                   
                         ${pageBar}
                        </div>
                       
                  </div>
                  
                  <!-- 앨범 뷰 텝 컨탠츠1 끝 -->
                  
                  <!-- 앨범 뷰 텝 컨탠츠2 -->
                  
                  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                     <div class='row'>
                        <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                             </ul>
                             <div style="margin-right:0;">
                                <form class="form-inline my-2 my-lg-0">
                                 <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                                 <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                               </form>
                            </div>
                        </nav>
                     </div>
                     <div class="container mt-40">
                         
                           <h3 class="text-center">등급별</h3>
                           <div class="row mt-30">                             
                              <c:forEach items="${gradeList}" var="gradeList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <div id="grade${gradeList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${gradeList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/imageDiv.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                

                                                               var imgContainer=$('#grade${gradeList.SELLNO}');
                                                               imgContainer.append("<img src='${path}/resources/upload/sell/"+data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");
                                                      
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>                                       	
                                       </div>
                                       <div class="box-content">
                                            <h3 class="title">${gradeList.MEMBERID}</h3>                                                                                      
                                           <p class="description">
                                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad adipisci pariatur qui.
                                           </p>
                                           <ul class="icon">
                                               <li><a href="#" class="fa fa-search"></a></li>
                                               <li><a href="#" class="fa fa-link"></a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <div class='sub-description'>
                                      <div style='float:left;'>
                                           <p>${gradeList.SELLTITLE}</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <div id="gradeprice${gradeList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${gradeList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/sellprice.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                
                                                               var sellPrice=data["sellPrice"];
                                                               var priceContainer=$('#gradeprice${gradeList.SELLNO}');
                                                               priceContainer.append("<p>최저가:"+sellPrice+"</p>")                                                               
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>
                                         
                                       </div>
                                        <p id="gradep">등급: ${gradeList.GRADENAME} </p>
                                      </div>                                       
                                   </div>
                               </div>
                                </c:forEach>
                           
                           </div>
                             
                       </div>
                        ${pageBar2}
                  </div>
                  
                  <!-- 앨범 뷰 텝 컨탠츠2 끝 -->
                  
                   <!-- 앨범 뷰 텝 컨텐츠 3 -->
                  
                  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                     <div class='row'>
                        <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                             </ul>
                             <div style="margin-right:0;">
                                <form class="form-inline my-2 my-lg-0">
                                 <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                                 <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                               </form>
                            </div>
                        </nav>
                     </div>
                     <div class="container mt-40">                            
                          <h3 class="text-center">실적별</h3>
                           <div class="row mt-30">                             
                              <c:forEach items="${performanceList}" var="performanceList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <div id="performance${performanceList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${performanceList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/imageDiv.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                

                                                               var imgContainer=$('#performance${performanceList.SELLNO}');
                                                               imgContainer.append("<img src='${path}/resources/upload/sell/"+data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");
                                                      
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>                                       	
                                       </div>
                                       <div class="box-content">
                                            <h3 class="title">${performanceList.MEMBERID}</h3>                                                                                      
                                           <p class="description">
                                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad adipisci pariatur qui.
                                           </p>
                                           <ul class="icon">
                                               <li><a href="#" class="fa fa-search"></a></li>
                                               <li><a href="#" class="fa fa-link"></a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <div class='sub-description'>
                                      <div style='float:left;'>
                                           <p>${performanceList.SELLTITLE}</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <div id="gradeprice${performanceList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${performanceList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/sellprice.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                
                                                               var sellPrice=data["sellPrice"];
                                                               var priceContainer=$('#performanceList${performanceList.SELLNO}');
                                                               priceContainer.append("<p>최저가:"+sellPrice+"</p>")                                                               
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>
                                         
                                       </div>
                                        <p id="performancep">등급: ${performanceList.GRADENAME} </p>
                                      </div>                                       
                                   </div>
                               </div>
                                </c:forEach>
                           
                           </div>
                             
                       </div>
                      
                  </div>
                                                                    
         </div>            
      </div>               
   </div>
   <div class='col-md-1'>
      
   </div>
<script>
function fn_newsellpost(){
   location.href="${path}/sellmain/newsellpost.do"
}
</script>
</body>
</html>