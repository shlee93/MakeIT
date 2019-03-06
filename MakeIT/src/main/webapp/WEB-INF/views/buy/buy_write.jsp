<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 게시글 작성</title>
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

div {
   border: 1px solid black;
}
#buy-container {
   padding: 20px;
}

label {
   margin-right: 30px;
   margin-bottom: 20px;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #fff;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #5cb85c;
   cursor: pointer;
   border: 1px solid #4cae4c;
   border-radius: .25em;
   -webkit-transition: background-color 0.2s;
   transition: background-color 0.2s;
}

.filebox label:hover {
   background-color: #6ed36e;
}

.filebox label:active {
   background-color: #367c36;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

#btn-container {
   text-align:right;
}
</style>
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