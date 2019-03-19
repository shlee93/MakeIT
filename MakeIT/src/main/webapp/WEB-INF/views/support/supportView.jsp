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
						<div class="qna-search">
                            <div id="search-icon">검색</div>
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
                        <c:if test="${member.MEMBERLEVEL==0 }">
                           	<button id="qna-status" style="display:none">미답변글</button> 
                        </c:if>
                        <c:if test="${not empty member and member.MEMBERLEVEL!=0 }">                         	 
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
													<a class="qna-title">${qna.QNATITLE }</a>
													<input type="hidden" value="${qna.QNANO }"/>
												</td>
												<td>${qna.MEMBERID }</td>
												<td>${qna.QNADATE }</td>
											</tr>
											<%i++; %>
										
										</c:when>
										<c:when test="${qna.QNALEVEL==2}">
											<tr class="qna-answer">
												<td><%=i %></td>
												<td></td>
												<td colspan="3">
													&nbsp;&nbsp;→[답변]<a class="qna-title-reple">${qna.QNATITLE }</a>
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
									<td>첫 게시물을 등록해주세요!</td>
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
									<th>Project Name</th>
									<th>Employer</th>
									<th>Time</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">Work 1</a></td>
									<td>Doe</td>
									<td>john@example.com</td>
								</tr>
								<tr>
									<td><a href="#">Work 2</a></td>
									<td>Moe</td>
									<td>mary@example.com</td>
								</tr>
								<tr>
									<td><a href="#">Work 3</a></td>
									<td>Dooley</td>
									<td>july@example.com</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<table class="table" cellspacing="0">
							<thead>
								<tr>
									<th>Contest Name</th>
									<th>Date</th>
									<th>Award Position</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">Work 1</a></td>
									<td>Doe</td>
									<td>john@example.com</td>
								</tr>
								<tr>
									<td><a href="#">Work 2</a></td>
									<td>Moe</td>
									<td>mary@example.com</td>
								</tr>
								<tr>
									<td><a href="#">Work 3</a></td>
									<td>Dooley</td>
									<td>july@example.com</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>