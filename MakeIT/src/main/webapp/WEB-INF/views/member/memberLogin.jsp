<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
            nav
        </div>
        <div class="col-md-10">     
            <div id="login">
                <div class="container">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-6">
                            <div class="login-box col-md-12">
                                <form id="login-form" class="form" action="" method="post">
                                    <h3 class="text-center text-info">Login</h3>
                                    <div class="form-group">
                                        <label for="username" class="text-info">ID:</label><br>
                                        <input type="text" name="username" id="username" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="text-info">Password:</label><br>
                                        <input type="text" name="password" id="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="remember-me" class="text-info"><span>아이디 저장</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                        <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                                    </div>
                                    <div id="register-link" class="text-right">
                                        <a href="${path }/member/findId.do" class="text-info">ID찾기</a><span class="text-info">/</span>
                                        <a href="${path }/member/findPw.do" class="text-info">비밀번호 찾기</a><span class="text-info">/</span>
                                        <a href="${path }/member/memberEnroll.do" class="text-info">회원가입</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            aside
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
