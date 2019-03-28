
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/buymain/buymain.css" />
	 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
<style>
.hide {
	display: none;

}
/* div
{
	border:1px solid red;
}  */
</style>
</head>
<body>
	<form action="" name="pageFrm">
		<input type="hidden" id="sCategoryFlag" name="sCategoryFlag" value="" />
	</form>
	<input type="hidden" id="newValue" value="1">
	<input type="hidden" id="gradeValue" value="0">
	<input type="hidden" id="isSearch" value="0">
	<div id="total" style='padding:1.1em;'>
	 	<div class='container-fluid' id="total">
			<div class='row'>
				<div class='col-md-1'>
					<div style='position:fixed; margin-top:-6em;'>
					<span onclick='fn_back()' style='cursor:pointer; font-size: 4em;'><i class="fas fa-arrow-circle-left"></i></span>                           
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
								<div class="brand">
									<img src="${path }/resources/image/logo1main.png" style='max-width:50px; max-height:50px; margin-bottom: 2em;'/>
								</div>
								<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
									data-target="#menu-content"></i>
								<div style="font-family: 'Sunflower', sans-serif;">
									<ul>
										<li class="menu"><a href="#"> <i class="fas fa-cogs"></i>
												&nbsp;개발자
										</a>
											<ul class="hide">
												<c:forEach items="${categoryList }" var="category">
													<c:if test="${category.INTERESTNO == 1 }">
														<li onclick="fn_changeCategory('${category.DETAILINTERESTNO}');">${category.DETAILINTEREST }</li>
													</c:if>	
												</c:forEach>
											</ul>
												
										</li>
										<li class="menu"><a href="#"> <i
												class="fas fa-pen-fancy"></i> &nbsp;웹 디자이너
										</a>
											<ul class="hide">
												<c:forEach items="${categoryList }" var="category">
													<c:if test="${category.INTERESTNO == 2 }">
														<li onclick="fn_changeCategory('${category.DETAILINTERESTNO}');">${category.DETAILINTEREST }</li>
													</c:if>	
												</c:forEach>
											</ul>
										</li>
										<li class="menu"><a href="#"> <i
												class="fas fa-shield-alt"></i> &nbsp;네트워크보안
										</a>
											<ul class="hide">
												<c:forEach items="${categoryList }" var="category">
													<c:if test="${category.INTERESTNO == 3 }">
														<li onclick="fn_changeCategory('${category.DETAILINTERESTNO}');">${category.DETAILINTEREST }</li>
													</c:if>	
												</c:forEach>
											</ul>
										</li>
									</ul>
								</div>
							</div>
		
							<!-- 네비 사이드 끝 -->
		
						</div>
		
						<!-- 앨범뷰 -->
		
						<div class='col-md-10 col-xs-10' style='position: relative; min-width: 400px'>
							<div id="pageTitle" style="padding-bottom:20px;">
								<h1 style="font-family: 'Sunflower', sans-serif;">구매게시판</h2>
							</div>
							<!-- 앨범 뷰 상단 탭 -->
							<div style="margin-right: 0; ">
								<div class="form-inline my-2 my-lg-0" >
									<i class='fa fa-search'></i>&nbsp; <select id="searchtype" name="searchtype" class="form-control">
										<option value='title'>제목</option>
										<option value='writer'>작성자</option>
									</select> <input class="form-control mr-sm-2" type="text" id="searchValue" placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-info slidetopleft my-2 my-sm-0" onclick="fn_searchtw();" type="button">Search</button>
								</div>
						
							</div>
							<nav>
								<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-home-tab" onclick="fn_valueChangeNew();" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="font-family: 'Sunflower', sans-serif;">신규등록</a> 
									<a class="nav-item nav-link" id="nav-profile-tab" onclick="fn_valueChangeGrade();" data-toggle="tab" href="#nav-profile" role="tab"	aria-controls="nav-profile" aria-selected="false" style="font-family: 'Sunflower', sans-serif;">등급별</a> 
								</div>
							</nav>
							<script>
							
								$(document).on('keydown','#searchValue',function(key){
									if(key.keyCode==13){
										fn_searchtw();
									}
								})
							
								function fn_valueChangeNew() {
				
									$("#newValue").attr("value", "1");
									$("#gradeValue").attr("value", "0");
									var pageBarCon = "";
									var html = "";
									var cPage = $(this).children('.nextNum').val();
		
									var searchtype = $("#searchtype").val();
									var searchValue = $("#searchValue").val();
									var newValue = $("#newValue").val();
									var gradeValue = $("#gradeValue").val();
									var sCategoryFlag = $("#sCategoryFlag").val();
									
									
		
									if ($("#isSearch").val() == '1') {
		
										$.ajax({
											url : "${path}/buy/buyBuySearch.do",
											data : {
												"searchtype" : searchtype,
												"searchValue" : searchValue,
												"sCategoryFlag" : sCategoryFlag,
												"newValue" : newValue,
												"gradeValue" : gradeValue
											},
											dataType : "html",
											success : function(data) {
												$("#nav-home").html(data);
											}
										});
									} else {
										$.ajax({
											url : "${path}/buy/buyNewChange.do",
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
									var pageBarCon = "";
									var html = "";
									var cPage = $(this).children('.nextNum').val();
		
									var searchtype = $("#searchtype").val();
									var searchValue = $("#searchValue").val();
									var newValue = $("#newValue").val();
									var gradeValue = $("#gradeValue").val();
									var sCategoryFlag = $("#sCategoryFlag").val();
		
									
									
									if ($("#isSearch").val() == '1') {
										$.ajax({
											url : "${path}/buy/buyBuySearch.do",
											data : {
												"searchtype" : searchtype,
												"searchValue" : searchValue,
												"sCategoryFlag" : sCategoryFlag,
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
											url : "${path}/buy/buyGradeChange.do",
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
								
								$(document).on("click",".sell-page",function() {
													var cPage = $(this).children('.nextNum').val();
													var sCategoryFlag = $("#sCategoryFlag").val()
													var searchtype = $("#searchtype").val();
													var searchValue = $("#searchValue").val();
													var newValue = $("#newValue").val();
													var gradeValue = $("#gradeValue").val();
		
													if ($("#isSearch").val() == '1') {
														if ($("#newValue").val() == '1') {
															$.ajax({
																		url : "${path}/buy/buyBuySearch.do",
																		data : {
																			"cPage" : cPage,
																			"searchtype" : searchtype,
																			"searchValue" : searchValue,
																			"sCategoryFlag" : sCategoryFlag,
																			"newValue" : newValue,
																			"gradeValue" : gradeValue,
																		},
																		dataType : "html",
																		success : function(data) {
																			$("#nav-home").html(data);
																		}
																	});
														} else if ($("#gradeValue").val() == '1') {
															$.ajax({
																		url : "${path}/buy/buyBuySearch.do",
																		data : {
																			"cPage" : cPage,
																			"searchtype" : searchtype,
																			"searchValue" : searchValue,
																			"sCategoryFlag" : sCategoryFlag,
																			"newValue" : newValue,
																			"gradeValue" : gradeValue
																		},
																		dataType : "html",
																		success : function(data) {
																			$("#nav-profile").html(data);
																		}
																	});
														} 
													} else if ($("#isSearch").val() == '0') {
														if ($("#newValue").val() == '1') {
															$.ajax({
																		url : "${path}/buy/buyNewChange.do",
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
																url : "${path}/buy/buyGradeChange.do",
																		data : {
																			"cPage" : cPage,
																			"sCategoryFlag" : sCategoryFlag
																		},
																		dataType : "html",
																		success : function(data) {
																			$("#nav-profile").html(data);
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
									var url = "${path}/buy/buymain.do";
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
		
									$("#isSearch").attr("value", "1");
									if ($("#newValue").val() == '1') {
										$.ajax({
											url : "${path}/buy/buyBuySearch.do",
											data : {
												"searchtype" : searchtype,
												"searchValue" : searchValue,
												"sCategoryFlag" : sCategoryFlag,
												"newValue" : newValue,
												"gradeValue" : gradeValue,
											},
											dataType : "html",
											success : function(data) {
												$("#nav-home").html(data);
											}
										});
									} else if ($("#gradeValue").val() == '1') {
										$.ajax({
											url : "${path}/buy/buyBuySearch.do",
											data : {
												"searchtype" : searchtype,
												"searchValue" : searchValue,
												"sCategoryFlag" : sCategoryFlag,
												"newValue" : newValue,
												"gradeValue" : gradeValue
											},
											dataType : "html",
											success : function(data) {
												$("#nav-profile").html(data);
											}
										});
									}
								}
								function fn_detailView(buyNo)
								{
									location.href="${path}/buy/buyDetail?buyNo="+buyNo;
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
												<li class="nav__link"><button class="btn btn-outline-info slidetopleft" onclick="location.href='${path }/buy/buyWrite.do'">새 글 작성</button></li>
											</ul>
		
										</nav>
									</div>
		
									<!-- 앨범 뷰 상단 네비 끝 -->
		
									<div class="container mt-40">
										<h3 class="text-center" style="font-family: 'Sunflower', sans-serif;">신규등록</h3>
										<div class="row mt-30">
		
											<c:forEach items="${newList}" var="newList">
												<div class="col-md-4 col-sm-6 col-xs-10" >
													<div class="box3" style='margin: 20px;'>
														<div id="${newList.BUYNO}">
															<script>
																$(function() {
																	var buyNo = ${newList.BUYNO};
																	$.ajax({
																				url : "${path}/imageDiv2.do",
																				data : {
																					"buyNo" : buyNo
																				},
																				dataType : "json",
																				success : function(data) {
		
																					var imgReName = data["buyImgRe"];
																					var imgContainer = $('#${newList.BUYNO}');
																					var url = "location.href='${path}/buy/buyDetail'";
																					imgContainer.append("<img src='${path}/resources/upload/buy/"+ data["buyImgRe"]+ "' style='width: 100%; height: 200px;cursor:pointer;' onclick='fn_detailView(${newList.BUYNO})'>");
		
																				}
																			});
																});
															</script>
														</div>
														<div class="box-content" onclick="fn_detailView(${newList.BUYNO})">
															<h3 class="title">${newList.MEMBERID}</h3>
															<p class="description">${newList.INTRODUCTION }</p>
														</div>
													</div>
													<div class='sub-description'>											
														
														<div class='infobox' style='margin-left: 1.2em;'>
															<div style='width: 340px; height: 24px; overflow:hidden;'>
																<h5>${newList.BUYTITLE}</h5>
															</div>
															<div class='row'>
																<div class='col-md-7' id="price">
																	<h5 style='position:relative; top:33%'>가격: ${newList.BUYPRICE }</h5>
																</div>
																<div class='col-md-5' style='float:right'>
																	<p id="gradep">
																	  <c:if test="${newList.GRADENAME == '브론즈' }">
								                                 	  <p style='display: inline;'><img alt="" src="${path }/resources/image/bronzeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
										                              </c:if>
										                              <c:if test="${newList.GRADENAME == '실버' }">
										                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/silverGrade.png" style="max-width: 50px;max-height: 50px;"></p>
										                              </c:if>
										                              <c:if test="${newList.GRADENAME == '골드' }">
										                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/goldGrade.png" style="max-width: 50px;max-height: 50px;"></p>
										                              </c:if>
										                              <c:if test="${newList.GRADENAME == '플래티넘' }">
										                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/platinumGrade.png" style="max-width: 50px;max-height: 50px;"></p>
										                              </c:if>
										                              <c:if test="${newList.GRADENAME == '다이아' }">
										                                 <p style='display: inline;'><img alt="" src="${path }/resources/image/diamodeGrade.png" style="max-width: 50px;max-height: 50px;"></p>
										                              </c:if>
																	${newList.GRADENAME}
																	</p>
																</div>
															</div>
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
														<div id="grade${gradeList.BUYNO}">
															<script>
																$(function() {
																	var buyNo = ${gradeList.BUYNO};
																	$.ajax({
																				url : "${path}/imageDiv2.do",
																				data : {
																					"buyNo" : buyNo
																				},
																				dataType : "json",
																				success : function(data) {
		
																					var imgContainer = $('#grade${gradeList.BUYNO}');
																					imgContainer.append("<img src='${path}/resources/upload/buy/"+ data["buyImgRe"]+ "' style='width: 100%; height: 200px;'>");
		
																				}
																			});
																});
															</script>
														</div>
														<div class="box-content">
															<h3 class="title">${gradeList.MEMBERID}</h3>
															<p class="description">${gradeList.INTRODUCTION}</p>
		
														</div>
													</div>
													<div class='sub-description'>
														<div style='float: left;'>
															<p>${gradeList.BUYTITLE}</p>
														</div>
														<div class='infobox' style='float: right; display: inline;'>
															<div id="gradeprice">
																<p>가격: ${gradeList.BUYPRICE}</p>
		
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
		
								
		
							</div>
						</div>
					</div>
					</div>
					<div class='col-md-1'></div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>