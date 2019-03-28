<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<hr>
	<button class="btn btn-outline-info slidetopleft" id="paymentSort-btn" style="float:right;">구매확정▼</button>
<hr>
<c:choose>
	<c:when test="${not empty paymentList }">

		<c:forEach items="${paymentList }" var="payment">
			<c:choose>
				<c:when test="${payment.CATEGORYCODE eq 'B' }">
					<div class="deal-payment">

						<div class="deal-info-back btn btn-outline-info slidetopleft">
							<ul class="deal-info">
								<li class="deal-no">
									<strong>구매자:</strong>
									${payment.BUYID }&nbsp;&nbsp;
								</li>
								<li class="dealer">
									<strong>판매자:</strong> 
									${payment.MEMBERID }
								</li>
								<li class="deal-title">
									<br><strong>글 제목:</strong> 
									${payment.BUYTITLE }
								</li>
							</ul>
						</div>

						<div class="deal-back">

							<ul class="step d-flex flex-nowrap">

								<li class="step-item ${payment.STATUSNO==1?'active':''}">
									<a href="#!" class="">입금 대기</a>
								</li>
								<li class="step-item ${payment.STATUSNO==2?'active':''}">
									<a href="#!" class="">입금 완료 및<br>프로젝트 진행
								</a>
								</li>
								<li class="step-item ${payment.STATUSNO==3?'active':''}">
									<a href="#!" class="">프로젝트 완료</a>
								</li>
								<li class="step-item ${payment.STATUSNO==4?'active payment-pop':'' }" ${payment.STATUSNO==4?'data-toggle="modal" data-target="#product_view"':'' }>
									<a href="#!" class="">구매 확정</a> 
									<input type="hidden" class="spec-no" value="${payment.BUYSPECNO }" />
								</li>
							</ul>
						</div>

					</div>
					<br>
				</c:when>
				<c:when test="${payment.CATEGORYCODE eq 'S' }">

					<div class="deal-payment">

						<div class="deal-info-back btn btn-outline-info slidetopleft">
							<ul class="deal-info">
								<li class="deal-no">
									<strong>구매자:</strong>
									${payment.MEMBERID }&nbsp;&nbsp;
								</li>
								<li class="dealer">
									<strong>판매자:</strong> 
									${payment.SELLID }
								</li>
								<li class="deal-title">
									<br><strong>글 제목:</strong> 
									${payment.SELLTITLE }
								</li>
							</ul>
						</div>

						<div class="deal-back">

							<ul class="step d-flex flex-nowrap">

								<li class="step-item ${payment.STATUSNO==1?'active':''}">
									<a href="#!" class="">입금 대기</a>
								</li>
								<li class="step-item ${payment.STATUSNO==2?'active':''}">
									<a href="#!" class="">입금 완료 및<br>프로젝트 진행
								</a>
								</li>
								<li class="step-item ${payment.STATUSNO==3?'active':''}">
									<a href="#!" class="">프로젝트 완료</a>
								</li>
								<li class="step-item ${payment.STATUSNO==4?'active payment-pop':''}" ${payment.STATUSNO==4?'data-toggle="modal" data-target="#product_view"':'' }>
									<a href="#!" class="">구매 확정</a> 
									<input type="hidden" class="spec-no" value="${payment.SELLSPECNO }" />
									<input type="hidden" class="member-id" value="${payment.MEMBERID }"/>
								</li>
							</ul>
						</div>

					</div>
					<br>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
		</c:forEach>

	</c:when>
	<c:otherwise>
		<div>데이터가 없습니다!</div>
	</c:otherwise>
</c:choose>
<div>
	${pageBarPayment }
</div>
