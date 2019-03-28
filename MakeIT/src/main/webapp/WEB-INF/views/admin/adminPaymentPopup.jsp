<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<c:if test="${paymentInfo.CATEGORYCODE=='S' }">

<div class="row">

	<div class="col-md-12 product_content">
		<h4>
			Product Title: <br><span>${paymentInfo.SELLTITLE }</span>
		</h4>
		<input type="hidden" id="end-spec-no" value="${paymentInfo.SELLSPECNO }"/>
		<div class="rating">
			<span class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> (10 reviews)
		</div>
		<h2 class="payment-target">
			<small>결제대상 ID:<span class="glyphicon glyphicon-usd"></span></small>
			
			<c:choose>
				<c:when test="${paymentInfo.GRADENO==1 }">
					<img class="grade-icon" alt="" src="/MakeIT/src/main/webapp/resources/image/bronzeGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==2 }">
					<img class="grade-icon" alt="" src="/MakeIT/src/main/webapp/resources/image/silverGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==3 }">
					<img class="grade-icon" alt="" src="/MakeIT/src/main/webapp/resources/image/goldGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==4 }">
					<img class="grade-icon" alt="" src="/MakeIT/src/main/webapp/resources/image/platinumGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==5 }">
					<img class="grade-icon" alt="" src="/MakeIT/src/main/webapp/resources/image/diamondGrade.png">
				</c:when>
			</c:choose>
			<span>
				<input type="hidden" id="payment-target" value="${paymentInfo.TARGETID }"/>
				${paymentInfo.TARGETID }
			</span>
		</h2>
		<h2 class="payment-target-name">
			<small>결제대상 이름:<span class="glyphicon glyphicon-usd"></span></small>
			${paymentInfo.MEMBERNAME }
		</h2>
		<h2 class="bank-name">
			<small>은행명:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${paymentInfo.BANKNAME }
			</span>
		</h2>
		<h2 class="cost">
			<small>계좌번호:<span class="glyphicon glyphicon-usd"></span></small>
			${paymentInfo.ACCOUNT }
		</h2>
		<h3 class="cost">
			<small>결제금액:</small>
			<span>${paymentInfo.SELLPRICE }</span>
		</h3>

		<div class="space-ten"></div>
		<div class="btn-ground">
			<button type="button" class="btn btn-outline-info slidetopleft payment-end">
				<span class="glyphicon glyphicon-shopping-cart"></span> 결제
			</button>
			<button type="button" class="btn btn-outline-info slidetopleft pull-right" id="close" data-dismiss="modal">
				<span class="glyphicon glyphicon-remove">닫기</span>
			</button>
		</div>
	</div>
</div>
</c:if>
<c:if test="${paymentInfo.CATEGORYCODE=='B' }">
<div class="row">

	<div class="col-md-12 product_content">
		<h4 class="product-title">
			Product Title: <span>${paymentInfo.BUYTITLE }</span>
		</h4>
		<input type="hidden" id="end-spec-no" value="${paymentInfo.BUYSPECNO }"/>
		<div class="rating">
			
		</div>
		<h2 class="payment-target">
			<small>결제대상 ID:<span class="glyphicon glyphicon-usd"></span></small>
			<c:choose>
				<c:when test="${paymentInfo.GRADENO==1 }">
					<img alt="" src="/MakeIT/src/main/webapp/resources/image/bronzeGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==2 }">
					<img alt="" src="/MakeIT/src/main/webapp/resources/image/silverGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==3 }">
					<img alt="" src="/MakeIT/src/main/webapp/resources/image/goldGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==4 }">
					<img alt="" src="/MakeIT/src/main/webapp/resources/image/platinumGrade.png">
				</c:when>
				<c:when test="${paymentInfo.GRADENO==5 }">
					<img alt="" src="/MakeIT/src/main/webapp/resources/image/diamondGrade.png">
				</c:when>
			</c:choose>
			
			<span>
				<input type="hidden" id="payment-target" value="${paymentInfo.MEMBERID }"/>
				${paymentInfo.MEMBERID }
			</span>
		</h2>
		<h2 class="payment-target-name">
			<small>결제대상 이름:<span class="glyphicon glyphicon-usd"></span></small>
			${paymentInfo.MEMBERNAME }
		</h2>
		<h2 class="bank-name">
			<small>은행명:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${paymentInfo.BANKNAME }
			</span>
		</h2>
		<h2 class="account">
			<small>계좌번호:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${paymentInfo.ACCOUNT }
			</span>
		</h2>
		<h3 class="cost">
			<small>결제금액:</small>
			<span>		
				${paymentInfo.BUYPRICE }
			</span>
		</h3>

		<div class="space-ten"></div>
		<div class="btn-ground">
			<button type="button" class="btn btn-outline-info slidetopleft payment-end">
				<span class="glyphicon glyphicon-shopping-cart"></span> 결제
			</button>
			<button type="button" class="btn btn-outline-info slidetopleft pull-right" id="close" data-dismiss="modal">
				닫기
			</button>
		</div>
	</div>
</div>
</c:if>

