<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	 <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/buywrite/buywrite.css" />

</head>
<body>
   <div class="row">
      <div class="col-sm-1"></div>
      <div id="buy-container" class="col-sm-10">
         <label>분류</label> <select class="form-control col-sm-2"
            style="display: inline">
            <option disabled selected>대분류</option>
            <option>개발자</option>
            <option>웹디자이너</option>
            <option>네트워크 보안</option>
         </select> <select class="form-control col-sm-2"
            style="display: inline; margin-right: 10px">
            <option disabled selected>소분류</option>
            <option>웹</option>
            <option>모바일</option>
            <option>게임</option>
            <option>응용 프로그램</option>
            <option>보안 프로그램</option>
            <option>데이터베이스 관리</option>
         </select> 
         <br> 
         <label>제목</label> 
         <input type="text" class="form-control col-sm-9" style="display: inline;" placeholder="제목을 입력하세요." /> 
         <br> 
         <label>금액</label> 
         <input type="number" class="form-control col-sm-2" style="display: inline" placeholder="금액(원)"> 
        
         
         <br>
         <label>기한</label> 

         <input type="date" class="form-control col-sm-2" style="display: inline">&nbsp부터&nbsp&nbsp

         <input type="date" class="form-control col-sm-2" style="display: inline">&nbsp까지
         <br> 
         
         <label>상세 설명</label>
         <textarea class="form-control" rows="10"></textarea>
         <br>
         <div class="filebox">
            <label for="ex_file">이미지 업로드</label> <input type="file" id="ex_file">
         </div>
         <br>
         <div id="btn-container">
            <button class="btn btn-secondary">취소</button>
            <button class="btn btn-secondary">작성</button>
         </div>
      </div>
      <div class="col-sm-1"></div>
   </div>
</body>
</html>