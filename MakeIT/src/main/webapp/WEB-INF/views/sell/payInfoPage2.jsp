<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
	
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
<style>
	div
	{
		/* border: 1px solid yellow; */
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>
	<div class='row'>
		<div class='col-md-1'>
			<div style='position:fixed; margin-top: 10em;'>
	    			<span onclick='fn_back()' style='cursor:pointer; font-size: 6em;'><i class="fas fa-arrow-circle-left"></i></span>    				           
	          	 	<script>
	           			function fn_back()
		           		{
		           			history.back();
		           		}
		           	</script>
	           	</div>
		</div>
		<div class='col-md-10'>
			<div style='width: 100%; min-height: 350px; padding: 2em;'>
				<div class='row'>
					<input type="hidden" id="sellno" value="${purchase.SELLNO}">
					<div class='col-md-12'style='padding-top: 70px;'>
						<div style='text-align:center;'>
							<img src="${path}/resources/upload/member/${purchaseMember.REIMG}" style='width: 200px; height: 100px; border-radius: 100%;'>
						</div>
						<div style="text-align:center;  padding-top: 30px;">
						<!-- style='padding-right: 100px; padding-left: 100px; padding-top: 30px;' -->
							<h3>판매자 이름 :${purchaseMember.MEMBERNAME} </h3><br>
							<h4>${purchaseMember.INTRODUCTION}</h4>
						</div>
					</div>
				</div>		
			</div>
			<div style='width: 100%; margin-bottom:1em;'>
				<h1 style='text-align:center; margin-bottom:1em;font-family: Sunflower, sans-serif;'>선택 상품 정보 </h1>
				<div style='width:100%; border-top: 1px solid black; border-bottom:1px solid black; padding:20px;' >
					<div class='row'>
						<div class='col-md-6' style='padding-left: 100px;'>
							<h4>선택옵션 : <p  id="selectedOption" style='display:inline; float:right; margin-right: 3.5em;'>${purchase.SELLOPTIONNO}  ${purchase.SELLOPTIONCONTENT}  소요기간  ${purchase.SELLDEADLINE}</p></h4>
							<input type="hidden" id="opPrice" value="${purchase.SELLPRICE}">
							<input type="hidden" id="optionCode" value="${purchase.SELLOPTIONCODE}">
							<input type="hidden" id="optionNo" value="${purchase.SELLOPTIONNO}">
							<input type="hidden" id="memberId" value="${sessionScope.member.MEMBERID}">						
						</div>
						<div class='col-md-6' style='padding-left: 100px;'>
							<h4>구매수량 : <input type='number' id="purchaseAccount" min="1" step="1" pattern="^[0-9]" class='form-control' style='width: 30%; float:right; margin-right: 5em;'></h4>
							<h4 style='margin-top: 1.2em;'>옵션별 금액 : <p style='display:inline; float:right; margin-right: 3.5em;'>${purchase.SELLPRICE}원</p></h4>
							<h4 style='margin-top: 1.2em;'>총 금액 : <p id="totalPrice" style='display:inline; float:right; margin-right: 3.5em;'></p></h4>
							<input type="hidden" id="hiddenTotal" value="">
						</div>						
					</div>
				</div>
			</div>	
			<div style='width: 100%; margin-bottom:3em;'>						
			<div class='row' style='margin-top:4em; justify-content:center;'>
				<div>
					<input type='button' class='btn btn-outline-info slidetopleft' id="cancelPurchase" style='margin-right: 1.3em; width: 5.3em;' value='취소'>
					<input type='button' id="decidePurchase" class='btn btn-outline-info slidetopleft' value='구매결정'/>
				
				</div>				
			</div>			
		</div>
		<div class='col-md-1'></div>
	</div>
	<script>
		var sellno=$("#sellno").val();
		var optionCode=$("#optionCode").val();
		var optionNo=$('#optionNo').val();
		var opPrice=$("#opPrice").val();
		var amount=(opPrice*$('#purchaseAccount').val());
		var memberId=$("#memberId").val();
		$('#purchaseAccount').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });

		
		
			$('#purchaseAccount').on('keyup',function(e){
				 var amount2=(opPrice*$('#purchaseAccount').val());				
				$("#totalPrice").empty();
				$("#totalPrice").append(amount2+'원');
				$("#hiddenTotal").attr("value",amount2);		
				var price=$("#hiddenTotal").val();
				var su=$("#purchaseAccount").val();
				$(document).on('click','#decidePurchase',function(){
					var title=$('#selectedOption').text();
					var specNo=$('#end-spec-no').val();					
					console.log(title);
					console.log(price);
		
					var IMP = window.IMP; // 생략가능
					IMP.init('imp51275730');
					IMP.request_pay({
						pg : 'kcp', // version 1.1.0부터 지원.
						pay_method : 'trans',
						merchant_uid : 'merchant_' + new Date().getTime(),
						name : title,
						amount : price,
						buyer_email : 'make_it@gmail.kr',
						buyer_name : 'MakeIT(메이크잇)',
						buyer_tel : '010-1234-5678',
						buyer_addr : '서울특별시 강남구 역삼동',
						buyer_postcode : '123-456',
						m_redirect_url : 'adminView.do'
					}, function(rsp) {
						if ( rsp.success ) {
							var msg = '결제가 완료되었습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '<br>상점 거래ID : ' + rsp.merchant_uid;
							msg += '<br>결제 금액 : ' + rsp.paid_amount;
							msg += '<br>카드 승인번호 : ' + rsp.apply_num;
							alert(msg);
							location.href="${path}/sell/purchaseComplete.do?sellno="+sellno+"&&optionCode="+optionCode+"&&amount="+price+"&&memberId="+memberId+"&&su="+su+"&&optionNo="+optionNo;
						  /*  $.ajax({
								
								url:"${path}/sell/purchaseComplete.do",
								data:{
									"sellno":sellno,
									"optionno":optionno,
									"cardYnno":rsp.apply_num,
									"payAmount":rsp.paid_amount;
									
								},
								dataType:"json",
								success:function(data){
									$('.modal-body').children('.row').remove();
									$payment_Tab.html(data);
								} 
							})
							 */ 
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
							alert(msg);
						}
						
					});
					
				});
			});
			//취소하기 버튼 클릭시 메인으로~
			$(document).on('click','#cancelPurchase',function(){
				location.href="${path}/sell/selldetail?sellno="+sellno;
			})
	
		

	</script>
</body>
</html>