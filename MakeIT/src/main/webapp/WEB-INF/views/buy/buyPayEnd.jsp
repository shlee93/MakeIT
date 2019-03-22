<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="path" value="${pageContext.request.contextPath }"/>
   
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
   


   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
   
   
   <style>

   
   </style>


   <div class='row'>
      <div class='col-md-1'></div>
      <div class='col-md-10' style='text-align:center'>
         <p>환불요건 같은거 한번더써주면 좋을듯 그것을 정합시다 우리<p>
         <div style='width: 100%; margin-top:6em; margin-bottom:2em;'>
            <h4>판매자 : ${memberId}</h4>
            <h4>구매한 내역 : ${title} </h4>            
            <h4>금액 : ${price} 원</h4>
            
            
         </div>
         <div>
            <h3 style='font-weight:600'>결제가 완료되었습니다.</h3>
         </div>
         <div style='margin-top:2em; justify-content:center;'>
            <div>               
               <input type='button' onclick='payComplete();' class='btn btn-outline-info slidetopleft' value='메인으로 이동'/>               
            </div>
         </div>
      </div>
      <div class='col-md-1'></div>
   </div>
   <script>
    function payComplete(){
       location.href="${paht}/makeit";
    }
   </script>
</body>
</html>