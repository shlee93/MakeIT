<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when test="${not empty refundList }">

		<c:forEach items="${refundList }" var="refund">
			<c:choose>
				<c:when test="${refund.CATEGORYCODE eq 'B' }">
					<div class="deal-refund">

						<div class="deal-info-back">
							<ul class="deal-info">
								<li class="deal-no">
									<strong>구매자:</strong> 
									${refund.BUYID }
								</li>
								<li class="dealer">
									<strong>판매자:</strong> 
									${refund.MEMBERID }
								</li>
								<li class="deal-title">
									<strong>글 제목:</strong>
									${refund.BUYTITLE }
								</li>
							</ul>
						</div>

						<div class="deal-back">

							<ul class="step d-flex flex-nowrap">

								<li class="step-item">
									<a href="#!">
										입금 대기
									</a>
								</li>
								<li class="step-item">
									<a href="#!">
										입금 완료 및<br>프로젝트진행
									</a>
								</li>
								<li class="step-item active">
									<a href="#!">
										프로젝트 완료
									</a>
								</li>
								
								<li class="step-item refund-pop">
									<a href="#!">
										환불승인
									</a> 
									<input type="hidden" class="spec-no" value="${refund.BUYSPECNO }" />
								</li>
							</ul>
						</div>

					</div>
					<br>
				</c:when>
				<c:when test="${refund.CATEGORYCODE eq 'S' }">

					<div class="deal-refund">

						<div class="deal-info-back">
							<ul class="deal-info">
								<li class="deal-no">
									<strong>구매자:</strong>
									${refund.MEMBERID }
								</li>
								<li class="dealer">
									<strong>판매자:</strong> 
									${refund.SELLID }
								</li>
								<li class="deal-title">
									<strong>글 제목:</strong>
									${refund.SELLTITLE }
								</li>
							</ul>
						</div>

						<div class="deal-back">

							<ul class="step d-flex flex-nowrap">

								<li class="step-item">
									<a href="#!">
										입금 대기
									</a>
								</li>
								<li class="step-item">
									<a href="#!">
										입금 완료 및<br>프로젝트진행
									</a>
								</li>
								<li class="step-item active">
									<a href="#!">
										프로젝트 완료
									</a>
								</li>
								
								<li class="step-item refund-pop">
									<a href="#!">
										환불승인
									</a> 
									<input type="hidden" class="spec-no" value="${refund.SELLSPECNO }" />
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
<div>${pageBarRefund }</div>