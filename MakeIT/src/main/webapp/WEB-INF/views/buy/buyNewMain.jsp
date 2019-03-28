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
                               <li class="nav__link"><button class="btn btn-outline-info slidetopleft" onclick="location.href='${path }/buy/buyWrite.do'">새 글 작성</button></li>
                             </ul>
                        </nav>
                     </div>
                     
                     <!-- 앨범 뷰 상단 네비 끝 -->
                     
                     <div class="container mt-40">                              
                        <h3 class="text-center" style="font-family: 'Sunflower', sans-serif;">신규등록</h3>
                           <div class="row mt-30">                                                                              	  
                              <c:forEach items="${newList}" var="newList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                   
                                       <div id="${newList.BUYNO}">
											<script>
												$(function() {
													var buyNo = ${newList.BUYNO};
													$.ajax({
														url : "${path}/imageDiv2.do",
														data : {
															"buyNo" : buyNo
														},
														dataType : "json",
														success : function(data) {

															var imgReName = data["buyImgRe"];
															var imgContainer = $('#${newList.BUYNO}');
															imgContainer.append("<img src='${path}/resources/upload/buy/"+ data["buyImgRe"]+ "' style='width: 100%; height: 200px;cursor:pointer;' onclick='fn_detailView(${newList.BUYNO})'>");

														}
													});
												});
												function fn_detailView(buyNo)
												{
													location.href="${path}/buy/buyDetail?buyNo="+buyNo;
												}
											</script>
										</div>
                                       <div class="box-content" onclick="fn_detailView(${newList.BUYNO})">
                                            <h3 class="title">${newList.MEMBERID}</h3>                                                                                      
                                           <p class="description">${newList.INTRODUCTION } </p>
                                       </div>
                                   </div>
                                   <div class='sub-description'>											
														
										<div class='infobox' style='margin-left: 1.2em;'>
											<div style='width: 90%; height: 40px; overflow:hidden;'>
												<h6>${newList.BUYTITLE}</h6>
											</div>
											<div class='row'>
												<div class='col-md-7' id="price">
													<h6 style='position:relative; top:33%'>가격: ${newList.BUYPRICE }</h6>
												</div>
												<div class='col-md-5' style='float:right'>
													<p id="gradep">
													  <c:if test="${newList.GRADENAME == '브론즈' }">
				                                 	  <p style='display: inline;'><img alt="" src="${path }/resources/image/bronzeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
						                              </c:if>
						                              <c:if test="${newList.GRADENAME == '실버' }">
						                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/silverGrade.png" style="max-width: 50px;max-height: 50px;"></p>
						                              </c:if>
						                              <c:if test="${newList.GRADENAME == '골드' }">
						                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/goldGrade.png" style="max-width: 50px;max-height: 50px;"></p>
						                              </c:if>
						                              <c:if test="${newList.GRADENAME == '플래티넘' }">
						                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/platinumGrade.png" style="max-width: 50px;max-height: 50px;"></p>
						                              </c:if>
						                              <c:if test="${newList.GRADENAME == '다이아' }">
						                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/diamodeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
						                              </c:if>
													<%-- ${newList.GRADENAME} --%>
													</p>
												</div>
											</div>
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


