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
	 <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/boardCommon/boardCommon.css'/>
   
      <jsp:include page="/WEB-INF/views/common/header.jsp">
        <jsp:param value="HelloSpring" name="pageTitle"/>
      </jsp:include>
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
				<h2 style="font-family: 'Sunflower', sans-serif;">구매 게시글 수정</h2>
			</div>
			<form id="buyWriteFrm" action="${pageContext.request.contextPath}/buy/buyModifyEnd.do" enctype="multipart/form-data" method="post">
				<div class="row">
					<input type="hidden" name="buyNo" value="${buyNo }"/>
					<div class="col-md-2">
						<label>분류</label>
					</div>
					<div class="col-md-8">
						<select class="form-control col-md-4" required id="interest"
							name="interest" style="display: inline" >
							<option>카테고리</option>
							<option value='1'>개발자</option>
							<option value='2'>웹디자이너</option>
							<option value='3'>네트워크보안</option>
						</select> <select class="form-control col-md-4" id="detailInterest"
							name="detailInterest" style="display: inline; margin-right: 10px" required>


						</select>
						<input type='hidden' id='interestHidden' value='${detailList.INTERESTNO}'>
				        <input type='hidden' id='detailInterestHidden' value='${detailList.DETAILINTERESTNO}'>
			        
				        <script>
				        	$(function()
			      			{	        		
				        		$('#interest').val($('#interestHidden').val()).trigger('change');
				        		$('#detailInterest').val($('#detailInterestHidden').val()).trigger('change');
			      			})
				        	
				        </script>
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
							style="display: inline;" placeholder="제목을 입력하세요." value="${detailList.BUYTITLE }"/> <br>
					</div>
				</div>
				<br>
				<div class='row'>
					<div class="col-md-2">
						<label>금액</label>
					</div>
					<div id="priceProduct" class="col-md-8">
						<input type='number' id="price" name="price" min="1" step="1" pattern="^[0-9]" class='form-control col-md-2' style='display: inline' placeholder="금액(원)" value="${detailList.BUYPRICE }">
						
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
				<textarea class="form-control" id="buyContent" name="buyContent" rows="10" >${detailList.BUYCONTENT }</textarea>
				<br />
				<div id="null">
					<span class='nullimg'>메인에 노출될 사진을 선택해주세요</span>
				</div>
				<div class="filebox bs3-primary preview-image">
					<c:forEach items="${imgList}" var="modifyImg" varStatus="st">
						<c:if test="${st.index == 0 }">
			            <div class="upload-display"><input type="radio" name="mainImgNo" value='${st.index}' checked>
			           		 <div class="upload-thumb-wrap"><img src="${path}/resources/upload/buy/${modifyImg.BUYIMGRE}" class="upload-thumb"></div>
			            </div>
			            </c:if>
			            <c:if test="${st.index != 0 }">
			            <div class="upload-display"><input type="radio" name="mainImgNo" value='${st.index}'>
			           		 <div class="upload-thumb-wrap"><img src="${path}/resources/upload/buy/${modifyImg.BUYIMGRE}" class="upload-thumb"></div>
			            </div>
			            </c:if>
		            </c:forEach>
					<label for="input_file">사진 선택</label> <input type="file"
						name="input_file" id="input_file" class="upload-hidden"
						multiple="multiple" accept=".gif, .jpg, .png">
				</div>

				<br />
				<div id="btn-container">
					
					<input type="submit" class="btn btn-outline-info slidetopleft" onsubmit="fn_check();" value="수정"/>
				</div>
				</form>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		
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
	   $('#buyContent').on('keyup', function() {
		      if($(this).val().length > 1339) {
		    	  console.log($(this).val());
		         alert("글자수는 1339자로 이내로 제한됩니다.");
		         $(this).val($(this).val().substring(0, 1339));
		      }
		   
		});
	   
	   function fn_check()
	   {
		   if(document.getElementByName("mainImgNo").checked == false)
			{
			   alert("메인이미지로 노출될 이미지를 선택해주세요");
			   return false;
			}
		   else
			{
				return true;   
			}
	
		   
	   }
	   
	   //가격
	   $('#price').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
	 
	   
	   
     
	  

   	
  
         
      
   </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>