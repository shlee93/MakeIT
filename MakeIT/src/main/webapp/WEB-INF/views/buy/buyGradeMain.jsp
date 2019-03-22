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
                               <li class="nav__link"><a href="${path }/buy/buyWrite.do">새 글 작성</a></li>
                             </ul>
                        </nav>
                     </div>
                     <div class="container mt-40">
                         
                           <h3 class="text-center" style="font-family: 'Sunflower', sans-serif;">등급별</h3>
                           <div class="row mt-30">                                                                              	  
                              <c:forEach items="${gradeList}" var="gradeList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                   
                                       <div id="grade${gradeList.BUYNO}">
											<script>
												$(function() {
													var buyNo = ${gradeList.BUYNO};
													$.ajax({
														url : "${path}/imageDiv2.do",
														data : {
															"buyNo" : buyNo
														},
														dataType : "json",
														success : function(data) {

															var imgReName = data["buyImgRe"];
															var imgContainer = $('#grade${gradeList.BUYNO}');
															var url = "location.href='${path}/buy/buyDetail'";
															imgContainer.append("<img src='${path}/resources/upload/buy/"+ data["buyImgRe"]+ "' style='width: 100%; height: 200px; cursor:pointer;' onclick='fn_detailView(${gradeList.BUYNO})'>");

														}
													});
												});
												function fn_detailView(buyNo)
												{
													location.href="${path}/buy/buyDetail?buyNo="+buyNo;
												}
											</script>
										</div>
                                       <div class="box-content" onclick="fn_detailView(${gradeList.BUYNO})">
                                            <h3 class="title">${gradeList.MEMBERID}</h3>                                                                                      
                                           <p class="description">${gradeList.INTRODUCTION } </p>
                                       </div>
                                   </div>
                                   <div class='sub-description'>
                                      <div style='float:left;'>
                                           <p>${gradeList.BUYTITLE}</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <div id="price">
                                         	<p>가격:${gradeList.BUYPRICE }</p>
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