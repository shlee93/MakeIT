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
	   		<c:if test="${fadeStatus == 1 }">
			    <ul class="nav nav-tabs" id="myTab" role="tablist">
			        <li class="nav-item">
			            <a class="nav-link active" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="true">구매 찜 리스트</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매 찜 리스트</a>
			        </li>
			    </ul>
		    </c:if>
		    <c:if test="${fadeStatus == 2 }">
			    <ul class="nav nav-tabs" id="myTab" role="tablist">
			        <li class="nav-item">
			            <a class="nav-link" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="true">구매 찜 리스트</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매 찜 리스트</a>
			        </li>
			    </ul>
		    </c:if>
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
        	<c:if test="${fadeStatus == 1 }">
	            <div class="tab-pane fade show active" id="buy" role="tabpanel" aria-labelledby="buy-tab">
	                <div class="row">
	                    <div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalBuyCount != 0 }">
		                    		<c:forEach var="bo" items="${buyOutBoxList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.BUYWRITER }"/></td>
											<td><c:out value="${bo.BUYDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalBuyCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${buyPageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="sell" role="tabpanel" aria-labelledby="sell-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalSellCount != 0 }">
		                    		<c:forEach var="so" items="${sellOutBoxList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
											<td><c:out value="${so.MEMBERID }"/></td>
											<td><c:out value="${so.SELLDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalSellCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${sellPageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${fadeStatus == 2 }">
            	<div class="tab-pane fade" id="buy" role="tabpanel" aria-labelledby="buy-tab">
	                <div class="row">
	                    <div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalBuyCount != 0 }">
		                    		<c:forEach var="bo" items="${buyOutBoxList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.BUYWRITER }"/></td>
											<td><c:out value="${bo.BUYDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalBuyCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${buyPageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade show active" id="sell" role="tabpanel" aria-labelledby="sell-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalSellCount != 0 }">
		                    		<c:forEach var="so" items="${sellOutBoxList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
											<td><c:out value="${so.MEMBERID }"/></td>
											<td><c:out value="${so.SELLDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalSellCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${sellPageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
        </div>
    </div>
    <input type="hidden" id="fadeStatus" name="fadeStatus" value="${fadeStatus }">
</div>
<script>
	function buytab(){
		$('#fadeStatus').attr("value","1");
		$('#buy').attr("class","tab-pane fade show active");
		$('#sell').attr("class","tab-pane fade");
		$('#buy-tab').attr("class","nav-link active");
		$('#sell-tab').attr("class","nav-link");
	}
	function selltab(){
		$('#fadeStatus').attr("value","2");
		$('#sell').attr("class","tab-pane fade show active");
		$('#buy').attr("class","tab-pane fade");
		$('#sell-tab').attr("class","nav-link active");
		$('#buy-tab').attr("class","nav-link");
	}
</script>