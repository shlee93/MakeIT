<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/support.css" />
<script src="${pageContext.request.contextPath }/resources/js/support/support.js"></script>
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="true">1:1 문의게시판</a> 
						<a class="nav-item nav-link" id="nav-faq-tab" data-toggle="tab" href="#nav-faq" role="tab" aria-controls="nav-faq" aria-selected="false">FAQ</a> 
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">
						<hr>
						<div class="qna-search">
                            <div id="search-icon"></div>
							<select id="search-filter">
								<option class="search-filter-option" value="QNATITLE" selected>제목</option>
								<option class="search-filter-option" value="MEMBERID">작성자</option>
							</select>
                            <select id="qna-sort">
                            	<option class="qna-sort-option" value="0">질문 유형</option>
                            	<c:if test="${not empty categoryList }">
                            		<c:forEach items="${categoryList }" var="faq">
                            			<option class="qna-sort-option" value="${faq.FAQNACATEGORYNO }">${faq.FAQNACATEGORYNAME }</option>
                            		</c:forEach>
                            	</c:if>
                            	
                            </select>
                            <input id="search-qna" type="text" placeholder="검색 내용을 입력해주세요" size="50"/>
                            
                        </div>
                            <hr>
                        <c:if test="${member.MEMBERLEVEL==0 and not empty qnaList}">
                           	<button id="qna-status" class="btn btn-outline-info slidetopleft">미답변글</button> 
                        </c:if>
                        <c:if test="${not empty member and member.MEMBERLEVEL!=0 and not empty categoryList }">                         	 
							<button class="btn btn-outline-info slidetopleft" id="insert-qna-view">문의하기</button>
                        </c:if>
						<table class="table" id="qna-table" cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>질문 유형</th>
									<th colspan="3">제목</th>
									<th>작성자</th>
									<th>작성 날짜</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty qnaList }">
								<% int i=0; %>
								<c:forEach items="${qnaList }" var="qna">
									<c:choose>
										<c:when test="${qna.QNALEVEL==1}">
											<tr class="qna-question">
												<td><%=i %></td>
												<td>${qna.FAQNACATEGORYNAME }</td>
												<td colspan="3">
													<a class="qna-pass ${sessionScope.member.MEMBERLEVEL==0?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
													<input type="hidden" value="${qna.QNANO }"/>
												</td>
												<td>
													<c:choose>
														<c:when test="${qna.GRADENO==1 }">
															<img class="grade-icon" src="${path }/resources/image/bronzeGrade.png"/>
														</c:when>
														<c:when test="${qna.GRADENO==2 }">
															<img class="grade-icon" src="${path }/resources/image/silverGrade.png"/>
														</c:when>
														<c:when test="${qna.GRADENO==3 }">
															<img class="grade-icon" src="${path }/resources/image/goldGrade.png"/>
														</c:when>
														<c:when test="${qna.GRADENO==4 }">
															<img class="grade-icon" src="${path }/resources/image/platinumGrade.png"/>
														</c:when>
														<c:when test="${qna.GRADENO==5 }">
															<img class="grade-icon" src="${path }/resources/image/diamondGrade.png"/>
														</c:when>
													</c:choose>
													${qna.MEMBERID }
												</td>
												<td>${qna.QNADATE }</td>
											</tr>
											<%i++; %>
										
										</c:when>
										<c:when test="${qna.QNALEVEL==2}">
											<tr class="qna-answer">
												<td><%=i %></td>
												<td></td>
												<td colspan="3">
													&nbsp;&nbsp;→[답변]<a class="qna-title-reple qna-pass ${sessionScope.member.MEMBERLEVEL==0||sessionScope.member.MEMBERID==qna.MEMBERID?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
													<input type="hidden" value="${qna.QNANO }"/>
												</td>
												<td>&nbsp;&nbsp;${qna.MEMBERID }</td>
												<td>&nbsp;&nbsp;${qna.QNADATE }</td>
											</tr>
											<%i++; %>
										</c:when>
										
									</c:choose>
								</c:forEach>
								<tr>
									<td colspan="7">
										${pageBarQna }
									</td>
								</tr>
								
							</c:if>
							<c:if test="${empty qnaList }">
								<tr>
									<td colspan="7">첫 게시물을 등록해주세요!</td>
								</tr>
							</c:if>	
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="nav-faq" role="tabpanel"
						aria-labelledby="nav-faq-tab">
						
						<table class="table" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>FAQ-자주 묻는 질문</th>
                                </tr>
                            </thead>

                        </table>
                        
                        <c:if test="${not empty categoryList }">
                        	<c:forEach items="${categoryList }" var="category">
                         <div class="faq-back">
                             <div class="faq-category btn btn-outline-info slidetopleft">●&nbsp;${category.FAQNACATEGORYNAME }

		                         <button class="faq-slide btn btn-outline-info slidetopleft">▼</button>

                             </div>
                             <div class="faq-list-back">
                                 <ul class="faq-list">
                                 <c:forEach items="${faqList }" var="faq">
                                 	<c:if test="${faq.FAQNACATEGORYNO==category.FAQNACATEGORYNO }">
                                 	
	                                    <li class="faq-question">
	                                    	<textarea cols="65" style="resize:none; border:0;" readonly="readonly">●&nbsp;${faq.FAQTITLE }</textarea>
											
	                                       	<button class="answer-slide">▼</button>
	                                       
	                                       	<hr>
	                                       	<div class="faq-answer">
	                                       		<textarea cols="90" style="resize:none; border:0; width:100%;" readonly="readonly">○&nbsp;${faq.FAQCONTENT }</textarea>
	                                       	</div>
	                                        
	                                    </li>
                                 	</c:if>
                                     
                                 </c:forEach>
                                 </ul>
                                 
                             </div>
                         </div>
                        	
                        	</c:forEach>
                        </c:if>
                        <c:if test="${empty categoryList }">
                        	<div class="col-md-12">
                        		준비중입니다.
                        	</div>
                        </c:if>
                       
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">비밀번호 입력</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>

		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-info slidetopleft qna-title" data-action="save" role="button">확인</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-info slidetopleft" id="pass-check-close" data-dismiss="modal"  role="button">닫기</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>