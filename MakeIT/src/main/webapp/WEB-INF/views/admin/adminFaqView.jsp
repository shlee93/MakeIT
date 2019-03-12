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

	</table>
	<div class='row'>
		<div class="col-md-6"></div>
		<div class="col-md-6 faq-add-back">
	
			<button class="faq-category-insert btn btn-primary">+카테고리 추가
			</button>
			&nbsp; &nbsp;
			<button class="add-qna btn btn-primary">+질문&답변 추가</button>
	
		</div>
	</div>
	<br>
	<c:if test="${not empty faqList }">
		<c:forEach items="${categoryList }" var="category">
			<div class="faq-back">
				<div class="faq-category">${category.FAQNACATEGORYNAME }
					<button class="faq-slide">▼</button>
					<button class="faq-category-delete">삭제</button>
				</div>
				<div class="faq-list-back">
					<ul class="faq-list">
						<c:forEach items="${faqList }" var="faq">
							<c:if test="${faq.FAQCATEGORYNO eq category.FAQCATEGORYNO }">

								<li class="faq-question">${faq.FAQTITLE }
									<input type="hidden" class="faq-no" value="${faq.FAQNO }" />
									<button class="answer-slide">▼</button>
									<button class="qna-delete-view">삭제</button>
									<button class="qna-update">수정</button>
									<hr>
									<div class="faq-answer">${faq.FAQCONTENT }</div>	
									<div class='qna-delete-back'>
										답변과 함께 삭제 됩니다.
										<button class='qna-delete-cancel btn btn-primary'>취소</button>
										<button class='qna-delete btn btn-primary'>삭제</button>
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

