<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

	<section id="tabs" class="project-tab">
		<div class="container">
    		<div class="row">
        		<div class="col-md-1"></div>
            		<div class="col-md-10">
                	<nav>
                        <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-member-tab" data-toggle="tab" href="#nav-member"
                                role="tab" aria-controls="nav-member" aria-selected="true">회원관리</a>
                            <a class="nav-item nav-link" id="nav-approval-tab" data-toggle="tab" href="#nav-approval"
                                role="tab" aria-controls="nav-approval" aria-selected="false">게시글 승인</a>
                            <a class="nav-item nav-link" id="nav-report-tab" data-toggle="tab" href="#nav-report" role="tab"
                                aria-controls="nav-report" aria-selected="false">신고회원 처리</a>
                            <a class="nav-item nav-link" id="nav-payment-tab" data-toggle="tab" href="#nav-payment"
                                role="tab" aria-controls="nav-payment" aria-selected="false">결제 현황</a>
                            <a class="nav-item nav-link" id="nav-refund-tab" data-toggle="tab" href="#nav-refund" role="tab"
                                aria-controls="nav-refund" aria-selected="false">환불 요청</a>
                            <a class="nav-item nav-link" id="nav-category-tab" data-toggle="tab" href="#nav-category"
                                role="tab" aria-controls="nav-category" aria-selected="false">카테고리 관리</a>
                            <a class="nav-item nav-link" id="nav-faq-tab" data-toggle="tab" href="#nav-faq" role="tab"
                                aria-controls="nav-faq" aria-selected="false">FAQ 관리</a>
                            <input type="hidden" id="view-status" value="member"/>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                    <!-- 회원관리 탭 -->
                        <div class="tab-pane fade show active" id="nav-member" role="tabpanel" aria-labelledby="nav-member-tab">
                            <!--회원 검색 div  -->
                            <div class="member-search">
                                <div id="search-icon">검색</div>
                                <input id="search-id" type="text" placeholder="검색할 회원의 아이디를 입력해주세요" size="50"/>
                                <select id="member-sort">
                                	<option class="member-sort-option" value="nosort">정렬</option>
                                    <option class="member-sort-option" value="memberid">아이디</option>
                                    <option class="member-sort-option" value="membername">이름</option>
                                    <option class="member-sort-option" value="address">주소</option>
                                    <option class="member-sort-option" value="entdate">가입일</option>
                                    <option class="member-sort-option" value="birth">생년월일</option>
                                    <option class="member-sort-option" value="gradeno">등급</option>
                                </select>
                                <input type="hidden" id="memberIdSort" value="0"/>
                                <input type="hidden" id="memberNameSort" value="0"/>
                                <input type="hidden" id="addressSort" value="0"/>
                                <input type="hidden" id="entDateSort" value="0"/>
                                <input type="hidden" id="birthSort" value="0"/>
                                <input type="hidden" id="gradeNoSort" value="0"/>
                                <button id="member-sort-reverse" style="display:none">▼</button>
                            </div>
                            <hr>
                            <table class="table member-view" cellspacing="0">
                                <!-- 회원 정보 출력 테이블 -->
                                <c:choose>
                                	<c:when test="${not empty memberList }">
                                		<thead>
		                                    <tr>
		                                        <th>ID</th>
		                                        <th>이름</th>
		                                        <th>전화번호</th>
		                                        <th>주소</th>
		                                        <th>가입일</th>
		                                        <th>생년월일</th>
		                                        <th>등급<th>
		                                    </tr>
		                                </thead>
		                                <tbody>
                                		<c:forEach items="${memberList }" var="member">
                                			<c:if test="${member.get('MEMBERLEVEL') eq 1 or member.get('MEMBERLEVEL') eq 2 }">
                                				
	                                				<tr>
				                                        <td><a href="#" class="member-id">${member.get("MEMBERID")}</a></td>
				                                        <td>${member.get("MEMBERNAME")}</td>
				                                        <td>${member.get("PHONE")}</td>
				                                        <td>${member.get("ADDRESS")}</td>
				                                        <td>${member.get("ENTDATE")}</td>
				                                        <td>${member.get("BIRTH")}</td>
				                                        <td>${member.get("GRADENAME")}</td>
				                                    </tr>
			                                    
                                			</c:if>
                                		</c:forEach>
                                			<tr>
                                				<td colspan="7">${memberPageBar }</td>
                                			</tr>
                                		</tbody>
                                	</c:when>
                                	<c:otherwise>

											<tr>
												<th>회원정보가 없습니다.</th>
											</tr>

										</tbody>
									</c:otherwise>
                                </c:choose>
	                    	</table>
                                    
                        </div>
                        <div class="tab-pane fade" id="nav-approval" role="tabpanel" aria-labelledby="nav-approval-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>미승인 게시글 리스트</th>

                                    </tr>
                                </thead>

                            </table>
                            <div class='row'>

                                <div class='col-md-12'>
                                    <div class='row'>
                                        <div class='col-md-3 col-xs-3'>

                                            <!-- 네비 사이드 -->

                                            <div class="nav-side-menu">
                                                <div class="brand">Brand Logo</div>
                                                <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
                                                    data-target="#menu-content"></i>
                                                <div class="menu-list">
                                                    <ul id="menu-content" class="menu-content collapse out">

                                                        <li class='side-nav-li' data-toggle="collapse" data-target="#new"
                                                            class="collapsed">
                                                            <a href="#">
                                                                <i class="fas fa-credit-card fa-lg"></i> 구매
                                                            </a>
                                                        </li>
                                                        <li class='side-nav-li' data-toggle="collapse" data-target="#new"
                                                            class="collapsed">
                                                            <a href="#">
                                                                <i class="fa fas fa-trophy fa-lg"></i> 판매
                                                            </a>
                                                        </li>
                                                        <li class='side-nav-li' data-toggle="collapse" data-target="#new"
                                                            class="collapsed">
                                                            <a href="#">
                                                                <i class="fas fa-address-card"></i> 블라인드채용
                                                            </a>
                                                        </li>
                                                        <li class='side-nav-li' data-toggle="collapse" data-target="#new"
                                                            class="collapsed">
                                                            <a href="#">
                                                                <i class="fas fa-fax fa-lg"></i> 고객센터
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>

                                            <!-- 네비 사이드 끝 -->

                                        </div>

                                        <!-- 앨범뷰 -->

                                        <div class='col-md-9 col-xs-9' style='position:relative; min-width: 400px'>

                                            <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" style='border-top:2px solid #337ab7;'>

                                                <!-- 앨범 뷰 탭 컨텐츠1 -->

                                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                                    aria-labelledby="nav-home-tab">

                                                    <div class="container mt-40">

                                                        <h3 class="text-center">미승인 게시글 리스트</h3>
                                                        <div class="row mt-30">
                                                            <div class="col-md-4 col-sm-6 col-xs-10">
                                                                <div class="box3" style='margin: 20px;'>
                                                                    <img src="https://www.kclf.org/wp-content/uploads/2016/12/IMG_64732-e1482971378190.jpg"
                                                                        style='width: 100%; height: 200px;'>
                                                                    <div class="box-content">
                                                                        <h3 class="title">Williamson</h3>
                                                                        <span class="post">Web Developer</span>
                                                                        <p class="description">
                                                                            Lorem ipsum dolor sit amet, consectetur
                                                                            adipisicing elit. A ad adipisci pariatur
                                                                            qui.
                                                                        </p>
                                                                        <ul class="icon">
                                                                            <li><a href="#" class="fa fa-search"></a></li>
                                                                            <li><a href="#" class="fa fa-link"></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class='sub-description'>
                                                                    <div style='float:left;'>
                                                                        <p>asdfdsfsdfasdfasdfasdfad</p>
                                                                    </div>
                                                                    <div class='infobox' style='float:right; display: inline;'>
                                                                        <p>단가: 100000</p>
                                                                        <p>등급: 280000</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-10">
                                                                <div class="box3" style='margin: 20px;'>
                                                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo4OnPzedTH7ZAEajSaiA2RTcWn-FQTkQA9JdA60hXit7xiV0q"
                                                                        style='width: 100%; height: 200px;'>
                                                                    <div class="box-content">
                                                                        <h3 class="title">Kristiana</h3>
                                                                        <span class="post">Web Designer</span>
                                                                        <p class="description">
                                                                            Lorem ipsum dolor sit amet, consectetur
                                                                            adipisicing elit. A ad adipisci pariatur
                                                                            qui.
                                                                        </p>
                                                                        <ul class="icon">
                                                                            <li><a href="#" class="fa fa-search"></a></li>
                                                                            <li><a href="#" class="fa fa-link"></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class='sub-description'>
                                                                    asdfdsfsdfasdfsad
                                                                    <div class='infobox' style='float:right;'>
                                                                        <p>단가: 100000</p>
                                                                        <p>등급: 280000</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-10">
                                                                <div class="box3" style='margin: 20px;'>
                                                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHelJu84DeOFYM_f_HuWC_dVEoYwyqW3z1Tdz6xeYYmzTGS6Q"
                                                                        style='width: 100%; height: 200px;'>
                                                                    <div class="box-content">
                                                                        <h3 class="title">Kristiana</h3>
                                                                        <span class="post">Web Designer</span>
                                                                        <p class="description">
                                                                            Lorem ipsum dolor sit amet, consectetur
                                                                            adipisicing elit. A ad adipisci pariatur
                                                                            qui.
                                                                        </p>
                                                                        <ul class="icon">
                                                                            <li><a href="#" class="fa fa-search"></a></li>
                                                                            <li><a href="#" class="fa fa-link"></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class='sub-description'>
                                                                    asdfdsfsdfasdfsadadsfasdfasdfsadfsadfsdafsdafasdfasdf
                                                                    <div class='infobox' style='float:right;'>
                                                                        <p>단가: 100000</p>
                                                                        <p>등급: 280000</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- 앨범 뷰 텝 컨탠츠1 끝 -->

                                            </div>

                                            <!-- 페이지네이션 -->
                                            <div class="container">
                                                <ul class="pagination" style='justify-content:center;'>
                                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- 앨범뷰 끝 -->

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-report" role="tabpanel" aria-labelledby="nav-report-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>신고 회원 리스트</th>

                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                            <div class="container">
                            	<div class="row">
                            		<div class="col-md-12">
		                                <div class="row">
											<div class='col-md-3 col-xs-3'>
			
												<!-- 네비 사이드 -->
			
												<div class="nav-side-menu">
													<div class="brand">게시판</div>
													<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
													<div class="menu-list">
														<input type="hidden" id="report-view-status" value="BUY"/>
														<ul id="menu-content" class="menu-content collapse out">
			
															<li class='side-nav-li report-view active' data-toggle="collapse" data-target="#new" class="collapsed">
																<input type="hidden" value="BUY"/>
																<a href="#">
																	<i class="fas fa-credit-card fa-lg"></i> 구매
																</a>
															</li>
															<li class='side-nav-li report-view' data-toggle="collapse" data-target="#new" class="collapsed">
																<input type="hidden" value="SELL"/>
																<a href="#">
																	<i class="fa fas fa-trophy fa-lg"></i> 판매
																</a>
															</li>
															<li class='side-nav-li report-view' data-toggle="collapse" data-target="#new" class="collapsed">
																<input type="hidden" value="CONTEST"/>
																<a href="#">
																	<i class="fas fa-address-card"></i> 컨테스트
																</a>
															</li>
															<li class='side-nav-li report-view' data-toggle="collapse" data-target="#new" class="collapsed">
																<input type="hidden" value="FREE"/>
																<a href="#">
																	<i class="fas fa-fax fa-lg"></i> 자유게시판
																</a>
															</li>
			
														</ul>
													</div>
												</div>
			
												<!-- 네비 사이드 끝 -->
			
											</div>
		
											<div class="col-md-9">
	
												<div class="panel panel-info">
											<c:if test="${empty reportList }">
											<div>
												데이터가 없습니다!
											</div>
											</c:if>
											<c:choose>
												<c:when test="${not empty reportList }">
												
													<c:forEach items='${reportList }' var="report">
													
													<div class="panel-body">
														<div class="report-tab-back">
															<ul class="report-tab">
																<li><strong>피신고인:</strong>
																	<span class="report-id">${report.MEMBERID }</span>
																</li>&nbsp;&nbsp;&nbsp;&nbsp;
																<li><strong>신고일:</strong>
																	<span class="report-date">${report.BUYREPORTDATE }</span>
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
																				<td>
																					${report.GRADENAME }
																				</td>
																			</tr>	
																			<tr>
																				<td>신고 횟수</td>
																				<td>
																					${report.REPORTCOUNT}
																				</td>
																			</tr>																		
																			<tr>
																				<td>신고인</td>
																				<td>
																					${report.MEMBERID }
																				</td>
																			</tr>
																			<tr>
																				<td>신고 글 제목</td>
																				<td>
																					<span class="report-title">${report.BUYTITLE }</span>
																					<input type="hidden" class="report-title-no" value="${report.BUYNO }"/>
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
																					<button class="report-btn-cancel btn btn-primary">신고 거부</button>
																					<button class="report-btn btn btn-primary">신고 승인</button>
																				</td>
																			</tr>
	
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
													
													</c:forEach>
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
											<c:if test="${not empty reportList }">
												<div class="page-bar-back">
													${pageBarReport }
												</div>
											</c:if>
												</div>
												
											</div>
			                            </div>
			                        </div>
                            	</div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-payment" role="tabpanel" aria-labelledby="nav-payment-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>결제 현황 리스트</th>

                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>

                            </table>

                            <div class="container">
                                <div class="mt-5 mb-5 text-center">
                                    <h2>결제현황 리스트</h2>
                                </div>
                                <div class="row">
									<div class='col-md-3 col-xs-3'>
	
										<!-- 네비 사이드 -->
	
										<div class="nav-side-menu">
											<div class="brand">게시판</div>
											<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
												data-target="#menu-content"></i>
											<div class="menu-list">
												<input type="hidden" id="payment-view-status" value="BUY" />
												<ul id="menu-content" class="menu-content collapse out">
													<li class='side-nav-li payment-view active' data-toggle="collapse" data-target="#new" class="collapsed">
														<input type="hidden" value="BUY" /> 
														<a> 
															<i class="fas fa-credit-card fa-lg"></i> 구매
														</a>
													</li>
													<li class='side-nav-li payment-view' data-toggle="collapse" data-target="#new" class="collapsed">
														<input type="hidden" value="SELL" /> 
														<a> 
															<i class="fa fas fa-trophy fa-lg"></i> 판매
														</a>
													</li>
	
												</ul>
											</div>
										</div>
	
										<!-- 네비 사이드 끝 -->
	
									</div>
									<div class="col-md-9 col-xs-9 payment-view-div">
										<!-- 결제현황 -->
										<button class="btn btn-primary" id="paymentSort-btn">구매확정▼</button>
									<c:choose>
										<c:when test="${not empty paymentList }">
										
										<c:forEach items="${paymentList }" var="payment">
										<c:choose>
											<c:when test="${payment.CATEGORYCODE eq 'B' }">
											<div class="deal-payment">
			
			                                    <div class="deal-info-back">
			                                        <ul class="deal-info">
			                                            <li class="deal-no">
			                                            	<strong>구매자:</strong>
			                                            	${payment.MEMBERID }
			                                            </li>
			                                            <li class="dealer">
			                                            	<strong>판매자:</strong>
			                                            	${payment.BUYID }                            	
			                                            </li>
			                                            <li class="deal-title">
															<strong>글 제목:</strong> 
															${payment.BUYTITLE }
														</li>
			                                        </ul>
			                                    </div>
			
			                                    <div class="deal-back">
			
			                                        <ul class="step d-flex flex-nowrap">
			
			                                            <li class="step-item ${payment.STATUSNO==1?'active':'' }">
			                                                <a href="#!" >입금 대기</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==2?'active':'' }">
			                                                <a href="#!" >입금 완료 및<br>프로젝트 진행</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==3?'active':'' }">
			                                                <a href="#!" >프로젝트 완료</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==4?'active payment-pop':'' }" data-toggle="modal" data-target="#product_view">
			                                                <a href="#!" >구매 확정</a>
			                                                <input type="hidden" class="spec-no" value="${payment.BUYSPECNO }"/>
			                                            </li>
			                                        </ul>
			                                    </div>
			
			                                </div><br>
											</c:when>
											<c:when test="${payment.CATEGORYCODE eq 'S' }">
											
			                                <div class="deal-payment">
			
			                                    <div class="deal-info-back">
			                                        <ul class="deal-info">
			                                            <li class="deal-no">
			                                            	<strong>구매자:</strong>
			                                            	${payment.MEMBERID }
			                                            </li>
			                                            <li class="dealer">
			                                            	<strong>판매자:</strong>
			                                            	${payment.SELLID }
			                                            </li>
			                                            <li class="deal-title">
															<strong>글 제목:</strong> 
															${payment.SELLTITLE }
														</li>
			                                        </ul>
			                                    </div>
			
			                                    <div class="deal-back">
			
			                                        <ul class="step d-flex flex-nowrap">
			
			                                            <li class="step-item ${payment.STATUSNO==1?'active':''}">
			                                                <a href="#!">입금 대기</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==2?'active':''}">
			                                                <a href="#!">입금 완료 및<br>프로젝트 진행</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==3?'active':''}">
			                                                <a href="#!">프로젝트 완료</a>
			                                            </li>
			                                            <li class="step-item ${payment.STATUSNO==4?'active payment-pop':''}" data-toggle="modal" data-target="#product_view">
			                                                <a href="#!">구매 확정</a>
			                                                <input type="hidden" class="spec-no" value="${payment.SELLSPECNO }"/>
			                                            </li>
			                                        </ul>
			                                    </div>
			
			                                </div><br>
											</c:when>
											<c:otherwise>
											
											</c:otherwise>
										</c:choose>
										</c:forEach>
		                                
										</c:when>
										<c:otherwise>
										<div>
											데이터가 없습니다!
										</div>
										</c:otherwise>
									</c:choose>
		                                <div>
		                                	${pageBarPayment }
		                                </div>
		                                
									</div>
								</div>
                            </div>
                        </div>
                        
                        <div class="tab-pane fade" id="nav-refund" role="tabpanel" aria-labelledby="nav-refund-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>환불 요청 리스트</th>
                                    </tr>
                                </thead>

                            </table>
                            <div class="container">
                                <div class="mt-5 mb-5 text-center">
									<h2>환불요청 리스트</h2>
                                </div>
                                <div class="row">
                                	<div class='col-md-3 col-xs-3'>
	
										<!-- 네비 사이드 -->
	
										<div class="nav-side-menu">
											<div class="brand">게시판</div>
											<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
												data-target="#menu-content"></i>
											<div class="menu-list">
												<input type="hidden" id="refund-view-status" value="BUY" />
												<ul id="menu-content" class="menu-content collapse out">
													<li class='side-nav-li refund-view active' data-toggle="collapse" data-target="#new" class="collapsed">
														<input type="hidden" value="BUY" /> 
														<a> 
															<i class="fas fa-credit-card fa-lg"></i> 구매
														</a>
													</li>
													<li class='side-nav-li refund-view' data-toggle="collapse" data-target="#new" class="collapsed">
														<input type="hidden" value="SELL" /> 
														<a> 
															<i class="fa fas fa-trophy fa-lg"></i> 판매
														</a>
													</li>
	
												</ul>
											</div>
										</div>
	
										<!-- 네비 사이드 끝 -->
	
									</div>
									<div class="col-md-9 col-xs-9 refund-view-div">
									<c:choose>
										<c:when test="${not empty refundList }">
										
										<c:forEach items="${refundList }" var="refund">
										<c:choose>
											<c:when test="${refund.CATEGORYCODE eq 'B' }">
		                                <div class="deal-refund">
		
		                                    <div class="deal-info-back">
		                                        <ul class="deal-info">
		                                            <li class="deal-no">
			                                          	<strong>구매자:</strong>
			                                           	${payment.BUYID }
			                                        </li>
			                                        <li class="dealer">
			                                           	<strong>판매자:</strong>
			                                           	${payment.MEMBERID }
			                                        </li>
			                                        <li class="deal-title">
														<strong>글 제목:</strong> 
														${payment.BUYTITLE }
													</li>
		                                        </ul>
		                                    </div>
		
		                                    <div class="deal-back">
		
		                                        <ul class="step d-flex flex-nowrap">
		
		                                            <li class="step-item">
		                                                <a href="#!">입금 대기</a>
		                                            </li>
		                                            <li class="step-item">
		                                                <a href="#!">입금 완료 및<br>프로젝트 진행</a>
		                                            </li>
		                                            <li class="step-item">
		                                                <a href="#!">프로젝트 완료</a>
		                                            </li>
		                                            <li class="step-item active">
		                                                <a href="#!">환불 사유 확인</a>
		                                            </li>
		                                            <li class="step-item refund-pop" data-toggle="modal" data-target="#product_view">
		                                                <a href="#!">환불 승인</a>
		                                                <input type="hidden" class="spec-no" value="${payment.BUYSPECNO }"/>
		                                            </li>
		                                        </ul>
		                                    </div>
		
		                                </div><br>
		                                	</c:when>
		                                	<c:when test="${refund.CATEGORYCODE eq 'S' }">
		                                	
		                                <div class="deal-refund">
		
		                                    <div class="deal-info-back">
		                                        <ul class="deal-info">
		                                            <li class="deal-no">
			                                          	<strong>구매자:</strong>
			                                           	${payment.MEMBERID }
			                                        </li>
			                                        <li class="dealer">
			                                           	<strong>판매자:</strong>
			                                           	${payment.SELLID }
			                                        </li>
			                                        <li class="deal-title">
														<strong>글 제목:</strong> 
														${payment.SELLTITLE }
													</li>
		                                        </ul>
		                                    </div>
		
		                                    <div class="deal-back">
		
		                                        <ul class="step d-flex flex-nowrap">
		
		                                            <li class="step-item">
		                                                <a href="#!">입금 대기</a>
		                                            </li>
		                                            <li class="step-item">
		                                                <a href="#!">입금 완료 및<br>프로젝트 진행</a>
		                                            </li>
		                                            <li class="step-item">
		                                                <a href="#!">프로젝트 완료</a>
		                                            </li>
		                                            <li class="step-item active">
		                                                <a href="#!">환불 사유 확인</a>
		                                            </li>
		                                            <li class="step-item refund-pop" data-toggle="modal" data-target="#product_view">
		                                                <a href="#!">환불 승인</a>
		                                                <input type="hidden" class="spec-no" value="${payment.SELLSPECNO }"/>
		                                            </li>
		                                        </ul>
		                                    </div>
		
		                                </div><br>
		                                	</c:when>
		                                	<c:otherwise>
		                                	
		                                	</c:otherwise>
		                                </c:choose>
		                                </c:forEach>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<div>
			                                	데이터가 없습니다!
			                                </div>
		                            	</c:otherwise>
		                            </c:choose>
		                            <div>
		                                ${pageBarRefund }
		                            </div>
									</div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-category" role="tabpanel" aria-labelledby="nav-category-tab">
							<!-- 구매,판매,게시판 카테고리 관리 탭 -->
                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>카테고리 관리</th>
                                    </tr>
                                </thead>

                            </table>

                            <div class='row'>

                                <div class='col-md-3 col-xs-3'>

                                    <!-- 네비 사이드 -->

                                    <div class="nav-side-menu">
                                    <!-- 1차 카테고리 -->
                                        <div class="brand">1차 카테고리</div>
                                        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                                        <div class="menu-list">
                                        	<input type="hidden" id="current-interest" value="1"/> 
                                            <ul id="menu-content" class="menu-content collapse out">
                                            <c:if test="${not empty interestList }">
                                            	<c:forEach items="${interestList }" var="interest">
                                            		<c:choose>
                                            			<c:when test="${interest.INTERESTNO eq 1 }">
                                            				<li class='side-nav-li first-interest active' data-toggle="collapse" data-target="#new" class="collapsed">
			                                                    <a href="#" class="interest">
			                                                        ${interest.INTEREST }
			                                                    </a>
			                                                	<input type="hidden" class="interest-no" value="${interest.INTERESTNO }"/>
			                                                </li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class='side-nav-li first-interest' data-toggle="collapse" data-target="#new" class="collapsed">
			                                                    <a href="#" class="interest">
			                                                        ${interest.INTEREST }
			                                                    </a>
			                                                	<input type="hidden" class="interest-no" value="${interest.INTERESTNO }"/>
			                                                </li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            	</c:forEach>
                                            </c:if>
                                               
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- 네비 사이드 끝 -->

                                </div>
                                <div class='col-md-9 col-xs-9'>
                                <!-- 2차 카테고리 -->
                                    <table class="table" id="second-interest-tbl" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>2차 카테고리</th>
                                                <th>카테고리 이동</th>
                                                <th>수정</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${deInterestList }" var="deInterest">
                                            <tr class="interest-back">
                                                <td class="deInterest-info">
                                                	<input type="text" class="deInterest-val" value="${deInterest.DETAILINTEREST }" />
                                                	<input type="hidden" class="deInterest-no" value="${deInterest.DETAILINTERESTNO }" />
                                                	<input type="hidden" class="interest-no" value="${deInterest.INTERESTNO }" />
                                                </td>
                                                <td class="interest-info">
                                                    <select class="change-interest">
                                                    <c:forEach items="${interestList }" var="interest">
                                                        <option value="${interest.INTERESTNO }" ${interest.INTERESTNO==deInterest.INTERESTNO?'selected':'' }>
                                                        	${interest.INTEREST }
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                                <td>
                                                	<!-- 2차 카테고리명, 1차 카테고리 변경 -->
                                                    <button class='btn btn-primary update-interest'>수정</button>
                                                </td>
                                                <td>
                                                	<!-- 2차 카테고리 삭제 -->
                                                    <button class='btn btn-primary delete-btn-view'>삭제</button>
                                                </td>
                                            </tr>
                                            <tr class='delete-btn-back-tr'>
                                                <td colspan="4">
                                                    <div class='delete-btn-back'>
                                                        	정말 삭제하시겠습니까?
                                                        <button class="btn btn-primary category-delete-btn">삭제</button>
                                                        <button class='btn btn-primary category-delete-cancel'>취소</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                            <tr>
                                            	<td colspan="4">
                                            		<button class="btn btn-primary" id="insert-interest-view">+추가</button>
                                            	</td>
                                            </tr>
                                            <tr id="insert-interest-back">
                                            	<td id="insert-interest-input" colspan="4">
                                            		<div id="insert-interest-div">
	                                            		<input type="text" id="insert-deInterest-val" size="30" placeholder="등록할 카테고리를 입력해 주세요" />
	                                            		<button class="btn btn-primary" id="insert-interest-btn">등록</button>
	                                            		<button class="btn btn-primary" id="insert-interest-btn-cancel">취소</button>
                                            		</div>
                                            	</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="nav-faq" role="tabpanel" aria-labelledby="nav-faq-tab">

                            <table class="table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>FAQ 관리</th>
                                    </tr>
                                </thead>

                            </table>
                            <div class='row'>
								<div class="col-md-6"></div>
                                <div class="col-md-6 faq-add-back">
                                
                                    <button class="faq-category-insert btn btn-primary">
                                        +카테고리 추가
                                    </button>
                                    &nbsp; &nbsp;
                                    <button class="add-qna btn btn-primary">
                                    	+질문&답변 추가
                                    </button>
                                    
                                </div>
                            </div>
                            <br>
                            <c:if test="${not empty faqList }">
                            	<c:forEach items="${categoryList }" var="category">
	                            <div class="faq-back">
	                                <div class="faq-category">${category.FAQNACATEGORYNAME }
	                                	<input type="hidden" class="faq-category-no" value="${category.FAQNACATEGORYNO }"/>
	                                	<input type="hidden" class="faq-category-name" value="${category.FAQNACATEGORYNAME }"/>
	                                    <button class="faq-slide">▼</button>
	                                    <button class="faq-category-delete">삭제</button>
	                                </div>
	                                <div class="faq-list-back">
	                                    <ul class="faq-list">
	                                    <c:forEach items="${faqList }" var="faq">
	                                    	<c:if test="${faq.FAQNACATEGORYNO==category.FAQNACATEGORYNO }">
	                                    	
	                                        <li class="faq-question">${faq.FAQTITLE }
												<input type="hidden" class="faq-no" value="${faq.FAQNO }"/>
												<input type="hidden" class="faq-title" value="${faq.FAQTITLE }"/>
	                                            <button class="answer-slide">▼</button>
	                                            <button class="qna-delete-view">삭제</button>
	                                            <button class="qna-update">수정</button>
	                                            <hr>
	                                            <div class="faq-answer">${faq.FAQCONTENT }</div>
	                                            <div class='qna-delete-back'>
	                                                	답변과 함께 삭제 됩니다. 
	                                                <button class='qna-delete-cancel btn btn-primary'>취소</button>
	                                                <button class='qna-delete btn btn-primary'>삭제</button>
	                                                <hr>
	                                            </div>
	                                        </li>
	                                    	</c:if>
	                                        
	                                    </c:forEach>
	                                    </ul>
	                                    
	                                </div>
	                            </div>
                            	
                            	</c:forEach>
                            </c:if>
                            <div id="faq-insert-back">
                            	<div id="add-faq-category">
                            		<input type="text" id="input-faq-category"/>
                            		<button type="button" class="btn btn-primary" id="add-faq-category-btn">추가</button>
                            		<button type="button" class="btn btn-primary" id="add-faq-category-cancel">취소</button>
                            	</div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <!-- 추가 사항
        1. 신고 취소
        2. 신고 승인시 쪽지 전송
        3. 카테고리 추가 기능
        -->
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<div class="modal fade product_view" id="product_view">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove">X</span></a>
	                <h3 class="modal-title">결제</h3>
	        </div>
	        <div class="modal-body">
	                
	        </div>
	    </div>
    </div>
</div>