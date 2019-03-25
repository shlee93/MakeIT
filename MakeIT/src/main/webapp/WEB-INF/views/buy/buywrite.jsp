<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 게시글 작성</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/buywrite/buywrite.css" />
<style>
#priceProduct {
	height: 100%;
}
</style>
<script>
             $(function()
               {
                  $("#interest").change(function()
                   {
                       console.log(this.value);
                       if(this.value!='카테고리')
                      {
                        $.ajax({
                           url:"${path}/categoryOneSel.do",
                              data:{"interestNo":this.value},
                           dataType:"json",
                              success:function(data)
                              {
                                 console.log(data);
                                 var detailInterest=$('#detailInterest');
                                 
                                    for(var i=0; i<data.length; i++)
                                 {
                                       
                                         optionValue='DETAILINTEREST';
                                      optionInter='DETAILINTERESTNO';
                                                 
                                        var option
                                        option+="<option value='"+data[i][optionInter]+"'>"+data[i][optionValue]+"</option>";
                                      
                                          detailInterest.html(option);
                                    
                                      }
                              }
                        });
                      }
                    })
                  }          
           );
        </script>
</head>
<body>
	<form id="buyWriteFrm" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-1"></div>
			<div id="buy-container" class="col-md-10">
				<div class="row">
					<div class="col-md-2">
						<label>분류</label>
					</div>
					<div class="col-md-8">
						<select class="form-control col-md-4" id="interest"
							name="interest" style="display: inline">
							<option>카테고리</option>
							<option value='1'>개발자</option>
							<option value='2'>웹디자이너</option>
							<option value='3'>네트워크보안</option>
						</select> <select class="form-control col-md-4" id="detailInterest"
							name="detailInterest" style="display: inline; margin-right: 10px">


						</select>
					</div>
					<br>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2">
						<label>제목</label>
					</div>
					<div class="col-md-8">
						<input type="text" name="writeTitle" class="form-control"
							style="display: inline;" placeholder="제목을 입력하세요." /> <br>
					</div>
				</div>
				<br>
				<div class='row'>
					<div class="col-md-2">
						<label>금액</label>
					</div>
					<div id="priceProduct" class="col-md-8">
						<input type="number" class="form-control col-md-2" id='firstPrice'
							name="price" style="display: inline" placeholder="금액(원)">
						 <br /> <br />
					</div>

					<br />
				</div>
				<br />

				<div class='row'>
					<div class="col-md-12">
						<label>상세설명</label>
					</div>

				</div>
				<textarea class="form-control" name="buyContent" rows="10"></textarea>
				<br />
				<div id="null">
					<span class='nullimg'>메인에 노출될 사진을 선택해주세요</span>
				</div>
				<div class="filebox bs3-primary preview-image">
					<label for="input_file">사진 선택</label> <input type="file"
						name="input_file" id="input_file" class="upload-hidden"
						multiple="multiple" accept=".gif, .jpg, .png">
				</div>

				<br />
				<div id="btn-container">
					<button class="btn btn-secondary">취소</button>
					<button class="btn btn-secondary" onclick="writeEnd();">작성</button>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</form>
	<script>
   var sel_files=[];
   var count = 0;
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
                 count = 0;
                  if(!f.type.match("image.*")){
                     alert("확장자는 이미지 확장자만 가능합니다.");
                     return;
             
                  }
                  console.log(f)
                  sel_files.push(f);
                  
                  var reader=new FileReader();
                  reader.onload=function(e){
                     var src = e.target.result;
                      parent.prepend('<div class="upload-display"><input type="radio" name="mainImgNo" value='+ (count++) +' required><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
                  }
                  
                  reader.readAsDataURL(f);
                  
                  
               })
                
           });
         
      });

      
   function writeEnd(){
      $('#buyWriteFrm').attr("action","${pageContext.request.contextPath}/buy/buyWriteEnd.do");
      $('#buyWriteFrm').attr("method","post");
      $('#buyWriteFrm').submit();
   }
     
         
      
   </script>
</body>
</html>