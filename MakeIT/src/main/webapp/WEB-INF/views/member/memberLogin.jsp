<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
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
<!-- Member CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        	<div style='position:fixed; margin-top:-6em;'>
            <span onclick='fn_back()' style='cursor:pointer; font-size: 4em;'><i class="fas fa-arrow-circle-left"></i></span>                           
                <script>
                   function fn_back()
                   {
                      history.back();
                   }
                </script>
            </div>
        </div>
        <div class="col-md-10">     
            <div id="loginTab">
                <div class="container">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-6">
                            <div class="login-box col-md-12">
                                <form id="login-form" class="form" action="${path }/member/loginEnd.do" method="post">
                                    <h3 class="text-center text-info">Login</h3>
                                    <div class="form-group">
                                        <label for="username" class="text-info">ID:</label><br>
                                        <input type="text" name="memberId" id="memberId" style="font-size: 20px;" class="form-control" value='<%=cookieValue!=""?cookieValue:"" %>'>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="text-info">Password:</label><br>
                                        <input type="password" name="password" id="password" style="font-size: 20px;" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="saveId" class="text-info"><span>아이디 저장</span> 
                                        <span><input id="saveId" name="saveId" type="checkbox" <%=cookieValue!=""?"checked":"" %>></span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" id="loginBtn" name="loginBtn" class="btn btn-outline-info slidetopleft"value="로그인">
                                    </div>
                                    <div id="register-link" class="text-right">
                                        <a onclick="findId();" class="text-info">ID찾기</a><span class="text-info">/</span>
                                        <a onclick="findPw();" class="text-info">비밀번호 찾기</a><span class="text-info">/</span>
                                        <a href="${path }/member/memberEnrollck.do" class="text-info">회원가입</a>
                                    </div>
                                </form>
                                <div class="socialLogin" id="naver_id_login">
                                	
                                </div>
                                <form action="${path }/member/naverLogin" id="naverLoginform" name="naverLoginform">
                                	<input type="hidden" id="email" name="email" value="">
                                	<input type="hidden" id="name" name="name" value="">
                                	<input type="hidden" id="token" name="token" value="">
                                </form>
                                <script>
	                                var naver_id_login = new naver_id_login("ayo0PcF7e31pJS4Lbj1N", "http://localhost:9090/makeit/callback");	// Client ID, CallBack URL 삽입
									// 단 'localhost'가 포함된 CallBack URL
									var state = naver_id_login.getUniqState();
									
									naver_id_login.setButton("green", 2, 50);
									naver_id_login.setDomain("http://localhost:9090/makeit");	//  URL
									naver_id_login.setState(state);
									naver_id_login.setPopup();
									naver_id_login.init_naver_id_login();
                                </script>
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
        	function naverPop(){
        		var popup=open("${path}/member/naverLogin.do","naverLogin","left=200px, top=100px, width=450px, height=250px");
        	}
        </script>
        <div class="col-md-1">
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
