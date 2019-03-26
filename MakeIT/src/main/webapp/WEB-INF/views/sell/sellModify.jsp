<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 글 보기</title>
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
   	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contestdetail/contestDetail.css" />
   	<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
   	<jsp:include page="/WEB-INF/views/common/header.jsp">
	  	<jsp:param value="HelloSpring" name="pageTitle"/>
   	</jsp:include>
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
      <div id="buy-container" class="col-md-10">
      <div id="pageTitle" style="padding-bottom:20px;">
                  		<h1 style="font-family: 'Sunflower', sans-serif;">판매 게시글 수정</h2>
      </div>
   <form id="sellWriteFrm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/sell/sellModifyEnd" method="post">

         <div class="row">
            <div class="col-md-2">
            <label>분류</label> 
            </div>
            <div class="col-md-8">
               <select class="form-control col-md-4" id="interest" name="interest" required style="display: inline">
                 <option>카테고리</option>
                 <option value='1'>개발자</option>
                 <option value='2'>웹디자이너</option>
                 <option value='3'>네트워크보안</option>    
               </select> 
               <select class="form-control col-md-4" id="detailInterest" name="detailInterest" required  style="display: inline; margin-right: 10px">
                  
                 
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
               <input type="text" name="writeTitle" class="form-control" style="display: inline;" value="${modifyMap.SELLTITLE}" required /> 
               <br> 
            </div>
      </div>
       <br> 
         <div class='row'>
            <div class="col-md-2">
                <label>상품</label> 
             </div>
             
             <div id="priceProduct" class="col-md-8">
             	<c:forEach items="${modifyOption}" var="modifyOption">
             	<div>
	                <input type="number" class="form-control col-md-2 price" min='0' step='1' pattern="^[0-9]" required name="price" style="display: inline" placeholder="금액(원)" value="${modifyOption.SELLPRICE}">
	               <input type="text" class="form-control col-md-2" id='endDate' name="endDate" style="display: inline" required value="${modifyOption.SELLDEADLINE}"> 
	               <input type="text" class="form-control  col-md-8" id="firstOption" name="productOption" required style="display: inline" value="${modifyOption.SELLOPTIONCONTENT }">
	               <br/><br/>
	            </div>
	       		 </c:forEach>        	                           
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
         <textarea class="form-control" id="sellContent" name="sellContent" rows="10"  required>${modifyMap.SELLCONTENT}</textarea>
         <br/> 
         <div id="null">
         <span class='nullimg'>메인에 노출될 사진을 선택해주세요</span>
         </div>
       <div class="filebox bs3-primary preview-image">
             <c:forEach items="${modifyImg}" var="modifyImg" varStatus="st">
             	<c:if test="${st.index == 0 }">
	            	<div class="upload-display"><input type="radio" name="mainImgNo" value='${st.index}' checked>
	           			 <div class="upload-thumb-wrap"><img src="${path}/resources/upload/sell/${modifyImg.SELLIMGRE}" class="upload-thumb"></div>
	            	</div>
	            </c:if>
	            <c:if test="${st.index != 0 }">
	            	<div class="upload-display"><input type="radio" name="mainImgNo" value='${st.index}'>
	           			 <div class="upload-thumb-wrap"><img src="${path}/resources/upload/sell/${modifyImg.SELLIMGRE}" class="upload-thumb"></div>
	            	</div>
	            </c:if>
            </c:forEach>
            <label for="input_file">사진 선택</label> 
            <input type="file" name="input_file" id="input_file" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png"> 
         </div>
			<input type="hidden" id="sellno" name="sellno" value="${modifyMap.SELLNO}">
         <br/>
         <div id="btn-container">
            <button class="btn btn-outline-info slidetopleft">취소</button>
            <button  type="submit" class="btn btn-outline-info slidetopleft" >수정완료</button>
         </div>
         </form>
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
                   
                        parent.prepend('<div class="upload-display"><input type="radio" name="mainImgNo" value='+ (count++) +' required ><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
                    
                      
                  }
                  
                  reader.readAsDataURL(f);
                  
                  
               })
                
           });
         
      });
      
   $('#sellContent').on('keyup', function() {
       if($(this).val().length > 450) {
          alert("글자수는 1339자로 이내로 제한됩니다.");
          $(this).val($(this).val().substring(0, 1339));
       }
    
    });
      function fn_optionPlus(){
    	  var addOption="<div class=addoption><input type='number' min='0' step='1' pattern='^[0-9]' class='form-control col-md-3 price' name='price' style='display: inline' placeholder='금액(원)' required><input type='text' class='form-control col-md-2' name='endDate' style='display: inline' placeholder='작업기한' required><input type='text' class='form-control  col-md-8' name='productOption' style='display: inline' placeholder='상품에 대한 설명을 입력하세요.' required><br/><br/></div>";
         $('#priceProduct').append(addOption);
         $('.price').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
      }
      function fn_otionDelete()
      {   
          if( $("#priceProduct").children().last().index()!=0){
    	  $("#priceProduct").children().last().remove();
          }
      }
      $('#firstPrice').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
      $(document).on('keypress','.price',function(){
    	  if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } 
      })   
      
   </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 