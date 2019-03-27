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
			            <a class="nav-link active" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="true">구매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="freetab();" id="free-tab" data-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="false">자유</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="qnatab();" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="false">Q&A</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="contesttab();" id="contest-tab" data-toggle="tab" href="#contest" role="tab" aria-controls="contest" aria-selected="false">콘테스트</a>
			        </li>	
		        </c:if>
		        <c:if test="${fadeStatus == 2 }">
			        <li class="nav-item">
			            <a class="nav-link" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="false">구매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="true">판매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="freetab();" id="free-tab" data-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="false">자유</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="qnatab();" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="false">Q&A</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="contesttab();" id="contest-tab" data-toggle="tab" href="#contest" role="tab" aria-controls="contest" aria-selected="false">콘테스트</a>
			        </li>	
		        </c:if>
		        <c:if test="${fadeStatus == 3 }">
			        <li class="nav-item">
			            <a class="nav-link" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="false">구매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="freetab();" id="free-tab" data-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="true">자유</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="qnatab();" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="false">Q&A</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="contesttab();" id="contest-tab" data-toggle="tab" href="#contest" role="tab" aria-controls="contest" aria-selected="false">콘테스트</a>
			        </li>	
		        </c:if>
		        <c:if test="${fadeStatus == 4 }">
			        <li class="nav-item">
			            <a class="nav-link" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="false">구매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="freetab();" id="free-tab" data-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="false">자유</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="qnatab();" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="true">Q&A</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="contesttab();" id="contest-tab" data-toggle="tab" href="#contest" role="tab" aria-controls="contest" aria-selected="false">콘테스트</a>
			        </li>	
		        </c:if>
		        <c:if test="${fadeStatus == 5 }">
			        <li class="nav-item">
			            <a class="nav-link" onclick="buytab();" id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="false">구매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="selltab();" id="sell-tab" data-toggle="tab" href="#sell" role="tab" aria-controls="sell" aria-selected="false">판매</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="freetab();" id="free-tab" data-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="false">자유</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" onclick="qnatab();" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="true">Q&A</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link active" onclick="contesttab();" id="contest-tab" data-toggle="tab" href="#contest" role="tab" aria-controls="contest" aria-selected="false">콘테스트</a>
			        </li>	
		        </c:if>
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
		                    		<c:forEach var="bo" items="${buyList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a class="myPageInfo" href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.MEMBERID }"/></td>
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
		                    		<c:forEach var="so" items="${sellList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a class="myPageInfo" href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
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
	            <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalFreeCount != 0 }">
		                    		<c:forEach var="fr" items="${freeList }">
		                    			<tr>
		                    				<td><c:out value="${fr.FREENO }"/></td>
											<td><a class="myPageInfo" href="${path }/board/boardInfoView.do?freeNo=${fr.FREENO }"><c:out value="${fr.FREETITLE }"/></a></td>
											<td><c:out value="${fr.MEMBERID }"/></td>
											<td><c:out value="${fr.FREEDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalFreeCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${freePageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>답변여부</th>
	                    		</tr>
	                    		<c:if test="${totalQnaCount != 0 }">
		                    		<c:forEach var="qna" items="${qnaList }">
		                    			<tr>
		                    				<td><c:out value="${qna.QNANO }"/></td>
											<td><a class="myPageInfo" href="${path }/support/detailQnaView2.do?qnaNo=${qna.QNANO}"><c:out value="${qna.QNATITLE }"/></a></td>
											<td><c:out value="${qna.MEMBERID }"/></td>
											<td><c:out value="${qna.ANSWERYN }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalQnaCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${qnaPageBar }
	                    </div>
	                </div>
	            </div>
            	 <div class="tab-pane fade" id="contest" role="tabpanel" aria-labelledby="contest-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalContestCount != 0 }">
		                    		<c:forEach var="con" items="${contestList }">
		                    			<tr>
		                    				<td><c:out value="${con.CONTESTNO }"/></td>
											<td><a class="myPageInfo" href="${path }/contest/contestDetail.do?contestNo=${con.CONTESTNO }"><c:out value="${con.CONTESTTITLE }"/></a></td>
											<td><c:out value="${con.MEMBERID }"/></td>
											<td><c:out value="${con.CONTESTDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalContestCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${contestPageBar }
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
		                    		<c:forEach var="bo" items="${buyList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a class="myPageInfo" href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.MEMBERID }"/></td>
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
		                    		<c:forEach var="so" items="${sellList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a class="myPageInfo" href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
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
	            <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalFreeCount != 0 }">
		                    		<c:forEach var="fr" items="${freeList }">
		                    			<tr>
		                    				<td><c:out value="${fr.FREENO }"/></td>
											<td><a class="myPageInfo" href="${path }/board/boardInfoView.do?freeNo=${fr.FREENO }"><c:out value="${fr.FREETITLE }"/></a></td>
											<td><c:out value="${fr.MEMBERID }"/></td>
											<td><c:out value="${fr.FREEDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalFreeCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${freePageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>답변여부</th>
	                    		</tr>
	                    		<c:if test="${totalQnaCount != 0 }">
		                    		<c:forEach var="qna" items="${qnaList }">
		                    			<tr>
		                    				<td><c:out value="${qna.QNANO }"/></td>
											<td><a class="myPageInfo" href="${path }/support/detailQnaView2.do?qnaNo=${qna.QNANO}"><c:out value="${qna.QNATITLE }"/></a></td>
											<td><c:out value="${qna.MEMBERID }"/></td>
											<td><c:out value="${qna.ANSWERYN }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalQnaCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${qnaPageBar }
	                    </div>
	                </div>
	            </div>
            	 <div class="tab-pane fade" id="contest" role="tabpanel" aria-labelledby="contest-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalContestCount != 0 }">
		                    		<c:forEach var="con" items="${contestList }">
		                    			<tr>
		                    				<td><c:out value="${con.CONTESTNO }"/></td>
											<td><a class="myPageInfo" href="${path }/contest/contestDetail.do?contestNo=${con.CONTESTNO }"><c:out value="${con.CONTESTTITLE }"/></a></td>
											<td><c:out value="${con.MEMBERID }"/></td>
											<td><c:out value="${con.CONTESTDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalContestCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${contestPageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${fadeStatus == 3 }">
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
		                    		<c:forEach var="bo" items="${buyList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a class="myPageInfo" href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.MEMBERID }"/></td>
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
		                    		<c:forEach var="so" items="${sellList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a class="myPageInfo" href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
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
	            <div class="tab-pane fade show active" id="free" role="tabpanel" aria-labelledby="free-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalFreeCount != 0 }">
		                    		<c:forEach var="fr" items="${freeList }">
		                    			<tr>
		                    				<td><c:out value="${fr.FREENO }"/></td>
											<td><a class="myPageInfo" href="${path }/board/boardInfoView.do?freeNo=${fr.FREENO }"><c:out value="${fr.FREETITLE }"/></a></td>
											<td><c:out value="${fr.MEMBERID }"/></td>
											<td><c:out value="${fr.FREEDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalFreeCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${freePageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>답변여부</th>
	                    		</tr>
	                    		<c:if test="${totalQnaCount != 0 }">
		                    		<c:forEach var="qna" items="${qnaList }">
		                    			<tr>
		                    				<td><c:out value="${qna.QNANO }"/></td>
											<td><a class="myPageInfo" href="${path }/support/detailQnaView2.do?qnaNo=${qna.QNANO}"><c:out value="${qna.QNATITLE }"/></a></td>
											<td><c:out value="${qna.MEMBERID }"/></td>
											<td><c:out value="${qna.ANSWERYN }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalQnaCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${qnaPageBar }
	                    </div>
	                </div>
	            </div>
            	 <div class="tab-pane fade" id="contest" role="tabpanel" aria-labelledby="contest-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalContestCount != 0 }">
		                    		<c:forEach var="con" items="${contestList }">
		                    			<tr>
		                    				<td><c:out value="${con.CONTESTNO }"/></td>
											<td><a class="myPageInfo" href="${path }/contest/contestDetail.do?contestNo=${con.CONTESTNO }"><c:out value="${con.CONTESTTITLE }"/></a></td>
											<td><c:out value="${con.MEMBERID }"/></td>
											<td><c:out value="${con.CONTESTDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalContestCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${contestPageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${fadeStatus == 4 }">
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
		                    		<c:forEach var="bo" items="${buyList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a class="myPageInfo" href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.MEMBERID }"/></td>
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
		                    		<c:forEach var="so" items="${sellList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a class="myPageInfo" href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
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
	            <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalFreeCount != 0 }">
		                    		<c:forEach var="fr" items="${freeList }">
		                    			<tr>
		                    				<td><c:out value="${fr.FREENO }"/></td>
											<td><a class="myPageInfo" href="${path }/board/boardInfoView.do?freeNo=${fr.FREENO }"><c:out value="${fr.FREETITLE }"/></a></td>
											<td><c:out value="${fr.MEMBERID }"/></td>
											<td><c:out value="${fr.FREEDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalFreeCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${freePageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade show active" id="qna" role="tabpanel" aria-labelledby="qna-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>답변여부</th>
	                    		</tr>
	                    		<c:if test="${totalQnaCount != 0 }">
		                    		<c:forEach var="qna" items="${qnaList }">
		                    			<tr>
		                    				<td><c:out value="${qna.QNANO }"/></td>
											<td><a class="myPageInfo" href="${path }/support/detailQnaView2.do?qnaNo=${qna.QNANO}"><c:out value="${qna.QNATITLE }"/></a></td>
											<td><c:out value="${qna.MEMBERID }"/></td>
											<td><c:out value="${qna.ANSWERYN }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalQnaCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${qnaPageBar }
	                    </div>
	                </div>
	            </div>
            	 <div class="tab-pane fade" id="contest" role="tabpanel" aria-labelledby="contest-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalContestCount != 0 }">
		                    		<c:forEach var="con" items="${contestList }">
		                    			<tr>
		                    				<td><c:out value="${con.CONTESTNO }"/></td>
											<td><a class="myPageInfo" href="${path }/contest/contestDetail.do?contestNo=${con.CONTESTNO }"><c:out value="${con.CONTESTTITLE }"/></a></td>
											<td><c:out value="${con.MEMBERID }"/></td>
											<td><c:out value="${con.CONTESTDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalContestCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${contestPageBar }
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${fadeStatus == 5 }">
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
		                    		<c:forEach var="bo" items="${buyList }">
		                    			<tr>
		                    				<td><c:out value="${bo.BUYNO }"/></td>
											<td><a class="myPageInfo" href="${path }/buy/buyDetail?buyNo=${bo.BUYNO }"><c:out value="${bo.BUYTITLE }"/></a></td>
											<td><c:out value="${bo.MEMBERID }"/></td>
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
		                    		<c:forEach var="so" items="${sellList }">
		                    			<tr>
		                    				<td><c:out value="${so.SELLNO }"/></td>
											<td><a class="myPageInfo" href="${path }/sell/selldetail?sellno=${so.SELLNO }"><c:out value="${so.SELLTITLE }"/></a></td>
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
	            <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalFreeCount != 0 }">
		                    		<c:forEach var="fr" items="${freeList }">
		                    			<tr>
		                    				<td><c:out value="${fr.FREENO }"/></td>
											<td><a class="myPageInfo" href="${path }/board/boardInfoView.do?freeNo=${fr.FREENO }"><c:out value="${fr.FREETITLE }"/></a></td>
											<td><c:out value="${fr.MEMBERID }"/></td>
											<td><c:out value="${fr.FREEDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalFreeCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${freePageBar }
	                    </div>
	                </div>
	            </div>
	            <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>답변여부</th>
	                    		</tr>
	                    		<c:if test="${totalQnaCount != 0 }">
		                    		<c:forEach var="qna" items="${qnaList }">
		                    			<tr>
		                    				<td><c:out value="${qna.QNANO }"/></td>
											<td><a class="myPageInfo" href="${path }/support/detailQnaView2.do?qnaNo=${qna.QNANO}"><c:out value="${qna.QNATITLE }"/></a></td>
											<td><c:out value="${qna.MEMBERID }"/></td>
											<td><c:out value="${qna.ANSWERYN }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalQnaCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${qnaPageBar }
	                    </div>
	                </div>
	            </div>
            	 <div class="tab-pane fade show active" id="contest" role="tabpanel" aria-labelledby="contest-tab">
	                <div class="row">
						<div class="col-md-12">
	                    	<table class="table table-striped table-hover">
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>제목</th>
	                    			<th>작성자</th>
	                    			<th>작성일</th>
	                    		</tr>
	                    		<c:if test="${totalContestCount != 0 }">
		                    		<c:forEach var="con" items="${contestList }">
		                    			<tr>
		                    				<td><c:out value="${con.CONTESTNO }"/></td>
											<td><a class="myPageInfo" href="${path }/contest/contestDetail.do?contestNo=${con.CONTESTNO }"><c:out value="${con.CONTESTTITLE }"/></a></td>
											<td><c:out value="${con.MEMBERID }"/></td>
											<td><c:out value="${con.CONTESTDATE }"/></td>
		                    			</tr>
		                    		</c:forEach>
	                    		</c:if>
	                    		<c:if test="${totalContestCount == 0 }">
	                    			<tr>
	                    				<td colspan='4' style="text-align: center;">
	                    					검색된 결과가 없습니다.
	                    				</td>
	                    			</tr>
	                    		</c:if>
	                    	</table>
	                    	${contestPageBar }
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
		$('#free').attr("class","tab-pane fade");
		$('#qna').attr("class","tab-pane fade");
		$('#contest').attr("class","tab-pane fade");
		$('#contest-tab').attr("class","nav-link");
		$('#qna-tab').attr("class","nav-link");
		$('#buy-tab').attr("class","nav-link active");
		$('#sell-tab').attr("class","nav-link");
		$('#free-tab').attr("class","nav-link");
	}
	function selltab(){
		$('#fadeStatus').attr("value","2");
		$('#sell').attr("class","tab-pane fade show active");
		$('#buy').attr("class","tab-pane fade");
		$('#free').attr("class","tab-pane fade");
		$('#qna').attr("class","tab-pane fade");
		$('#contest').attr("class","tab-pane fade");
		$('#contest-tab').attr("class","nav-link");
		$('#qna-tab').attr("class","nav-link");
		$('#sell-tab').attr("class","nav-link active");
		$('#buy-tab').attr("class","nav-link");
		$('#free-tab').attr("class","nav-link");
	}
	function freetab(){
		$('#fadeStatus').attr("value","3");
		$('#sell').attr("class","tab-pane fade");
		$('#buy').attr("class","tab-pane fade");
		$('#free').attr("class","tab-pane fade show active");
		$('#qna').attr("class","tab-pane fade");
		$('#contest').attr("class","tab-pane fade");
		$('#contest-tab').attr("class","nav-link");
		$('#qna-tab').attr("class","nav-link");
		$('#sell-tab').attr("class","nav-link");
		$('#buy-tab').attr("class","nav-link");
		$('#free-tab').attr("class","nav-link active");
	}
	function qnatab(){
		$('#fadeStatus').attr("value","4");
		$('#sell').attr("class","tab-pane fade");
		$('#buy').attr("class","tab-pane fade");
		$('#free').attr("class","tab-pane fade");
		$('#qna').attr("class","tab-pane fade show active");
		$('#contest').attr("class","tab-pane fade");
		$('#contest-tab').attr("class","nav-link");
		$('#qna-tab').attr("class","nav-link active");
		$('#sell-tab').attr("class","nav-link");
		$('#buy-tab').attr("class","nav-link");
		$('#free-tab').attr("class","nav-link");
	}
	function contesttab(){
		$('#fadeStatus').attr("value","5");
		$('#sell').attr("class","tab-pane fade");
		$('#buy').attr("class","tab-pane fade");
		$('#free').attr("class","tab-pane fade");
		$('#qna').attr("class","tab-pane fade");
		$('#contest').attr("class","tab-pane fade show active");
		$('#contest-tab').attr("class","nav-link active");
		$('#qna-tab').attr("class","nav-link");
		$('#sell-tab').attr("class","nav-link");
		$('#buy-tab').attr("class","nav-link");
		$('#free-tab').attr("class","nav-link");
	}
</script>