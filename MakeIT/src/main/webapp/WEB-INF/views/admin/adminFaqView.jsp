<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<table class="table" cellspacing="0">
		<thead>
			<tr>
				<th>FAQ 관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="text" id="faq-search" placeholder="검색할 질문의 '키워드'를 입력해주세요" style="width:100%;"/>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="col-md-12 faq-section">
	
		<div class='row'>
			<div class="col-md-6"></div>
			<div class="col-md-6 faq-add-back">
	
				<button class="add-qna btn btn-outline-info slidetopleft">+질문&답변 추가</button>
		
			</div>
		</div>
		<br>
		<c:if test="${not empty categoryList }">
			<c:forEach items="${categoryList }" var="category">
				<div class="faq-back">
					<div class="faq-category btn btn-outline-info slidetopleft">●&nbsp;${category.FAQNACATEGORYNAME }
						<input type="hidden" class="faq-category-no" value="${category.FAQNACATEGORYNO }"/>
						<input type="hidden" class="faq-category-name" value="${category.FAQNACATEGORYNAME }"/>
						<button class="faq-slide">▼</button>
					</div>
					<div class="faq-list-back">
						<ul class="faq-list">
							<c:forEach items="${faqList }" var="faq">
								<c:if test="${faq.FAQNACATEGORYNO==category.FAQNACATEGORYNO }">
	
									<li class="faq-question">
										<textarea cols="65" style="resize:none; border:0;" readonly="readonly">●&nbsp;${faq.FAQTITLE }</textarea>
										<input type="hidden" class="faq-no" value="${faq.FAQNO }" />
										<input type="hidden" class="faq-title" value="${faq.FAQTITLE }"/>
										<button class="answer-slide">▼</button>
										<button class="qna-delete-view">삭제</button>
										<button class="qna-update">수정</button>
										<hr>
										<div class="faq-answer">
											<textarea cols="85" rows='17' style="resize:none; border:0; width:100%;" readonly="readonly">○&nbsp;${faq.FAQCONTENT }</textarea>
										</div>	
										<div class='qna-delete-back'>
											답변과 함께 삭제 됩니다.
											<button class='qna-delete-cancel btn btn-outline-info slidetopleft'>취소</button>
											<button class='qna-delete btn btn-outline-info slidetopleft'>삭제</button>
											<hr>
										</div>
									</li>
								</c:if>
	
							</c:forEach>
						</ul>
	
					</div>
				</div>
	
			</c:forEach>
		</c:if>
		<div id="faq-insert-back">
			<div id="add-faq-category">
				<input type="text" id="input-faq-category" />
				<button type="button" id="add-faq-category-btn">추가</button>
				<button type="button" id="add-faq-category-cancel">취소</button>
			</div>
		</div>
	</div>

