<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<hr>
<div class="qna-search">
	<div id="search-icon"></div>
	<select id="search-filter">
		<option class="search-filter-option" value="QNATITLE" ${filter=='QNATITLE'?'selected':'' }>제목</option>
		<option class="search-filter-option" value="MEMBERID" ${filter=='MEMBERID'?'selected':'' }>작성자</option>
	</select> 
	<select id="qna-sort">
		<option class="qna-sort-option" value="0" ${sortCheck==0?'selected':'' }>질문 유형</option>
		<c:if test="${not empty categoryList }">
			<c:forEach items="${categoryList }" var="faq">
				<option class="qna-sort-option" value="${faq.FAQNACATEGORYNO }" ${faq.FAQNACATEGORYNO==sortCheck?'selected':'' }>${faq.FAQNACATEGORYNAME }</option>
			</c:forEach>
		</c:if>

	</select> 
	<input id="search-qna" type="text" placeholder="검색 내용을 입력해주세요" style="width:83%" value="${searchQna }" />
</div>
<hr>
<c:if test="${member.MEMBERLEVEL==0 }">
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
								<a class="qna-pass ${sessionScope.member.MEMBERLEVEL==0||sessionScope.member.MEMBERID==qna.MEMBERID?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0||sessionScope.member.MEMBERID==qna.MEMBERID?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
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
								&nbsp;&nbsp;→[답변]<a class="qna-title-reple qna-pass ${sessionScope.member.MEMBERLEVEL==0?'qna-admin':'' }" ${sessionScope.member.MEMBERLEVEL==0?'':'data-toggle="modal" data-target="#squarespaceModal"' }>${qna.QNATITLE }</a>
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
				<td colspan="7">${pageBarQna }</td>
			</tr>

		</c:if>
		<c:if test="${empty qnaList }">
			<tr>
				<td colspan="7">첫 게시물을 등록해주세요!</td>
			</tr>
		</c:if>
	</tbody>
</table>
