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
						<div class="col-md-12 insert-form">
							<fieldset>
							
							<!-- Form Name -->
							<legend>QNA</legend>
							<div class="form-group">
								<label class="col-md-6 control-label" for="qna-writer"><strong>작성자</strong></label>
								<div class="col-md-6">
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
									
							    	<span id="qna-writer">${qna.MEMBERID }</span>	
							  	</div>
							</div>
							<!-- Select Category -->
							<div class="form-group">
							  <label class="col-md-6 control-label" for="category"><strong>질문 유형</strong></label>
							  <div class="col-md-6">
							  	<span id="qna-categroy">${qna.FAQNACATEGORYNAME }</span>
							  </div>
							</div>
							
							<!-- Title input-->
							<div class="form-group">
							  <label class="col-md-6 control-label" for="qna-title"><strong>제목</strong></label>  
							  <div class="col-md-6">
							  	<input id="qna-title" name="qna-title" placeholder="제목을 입력해주세요" class="form-control input-md" type="text" value="${qna.QNATITLE }" readonly/>
							  </div>
							</div>
							
							<!-- Content input-->
							<div class="form-group">
							  <label class="col-md-6 control-label" for="qna-content"><strong>내용</strong></label>  
							  <div class="col-md-6">
							  	<textarea rows="10" cols="100" placeholder="질문을 입력해주세요" id="qna-content" name="qna-content" readonly >${qna.QNACONTENT }</textarea>
							  </div>
							</div>
							
							<div class="form-group">
							<c:if test="${member.MEMBERLEVEL==0 and qna.QNALEVEL!=2 and qna.ANSWERYN=='N'}">
								<button id="reple-qna" class="btn btn-outline-info slidetopleft">답변하기</button>
							</c:if>
							<c:if test="${member.MEMBERID eq qna.MEMBERID }">
							
							    <button id="update-qna" class="btn btn-outline-info slidetopleft">수정</button>
							    <button id="delete-qna" class="btn btn-outline-info slidetopleft">삭제</button>
							</c:if>
								<button id="back-list" class="btn btn-outline-info slidetopleft">목록</button>
								<input type="hidden" id="qnaNo" value="${qna.QNANO }"/>
								<input type="hidden" id="cPage" value="${cPage }"/>
								<input type="hidden" id="search-qna" value="${searchQna }"/>
								<input type="hidden" id="filter" value="${filter }"/>
								<input type="hidden" id="sortCheck" value="${sortCheck }"/>
							</div>
						</fieldset>
						</div>
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
                             <div class="faq-category btn btn-outline-info slidetopleft">${category.FAQNACATEGORYNAME }

		                         <button class="faq-slide btn btn-outline-info slidetopleft">▼</button>

                             </div>
                             <div class="faq-list-back">
                                 <ul class="faq-list">
                                 <c:forEach items="${faqList }" var="faq">
                                 	<c:if test="${faq.FAQNACATEGORYNO==category.FAQNACATEGORYNO }">
                                 	
	                                    <li class="faq-question">
	                                    	<textarea cols="65" style="resize:none; border:0;" readonly="readonly">${faq.FAQTITLE }</textarea>
											
	                                       	<button class="answer-slide">▼</button>
	                                       
	                                       	<hr>
	                                       	<div class="faq-answer">
	                                       		<textarea cols="65" style="resize:none; border:0;" readonly="readonly">${faq.FAQCONTENT }</textarea>
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