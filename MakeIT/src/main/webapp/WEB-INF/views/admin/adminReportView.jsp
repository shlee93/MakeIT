<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:if test="${empty reportList }">
<div>
	데이터가 없습니다!
</div>
</c:if>
<c:if test="${not empty reportList }">
	<c:forEach items='${reportList }' var="report">
		<c:choose>
			<c:when test="${report.CATEGORYCODE eq 'S' }">
				<div class="panel-body">
					<div class="report-tab-back">
						<ul class="report-tab">
							<li><strong>피신고인:</strong> <span class="report-id">${report.MEMBERID }</span>
							</li>&nbsp;&nbsp;&nbsp;&nbsp;
							<li><strong>신고일:</strong> <span class="report-date">${report.SELLREPORTDATE }</span>
							</li>
						</ul>
					</div>
					<div class="report-info-back">
						<div class="row">
							<div class="col-md-3" align="center">
								<h3 class="panel-title">${report.SELLID }</h3>
								<img alt="User Pic" src="${path }/upload/member/${report.REIMG}" class="img-circle img-responsive">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>분야</td>
											<td>${report.INTERESTNO }</td>
										</tr>
										<tr>
											<td>신고일</td>
											<td>${report.SELLREPORTDATE }</td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td>${report.BIRTH }</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${report.ADDRESS }</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><a href="#">${report.EMAIL }</a></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${report.PHONE }</td>
										</tr>
										<tr>
											<td>등급</td>
											<td>${report.GRADENAME }</td>
										</tr>
										<tr>
											<td>신고 횟수</td>
											<td>${report.REPORTCOUNT}</td>
										</tr>
										<tr>
											<td>신고인</td>
											<td>${report.MEMBERID }</td>
										</tr>
										<tr>
											<td>신고 글 제목</td>
											<td><span class="report-title">${report.SELLTITLE }</span>
												<input type="hidden" class="report-title-no" value="${report.SELLNO }" />
											</td>
										</tr>
										<tr>
											<td>신고 사유</td>
											<td>
												<p>${report.SELLREPORTCONTENT }</p>
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="hidden" class="content-no" value="${report.BUYNO }"/>
												<button class="report-btn-cancel btn btn-outline-info slidetopleft">신고 거부</button>
												<button class="report-btn btn btn-outline-info slidetopleft">신고 승인</button>
											</td>
										</tr>
		
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			
			</c:when>
			<c:when test="${report.CATEGORYCODE eq 'C' }">
				<div class="panel-body">
					<div class="report-tab-back">
						<ul class="report-tab">
							<li><strong>피신고인:</strong> <span class="report-id">${report.MEMBERID }</span>
							</li>&nbsp;&nbsp;&nbsp;&nbsp;
							<li><strong>신고일:</strong> <span class="report-date">${report.CONTESTREPORTDATE }</span>
							</li>
						</ul>
					</div>
					<div class="report-info-back">
						<div class="row">
							<div class="col-md-3" align="center">
								<h3 class="panel-title">${report.CONTESTID }</h3>
								<img alt="User Pic" src="${path }/upload/member/${report.REIMG}" class="img-circle img-responsive">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>분야</td>
											<td>${report.INTERESTNO }</td>
										</tr>
										<tr>
											<td>신고일</td>
											<td>${report.CONTESTREPORTDATE }</td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td>${report.BIRTH }</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${report.ADDRESS }</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><a href="#">${report.EMAIL }</a></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${report.PHONE }</td>
										</tr>
										<tr>
											<td>등급</td>
											<td>${report.GRADENAME }</td>
										</tr>
										<tr>
											<td>신고 횟수</td>
											<td>${report.REPORTCOUNT}</td>
										</tr>
										<tr>
											<td>신고인</td>
											<td>${report.MEMBERID }</td>
										</tr>
										<tr>
											<td>신고 글 제목</td>
											<td><span class="report-title">${report.CONTESTTITLE }</span>
												<input type="hidden" class="report-title-no" value="${report.CONTESTNO }" />
											</td>
										</tr>
										<tr>
											<td>신고 사유</td>
											<td>
												<p>${report.CONTESTREPORTCONTENT }</p>
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="hidden" class="content-no" value="${report.BUYNO }"/>
												<button class="report-btn btn btn-outline-info slidetopleft">신고승인</button>
												<button class="report-btn-cancel btn btn-outline-info slidetopleft">신고거부</button>
											</td>
										</tr>
		
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${report.CATEGORYCODE eq 'F' }">
				<div class="panel-body">
					<div class="report-tab-back">
						<ul class="report-tab">
							<li><strong>피신고인:</strong> <span class="report-id">${report.MEMBERID }</span>
							</li>&nbsp;&nbsp;&nbsp;&nbsp;
							<li><strong>신고일:</strong> <span class="report-date">${report.FREEREPORTDATE }</span>
							</li>
						</ul>
					</div>
					<div class="report-info-back">
						<div class="row">
							<div class="col-md-3" align="center">
								<h3 class="panel-title">${report.FREEID }</h3>
								<img alt="User Pic" src="${path }/upload/member/${report.REIMG}" class="img-circle img-responsive">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>분야</td>
											<td>${report.INTERESTNO }</td>
										</tr>
										<tr>
											<td>신고일</td>
											<td>${report.FREEREPORTDATE }</td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td>${report.BIRTH }</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${report.ADDRESS }</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><a href="#">${report.EMAIL }</a></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${report.PHONE }</td>
										</tr>
										<tr>
											<td>등급</td>
											<td>${report.GRADENAME }</td>
										</tr>
										<tr>
											<td>신고 횟수</td>
											<td>${report.REPORTCOUNT}</td>
										</tr>
										<tr>
											<td>신고인</td>
											<td>${report.MEMBERID }</td>
										</tr>
										<tr>
											<td>신고 글 제목</td>
											<td><span class="report-title">${report.FREETITLE }</span>
												<input type="hidden" class="report-title-no" value="${report.FREENO }" />
											</td>
										</tr>
										<tr>
											<td>신고 사유</td>
											<td>
												<p>${report.FREEREPORTCONTENT }</p>
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="hidden" class="content-no" value="${report.BUYNO }"/>
												<button class="report-btn btn btn-outline-info slidetopleft">신고 승인</button>
												<button class="report-btn-cancel btn btn-outline-info slidetopleft">신고 거부</button>
											</td>
										</tr>
		
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${report.CATEGORYCODE eq 'B' }">
				<div class="panel-body">
					<div class="report-tab-back">
						<ul class="report-tab">
							<li><strong>피신고인:</strong> <span class="report-id">${report.MEMBERID }</span>
							</li>&nbsp;&nbsp;&nbsp;&nbsp;
							<li><strong>신고일:</strong> <span class="report-date">${report.BUYREPORTDATE }</span>
							</li>
						</ul>
					</div>
					<div class="report-info-back">
						<div class="row">
							<div class="col-md-3" align="center">
								<h3 class="panel-title">${report.BUYID }</h3>
								<img alt="User Pic" src="${path }/upload/member/${report.REIMG}" class="img-circle img-responsive">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>분야</td>
											<td>${report.INTERESTNO }</td>
										</tr>
										<tr>
											<td>신고일</td>
											<td>${report.BUYREPORTDATE }</td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td>${report.BIRTH }</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${report.ADDRESS }</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><a href="#">${report.EMAIL }</a></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${report.PHONE }</td>
										</tr>
										<tr>
											<td>등급</td>
											<td>${report.GRADENAME }</td>
										</tr>
										<tr>
											<td>신고 횟수</td>
											<td>${report.REPORTCOUNT}</td>
										</tr>
										<tr>
											<td>신고인</td>
											<td>${report.MEMBERID }</td>
										</tr>
										<tr>
											<td>신고 글 제목</td>
											<td><span class="report-title">${report.BUYTITLE }</span>
												<input type="hidden" class="report-title-no" value="${report.BUYNO }" />
											</td>
										</tr>
										<tr>
											<td>신고 사유</td>
											<td>
												<p>${report.BUYREPORTCONTENT }</p>
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="hidden" class="content-no" value="${report.BUYNO }"/>
												<button class="report-btn btn btn-outline-info slidetopleft">신고 승인</button>
												<button class="report-btn-cancel btn btn-outline-info slidetopleft">신고 거부</button>
											</td>
										</tr>
		
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
			<div>
				데이터가 없습니다!
			</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>
<c:if test="${not empty reportList }">
	<div class="page-bar-back">
		${pageBarReport }
	</div>
</c:if>