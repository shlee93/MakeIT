<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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
   
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />
   
    <style>
    /* body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}  */

/* div{
    border: 1px solid red;
} */

    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-1">
                nav
            </div>
            <div class="col-md-10">
                <div class="container emp-profile">
                    <form method="post">
                        <div class="row" id="toprow">
                            <div class="col-md-4">
                                <div class="profile-img">
                                    <img src="http://www.iei.or.kr/upload/teacher/bsyoo_teacher.jpg" alt=""/>
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="profile-head">
                                            <h5>
                                                유병승
                                            </h5>
                                            <h6>
                                                Java개발자
                                            </h6>
                                            <!-- <p class="proile-rating">RANKINGS : <span>8/10</span></p> -->
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">회원정보</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">프로젝트 이력</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="appeal-tab" data-toggle="tab" href="#appeal" role="tab" aria-controls="appeal" aria-selected="false">자기소개</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <input type="submit" class="profile-edit-btn" name="btnAddMore" value="정보수정"/>
                            </div>
                        </div>
                        <div class="row" id="bottomrow">
                            <div class="col-md-4">
                                <div class="profile-work">
                                    <p>마이페이지</p>
                                    <a href="">회원정보</a><br/>
                                    <a href="">찜한 목록</a><br/>
                                    <a href="">내가 쓴 글 보기</a><br/>
                                    <a href="">쪽지함</a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="tab-content profile-tab" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>회원아이디</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>prince0324</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>이름</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>유병승</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>prince0324@naver.com</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>연락처</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>010 1234 5678</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>전문분야</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Java개발자</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>숙련도</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>실행한 프로젝트 수</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230개</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>프로젝트당 평균금액</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>프로젝트당 평균 소요시간</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="appeal" role="tabpanel" aria-labelledby="appeal-tab">
                                        <form action="" method="POST">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <textarea rows="10" cols="80" class="form-control" name="appeal-content"></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-10"></div>
                                                <div class="col-md-1">
                                                    <input type="submit" class="btn btn-primary" value="저장">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>           
                </div>

            </div>
            <div class="col-md-1">
                aside
            </div>
        </div>
    </div>
</body>
</html>