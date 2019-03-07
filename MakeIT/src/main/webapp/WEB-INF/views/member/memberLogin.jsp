<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
	Cookie[] cookies=request.getCookies();
	String cookieValue="";
	for(Cookie c : cookies){
		if(c.getName().equals("saveId")){
			cookieValue=c.getValue();
		}
	}
%> 
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
                                <form id="login-form" class="form" action="${path }/member/loginEnd.do" method="post">
                                    <h3 class="text-center text-info">Login</h3>
                                    <div class="form-group">
                                        <label for="username" class="text-info">ID:</label><br>
                                        <input type="text" name="memberId" id="memberId" class="form-control" value='<%=cookieValue!=""?cookieValue:"" %>'>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="text-info">Password:</label><br>
                                        <input type="password" name="password" id="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="saveId" class="text-info"><span>아이디 저장</span> 
                                        <span><input id="saveId" name="saveId" type="checkbox" <%=cookieValue!=""?"checked":"" %>></span>
                                        </label><br>
                                        <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                                    </div>
                                    <div id="register-link" class="text-right">
                                        <a onclick="findId();" class="text-info">ID찾기</a><span class="text-info">/</span>
                                        <a onclick="findPw();" class="text-info">비밀번호 찾기</a><span class="text-info">/</span>
                                        <a href="${path }/member/memberEnroll.do" class="text-info">회원가입</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        	function findId(){
        		var popup=open("${path}/member/findId.do","find ID","left=200px, top=100px, width=450px, height=250px");
        	}
        	function findPw(){
        		var popup=open("${path}/member/findPw.do","find PW","left=200px, top=100px, width=450px, height=250px");
        	}
        </script>
        <div class="col-md-1">
            aside
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
