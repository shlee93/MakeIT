
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
<title>다른 글 보기</title>

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
</style>
</head>
<body>
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
				<div style='position: relative; min-width: 400px'>

					<script>
						
						$(document).on("click",".sell-page",function() {
							var cPage = $(this).children('.nextNum').val();
							var memberId = '${param.memberId}'; 
							
							$.ajax({
								url : "${path}/buy/anotherView.do",
								data : {
									"cPage" : cPage,
									"memberId" : memberId
								},
								dataType : "html",
								success : function(data) {
									$("#nav-home").html(data);
								}
							});
								
						}); 
						
						function fn_detailView(buyNo)
						{
							location.href="${path}/buy/buyDetail?buyNo="+buyNo;
						}
					</script>
					<!-- 엘범 뷰 상단 탭 끝 -->


					<div id="nav-tabContent" style='border-top: 2px solid #337ab7;'>

						<!-- 앨범 뷰 탭 컨텐츠1 -->

						<div id="nav-home">

							

							<div class="container mt-40">
								
								<div class="row mt-30">

									<c:forEach items="${newList}" var="newList">
										<div class="col-md-4 col-sm-6 col-xs-10">
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
																			imgContainer.html("<img src='${path}/resources/upload/buy/"+ data["buyImgRe"]+ "' style='width: 100%; height: 200px;cursor:pointer;' onclick='fn_detailView(${newList.BUYNO})'>");

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
												<div style='float: left;'>
													<p>${newList.BUYTITLE}</p>
												</div>
												<div class='infobox' style='float: right; display: inline;'>
													<div id="price">
														<p>가격: ${newList.BUYPRICE }</p>
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

					

						

					</div>
				</div>
			</div>
			<div class='col-md-1'></div>
</body>
</html>