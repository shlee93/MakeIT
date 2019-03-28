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
		    	<c:if test="${fadeStatus == 1 }">
			        <li class="nav-item">
			            <a class="nav-link active" onclick="sendtab();" id="send-tab" data-toggle="tab" href="#send" role="tab" aria-controls="send" aria-selected="true">보낸메시지</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="receivetab();" id="receive-tab" data-toggle="tab" href="#receive" role="tab" aria-controls="receive" aria-selected="false">받은메시지</a>
			        </li>
		        </c:if>
		        <c:if test="${fadeStatus == 2 }">
			        <li class="nav-item">
			            <a class="nav-link" onclick="sendtab();" id="send-tab" data-toggle="tab" href="#send" role="tab" aria-controls="send" aria-selected="true">보낸메시지</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="receivetab();" id="receive-tab" data-toggle="tab" href="#receive" role="tab" aria-controls="receive" aria-selected="false">받은메시지</a>
			        </li>
		        </c:if>
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
        	<input type="hidden" id="memberId" value="${map.MEMBERID }">
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
            <c:if test="${fadeStatus == 1 }">
            	 <div class="tab-pane fade show active" id="send" role="tabpanel" aria-labelledby="send-tab">
	                <div class="row">
	                    <div class="col-md-12">
		                    	<table class="table table-striped table-hover" style="table-layout:fixed;">
		                    		<tr>
		                    			<th style="width: 10%;"><input type="checkbox" class="allSendCheck"></th>
		                    			<th style="width: 30%;">내용</th>
		                    			<th style="width: 30%;">받는사람</th>
		                    			<th style="width: 30%;">보낸날짜</th>
		                    		</tr>
		                    		<c:if test="${totalSendCount != 0 }">
			                    		<c:forEach var="sm" items="${sendMessage }">
			                    			<tr>
			                    				<td style="width: 10%;"><input type="checkbox" class="sendDeleteCk" name="sendDeleteCk" value="${sm.MESSAGENO }"></td>
			                    				<td style="width: 30%; white-space : nowrap; text-overflow:ellipsis; overflow:hidden;"><a class="myPageInfo" onclick="messageView(${sm.MESSAGENO});"><c:out value="${sm.MESSAGECONTENT }"/></a></td>
												<td style="width: 30%;"><c:out value="${sm.RECEIVEID }"/></td>
												<td style="width: 30%;"><c:out value="${sm.SENDDATE }"/></td>
			                    			</tr>
			                    		</c:forEach>
		                    		</c:if>
		                    		<c:if test="${totalSendCount == 0 }">
		                    			<tr>
		                    				<td colspan='4' style="text-align: center;">
		                    					검색된 결과가 없습니다.
		                    				</td>
		                    			</tr>
		                    		</c:if>
		                    	</table>
		                    	<input type="submit" class="btn btn-outline-info slidetopleft" onclick="fn_sendDeleteBtn();" value="삭제">
		                    	<input type="button"class="btn btn-outline-info slidetopleft" onclick="fn_sendBtn();" value="보내기">
	                    	${sendPageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="receive" role="tabpanel" aria-labelledby="receive-tab">
	                <div class="row">
						<div class="col-md-12">
		                    	<table class="table table-striped table-hover" style="table-layout:fixed;">
		                    		<tr>
		                    			<th style="width: 10%;"><input type="checkbox" class="allReceiveCheck"></th>
		                    			<th style="width: 30%;">내용</th>
		                    			<th style="width: 30%;">보낸사람</th>
		                    			<th style="width: 30%;">보낸날짜</th>
		                    		</tr>
		                    		<c:if test="${totalReceiveCount != 0 }">
			                    		<c:forEach var="rm" items="${receiveMessage }">
			                    			<tr>
			                    				<td style="width: 10%;"><input type="checkbox" class="receiveDeleteCk" name="receiveDeleteCk" value="${rm.MESSAGENO }"></td>
			                    				<td style="wedth: 30%; white-space : nowrap; text-overflow:ellipsis; overflow:hidden;"><a class="myPageInfo" onclick="messageView(${rm.MESSAGENO});"><c:out value="${rm.MESSAGECONTENT }"/></a></td>
												<td style="width: 30%;"><c:out value="${rm.SENDID }"/></td>
												<td style="width: 30%;"><c:out value="${rm.SENDDATE }"/></td>
			                    			</tr>
			                    		</c:forEach>
		                    		</c:if>
		                    		<c:if test="${totalReceiveCount == 0 }">
		                    			<tr>
		                    				<td colspan='4' style="text-align: center;">
		                    					검색된 결과가 없습니다.
		                    				</td>
		                    			</tr>
		                    		</c:if>
		                    	</table>
		                    	<input type="submit" class="btn btn-outline-info slidetopleft" onclick="fn_receiveDeleteBtn();" value="삭제">
		                    	<input type="button"class="btn btn-outline-info slidetopleft" onclick="fn_sendBtn();" value="보내기">
	                    	${receivePageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${fadeStatus == 2 }">
            	 <div class="tab-pane fade" id="send" role="tabpanel" aria-labelledby="send-tab">
	                <div class="row">
	                    <div class="col-md-12">
	                    	<form action="${path }/member/messageSendSelectDel.do" method="post">
		                    	<table class="table table-striped table-hover" style="table-layout:fixed;">
		                    		<tr>
		                    			<th style="width: 10%;"><input type="checkbox" class="allSendCheck"></th>
		                    			<th style="width: 30%;">내용</th>
		                    			<th style="width: 30%;">받는사람</th>
		                    			<th style="width: 30%;">보낸날짜</th>
		                    		</tr>
		                    		<c:if test="${totalSendCount != 0 }">
			                    		<c:forEach var="sm" items="${sendMessage }">
			                    			<tr>
			                    				<td style="width: 10%;"><input type="checkbox" class="sendDeleteCk" name="sendDeleteCk" value="${sm.MESSAGENO }"></td>
			                    				<td style="width: 30%; white-space : nowrap; text-overflow:ellipsis; overflow:hidden;"><a class="myPageInfo" onclick="messageView(${sm.MESSAGENO});"><c:out value="${sm.MESSAGECONTENT }"/></a></td>
												<td style="width: 30%;"><c:out value="${sm.RECEIVEID }"/></td>
												<td style="width: 30%;"><c:out value="${sm.SENDDATE }"/></td>
			                    			</tr>
			                    		</c:forEach>
		                    		</c:if>
		                    		<c:if test="${totalSendCount == 0 }">
		                    			<tr>
		                    				<td colspan='4' style="text-align: center;">
		                    					검색된 결과가 없습니다.
		                    				</td>
		                    			</tr>
		                    		</c:if>
		                    	</table>
		                    	<input type="submit"class="btn btn-outline-info slidetopleft" onclick="fn_sendDeleteBtn();" value="삭제">
		                    	<input type="button"class="btn btn-outline-info slidetopleft" onclick="fn_sendBtn();" value="보내기">
	                    	</form>
	                    	${sendPageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade show active" id="receive" role="tabpanel" aria-labelledby="receive-tab">
	                <div class="row">
						<div class="col-md-12">
		                    	<table class="table table-striped table-hover" style="table-layout:fixed;">
		                    		<tr>
		                    			<th style="width: 10%;"><input type="checkbox" class="allReceiveCheck"></th>
		                    			<th style="width: 30%;">내용</th>
		                    			<th style="width: 30%;">보낸사람</th>
		                    			<th style="width: 30%;">보낸날짜</th>
		                    		</tr>
		                    		<c:if test="${totalReceiveCount != 0 }">
			                    		<c:forEach var="rm" items="${receiveMessage }">
			                    			<tr>
			                    				<td style="width: 10%;"><input type="checkbox" class="receiveDeleteCk" name="receiveDeleteCk" value="${rm.MESSAGENO }"></td>
			                    				<td style="width: 30%; white-space : nowrap; text-overflow:ellipsis; overflow:hidden;">
			                    					<a class="myPageInfo" onclick="messageView(${rm.MESSAGENO});"><c:out value="${rm.MESSAGECONTENT }"/></a>
			                    				</td>
												<td style="width: 30%;"><c:out value="${rm.SENDID }"/></td>
												<td style="width: 30%;"><c:out value="${rm.SENDDATE }"/></td>
			                    			</tr>
			                    		</c:forEach>
		                    		</c:if>
		                    		<c:if test="${totalReceiveCount == 0 }">
		                    			<tr>
		                    				<td colspan='4' style="text-align: center;">
		                    					검색된 결과가 없습니다.
		                    				</td>
		                    			</tr>
		                    		</c:if>
		                    	</table>
		                    	<input type="button"class="btn btn-outline-info slidetopleft" onclick="fn_receiveDeleteBtn();" value="삭제">
		                    	<input type="button"class="btn btn-outline-info slidetopleft" onclick="fn_sendBtn();" value="보내기">
	                    	${receivePageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
        </div>
    </div>
    <input type="hidden" id="fadeStatus" name="fadeStatus" value="${fadeStatus }">
</div>
<script>
	function fn_sendDeleteBtn(){
		var list = "";
		var size = document.getElementsByName("sendDeleteCk").length;
	    for(var i = 0; i < size; i++){
	        if(document.getElementsByName("sendDeleteCk")[i].checked == true){
    			if(i!=0) {
    				list += ",";
    			}
    			list += document.getElementsByName("sendDeleteCk")[i].value;
	    		
	        }
	    }

		$.ajax({
			url:"${path }/member/messageSendSelectDel.do",
			dataType:"html",
			data:{"sendDeleteCk":list},
			success:function(data){
				alert(data);
				$.ajax({
					url:"${path}/member/memberMessageAjax.do",
					dataType:"html",
					data:{"memberId":$('#sendId').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}
		});
	}
	function fn_receiveDeleteBtn(){
		var list = "";
		var size = document.getElementsByName("receiveDeleteCk").length;
	    for(var i = 0; i < size; i++){
	        if(document.getElementsByName("receiveDeleteCk")[i].checked == true){
    			if(i!=0) {
    				list += ",";
    			}
    			list += document.getElementsByName("receiveDeleteCk")[i].value;
	    		
	        }
	    }
		$.ajax({
			url:"${path }/member/messageReceiveSelectDel.do",
			dataType:"html",
			data:{"receiveDeleteCk":list},
			success:function(data){
				alert(data);
				$.ajax({
					url:"${path}/member/memberMessageAjax.do",
					dataType:"html",
					data:{"memberId":$('#sendId').val()},
					success:function(data){
						console.log(data);
						$('#ajaxHtml').html(data);
					}
				});
			}
		});
	}
	function fn_sendBtn(){
		$.ajax({
			url:"${path}/member/sendMessage.do",
			dataType:"html",
			data:{"memberId":$('#memberId').val()},
			success:function(data){
				$('#ajaxHtml').html(data);
			}
		});
	}
	function sendtab(){
		$('#fadeStatus').attr("value","1");
		$('#send').attr("class","tab-pane fade show active");
		$('#receive').attr("class","tab-pane fade");
		$('#send-tab').attr("class","nav-link active");
		$('#receive-tab').attr("class","nav-link");
	}
	function receivetab(){
		$('#fadeStatus').attr("value","2");
		$('#receive').attr("class","tab-pane fade show active");
		$('#send').attr("class","tab-pane fade");
		$('#receive-tab').attr("class","nav-link active");
		$('#send-tab').attr("class","nav-link");
	}
	function messageView(messageNo){
		$.ajax({
			url:"${path}/member/memberMessageDetailAjax.do",
			dataType:"html",
			data:{"memberId":$('#memberId').val()
				,"messageNo":messageNo},
			success:function(data){
				console.log(data);
				$('#ajaxHtml').html(data);
			}
		});
	}
	$(function(){ 
		//전체선택 체크박스 클릭 
		$(".allSendCheck").click(function(){ 
			//만약 전체 선택 체크박스가 체크된상태일경우 
			if($(".allSendCheck").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[name=sendDeleteCk]").prop("checked",true); 
				// 전체선택 체크박스가 해제된 경우 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[name=sendDeleteCk]").prop("checked",false); 
			} 
		}); 
	});
	$(function(){ 
		//전체선택 체크박스 클릭 
		$(".allReceiveCheck").click(function(){ 
			//만약 전체 선택 체크박스가 체크된상태일경우 
			if($(".allReceiveCheck").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[name=receiveDeleteCk]").prop("checked",true); 
				// 전체선택 체크박스가 해제된 경우 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[name=receiveDeleteCk]").prop("checked",false); 
			} 
		}); 
	});

</script>