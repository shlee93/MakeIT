
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
   integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
   crossorigin="anonymous">

<style>
.hide {
   display: none;
}
#container{
 width:97%;
}
.btn-primary{
   position:relative;
   left:83%;
   top:3px;
}
</style>
</head>
<body>
   <div id="container">
      <form id="popForm">
         <div>
            <div class="row" >
               <div class="col-md-12" style="text-align:center" >
                  <h3 >신고하기</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-md-2" >
                  
               </div>
               <div class="col-md-9">
                  <label>신고대상</label> 
                  <input class="form-control" type="text" name="reportId" value="${buyWriter}" style="width:40%;">
               </div>
            </div>
            <br/>
            <div class="row">
               <div class="col-md-3">
                  <label style="">신고내용</label> 
               </div>
               <div class="col-md-9">
                  <textarea name="reportContent" class="form-control" rows="5"></textarea>
               </div>
            </div>
            <div class="row">
               <br/>

               <button type="button" onclick="fn_buyReportEnd();" class="btn btn-primary">신고하기</button>

            </div>
      <input type="hidden" name="buyNo" value="${buyNo}">      
         </div>
      </form>
      
   </div>
   <script>
      function fn_buyReportEnd()
      {
          $('#popForm').attr('action',"${path}/buy/buyReportEnd");
         $('#popForm').submit();
         
      }
      
   </script>
</body>
</html>


