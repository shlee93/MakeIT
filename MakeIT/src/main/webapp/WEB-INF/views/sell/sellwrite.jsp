<%@ page language="java" contentType="text/html; charset=UTF-8"
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
						html+="<option value='"+data.list[i]["DETAILINTEREST"]+"'>"+data.list[i]["DETAILINTEREST"]+"</option>";
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
      <div class="col-sm-1"></div>
      <div id="buy-container" class="col-sm-10">
         <label>분류</label> <select class="form-control col-sm-2"
            style="display: inline">
            <option disabled selected>대분류</option>
            <option>개발자</option>
            <option>웹디자이너</option>
            <option>네트워크 보안</option>
         </select> <select class="form-control col-sm-2"
            style="display: inline; margin-right: 10px">
            <option disabled selected>소분류</option>
            <option>웹</option>
            <option>모바일</option>
            <option>게임</option>
            <option>응용 프로그램</option>
            <option>보안 프로그램</option>
            <option>데이터베이스 관리</option>
         </select> 
         <br> 
         <label>제목</label> 
         <input type="text" class="form-control col-sm-9" style="display: inline;" placeholder="제목을 입력하세요." /> 
         <br> 
         <label>상품</label> 
         <input type="number" class="form-control col-sm-2" style="display: inline" placeholder="금액(원)"> 
         <input type="text" class="form-control col-sm-7" style="display: inline" placeholder="상품에 대한 설명을 입력하세요.">
         <button class="btn btn-secondary" style="width: 45px; font-size: 20px">+</button>
         <button class="btn btn-secondary" style="width: 45px; font-size: 20px">-</button>
         <br>
         <label>기한</label> 
         <input type="date" class="form-control col-sm-2" style="display: inline">&nbsp부터&nbsp&nbsp

         <input type="date" class="form-control col-sm-2" style="display: inline">&nbsp까지
         <br> 
         
         <label>상세 설명</label>
         <textarea class="form-control" rows="10"></textarea>
         <br>
         <div class="filebox">
            <label for="ex_file">이미지 업로드</label> <input type="file" id="ex_file">

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
	         	<select class="form-control col-md-4" id="detailInterest"  style="display: inline; margin-right: 10px">
		            <option disabled selected>소분류</option>
		           
	         	</select>
	         </div> 
	         <br> 

         </div>
         <div class="row">
	         <div class="col-md-2">
	         	<label>제목</label> 
	         </div>
	         <div class="col-md-8">
	         	<input type="text" class="form-control" style="display: inline;" placeholder="제목을 입력하세요." /> 
	         	<br> 
	         </div>
		</div>
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
       
         <br/> 
      <div class='row'>
            <div class="col-md-12">
             	<label>상세설명</label> 
            </div> 
         
       </div>
         <textarea class="form-control" rows="10"></textarea>
         <br/> 
       <div class="filebox"> 
	       <input class="upload-name" value="파일선택" disabled="disabled"> 
	       <label for="ex_filename">업로드</label> 
	       <input type="file" id="ex_filename" class="upload-hidden"> 
       </div>
		<script>
		$(document).ready(function(){ 
			var fileTarget = $('.filebox .upload-hidden'); 
			fileTarget.on('change', function(){ 
				 if(window.FileReader){ 
					 var filename = $(this)[0].files[0].name; 
					 }
				 else { 
					 var filename = $(this).val().split('/').pop().split('\\').pop();
					  }
				 $(this).siblings('.upload-name').val(filename); }); }); 

			
		</script>

         
         <!--  <div id="imgContainer" class="row">
	         	<input type="file" class="form-control col-md-8" id='firstimg' name="sellImg">
	         	<br/><br/>
	         </div> -->
         
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
   function writeEnd(){
	   
	   $('#sellWriteFrm').attr("action","${pageContext.request.contextPath}/sell/sellWriteEnd");
		$('#sellWriteFrm').attr("method","post");
		$('#sellWriteFrm').submit();
   }
   	function fn_optionPlus(){
   	/* 	var addPrice='<input type="number" class="form-control col-md-3" name="price" style="display: inline" placeholder="금액(원)"> ';
   		$('#priceProduct').append(addPrice); 
   		var addDate='<input type="text" class="form-control col-md-2" name="endDate" style="display: inline" placeholder="작업기한">';
   		$('#priceProduct').append(addDate);
   		var addOption='<div class="remove"><input type="text" class="form-control  col-md-8" name="productOption" style="display: inline" placeholder="상품에 대한 설명을 입력하세요."><br/><br/></div>';
   		$('#priceProduct').append(addOption); */
   		var addOption="<div class=addoption><input type='number' class='form-control col-md-3' name='price' style='display: inline' placeholder='금액(원)'><input type='text' class='form-control col-md-2' name='endDate' style='display: inline' placeholder='작업기한'><input type='text' class='form-control  col-md-8' name='productOption' style='display: inline' placeholder='상품에 대한 설명을 입력하세요.'><br/><br/></div>";
   		$('#priceProduct').append(addOption); 
   	}
   	function fn_otionDelete()
   	{	
   		$('.addoption').last().remove();
   		/* if($('#priceProduct > input:nth-last-of-type(1)').attr("id")!=$('#firstOption').attr("id")){
   			$('#priceProduct > input').last().remove();
   			$('#priceProduct > input').last().remove();
   			$('#priceProduct > input').last().remove();
   		} */
   	}
   	
   </script>
</body>
</html>