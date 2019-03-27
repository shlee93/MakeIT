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

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/writeBoard.css" />
<style>
body,html{
	margin:0;
	padding:0;
	overflow-X:hidden;
}
#writeBoardBody{
	position: relative;
	width:900px;
	height:max-content;
	margin-top:-80px;
	left:50%;
	transform:translateX(-50%);
	background-color: gainsboro;
	border:1px solid gray;
	border-radius:15px;
	overflow: hidden;
}
#decoBar{
	position: absolute;
	width:100%;
	height: 50px;
	z-index:1;
	background-color: #138496;
}
#writeBoardTitleBox{
	position: relative;
	width:100%;
	height: 150px;
	border-bottom:1px solid gray;
	background-color: white;
}
#writeTitleInput{
	position: absolute;
	width: 200px;
	height: 40px;
	left:50%;
	top:80%;
	transform:translate(-50%,-80%);
	font-size:20px;
	font-family: 'Sunflower', sans-serif;
	border: 1px solid gray;
	transition: ease-in-out;
	transition-duration: 0.7s;
}

#writeBoardContentBox{
	position: relative;
	width:100%;
	height:440px;
	margin-top:15px;
	border-top:1px solid gray;
	border-bottom:1px solid gray;
	background-color: white;
}
#writeBoardImgBox{
	position: relative;
	width:100%;
	height: 340px;
	margin-top:15px;
	border-top:1px solid gray;
	background-color: white;
}
#imgSortBox{
	position: absolute;
	left:50%;
	transform: translate(-50%);
	width: 800px;
	height: 250px;
	border: 1px solid gray;
}
.writeImg{
	position: relative;
	display:inline-block;
	width: 220px;
	height:220px;
	background-size:cover;
	top:50%;
	transform: translateY(-50%);
	margin-left: 20px;
	border-radius: 5px;
	border: 2px solid gray;
}


#writeContentText{
	position: absolute;
	width: 600px;
	height: 400px;
	left:50%;
	top:50%;
	transform:translate(-50%,-50%);
	font-size:20px;
	font-family: 'Sunflower', sans-serif;
	border: 2px solid gray;
	resize: none;
	transition: ease-in-out;
	transition-duration: 0.7s;
}
#writeContentText:focus{
	border: 3px solid cornflowerblue;
}
#btn-container{
margin-left: 380px;
margin-top: 260px;
}


</style>

<form id="sellWriteFrm" enctype="multipart/form-data" method="post" action="${path}/board/insertWriteBoardEnd.do">
	<div id="writeBoardBody">
		<div id="decoBar"></div>
	
		<div id="writeBoardTitleBox">
			<input type="text" id="writeTitleInput" name="writeTitle" placeholder="    제목을 입력하세요." maxlength="20" required/>
		</div>
		
		<div id="writeBoardContentBox">
			<textarea id="writeContentText" name="writeContent" placeholder="내용을 입력하세요." maxlength="1000" required></textarea>
		</div>
		<div id="writeBoardImgBox">

			
			<div class="filebox bs3-primary preview-image" style="margin-left: 300px;">
            	<label for="input_file">사진 선택</label> 
            
            	<input type="file" name="input_file" id="input_file" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png"> 
         	</div>
			
			<div id="imgSortBox"></div>
			
			<div id="btn-container">
	            <button id="writeCancle" class="btn btn-outline-info">취소</button>
	            <button type="submit" class="btn btn-outline-info">작성</button>
	         </div>
		</div>
	
	</div>
</form>
	
	

<script>
	

	var sel_files = [];
	$(document).ready(function(){
		$('#input_file').on("change", handleImgsFilesSelect);
	});
	function handleImgsFilesSelect(e){
		var files = e.target.files;
		var fileArr = Array.prototype.slice.call(files);
		
		$('.writeImg').remove();
		
        if(fileArr.length > 3)
        {	
           $('#input_file').val("");
           alert("사진은 3개 제한입니다.");
           return;
        }
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img class='writeImg' src=\"" + e.target.result + "\" />";
				$('#imgSortBox').append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
	

	$('#writeTitleInput').click(function(){
		
		$(this).css('width','600px');
		$(this).css('height','60px');
		$(this).css('border','3px solid cornflowerblue');
		$(this).css('font-size','30px');
	})
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>