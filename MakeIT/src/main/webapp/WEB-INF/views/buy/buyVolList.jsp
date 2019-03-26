<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>지원자 리스트 화면</title>
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
 
      


div {padding: 10px;}
thead {
	text-align:center;
}
.volTr{
	cursor:pointer
}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}



/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-1">
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
		<div id="vol-container" class="col-md-10">
			<div id="pageTitle" style="padding-bottom:20px;">
				<h2 style="font-family: 'Sunflower', sans-serif;">지원자 리스트</h2>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>제목</th>
						<th>지원 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${volList}" var="v">
					<tr class="volTr" onclick="fn_volView('${v.MEMBERID}', '${v.BUYNO }', '${v.CATEGORYCODE }')" >
						<td><c:out value="${v.MEMBERID }"/></td>
						<td><c:out value="${v.BUYCANDIDATETITLE }"/></td>
						<fmt:parseDate value="${v.BUYCANDIDATEDATE }" var="dateFMT" pattern="yyyy-MM-dd HH:mm:ss.S"/>
						<td><fmt:formatDate value="${dateFMT}" pattern="yy-MM-dd HH:mm"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<form action="" name="volViewFrm">
				<input type="hidden" name="memberId"/>
				<input type="hidden" name="buyNo"/>
				<input type="hidden" name="categoryCode"/>
				<input type="hidden" name="cPage"/>
			</form>	
			<!--
			<div class="filebox bs3-primary preview-image">
				<label for="input_file">사진 선택</label> 
				<input type="file" id="input_file" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png"> 
			</div> -->
		<div>
			${pageBar }
		</div>
		</div>
		
		<div class="col-md-1"></div>
	</div>
<script>
var sel_files=[];
$(document).ready(function(){
	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(e){
	    	var files=e.target.files;
	        var filesArr=Array.prototype.slice.call(files);
	        console.log(files);
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();
	        console.log("수 : " + filesArr.length);
			if(filesArr.length > 5)
			{
				alert("사진은 5개 제한입니다.");
				return;
			}
	        filesArr.forEach(function(f){
	            if(!f.type.match("image.*")){
	               alert("확장자는 이미지 확장자만 가능합니다.");
	               return;
	       
	            }
	            console.log(f)
	            sel_files.push(f);
	            
	            var reader=new FileReader();
	            reader.onload=function(e){
	            	var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            
	            reader.readAsDataURL(f);
	         })
	     });
	});
	
	function fn_volView(memberId, buyNo, categoryCode)
	{
		var url="${path}/buy/buyVolView.do?specFlag=${param.specFlag}";
		
		volViewFrm.memberId.value=memberId;
		volViewFrm.buyNo.value=buyNo;
		volViewFrm.categoryCode.value=categoryCode;
		volViewFrm.cPage.value=${param.cPage==null?1:param.cPage};
		volViewFrm.action=url;
		volViewFrm.method="post";
		volViewFrm.submit();
		
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
