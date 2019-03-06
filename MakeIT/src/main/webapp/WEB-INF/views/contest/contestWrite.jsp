<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<body>
 <div class="row">
 	<div class="col-sm-1"></div>
    <div id="buy-container" class="col-sm-10">    
		<label>제목</label> 

		<select class="form-control col-sm-1" id='interest' style="display: inline;"/>
        	<option>카테고리</option>
        	<option value='1'>개발자</option>
        	<option value='2'>웹디자이너</option>
        	<option value='3'>네트워크보안</option>         
        </select>
         
        <select class="form-control col-sm-1" id='detailInterest' style="display: inline;"/>
        	       
        </select> 
        
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
       
		<input type="text" class="form-control col-sm-6" style="display: inline;" placeholder="제목을 입력하세요." /> 
        
        <!-- 콘테스트 이름 -->      
        
        <br/>
       	 
   	    <label>주최</label>
     	<input type="text" class="form-control col-sm-2" style="display: inline;" placeholder="주최측" disabled/>&nbsp;&nbsp;
      	<input type="text" class="form-control col-sm-2" style="display: inline;" placeholder="주최자 아이디"  value='${memberId}'disabled/> 
       	
       	<br/>
       	
       	<label>상금</label>
     	<input type="text" class="form-control col-sm-2" style="display: inline;" placeholder="상금 총액" />
       	
       	<br/>
       	  
        <label>기한</label> 
        <input type="date" class="form-control col-sm-2" style="display: inline">~
        <input type="date" class="form-control col-sm-2" style="display: inline">
        
        <br/> 
         
        <label>상세 설명</label>
        <textarea class="form-control" rows="10"></textarea>
        <br>
        <div class="filebox">
           <label for="ex_file">이미지 업로드</label> <input type="file" id="ex_file">
        </div>
        <br>
        <div id="btn-container">
           <button class="btn btn-secondary">취소</button>
           <button class="btn btn-secondary">작성</button>
        </div>
    </div>
    <div class="col-sm-1"></div>
</div>   

</body>
</html>