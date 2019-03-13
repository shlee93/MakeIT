<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                     
                      <!-- 앨범 뷰 상단 네비 -->
                      
                      <div class='row'>
                           <nav class="nav" style="width: 100%;">                                
                                  
                             <ul class="nav__link-wrapper">
                               <li class="nav__link"><a href="#">새 글 작성</a></li>
                             </ul>
                             <!-- <div style="margin-right:0;">
                                <form class="form-inline my-2 my-lg-0">
                                      <i class='fa fa-search'></i>&nbsp;
                                        <select id="searchtype"name="searchtype" class="form-control">
  										<option value='title'>제목</option>
  										<option value='writer'>작성자</option>                                 
                                   </select>
                                   <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                                   <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                               </form>
                            </div> -->
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
                                                               imgContainer.append("<a href='${path}/sell/selldetail?"+${newList.SELLNO}+"'><img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+"'style='width:100%;height:200px'></a>");
                                                      
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


