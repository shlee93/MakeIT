<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


  <div class="tab-pane fade active show" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
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
                     <div class="container mt-40">
                         
                           <h3 class="text-center">등급별</h3>
                           <div class="row mt-30">                             
                              <c:forEach items="${gradeList}" var="gradeList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <div id="grade${gradeList.SELLNO}">
                                       		<script>
                                       		function fn_detailView(sellno)
                                            {
                                               location.href="${path}/sell/selldetail?sellno="+sellno;
                                            }
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
                                                               
                                                               imgContainer.append("<img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+ "' style='width: 100%; height: 200px;cursor:pointer;' onclick='fn_detailView(${gradeList.SELLNO})'>");
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>                                       	
                                       </div>
											<div class="box-content" onclick="location.href='${path}/sell/selldetail?sellno=${gradeList.SELLNO }'">
                                            <h3 class="title">${gradeList.MEMBERID}</h3>                                                                                      
                                           <p class="description">
                                               ${gradeList.INTRODUCTION}
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
                         <div id="pageBarCon">                   
                        	${pageBar}
                        </div>
                  </div>