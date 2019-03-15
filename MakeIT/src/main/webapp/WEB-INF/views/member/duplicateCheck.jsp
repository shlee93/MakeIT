<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

       
<!-- 공용 CSS JS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- 아이콘 CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	    	    
</head>
<style>
	body
	{
		/* background-color:#E0ede9; */
	}
	#checkId-container 
	{
		margin-top:3em;
		text-align:center;
	}
	
</style>

<body>
	<div id="checkId-container">
		<c:if test="${isAble==true }">
			<p style="color:green;"><span style="color:#516055">[${memberId }]</span>는 사용가능합니다.</p>
			<br><br>
			<button class="btn btn-outline-info slidetopleft" type="button" onclick="setUserId('${memberId }');">닫기</button>
		</c:if>
		<c:if test="${isAble==false }">
			<p style="color:red;"><span style="color:#516055">[${memberId }]</span>는 사용할 수 없습니다.</p>
			<br><br>
			<button class="btn btn-outline-info slidetopleft" type="button" onclick="setUserId(1);">닫기</button>
		</c:if>
	</div>
	<script>
		
		function setUserId(checkedId)
		{
			var frm=opener.document.signupform;
			
			if(checkedId==1)
			{
				frm.memberId.value='';
				frm.idValid.value='0';
				frm.memberId.focus();
			}
			else
			{
				frm.memberId.value=checkedId;
				frm.idValid.value='1';
				frm.password.focus();				
			}
			
			self.close();	
		}
		
		
	</script>

</body>
</html>