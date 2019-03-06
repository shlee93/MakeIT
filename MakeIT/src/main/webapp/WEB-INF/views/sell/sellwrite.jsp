﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 게시글 작성</title>
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
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
   integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
   crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sellwrite/sellwrite.css" />
<style>
#priceProduct{
	height:100%;
}


 
</style>
<script>
var subde="";
	$(function(){
		$("select[name=interest]").on("change",function(){
			var interest=$(this).val();
			$.ajax({
				url:"${path}/sell/findInterest",
				data:{"interest":interest},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType:"json",
				type:"post",
				success:function(data){
					console.log(data);
					var html="";
					
					for(var i = 0;i<data.list.length;i++){
						console.log(data.list[i]["DETAILINTEREST"]);
						html+="<option value='"+(i+1)+"'>"+data.list[i]["DETAILINTEREST"]+"</option>";
					}
					$('#detailInterest').html(html);
				}
			});
		});
	});
	
</script>
</head>
<body>
	<form id="sellWriteFrm">
   <div class="row">
      <div class="col-md-1"></div>
      <div id="buy-container" class="col-md-10">
         <div class="row">
         	<div class="col-md-2">
	         <label>분류</label> 
	         </div>
	         <div class="col-md-8">
	         	<select class="form-control col-md-4" name="interest" style="display: inline">
		            <option disabled selected>대분류</option>
		            <option value=1>개발자</option>
		            <option value=2>웹디자이너</option>
		            <option value=3>네트워크 보안</option>
	         	</select> 
	         	<select class="form-control col-md-4" id="detailInterest" name="detailInterest"  style="display: inline; margin-right: 10px">
		            <option disabled selected>소분류</option>
		           
	         	</select>
	         </div> 
         </div>
          <br> 
         <div class="row">
	         <div class="col-md-2">
	         	<label>제목</label> 
	         </div>
	         <div class="col-md-8">
	         	<input type="text" name="writeTitle" class="form-control" style="display: inline;" placeholder="제목을 입력하세요." /> 
	         	<br> 
	         </div>
		</div>
		 <br> 
         <div class='row'>
            <div class="col-md-2">
             	<label>상품</label> 
             </div>
             <div id="priceProduct" class="col-md-8">
	         	<input type="number" class="form-control col-md-2" id='firstPrice' name="price" style="display: inline" placeholder="금액(원)">
	         	<input type="text" class="form-control col-md-2" id='endDate' name="endDate" style="display: inline" placeholder="작업기한"> 
	         	<input type="text" class="form-control  col-md-8" id="firstOption" name="productOption" style="display: inline" placeholder="상품에 대한 설명을 입력하세요.">
	         	<br/><br/>
	         </div>
	         <div class="col-md-2">
	        <button class="btn btn-secondary" type="button" onclick="fn_optionPlus();" style="width: 45px; font-size: 20px">+</button>
         	<button class="btn btn-secondary" type="button" onclick="fn_otionDelete();" style="width: 45px; font-size: 20px">-</button> 
         	</div>
         <br/>
         </div>
         <br/>
       
      <div class='row'>
            <div class="col-md-12">
             	<label>상세설명</label> 
            </div> 
         
       </div>
         <textarea class="form-control" name="sellContent" rows="10"></textarea>
         <br/> 
    	<div class="filebox bs3-primary preview-image">
            <label for="input_file">사진 선택</label> 
            <input type="file" id="input_file" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png"> 
         </div>
         
         <br/>
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

		
   function writeEnd(){
	   
	   $('#sellWriteFrm').attr("action","${pageContext.request.contextPath}/sell/sellWriteEnd");
		$('#sellWriteFrm').attr("method","post");
		$('#sellWriteFrm').submit();
   }
   	function fn_optionPlus(){
   		var addOption="<div class=addoption><input type='number' class='form-control col-md-3' name='price' style='display: inline' placeholder='금액(원)'><input type='text' class='form-control col-md-2' name='endDate' style='display: inline' placeholder='작업기한'><input type='text' class='form-control  col-md-8' name='productOption' style='display: inline' placeholder='상품에 대한 설명을 입력하세요.'><br/><br/></div>";
   		$('#priceProduct').append(addOption); 
   	}
   	function fn_otionDelete()
   	{	
   		$('.addoption').last().remove();
   	}
   	
      	
      
   </script>
</body>
</html>