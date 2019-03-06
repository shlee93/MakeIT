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


<style>

body {margin: 10px;}
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
		<div class="col-sm-1"></div>
		<div id="vol-container" class="col-sm-10">
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
					<tr>
						<td><c:out value="${v.MEMBERID }"/></td>
						<td><c:out value="${v.BUYCANDIDATECONTENT }"/></td>
						<td><c:out value="${v.BUYCANDIDATEDATE }"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div>
				<input type="text" class="form-group" id="title"
					value="내가 나를 이긴다 그럼 나는 너를 이기는가" readonly style="width:90%"/>
					<br> 
				<input type="text"
					class="form-group" id="writer" value="조충현" readonly style="width:5%"/>
				<br>
				<textarea class="form-group" id="content" rows="10" style="width:90%;">
					내가 나를 이긴다 고로 나는 너를 이긴다. 왜냐하면 나느 천하무적이기 때문이다. 누가 나를 이길 쏘냐? 그건 너도 나도 우리도 심지어 하늘도 모르는 것이다.
				</textarea>
				<div style="text-align:right; margin-right:200px;">
					<button class="btn btn-secondary">결정하기</button>
					<button class="btn btn-secondary">뒤로가기</button>
				</div>
				<hr>
				<table class="table table-hover" style="width:90%">
					<tr>
						<td>이전</td>
						<td>창과 방패가 서로 강하기를 주장하니 어찌 세상이 평화로울 수 있겠습니까</td>
						<td>제갈공명</td>
					</tr>
					<tr>
						<td>다음</td>
						<td>암튼 다이아몬드가 젤 단단함 반박시 빙시</td>
						<td>관종</td>
					</tr>
	
				</table>
			</div>
			<div class="filebox bs3-primary preview-image">
				<label for="input_file">사진 선택</label> 
				<input type="file" id="input_file" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png"> 
			</div>

		
		<div class="col-sm-1"></div>
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
</script>
</body>
</html>
