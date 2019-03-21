<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>지원자 상세 보기</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
<style>
#vol-container{
	padding-top:20px;
}
#vol-title{
	
	padding-right:20px;
}
#vol-img{
	/* border: 1px solid rgb(230,230,230); */
  	width: 30px;
    height: 30px;
    border-radius: 100px;
    margin-bottom:10px;

    display:inline;
}
#vol-id{
	color:#5D5D5D;
	font-weight: 500; 
	font-size:16pt; 
	display:inline;
}

#vol-content{
	padding:50px;
	
	height:300px;
}

#btn-div{
	padding-bottom:50px;
	text-align: right;
}
.volTr{
	cursor:pointer
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-1"></div>
		<div id="vol-container" class="col-sm-10">
		<div style="padding:50px;"><h2>지원자 상세보기</h2></div>
		<div id="vol-title">
		<div>
			<h3 class="font-weight-bold text-left" style="display:inline"><c:out value="${vol.BUYCANDIDATETITLE }"/></h3>
		</div>
		<div>
			<fmt:parseDate value="${vol.BUYCANDIDATEDATE }" var="dateFMT" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			<p class="text-right" style="color:grey;"><fmt:formatDate value="${dateFMT}" pattern="yy-MM-dd HH:mm"/></p>
		</div>
		</div>
		<div>
			<hr>
			<img id="vol-img" alt="" src="${path}/resources/upload/member/${volImg.REIMG}">
			<p id="vol-id"><c:out value="${vol.MEMBERID }"/></p>
		
			<div id="vol-content">
				<p>${vol.BUYCANDIDATECONTENT }</p>
			</div>
		</div>
		<div style="border:1px solid black; padding: 10px; margin:10px;">
		<h4>첨부파일</h4>
		<c:forEach items="${downImg }" var="img">
			<img src="${path }/resources/images/file.png" width="16px"><a style="padding-right:10px;cursor: pointer"onclick="fileDownload('${img.BUYCANDIDATEFILEORI}','${img.BUYCANDIDATEFILERE }');"> ${img.BUYCANDIDATEFILEORI } </a>
		
		</c:forEach>
		</div>
		<div id="btn-div">
			<button class="btn btn-secondary" onclick="location.href='${path}/buy/payInfoView.do?buyNo=${buyNo }&memberId=${vol.MEMBERID }'">결정 및 결제하기</button>
			<button class="btn btn-secondary" onclick="location.href='${path}/buy/volList.do?buyNo=${buyNo }&cPage=${cPage }'">뒤로가기</button>
		</div>
		
		
		
		<div class="col-sm-1"></div>
		
		
	</div>
	</div>
	
<script>
	function fileDownload(oName, rName)
	{
		oName=encodeURIComponent(oName);
		location.href="${path}/buy/filedownLoad.do?oName="+oName+"&rName="+rName;
	}
</script>
</body>
</html>