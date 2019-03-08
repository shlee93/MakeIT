
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
<title>구매페이지</title>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/buymain/buymain.css" />
<style>
.hide
{
   display:none;
}

</style>
</head>
<body >
<script>
   
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
</script>
<form action="" name="pageFrm">
	<input type="hidden" name="categoryFlag"/>
	<input type="hidden" name="sortFlag"/>
</form>
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
                                  <li>웹</li>
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
                     <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">실적별</a>
                     <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">등급별</a>
                     <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">신규등록</a>                     
                  </div>
               </nav>
               
               <!-- 엘범 뷰 상단 탭 끝 -->
               
                
               <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" style='border-top:2px solid #337ab7;'>
                  
                  <!-- 앨범 뷰 탭 컨텐츠1 -->
                  
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                     
                      <!-- 앨범 뷰 상단 네비 -->
                      
                      <div class='row'>
                        <nav class="nav" style="width: 100%;">                
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                               <li class="nav__link"><a href="#">Team</a></li>
                               <li class="nav__link"><a href="#">Work</a></li>
                               <li class="nav__link"><a href="#">Contact</a></li>
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
                          
                        <h3 class="text-center">실적별</h3>
                           <div class="row mt-30">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Williamson</h3>
                                           <span class="post">Web Developer</span>
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
                                           <p>asdfdsfsdfasdfasdfasdfad</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsad
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHelJu84DeOFYM_f_HuWC_dVEoYwyqW3z1Tdz6xeYYmzTGS6Q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsadadsfasdfasdfsadfsadfsdafsdafasdfasdf
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                            </div>                              
                       </div>
                  </div>
                  
                  <!-- 앨범 뷰 텝 컨탠츠1 끝 -->
                  
                  <!-- 앨범 뷰 텝 컨탠츠2 -->
                  
                  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                     <div class='row'>
                        <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                               <li class="nav__link"><a href="#">Team</a></li>
                               <li class="nav__link"><a href="#">Work</a></li>
                               <li class="nav__link"><a href="#">Contact</a></li>
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
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Williamson</h3>
                                           <span class="post">Web Developer</span>
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
                                        asdfdsfsdfasdfsad
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsad
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHelJu84DeOFYM_f_HuWC_dVEoYwyqW3z1Tdz6xeYYmzTGS6Q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsadadsfasdfasdfsadfsadfsdafsdafasdfasdf
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>                                  
                           </div>
                       </div>
                  </div>
                  
                  <!-- 앨범 뷰 텝 컨탠츠2 끝 -->
                  
                   <!-- 앨범 뷰 텝 컨텐츠 3 -->
                  
                  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                     <div class='row'>
                        <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                               <li class="nav__link"><a href="#">Team</a></li>
                               <li class="nav__link"><a href="#">Work</a></li>
                               <li class="nav__link"><a href="#">Contact</a></li>
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
                           <h3 class="text-center">신규등록</h3>
                           <div class="row mt-30">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHelJu84DeOFYM_f_HuWC_dVEoYwyqW3z1Tdz6xeYYmzTGS6Q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Williamson</h3>
                                           <span class="post">Web Developer</span>
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
                                        asdfdsfsdfasdfsad
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsad
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <img src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg" style='width: 100%; height: 200px;'>
                                       <div class="box-content">
                                           <h3 class="title">Kristiana</h3>
                                           <span class="post">Web Designer</span>
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
                                        asdfdsfsdfasdfsadadsfasdfasdfsadfsadfsdafsdafasdfasdf
                                      <div class='infobox' style='float:right;'>
                                         <p>단가: 100000</p>
                                         <p>등급: 280000</p>
                                      </div>                                       
                                   </div>
                               </div>
                            </div>   
                       </div>
                  </div>
                  
                  <!-- 앨범 뷰 텝 컨텐츠 3끝 -->
                                    
               </div>
               
               <!-- 페이지네이션 -->
               <div class="container">
                 <ul class="pagination" style='justify-content:center;'>
                   <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                   <li class="page-item"><a class="page-link" href="#">1</a></li>
                   <li class="page-item active"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item"><a class="page-link" href="#">Next</a></li>
                 </ul>
               </div>      
            </div>
            
            <!-- 앨범뷰 끝 -->
                                                                    
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