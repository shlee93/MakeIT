<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 지원하기</title>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
<style>
div {
   /* border: 1px solid black; */
}
#apply-container{
   padding: 20px;
}
#image_div {
   padding:10px;
   text-align : center;
 
}
#profile{
   border: 5px solid rgb(230,230,230);
   width: 160px;
    height: 160px;
    border-radius: 100px;
    
}
.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    /* overflow: hidden; */
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







#intro-div label {
   margin-right: 30px;
   
}
#btn-container {
   padding : 10px;
   text-align:right;
}
</style>
</head>
<body>
   <div class="row">
      <div class="col-md-1">
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
      <div class="col-md-10" id="apply-container">
     	 <div id="pageTitle" style="padding-bottom:20px;">
			<h2 style="font-family: 'Sunflower', sans-serif;">지원글 작성</h2>
		</div>
       <form id="volFrm" action="${path }/buy/buyVolEnd.do" enctype="multipart/form-data" method="post">
         <div id="intro-div">
        
            <label>제목</label> 
            <input type="text" name="title" class="form-control col-sm-9" style="display: inline;" placeholder="제목을 입력하세요." required />
            <br>
            <br>
            <label>내용</label>
            <textarea name="content" class="form-control" rows="10" required></textarea>
         </div>
         <div class="filebox bs3-primary preview-image" style="padding-top:10px;">
			<label for="input_file">파일 선택</label> <input type="file" name="input_file" id="input_file" class="upload-hidden" multiple="multiple" >
		
		</div>
		<input type="hidden" name="buyNo" value="${param.buyNo }"/>
		
         <div id="btn-container">
            <input type="submit" class="btn btn-secondary" value="지원하기"/>
         </div>
          </form>
      </div>
     
      <div class="col-md-1"></div>
     </div>
</body>

<script>
var sel_files=[];

$(document).ready(function(){
       //preview image 
       
       var imgTarget = $('.preview-image .upload-hidden');
       imgTarget.on('change', function(e){
    	  
          var files=e.target.files;
          console.log(files);
           var filesArr=Array.prototype.slice.call(files);
           console.log(files);
           var parent = $(this).parent();
           parent.children('p').remove();
          
           console.log("수 : " + filesArr.length);
         if(filesArr.length > 5)
         {
            alert("파일은 5개 제한입니다.");
            return;
         }
           filesArr.forEach(function(f){
              count = 0;
               
               console.log("Asdf" + f.name)
               sel_files.push(f);
               
               var reader=new FileReader();
               reader.onload=function(e){
                  var src = e.target.result;
                   parent.prepend('<p style="padding-right:20px;">'+ f.name +'</p>');
               }
               
               reader.readAsDataURL(f);
               
               
            })
             
        });
      
   });
function fn_volEnd(){
	console.log("${param.buyNo}")
    $('#volFrm').attr("method","post");
    $('#volFrm').submit();
 }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>