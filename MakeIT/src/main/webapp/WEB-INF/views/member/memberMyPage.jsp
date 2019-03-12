<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<fmt:setLocale value="kr_ko"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
            nav
        </div>
        <div class="col-md-10">
            <div class="container emp-profile" id="ajaxHtml">
                <div class="row" id="toprow">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="${path }/resources/upload/member/${map.REIMG}" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                        	<h5>
								<c:out value="${map.MEMBERNAME }"></c:out>
                            </h5>
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
                    	<form id="hiddenFrm" action="" method="post">
	                    	<input type="hidden" id="updateId" name="updateId" value="${map.MEMBERID }"/>
	                        <input type="button" onclick="updateMember();" class="profile-edit-btn" name="updateBtn" value="정보수정"/>
	                        <input type="button" onclick="deleteMember();" class="profile-edit-btn" name="deleteBtn" value="회원탈퇴"/>
                    	</form>
                    </div>
                </div>
                <div class="row" id="bottomrow">
                    <div class="col-md-4">
                        <div class="profile-work">
                        	<input type="hidden" id="memberId" value="${map.MEMBERID }">
                            <p>마이페이지</p>
                            <a class="myPageInfo" onclick="memberInfoAjax();">회원정보</a><br/>
                            <a class="myPageInfo" onclick="memberOutBoxAjax();">찜한 목록</a><br/>
                            <a class="myPageInfo" onclick="memberWriteAjax();">내가 쓴 글 보기</a><br/>
                            <a class="myPageInfo" onclick="memberMessageAjax();">쪽지함</a>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>회원아이디</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.MEMBERID }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>이름</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.MEMBERNAME }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>생년월일</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.BIRTH }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.EMAIL }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>연락처</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.PHONE }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.ADDRESS }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>은행</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.BANKNAME }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>계좌번호</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.ACCOUNT }"></c:out> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>관심분야</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.INTERESTNO }"></c:out> </p>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>등급</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p><c:out value="${map.GRADENAME }"></c:out></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>실행한 프로젝트 수</label>
                                    </div>
                                    <div class="col-md-2">
                                    	<p>판매:</p>
                                    </div>
                                    <div class="col-md-4">
                                    	<c:if test="${sellCount != 0 }">
                                    		<p><c:out value="${sellCount }건"></c:out> </p>
                                    	</c:if>
                                    	<c:if test="${sellCount == 0 }">
                                    		<p>등록된 글이 없습니다.</p>
                                    	</c:if>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                                    </div>
                                	<div class="col-md-2">
                                    	<p>구매:</p>
                                    </div>
                                    <div class="col-md-4">
                                    	<c:if test="${buyCount != 0 }">
                                    		<p><c:out value="${buyCount }건"></c:out> </p>
                                    	</c:if>
                                    	<c:if test="${buyCount == 0 }">
                                    		<p>등록된 글이 없습니다.</p>
                                    	</c:if>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>프로젝트당 평균금액</label>
                                    </div>
                                    <div class="col-md-2">
                                    	<p>판매:</p>
                                    </div>
                                    <div class="col-md-4">
                                    	<c:if test="${sellAvg != 0 }">
                                    		<p><fmt:formatNumber value="${sellAvg }" type="currency"/></p>
                                    	</c:if>
                                    	<c:if test="${sellAvg == 0 }">
                                    		<p>등록된 글이 없습니다.</p>
                                    	</c:if>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                                    </div>
                                	<div class="col-md-2">
                                    	<p>구매:</p>
                                    </div>
                                    <div class="col-md-4">
                                    	<c:if test="${buyAvg != 0 }">
                                    		<p><fmt:formatNumber value="${buyAvg }" type="currency"/></p>
                                    	</c:if>
                                    	<c:if test="${buyAvg == 0 }">
                                    		<p>등록된 글이 없습니다.</p>
                                    	</c:if>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                                
                            </div>
                            <div class="tab-pane fade" id="appeal" role="tabpanel" aria-labelledby="appeal-tab">
                             	<form action="${path }/member/memberIntroduction.do" method="POST">
                                 	<div class="row">
                                     	<div class="col-md-12">
                                     		<input type="hidden" name="appealId" value="${map.MEMBERID }">
                                          	<textarea rows="10" cols="80" class="form-control" name="appealContent"><c:out value="${map.INTRODUCTION }"></c:out></textarea>
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
        </div>
        <input type="hidden" id="sellcPage" name="sellcPage" value="${sellcPage }">
        <input type="hidden" id="buycPage" name="buycPage" value="${buycPage }">
        <input type="hidden" id="freecPage" name="freecPage" value="${freecPage }">
        <input type="hidden" id="qnacPage" name="qnacPage" value="${qnacPage }">
        <input type="hidden" id="contestcPage" name="contestcPage" value="${contestcPage }">
        <input type="hidden" id="fadeStatus" name="fadeStatus" value="${fadeStatus }">
        <input type="hidden" id="naviBarStatus" name = "naviBarStatus" value="${naviBarStatus }">
		<script>
			function updateMember(){
				$('#hiddenFrm').attr("action","${path }/member/updateMember.do");
				$('#hiddenFrm').submit();
			}
			
			function deleteMember(){
				$('#hiddenFrm').attr("action","${path }/member/deleteMember.do");
				$('#hiddenFrm').submit();
			}
			
			function memberInfoAjax(){
				$('#naviBarStatus').attr("value","1");
				$.ajax({
					url:"${path}/member/memberInfoAjax.do",
					dataType:"html",
					data:{"memberId":$('#memberId').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}
			function memberOutBoxAjax(){
				$('#naviBarStatus').attr("value","2");
				$.ajax({
					url:"${path}/member/memberOutBoxAjax.do",
					dataType:"html",
					data:{"memberId":$('#memberId').val()
						,"sellcPage":$('#sellcPage').val()
						,"buycPage":$('#buycPage').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}
			function memberWriteAjax(){
				$('#naviBarStatus').attr("value","3");
				$.ajax({
					url:"${path}/member/memberWriteAjax.do",
					dataType:"html",
					data:{"memberId":$('#memberId').val()
						,"sellcPage":$('#sellcPage').val()
						,"buycPage":$('#buycPage').val()
						,"freecPage":$('#freecPage').val()
						,"qnacPage":$('#qnacPage').val()
						,"contestcPage":$('#contestcPage').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}
			function memberMessageAjax(){
				$('#naviBarStatus').attr("value","4");
				$.ajax({
					url:"${path}/member/memberMessageAjax.do",
					dataType:"html",
					data:{"memberId":$('#memberId').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}	
			
		</script>
        </div>
        <div class="col-md-1">
            aside
        </div>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>






