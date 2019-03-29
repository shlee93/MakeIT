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
         <div style='position:fixed; margin-top:-6em;'>
			<span onclick='fn_back()' style='cursor:pointer; font-size: 4em;'><i class="fas fa-arrow-circle-left"></i></span>                           
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
               <input type="hidden" id="buyNo" value="${buyer.BUYNO}">
               <div class='col-md-12'style='padding-top: 70px;'>
                  <div style='text-align:center;'>
                     <img src="${path}/resources/upload/member/${sellerImg.REIMG}" style='width: 200px; height: 100px; border-radius: 100%;'>
                  </div>
                  <div style="text-align:center;  padding-top: 30px;">
                  <!-- style='padding-right: 100px; padding-left: 100px; padding-top: 30px;' -->
                     <h3>판매자 이름 :${sellerImg.MEMBERNAME} </h3><br>
                     <h4>${sellerImg.INTRODUCTION}</h4>
                  </div>
               </div>
            </div>      
         </div>
         <div style='width: 100%; margin-bottom:1em;'>
            <h1 style='text-align:center; margin-bottom:1em; font-family: "Sunflower",sans-serif;'>상품 정보 </h1>
            <div style='width:100%; border-top: 1px solid black; border-bottom:1px solid black; padding:20px;' >
               <div class='row'>
                  <div class='col-md-6' style='padding-left: 100px;'>
                     <h4>구매항목 : <p  id="selectedOption" style='display:inline; float:right; margin-right: 3.5em;'>${seller.BUYCANDIDATETITLE }</p></h4>
                     <input type="hidden" id="buyTitle" value="${seller.BUYCANDIDATETITLE }">
                     <input type="hidden" id="opPrice" value="${buyer.BUYPRICE}">
                     <input type="hidden" id="memberId" value="${seller.MEMBERID}">                  
                  </div>
                  <div class='col-md-6' style='padding-left: 100px;'>
                     <h4>구매금액 : <p style='display:inline; float:right; margin-right: 3.5em;'>${buyer.BUYPRICE} 원</p></h4>
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
   </div>
   <div class='col-md-1'></div>
   </div>
   <script>
      var buyNo=$("#buyNo").val();
      var price=$("#opPrice").val();
      var memberId=$("#memberId").val();
      /* $('#purchaseAccount').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } }); */
		
      
      
            $(document).on('click','#decidePurchase',function(){
               var title=$('#buyTitle').val();
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
                     msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                     msg += '\n결제 금액 : ' + rsp.paid_amount;
                     msg += '\n카드 승인번호 : ' + rsp.apply_num;
                     alert(msg);
                     location.href="${path}/buy/volCommit.do?buyNo="+buyNo+"&&memberId="+memberId+"&&price="+price+"&&title="+title;
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
         
         //취소하기 버튼 클릭시 메인으로~
         $(document).on('click','#cancelPurchase',function(){
            location.href="${path}/buy/buyDetail?buyNo="+buyNo;
         })
   
      

   </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>