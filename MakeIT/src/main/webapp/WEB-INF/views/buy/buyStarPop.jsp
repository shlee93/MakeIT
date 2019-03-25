<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>별점/후기 작성</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	    <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/selldetail/selldetail.css" />
</head>
<script>
	function fn_plusStar()
	{
		var starCount = $("#starCount").val();
		if(starCount != 5)
		{			
			starCount++;
			$("#star"+starCount).attr("src","${path }/resources/image/star.png");
			$("#starCount").val(starCount);
		}
		
	}
	function fn_minusStar()
	{
		var starCount = $("#starCount").val();
		
		if(starCount != 0)
		{
			$("#star"+starCount).attr("src","${path }/resources/image/emptyStar.png");
			starCount--;
			$("#starCount").val(starCount);
		}
		
	}
	
	function fn_submit()
	{
		var reviewNo = $("#reviewNo").val();
		if(reviewNo != null && reviewNo != "")
		{
			reviewFrm.action="${path }/buy/modReviewEnd.do";
		}
		else
		{
			reviewFrm.action="${path }/buy/writeReviewEnd.do";
		}
		reviewFrm.submit();
		
		
	}
</script>
<body>
	<div style="text-align:center; padding:20px;">
	<p>여러분이 남긴 후기가 makeIt을 발전 시킵니다</p>
	<form action="${path }/buy/writeReviewEnd.do" method="post" name="reviewFrm">
		<div style="text-align:center; padding:10px;">
			<img id="minus" src="${path }/resources/image/minus.png" style="margin-right:10px;" onclick="fn_minusStar();" >
			<img id="star1" src="${path }/resources/image/emptyStar.png">
			<img id="star2" src="${path }/resources/image/emptyStar.png">
			<img id="star3" src="${path }/resources/image/emptyStar.png">
			<img id="star4" src="${path }/resources/image/emptyStar.png">
			<img id="star5" src="${path }/resources/image/emptyStar.png">
			<img id="plus" src="${path }/resources/image/plus.png" style="margin-left:10px;" onclick="fn_plusStar();">
		</div>	
		<div style="padding:10px">
			<input type="text" class="form-control" name="reviewContent">
			<input type="hidden" id="starCount" name="starCount" value="0">
			<input type="hidden" id="buyNo" name="buyNo" value="${buyNo }">
			<input type="hidden" id="reviewNo" name="reviewNo" value="${reviewNo }">
		
		</div>
		<div style="float:right; padding:10px;">
			<input type="button" class="btn btn-primary" value="작성" onclick="fn_submit()">
		</div>
	</form>
	</div>
</body>
</html>