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
	        <c:if test="${map.REIMG != null }">
            	<img src="${path }/resources/upload/member/${map.REIMG}" alt=""/>
            </c:if>
            <c:if test="${map.REIMG == null }">
            	<img src="${path }/resources/image/logo1.png" alt=""/>
            </c:if>
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
			<input type="button" onclick="updateMember();" class="btn btn-outline-info slidetopleft" name="updateBtn" value="정보수정"/>
			<input type="button" onclick="deleteMember();" class="btn btn-outline-info slidetopleft" name="deleteBtn" value="회원탈퇴"/>
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
                   		<input type="hidden" id="messageNo" name="messageNo" value="${message.MESSAGENO }">
            			<input type="hidden" id="memberId" name="memberId" value="${map.MEMBERID }">
              			<input type="hidden" id="sendId" name="sendId" value="${message.SENDID }">
                    	<table class="table">
                    		<tr>
                    			<th>번호</th>
                    			<td>
                    				${message.MESSAGENO }
                    			</td>
                    			<th>보낸날짜</th>
                    			<td><c:out value="${message.SENDDATE }"></c:out></td>
                    		</tr>
                    		<tr>
                    			<th>보낸사람</th>
                    			<td><c:out value="${message.SENDID }"></c:out></td>
                    			<th>받는사람</th>
                    			<td><c:out value="${message.RECEIVEID }"></c:out></td>
                    		</tr>
                   			<tr>
                   				<td colspan="4"><c:out value="${message.MESSAGECONTENT }"/></td>
                   			</tr>
                   			<tr>
                   				<td colspan='3'>
                   					<button class="btn btn-outline-info slidetopleft" onclick="backMessageList();">이전</button>
                   					<button class="btn btn-outline-info slidetopleft" onclick="deleteMessage();">삭제</button>
                   					<c:if test="${message.RECEIVEID==map.MEMBERID }">
                   						<button class="btn btn-outline-info slidetopleft" onclick="reMessage();">답장</button>
                   					</c:if>
                   				</td>
                   				<td></td>
                   			</tr>
                    	</table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	function backMessageList(){
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
	function deleteMessage(){
		$.ajax({
			url:"${path }/member/deleteMessage.do",
			dataType:"html",
			data:{"memberId":$('#memberId').val(),
				"messageNo":$('#messageNo').val()},
			success:function(data){
				alert(data);
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
		});
	}
	function reMessage(){
		$.ajax({
			url:"${path}/member/reSendMessage.do",
			dataType:"html",
			data:{"memberId":$('#memberId').val(),
				"sendId":$('#sendId').val(),
				"messageNo":$('#messageNo').val()},
			success:function(data){
				$('#ajaxHtml').html(data);
			}
		});
	}
</script>