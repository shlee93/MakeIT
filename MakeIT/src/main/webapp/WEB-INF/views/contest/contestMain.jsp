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
 <body>
    <div class='container-fluid' id="total">
        <div class='row'>
            <div class='col-md-1' id='nav'></div>
            <div class='col-md-10' id='section' >
              <div class="row">
                <div class="col-md-2">
                  <select class="form-control">
                      <option >상위 카테고리</option>
                  </select>
                </div>
                <div class="col-md-2">
                    <select class="form-control">
                        <option >하위 카테고리</option>
                    </select>
                </div>
                <div class="col-md-6"></div>
                <div class="col-md-2">
                    <select class="form-control">
                        <option >정렬방식</option>
                    </select>
                </div>
              </div>
              <div class="card" id="contestMain">
                <div class="row ">
                  <div class="col-md-2" id="imgContainer">
                      <img id="contestimg" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3" class="w-100">
                    </div>
                    <div class="col-md-7 ">
                      <div class="card-block px-3">
                        <div class="row">
                          <h2 class="card-title">콘테스트 이름을 작성해요 </h4>
                        </div>
                        <div class="row">
                          <div class="col-md-12" id="contestdetail"  >
                              <h4>회사이름</h4>
                              <p class="card-text" style="overflow: hidden">상세설명 적는곳 Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.</p>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-control righthandle">
                          <strong>상금</strong>
                          <span>50000만원</span>
                        </div>
                        <div class="form-control righthandle">
                            <strong>기한</strong>
                            <span>2019/03/04</span>
                        </div>    
                        <div class="form-control righthandle">
                            <strong>현재 참여자</strong>
                            <span>00명</span>
                        </div>                           
                          <div class="row">
                            <div class="col-md-12">
                              <a href="#" class="btn btn-primary" style="width: 80%; margin-left:5% ;">상세보기</a>    
                            </div>
                          </div>
                      </div>
          
                  </div>
              </div>
       
              <input type="text" name="searchKeyword" size="25" placeholder="검색할 아이디를 입력하세요" />
              <button class="btn btn-primary" type="submit">검색</button>
            
    
            
                
            </div>
            <div class='col-md-1' id='right-nav' >
               
                      
            </div>
            
        </div>
    </div>       
</body>
</html>