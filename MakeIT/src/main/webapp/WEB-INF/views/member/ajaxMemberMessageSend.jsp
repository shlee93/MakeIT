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
			<c:if test="${map.MEMBERLEVEL != 0 }">
              	<input type="button" onclick="deleteMember();" class="btn btn-outline-info slidetopleft" name="deleteBtn" value="회원탈퇴"/>
            </c:if>
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
            <a class="myPageInfo" onclick="memberMessageAjax();">쪽지함</a><br/>
            <a class="myPageInfo" onclick="memberTradeAjax();">거래내역</a>
        </div>
    </div>
    <div class="col-md-8">
        <div class="tab-content send-tab" id="myTabContent">
           	 <div class="tab-pane fade show active" id="send" role="tabpanel" aria-labelledby="send-tab">
                <div class="row">
                    <div class="col-md-12">
                    	<table class="table">
                    		<tr>
                    			<th>보낸사람</th>
                    			<td><input type="text" id="sendId" name="sendId" class="form-control" value="<c:out value="${map.MEMBERID }"></c:out>" readonly></td>
                    			<th>받는사람</th>
                    			<td>
                   					<input type="text" id="receiveId" name="receiveId" class="form-control" placeholder="받는사람 ID" value="" list="datalist">
                   					<datalist id="datalist"></datalist>
                    			</td>
                    		</tr>
                   			<tr>
                   				<td colspan="4">
									<textarea rows="10" cols="80" id="messageContent" name = "messageContent"></textarea>
								</td>
                   			</tr>
                   			<tr>
                   				<td colspan='2'>
                   					<button class="btn btn-outline-info slidetopleft" onclick="backMessage();">이전</button>
                   					<button class="btn btn-outline-info slidetopleft" onclick="sendMessage();">보내기</button>
                   				</td>
                   				<td></td>
                   				<td></td>
                   			</tr>
                    	</table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="fadeStatus" name="fadeStatus" value="${fadeStatus }">
<script>
	$('#messageContent').on('keyup', function() {
		if($(this).val().length > 300) {
			alert("글자수는 300자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 300));
		}
	
	});
	$(document).on('keyup','#receiveId',function(){
		var receiveId=$('#receiveId').val();
		
		$.ajax({
			url:"${path}/member/memberSearch.do",
			data:{"receiveId":receiveId},
			dataType:"html",
			success:function(data){
				var ids = data.split(",");
				var html = "";
				for(var i = 0; i < ids.length; i++){
					html+="<option>"+ids[i]+"</option>"
				}
				$('#datalist').html(html);
			}
		});
	});
	function backMessage(){
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
	function sendMessage(){
		$('#naviBarStatus').attr("value","4");
		var receiveId = $('#receiveId').val().trim();
		if(receiveId.length == 0){
			alert('수신자를 입력해주세요');
			return false;
		} else {
			if($('#messageContent').val().trim().length == 0){
				alert('내용을 입력해주세요');
				return false;
			} else{
				if($('#sendId').val()==$('#receiveId').val()){
					alert("본인에게는 메시지를 보낼 수 없습니다.");
					return false;
				}
				$.ajax({
					url:"${path}/member/reSendMessageEnd.do",
					dataType:"html",
					data:{"sendId":$('#sendId').val(),
						"receiveId":$('#receiveId').val(),
						"messageContent":$('#messageContent').val()},
					success:function(data){
						alert(data);
						if(data=="메시지가 정상적으로 발송되었습니다."){
							$.ajax({
								url:"${path}/member/memberMessageAjax.do",
								dataType:"html",
								data:{"memberId":$('#sendId').val()},
								success:function(data){
									console.log(data);
									$('#ajaxHtml').html(data);
								}
							});
						} else{
							$('#receiveId').val('');
							$('#receiveId').focus();
							/* $.ajax({
								url:"${path}/member/sendMessage.do",
								dataType:"html",
								data:{"memberId":$('#sendId').val()},
								success:function(data){
									console.log(data);
									$('#ajaxHtml').html(data);
								}
							}); */
						}
						
					}
				});
			}
		}
	}

</script>