<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>컨테스트 작성</title>
    
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contestwrite/contestwrite.css" />

</head>

<style>
	.sero-center
		{
		    display:flex;
		    align-items:center;
		}
		
		.garo-center
		{
		    display:flex;
		    margin: auto;
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

	<jsp:include page="/WEB-INF/views/common/header.jsp">
	  	<jsp:param value="HelloSpring" name="pageTitle"/>
   	</jsp:include>

<body>
	<div class="row" style='padding:1.1em;'>
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
    		<form action='${path}/contest/contestModifyEnd.do' method='post' enctype="multipart/form-data">    
				<label>제목</label> 
	
				<select class="form-control col-md-2" id='interestNo' name='interestNo' style="display: inline;" required/>
	        		<option>카테고리</option>
	        		<option value='1'>개발자</option>
	        		<option value='2'>웹디자이너</option>
	        		<option value='3'>네트워크보안</option>         
	        	</select>
	         
	        	<select class="form-control col-md-2" id='detailInterestNo' name='detailInterestNo' style="display: inline;" required/>
	        	       
	        	</select> 
		        <script>
		       		$(function()
		      			{	       				
		            		$("#interestNo").change(function()
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
			            	               var detailInterest=$('#detailInterestNo');
			            	               
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
	       	
		       	<input type='hidden' id='interestHidden' value='${contest.INTERESTNO}'>
		        <input type='hidden' id='detailInterestHidden' value='${contest.DETAILINTERESTNO}'>
	        
		        <script>
		        	$(function()
	      			{	        		
		        		$('#interestNo').val($('#interestHidden').val()).trigger('change');
		        		$('#detailInterestNo').val($('#detailInterestHidden').val()).trigger('change');
	      			})
		        	
		        </script>
	        
				<input type="text" class="form-control col-md-6" id='contestTitle' name='contestTitle' style="display: inline;" placeholder="제목을 입력하세요." value='${contest.get("CONTESTTITLE")}' required/> 
	        	
	        	<script>
		        	$('#contestTitle').on('keyup', function() 
	        		{
			            if($(this).val().length > 60) 
			            {
			               alert("글자수는 60자로 이내로 제한됩니다.");
			               $(this).val($(this).val().substring(0, 60));
			            }			         
			        });
		        </script>
	        		        	
	        	<!-- 콘테스트 이름 -->      
	        
	        	<br/>
	       	 
		       	<input type='hidden' name='contestNo' value='${contest.CONTESTNO}'>
		       	 
		   	    <label>주최</label>
		     	<input type="text" class="form-control col-md-2" style="display: inline;" id='star' name='dona' placeholder="주최측" value='${memberMap.get("MEMBERNAME")}' readonly/>
		      	<input type="text" class="form-control col-md-2" style="display: inline;" id='starId' name='donaId' placeholder="주최자 아이디" value='${memberMap.get("MEMBERID")}'readonly/> 
		       	
		       	<br/>
	       	
		       	<label>상금</label>
		     	<input type="number" class="form-control col-md-2" id='contestPrice' name='contestPrice' style="display: inline;" placeholder="상금 총액"  value='${contest.get("CONTESTPRICE")}' required/>
		       	
		       	<br/>
	       	  
		        <label>기한</label> 
		        <input type="date" id='contestDate' name='contestDate' class="form-control col-md-2" style="display: inline" value="${contest.get('CONTESTDATE')}" required>~
		        <input type="date" id='contestDeadLine' name='contestDeadLine' class="form-control col-md-2" style="display: inline" value="${contest.get('CONTESTDEADLINE')}" required>
				<script>        
			        $(function()
	        		{
					    fn_setDatePickerMax();
					});
					
					function fn_setDatePickerMax()
					{
					    var datePicker1 = document.getElementById('contestDate');
					    var datePicker2 = document.getElementById('contestDeadLine');
					    if(datePicker2.val==null)
				    	{
						    datePicker1.min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
						    console.log(datePicker1.val);
				    	}     	
					 }
					
					$(function()
	      			{
	            		$("#contestDeadLine").change(function()
	       				{
	           				console.log(this.value);
	           				
	           				var datePicker1 = document.getElementById("contestDate");
	           				var datePicker2 = document.getElementById('contestDeadLine');
	           				
	           				datePicker1.max=this.value;
	       				})
	       				$("#contestDate").change(function()
						{
							console.log(this.value);
	           				
	           				var datePicker1 = document.getElementById("contestDate");
	           				var datePicker2 = document.getElementById('contestDeadLine');
	           				
	           				datePicker2.min=this.value;
	       				})
	      			});
					
				</script>
				
	        	<br/> 
	         
		        <label>상세 설명</label>
		        <textarea class="form-control" id='contestContent' name='contestContent' rows="10" required>${contest.CONTESTCONTENT}</textarea>
		        <script>
			        $('#contestContent').on('keyup', function() 
	        		{
			            if($(this).val().length > 1333) {
			               alert("글자수는 1333자로 이내로 제한됩니다.");
			               $(this).val($(this).val().substring(0, 1333));
			            }			         
			         });		        
		        </script>
		        <br>
		        
		        <div id="null">
	         		<span class='nullimg'>메인에 노출될 사진을 선택해주세요</span>
	         	</div>
		       	<div id='modifyFilePreview' class="filebox bs3-primary preview-image">
		       		<c:forEach items="${contestImgList}" var="contestImgList" varStatus='status'>
		       			<div class="upload-display"><input type="radio" name="mainImgReInsert" value='${contestImgList.CONTESTIMGRE}' required><div class="upload-thumb-wrap"><img src="${path}/resources/upload/contest/${contestImgList.CONTESTIMGRE}" class="upload-thumb"></div></div>	
		       		</c:forEach>
		            <label for="upFile">사진 선택</label> 
		            
		            <input type="file" name="upFile" id="upFile" class="upload-hidden" multiple="multiple" accept=".gif, .jpg, .png" > 
		        </div>
            	
	            <script>
		            var sel_files=[];
		            var count = 0;
		            $(document).ready(function()
            		{
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
				</script>
	        	<br>
	        	
	        	<div id="btn-container">
	           		<button type='button' class="btn btn-outline-info slidetopleft" onclick='fn_back()'>취소</button>
	           		<script>
		           		function fn_back()
		           		{
		           			history.back();
		           		}
	           		</script>
	           		<input type='submit' class="btn btn-outline-info slidetopleft" value='수정'/>
	        	</div>
        	</form>
    	</div>
    	<div class="col-md-1"></div>
	</div>
</body>
</html>