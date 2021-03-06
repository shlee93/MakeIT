<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매페이지</title>



<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sellmain/sellmain.css" />
<style>
.hide {
	display: none;

}
</style>
</head>
<body>

	<form action="" name="pageFrm">
		<input type="hidden" id="sCategoryFlag" name="sCategoryFlag" value="" />
	</form>
	<input type="hidden" id="newValue" value="1">
	<input type="hidden" id="gradeValue" value="0">
	<input type="hidden" id="sellValue" value="0">
	<input type="hidden" id="isSearch" value="0">
	<div class='row'>
		<div class='col-md-1'>
			<div style='position:fixed; margin-top: 10em;'>

	    			<span onclick='fn_back()' style='cursor:pointer; font-size: 6em;'><i class="fas fa-arrow-circle-left"></i></span>    				           
	          	 	<script>
	           			function fn_back()
		           		{
		           			history.back();
		           		}
		           	</script>
	        </div>
      </div>

		<div class='col-md-10'>
			<div class='row'>
				<div class='col-md-2 col-xs-2'>
					<!-- 네비 사이드 -->

					<div class="nav-side-menu">
						<div class="brand">Brand Logo</div>
						<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
							data-target="#menu-content"></i>
						<div>
							<ul>
								<li class="menu"><a href="#"> <i class="fas fa-cogs"></i>
										&nbsp;개발자
								</a>
									<ul class="hide">
										<li onclick="fn_changeCategory('1');">웹</li>
										<li onclick="fn_changeCategory('2');">모바일</li>
										<li onclick="fn_changeCategory('3');">게임</li>
										<li onclick="fn_changeCategory('4');">응용프로그램</li>
										<li onclick="fn_changeCategory('5');">보안프로그램</li>
										<li onclick="fn_changeCategory('6');">DB관리</li>
									</ul></li>
								<li class="menu"><a href="#"> <i
										class="fas fa-pen-fancy"></i> &nbsp;웹 디자이너
								</a>
									<ul class="hide">
										<li onclick="fn_changeCategory('7');">웹 디자인</li>
										<li onclick="fn_changeCategory('8');">웹 퍼블리셔</li>
										<li onclick="fn_changeCategory('9');">게임 디자인</li>
									</ul></li>
								<li class="menu"><a href="#"> <i
										class="fas fa-shield-alt"></i> &nbsp;네트워크보안
								</a>
									<ul class="hide">
										<li onclick="fn_changeCategory('10');">모의해킹</li>
										<li onclick="fn_changeCategory('11');">침해대응</li>
										<li onclick="fn_changeCategory('12');">보안관제</li>
										<li onclick="fn_changeCategory('13');">컨설턴트</li>

									</ul></li>
							</ul>
						</div>
					</div>

					<!-- 네비 사이드 끝 -->

				</div>

				<!-- 앨범뷰 -->

				<div class='col-md-10 col-xs-10' style='position: relative; min-width: 400px'>

					<!-- 앨범 뷰 상단 탭 -->
					<div style="margin-right: 0; text-align: right">

						<div class="form-inline my-2 my-lg-0">

							<i class='fa fa-search'></i>&nbsp; <select id="searchtype" name="searchtype" class="form-control">
								<option value='title'>제목</option>
								<option value='writer'>작성자</option>
							</select> <input class="form-control mr-sm-2" type="text" id="searchValue" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-info my-2 my-sm-0" onclick="fn_searchtw();" type="button">Search</button>
						</div>
					</div>
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab" onclick="fn_valueChangeNew();" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="font-family: 'Sunflower', sans-serif;">신규등록</a> 
							<a class="nav-item nav-link" id="nav-profile-tab" onclick="fn_valueChangeGrade();" data-toggle="tab" href="#nav-profile" role="tab"	aria-controls="nav-profile" aria-selected="false" style="font-family: 'Sunflower', sans-serif;">등급별</a> 
							<a class="nav-item nav-link" id="nav-contact-tab" onclick="fn_valueChangePerformance();" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false" style="font-family: 'Sunflower', sans-serif;">실적별</a>
						</div>
					</nav>
					<script>
						function fn_valueChangeNew() {
		
							$("#newValue").attr("value", "1");
							$("#gradeValue").attr("value", "0");
							$("#sellValue").attr("value", "0");
							var pageBarCon = "";
							var html = "";
							var cPage = $(this).children('.nextNum').val();

							var searchtype = $("#searchtype").val();
							var searchValue = $("#searchValue").val();
							var newValue = $("#newValue").val();
							var gradeValue = $("#gradeValue").val();
							var sellValue = $("#sellValue").val();
							var sCategoryFlag = $("#sCategoryFlag").val();
							
							

							if ($("#isSearch").val() == '1') {

								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"newValue" : newValue,
										"gradeValue" : gradeValue,
										"sellValue" : sellValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-home").html(data);
									}
								});
							} else {
								$.ajax({
									url : "${path}/sell/sellNewChange.do",
									data : {
										"sCategoryFlag" : sCategoryFlag
									},
									dataType : "html",
									success : function(data) {
										html += data;
										$("#nav-home").html(html);
									}
								});
								
							}
							

						}
						function fn_valueChangeGrade() {

							$("#newValue").attr("value", "0");
							$("#gradeValue").attr("value", "1");
							$("#sellValue").attr("value", "0");
							var pageBarCon = "";
							var html = "";
							var cPage = $(this).children('.nextNum').val();

							var searchtype = $("#searchtype").val();
							var searchValue = $("#searchValue").val();
							var newValue = $("#newValue").val();
							var gradeValue = $("#gradeValue").val();
							var sellValue = $("#sellValue").val();
							var sCategoryFlag = $("#sCategoryFlag").val();

							
							
							if ($("#isSearch").val() == '1') {
								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"sellValue" : sellValue,
										"newValue" : newValue,
										"gradeValue" : gradeValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-profile").html(data);
									}
								});
								
							}
							else
							{
								
								$.ajax({
									url : "${path}/sell/sellGradeChange.do",
									data : {
										"sCategoryFlag" : sCategoryFlag
									},
									dataType : "html",
									success : function(data) {
										console.log(data);
										html += data;
										$("#nav-profile").html(html);
									}
								});
							}
							
							
						}
						function fn_valueChangePerformance() {

							$("#newValue").attr("value", "0");
							$("#gradeValue").attr("value", "0");
							$("#sellValue").attr("value", "1");
							var pageBarCon = "";
							var html = "";
							var cPage = $(this).children('.nextNum').val();

							var searchtype = $("#searchtype").val();
							var searchValue = $("#searchValue").val();
							var newValue = $("#newValue").val();
							var gradeValue = $("#gradeValue").val();
							var sellValue = $("#sellValue").val();
							var sCategoryFlag = $("#sCategoryFlag").val();

							
							
							if ($("#isSearch").val() == '1') {
								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"sellValue" : sellValue,
										"newValue" : newValue,
										"gradeValue" : gradeValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-contact").html(data);
									}
								});
							}
							else
							{
								$.ajax({
									url : "${path}/sell/sellSellChange.do",
									data : {
										"sCategoryFlag" : sCategoryFlag
									},
									dataType : "html",
									success : function(data) {
										html += data;
										$("#nav-contact").html(html);
									}
								});
							}
							
							
						}

						$(document).on("click",".sell-page",function() {
											var cPage = $(this).children('.nextNum').val();
											var sCategoryFlag = $("#sCategoryFlag").val()
											var searchtype = $("#searchtype").val();
											var searchValue = $("#searchValue").val();
											var newValue = $("#newValue").val();
											var gradeValue = $("#gradeValue").val();
											var sellValue = $("#sellValue").val();

											if ($("#isSearch").val() == '1') {
												if ($("#newValue").val() == '1') {
													$.ajax({
																url : "${path}/sell/sellSellSearch.do",
																data : {
																	"cPage" : cPage,
																	"searchtype" : searchtype,
																	"searchValue" : searchValue,
																	"sCategoryFlag" : sCategoryFlag,
																	"newValue" : newValue,
																	"gradeValue" : gradeValue,
																	"sellValue" : sellValue
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-home").html(data);
																}
															});
												} else if ($("#gradeValue").val() == '1') {
													$.ajax({
																url : "${path}/sell/sellSellSearch.do",
																data : {
																	"cPage" : cPage,
																	"searchtype" : searchtype,
																	"searchValue" : searchValue,
																	"sCategoryFlag" : sCategoryFlag,
																	"sellValue" : sellValue,
																	"newValue" : newValue,
																	"gradeValue" : gradeValue
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-profile").html(data);
																}
															});
												} else if ($("#sellValue").val() == '1') {
													$.ajax({
														url : "${path}/sell/sellSellSearch.do",
																data : {
																	"cPage" : cPage,
																	"searchtype" : searchtype,
																	"searchValue" : searchValue,
																	"sCategoryFlag" : sCategoryFlag,
																	"sellValue" : sellValue,
																	"newValue" : newValue,
																	"gradeValue" : gradeValue
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-contact").html(data);
																}
															});
												}
											} else if ($("#isSearch").val() == '0') {
												if ($("#newValue").val() == '1') {
													$.ajax({
																url : "${path}/sell/sellNewChange.do",
																data : {
																	"cPage" : cPage,
																	"sCategoryFlag" : sCategoryFlag
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-home").html(data);
																}
															});
												} else if ($("#gradeValue").val() == '1') {
													var sCategoryFlag = $("#sCategoryFlag").val()
													$.ajax({				
														url : "${path}/sell/sellGradeChange.do",
																data : {
																	"cPage" : cPage,
																	"sCategoryFlag" : sCategoryFlag
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-profile").html(data);
																}
															});
												} else if ($("#sellValue").val() == '1') {
													var sCategoryFlag = $("#sCategoryFlag").val()
													$.ajax({
																url : "${path}/sell/sellSellChange.do",
																data : {
																	"cPage" : cPage,
																	"sCategoryFlag" : sCategoryFlag
																},
																dataType : "html",
																success : function(data) {
																	$("#nav-contact").html(data);
																}
															});
												}
											}

										});

						$(document).ready(function() {

							pageFrm.sCategoryFlag.value = "${sCategoryFlag}";

							$(".menu>a").click(function() {
								var submenu = $(this).next("ul");

								if (submenu.is(":visible")) {
									submenu.slideUp();
								} else {
									submenu.slideDown();
								}
							});
						});

						function fn_changeCategory(sCtgr) {

							$("#isSearch").attr("value", "0");
							console.log($("#sCategoryFlag").val());
							var url = "${path}/sell/sellmain.do";
							pageFrm.sCategoryFlag.value = sCtgr;
							pageFrm.action = url;
							pageFrm.method = "post";
							pageFrm.submit();
						}
						function fn_searchtw() {
							var searchtype = $("#searchtype").val();
							var searchValue = $("#searchValue").val();
							var sCategoryFlag = $("#sCategoryFlag").val();
							var newValue = $("#newValue").val();
							var gradeValue = $("#gradeValue").val();
							var sellValue = $("#sellValue").val();

							$("#isSearch").attr("value", "1");
							if ($("#newValue").val() == '1') {
								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"newValue" : newValue,
										"gradeValue" : gradeValue,
										"sellValue" : sellValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-home").html(data);
									}
								});
							} else if ($("#gradeValue").val() == '1') {
								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"sellValue" : sellValue,
										"newValue" : newValue,
										"gradeValue" : gradeValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-profile").html(data);
									}
								});
							} else if ($("#sellValue").val() == '1') {
								$.ajax({
									url : "${path}/sell/sellSellSearch.do",
									data : {
										"searchtype" : searchtype,
										"searchValue" : searchValue,
										"sCategoryFlag" : sCategoryFlag,
										"sellValue" : sellValue,
										"newValue" : newValue,
										"gradeValue" : gradeValue
									},
									dataType : "html",
									success : function(data) {
										$("#nav-contact").html(data);
									}
								});
							}
						}
					</script>
					<!-- 엘범 뷰 상단 탭 끝 -->


					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent"
						style='border-top: 2px solid #337ab7;'>

						<!-- 앨범 뷰 탭 컨텐츠1 -->

						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">

							<!-- 앨범 뷰 상단 네비 -->

							<div class='row'>
								<nav class="nav" style="width: 100%;">

									<ul class="nav__link-wrapper">
										<li class="nav__link"><a href="${path}/sell/sellWrite.do">새 글 작성</a></li>
									</ul>

								</nav>
							</div>

							<!-- 앨범 뷰 상단 네비 끝 -->

							<div class="container mt-40">
								<h3 class="text-center" style="font-family: 'Sunflower', sans-serif;">신규등록</h3>
								<div class="row mt-30">

									<c:forEach items="${newList}" var="newList">
										<div class="col-md-4 col-sm-6 col-xs-10">
											<div class="box3" style='margin: 20px;'>
												<div id="${newList.SELLNO}">
													<script>
													function fn_detailView(sellno)
		                                            {
		                                               location.href="${path}/sell/selldetail?sellno="+sellno;
		                                            }
														$(function() {
															var sellNo = ${newList.SELLNO};
															$.ajax({
																		url : "${path}/imageDiv.do",
																		data : {
																			"sellNo" : sellNo
																		},
																		dataType : "json",
																		success : function(data) {

																			var imgReName = data["sellImgRe"];
																			var imgContainer = $('#${newList.SELLNO}');
																			 imgContainer.append("<img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+ "' style='width: 100%; height: 200px;cursor:pointer;' onclick='fn_detailView(${newList.SELLNO})'>"); 
																			   
																			/* imgContainer.append("<img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>"); */
																			/* imgContainer.append("<a href='${path}/sell/selldetail?"+${newList.SELLNO}+"'><img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+"'></a>"); */
																		}
																	});
														});
													</script>
													<!-- <a href="시발라랏사">ㅇㅇㅇ</a> -->
												</div>
												<div class="box-content" onclick="location.href='${path}/sell/selldetail?sellno=${newList.SELLNO }'">
													<h3 class="title">${newList.MEMBERID}</h3>
													<p class="description">${newList.INTRODUCTION}</p>
												</div>
											</div>
											<div class='sub-description'>
												<div style='float: left;'>
													<p>${newList.SELLTITLE}</p>
												</div>
												<div class='infobox' style='float: right; display: inline;'>
													<div id="price${newList.SELLNO}">
														<script>
															$(function() {
																var sellNo = ${newList.SELLNO};
																$.ajax({
																			url : "${path}/sellprice.do",
																			data : {
																				"sellNo" : sellNo
																			},
																			dataType : "json",
																			success : function(data) {

																				var sellPrice = data["sellPrice"];
																				var priceContainer = $('#price${newList.SELLNO}');
																				priceContainer.append("<p>최저가:" +sellPrice	+ "</p>");
																			}
																		});
															});
														</script>

													</div>
													<p id="gradep">등급: ${newList.GRADENAME}</p>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						
							<div id="pageBarCon">${pageBar}</div>

						</div>

						<!-- 앨범 뷰 텝 컨탠츠1 끝 -->

						<!-- 앨범 뷰 텝 컨탠츠2 -->

						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<%-- <div class='row'>
								<nav class="nav" style="width: 100%;">

									<ul class="nav__link-wrapper">
										<li class="nav__link"><a href="#">새 글 작성</a></li>
									</ul>
									<div style="margin-right: 0;">
										
									</div>
								</nav>
							</div>
							<div class="container mt-40">

								<h3 class="text-center">등급별</h3>
								<div class="row mt-30">
									<c:forEach items="${gradeList}" var="gradeList">
										<div class="col-md-4 col-sm-6 col-xs-10">
											<div class="box3" style='margin: 20px;'>
												<div id="grade${gradeList.SELLNO}">
													<script>
														$(function() {
															var sellNo = ${gradeList.SELLNO};
															$.ajax({
																		url : "${path}/imageDiv.do",
																		data : {
																			"sellNo" : sellNo
																		},
																		dataType : "json",
																		success : function(data) {

																			var imgContainer = $('#grade${gradeList.SELLNO}');
																			imgContainer.append("<img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");

																		}
																	});
														});
													</script>
												</div>
												<div class="box-content">
													<h3 class="title">${gradeList.MEMBERID}</h3>
													<p class="description">Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. A ad adipisci pariatur qui.
													</p>

												</div>
											</div>
											<div class='sub-description'>
												<div style='float: left;'>
													<p>${gradeList.SELLTITLE}</p>
												</div>
												<div class='infobox' style='float: right; display: inline;'>
													<div id="gradeprice${gradeList.SELLNO}">
														<script>
															$(function() {
																var sellNo = ${gradeList.SELLNO};
																$.ajax({
																			url : "${path}/sellprice.do",
																			data : {
																				"sellNo" : sellNo
																			},
																			dataType : "json",
																			success : function(data) {

																				var sellPrice = data["sellPrice"];
																				var priceContainer = $('#gradeprice${gradeList.SELLNO}');
																				priceContainer.append("<p>최저가:"+ sellPrice+ "</p>")
																			}
																		});
															});
														</script>

													</div>
													<p id="gradep">등급: ${gradeList.GRADENAME}</p>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>

							</div> --%>

						</div>

						<!-- 앨범 뷰 텝 컨탠츠2 끝 -->

						<!-- 앨범 뷰 텝 컨텐츠 3 -->

						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">
							<%-- <div class='row'>
								<nav class="nav" style="width: 100%;">

									<ul class="nav__link-wrapper">
										<li class="nav__link"><a href="#">새 글 작성</a></li>
									</ul>
									<div style="margin-right: 0;">
										
									</div>
								</nav>
							</div>
							<div class="container mt-40">
								<h3 class="text-center">실적별</h3>
								<div class="row mt-30">
									<c:forEach items="${performanceList}" var="performanceList">
										<div class="col-md-4 col-sm-6 col-xs-10">
											<div class="box3" style='margin: 20px;'>
												<div id="performance${performanceList.SELLNO}">
													<script>
														$(function() {
															var sellNo = ${performanceList.SELLNO};
															$.ajax({
																		url : "${path}/imageDiv.do",
																		data : {
																			"sellNo" : sellNo
																		},
																		dataType : "json",
																		success : function(data) {

																			var imgContainer = $('#performance${performanceList.SELLNO}');
																			imgContainer.append("<img src='${path}/resources/upload/sell/"+ data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");

																		}
																	});
														});
													</script>
												</div>
												<div class="box-content">
													<h3 class="title">${performanceList.MEMBERID}</h3>
													<p class="description">Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. A ad adipisci pariatur qui.
													</p>

												</div>
											</div>
											<div class='sub-description'>
												<div style='float: left;'>
													<p>${performanceList.SELLTITLE}</p>
												</div>
												<div class='infobox' style='float: right; display: inline;'>
													<div id="performanceprice${performanceList.SELLNO}">
														<script>
															$(function() {
																var sellNo = ${performanceList.SELLNO};
																$.ajax({
																			url : "${path}/sellprice.do",
																			data : {
																				"sellNo" : sellNo
																			},
																			dataType : "json",
																			success : function(data) {

																				var sellPrice = data["sellPrice"];
																				var priceContainer = $('#performanceList${performanceList.SELLNO}');
																				priceContainer.append("<p>최저가:"+ sellPrice	+ "</p>")
																			}
																		});
															});
														</script>

													</div>
													<p id="performancep">등급: ${performanceList.GRADENAME}</p>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>

							</div> --%>

						</div>

					</div>
				</div>
			</div>
		</div>
		
			<div class='col-md-1'></div>
			</div>
</body>
</html>