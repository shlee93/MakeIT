<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<fmt:setLocale value="kr_ko"/>
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
		            <a class="nav-link active" onclick="messagetab();" id="message-tab" data-toggle="tab" href="#message" role="tab" aria-controls="message" aria-selected="true">상세메시지</a>
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
            <p>마이페이지</p>
            <a class="myPageInfo" onclick="memberInfoAjax();">회원정보</a><br/>
            <a class="myPageInfo" onclick="memberOutBoxAjax();">찜한 목록</a><br/>
            <a class="myPageInfo" onclick="memberWriteAjax();">내가 쓴 글 보기</a><br/>
            <a class="myPageInfo" onclick="memberMessageAjax();">쪽지함</a>
        </div>
    </div>
    <div class="col-md-8">
        <div class="tab-content send-tab" id="myTabContent">
           	 <div class="tab-pane fade show active" id="send" role="tabpanel" aria-labelledby="send-tab">
                <div class="row">
                    <div class="col-md-12">
                    	<form id="messageFrm">
               				<input type="hidden" id="sendId" name="sendId" value="${map.MEMBERID }">
               				<input type="hidden" id="receiveId" name="receiveId" value="${sendId }">
               				<input type="hidden" id="messageNo" name="messageNo" value="${messageNo }">
	                    	<table class="table">
	                    		<tr>
	                    			<th>보낸사람</th>
	                    			<td><c:out value="${map.MEMBERID }"></c:out></td>
	                    			<th>받는사람</th>
	                    			<td><c:out value="${sendId }"></c:out></td>
	                    		</tr>
	                   			<tr>
	                   				<td colspan="4">
										<textarea rows="10" cols="75" name = "messageContent"></textarea>
									</td>
	                   			</tr>
	                   			<tr>
	                   				<td>
	                   					<button class="btn btn-primary" onclick="backMessage();">이전</button>
	                   				</td>
	                   				<td>
	                   					<button class="btn btn-primary" onclick="sendMessage();">보내기</button>
	                   				</td>
	                   				<td></td>
	                   				<td></td>
	                   			</tr>
	                    	</table>
                    	</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	function backMessage(){
		$('#messageFrm').attr("action","${path }/member/memberMyPage.do");
		$('#messageFrm').submit();
	}
	function sendMessage(){
		$('#messageFrm').attr("action","${path }/member/sendMessage.do");
		$('#messageFrm').submit();
	}

</script>