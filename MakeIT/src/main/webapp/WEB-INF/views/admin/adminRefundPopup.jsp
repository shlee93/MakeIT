<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<c:if test="${refundInfo.CATEGORYCODE=='S' }">

<div class="row">

	<div class="col-md-12 product_content">
		<h4>
			Product Title: <span>${paymentInfo.SELLTITLE }</span>
		</h4>
		<input type="hidden" id="end-spec-no" value="${refundInfo.SELLSPECNO }"/>
		<div class="rating">
			<span class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> (10 reviews)
		</div>
		<h2 class="payment-target">
			<small>결제대상 ID:<span class="glyphicon glyphicon-usd"></span></small>
			${refundInfo.MEMBERID }
		</h2>
		<h2 class="payment-target-name">
			<small>결제대상 이름:<span class="glyphicon glyphicon-usd"></span></small>
			${refundInfo.MEMBERNAME }
		</h2>
		<h2 class="bank-name">
			<small>은행명:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${refundInfo.BANKNAME }
			</span>
		</h2>
		<h2 class="cost">
			<small>계좌번호:<span class="glyphicon glyphicon-usd"></span></small>
			${refundInfo.ACCOUNT }
		</h2>
		<h3 class="cost">
			<small>결제금액:</small>
			<span>${refundInfo.SELLPRICE }</span>
		</h3>

		<div class="space-ten"></div>
		<div class="btn-ground">
			<button type="button" class="btn btn-primary payment-end">
				<span class="glyphicon glyphicon-shopping-cart"></span> 결제
			</button>
			<button type="button" class="btn btn-primary">
				<span class="glyphicon glyphicon-remove">X</span>
			</button>
		</div>
	</div>
</div>
</c:if>
<c:if test="${refundInfo.CATEGORYCODE=='B' }">
<div class="row">

	<div class="col-md-12 product_content">
		<h4 class="product-title">
			Product Title: <span>${refundInfo.BUYTITLE }</span>
		</h4>
		<input type="hidden" id="end-spec-no" value="${refundInfo.BUYSPECNO }"/>
		<div class="rating">
			<span class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> <span
				class="glyphicon glyphicon-star"></span> (10 reviews)
		</div>
		<h2 class="payment-target">
			<small>결제대상 ID:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${refundInfo.BUYID }
			</span>
		</h2>
		<h2 class="payment-target-name">
			<small>결제대상 이름:<span class="glyphicon glyphicon-usd"></span></small>
			${refundInfo.MEMBERNAME }
		</h2>
		<h2 class="bank-name">
			<small>은행명:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${refundInfo.BANKNAME }
			</span>
		</h2>
		<h2 class="account">
			<small>계좌번호:<span class="glyphicon glyphicon-usd"></span></small>
			<span>
				${refundInfo.ACCOUNT }
			</span>
		</h2>
		<h3 class="cost">
			<small>결제금액:</small>
			<span>		
				${refundInfo.BUYPRICE }
			</span>
		</h3>

		<div class="space-ten"></div>
		<div class="btn-ground">
			<button type="button" class="btn btn-primary payment-end">
				<span class="glyphicon glyphicon-shopping-cart"></span> 결제
			</button>
			<button type="button" class="btn btn-primary">
				<span class="glyphicon glyphicon-remove">X</span>
			</button>
		</div>
	</div>
</div>
</c:if>

