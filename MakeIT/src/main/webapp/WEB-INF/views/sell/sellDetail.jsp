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
</head>

<style>

        /* div
        {
            border: 1px solid red;
        } */
  
        .subImgs
        {
            max-width: 100px;
            height: 120px;
            display: inline-block;
            margin-top: 3%;
            margin-left: 2%;
        }

        .subImg        
        {
        
            display: inline;
      
        }

        #mainImg
        {
            position: relative; top:0; left: 0;
            width: 100%;
            height: 100%;
        }

        #img-container
        {
            width: 80%;
            height: 40%;
        }
  
        nav > .nav.nav-tabs
        {
            border: none;
            color:#fff;
            background:#272e38;
            border-radius:0;
            text-align: center;
            /* font-size: 0.965em; */
            font-size: 1.55em;
        }
        nav > div a.nav-item.nav-link:not(.xx),
        nav > div a.nav-item.nav-link.active:not(.xx)
        {
            border: none;
            padding: 18px 25px;
            color:#fff;
            background:#272e38;
            border-radius:0;
        }

        nav > div a.nav-item.nav-link.active:after
        {
            /* content: "";
            position: relative;
            bottom: -60px;
            left: -10%; */
            border: 15px solid transparent;
            border-top-color: #e74c3c ;
        } 

        .tab-content
        {
            background: #fdfdfd;
            line-height: 25px;
            border: 1px solid #ddd;
            border-top:5px solid #e74c3c;
            border-bottom:5px solid #e74c3c;
            padding:30px 25px;
        }

        .detail:hover
        {
            border: none;
            background: #e74c3c;
            color:#fff;
            border-radius:0;
            transition: background 0.20s linear;    
        }
        
        .fixed
        {
            position: fixed;
            float: right;
            margin-left: 50%;
        }

        #total
        {
        margin-top: 5%;
        }

        #tab-list
        {
            margin-top:3%;
            width:100%;
        }

        #subImg1
        {
        margin-right:0;
        }

        .userImg
        {
            border-radius: 6em;
        }
    </style>
<body>
<div class='container-fluid' id="total">
    <div class='row'>
        <div class='col-md-1' id='nav'></div>
        <div class='col-md-10' id='section' >
            <div class='row'>
                <div class="col-md-7" id="img-container">
                    <img  id="mainImg" class="mainImg" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>
                    <div class='row'>                                        
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>     
                        </div>
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>     
                        </div>
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>     
                        </div>
                        <div class="col-md-3 subImg1" id="subImg-container">
                            <img  class="subImgs" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>     
                        </div>                                            
                    </div>
                    <div class='row'>
                        <nav id=tab-list>
                            <div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>
                                <a class="nav-item nav-link detail" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">후기</a>
                                <a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">취소 / 환불규정</a>
                                <a class="nav-item nav-link detail" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">옵션별 가격</a>
                            </div>
                        </nav>
                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                Et et dkjflksdnn djsklfjlkdsdddddddddddddddddddddddjsdklfjsdlkjl jsdklfjlk  jdkf jdk  djkfsdjfk jdskl sdjklf jdslkf jlsdjf klj sjdklf jsdklfj kl jsdklf jklsdf jlkdsjflkjsdlkf jjsdklfjsldkjflksdjflksdjflksdjflksdjlkf jdk jlc jsd klfjldk  ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex 이대형앝나.
                            </div>
                            <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                            </div>
                        </div>
                    </div>                       
                        
                </div>
                <div class="col-md-5 fixed" style='position:fixed'>            
                    <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        <span>작성자 정보확인</span>
                        </button>
                        
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                                <a class="nav-item nav-link active xx" href="#">평점|후기 보기</a>
                                <a class="nav-item nav-link xx" href="#">다른 글보기</a>
                                <a class="nav-item nav-link xx" href="#">Pricing</a>
                                <a class="nav-item nav-link disabled xx" href="#">Disabled</a>
                            </div>
                        </div>                                            
                    </nav>
                    <div class="row " style="text-align:center">
                        <div class="col-md-10">
                            <img  class="subImgs userImg" src=https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F2253CF3E58A403A30DA6C3>     
                            <button class="btn btn-primary"><i class='far fa-star'></i> 찜하기</button>
                            <button class='btn btn-primary'>쪽지보내기</button>
                            <p>어쩌고저쩌고ㄴㅇㄹㄴㅇㄹㄴㅁ오러ㅏㅓㅁㄴ아ㅣ러ㅣㅏㅁㄴ어리ㅏㅁㄴ어리ㅏㅓㅁㄴ아ㅣ런이ㅏㅓ라ㅣㄴ어리ㅏㄴ어리ㅏㅓㅇ니이ㅏ러ㅣㅏㅁㄴ어리ㅏㅁㄴ어ㅏㅣ~</p>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" style="text-align:center;">
                                    <select class="form-control" style="width:100%">
                                        <option value="option1">옵션1</option>
                                        <option value="option2">옵션2</option>
                                        <option value="option3">옵션3</option>
                                    </select>
                                </div>
                                <div class='col-md-1'></div>
                            </div>
                            <div class='row' style='margin-top: 1.2em'>
                                <div class='col-md-6'>
                                    <button class="btn btn-primary" style='padding-left:17px; padding-right:17px; float:right;'>구매하기</button>
                                </div>
                                <div class='col-md-6' style='float:left'>
                                    <button onclick='fn_starPop()'; class='btn btn-primary' style='float:left;' disabled>후기남기기</button>
                                </div>
                                <script>
                                    function fn_starPop()
                                    {
                                        var starPop=open("starPop.html","별점/후기","top=200px, left=200px, width=400px, height=150px");
                                    }
                                </script>                              
                            </div>
                        <div class="col-md-2"></div>
                    </div>                      
               </div>        
          </div>
      </div>
    <div class='col-md-1' id='right-nav' ></div>                   
</div>   
</body>
</html>