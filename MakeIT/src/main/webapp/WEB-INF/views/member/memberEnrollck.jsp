<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

<<<<<<< HEAD
   <style>
	#individual{
		text-align: center;	
		margin-top: 20%;
	}
	#company{
		text-align: center;
		margin-top: 20%;
	}
	#welcome{
		text-align: center;
		margin-top: 5%;
	}
	.fas{
		display: block;
	}
	.signUp{
		margin-top: 2%;
	}
   </style>
=======
>>>>>>> refs/remotes/origin/lsh
<div class="container-fluid">
        <div class="row">
            <div class="col-md-1">
                nav
            </div>
            <div class="col-md-10">
            	<div class="row">
            		<div class="col-md-12" id="welcome">
            			<h1><b>MakeIT</b>의 회원가입을 환영합니다!</h1>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-md-6" id="individual">
	          			<form action="${path }/member/memberEnroll" method="post">
            				<i class="fas fa-user fa-10x"></i><br/>
            				<h3>당신의 재능을 <b>MakeIT</b>와 함께</h3>
            				<input type="hidden" name="memberLevel" id="memberLevel" value="1">
            				<input type="submit" class="btn btn-primary signUp" id="individual" value="개인 회원가입">
           				</form>
            		</div>
            		<div class="col-md-6" id="company">
       				    <form action="${path }/member/memberEnroll" method="post">
            				<i class="fas fa-user-tie fa-10x"></i><br/>
            				<h3>많은 인재들이 기다리는 <b>MakeIT</b>입니다.</h3>
            				<input type="hidden" name="memberLevel" id="memberLevel" value="2">
            				<input type="submit" class="btn btn-primary signUp" id="company" value="기업 회원가입">
	           			</form>
            		</div>
            	</div>
            </div>
            <div class="col-md-1">
                aside
            </div>
        </div>
<<<<<<< HEAD

=======
    </div>
>>>>>>> refs/remotes/origin/lsh


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





