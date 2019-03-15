<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지창</title>
</head>
<body>
	<script>
		alert('${msg }');
		if("${script} != null")
		{
			${script}
		}
		location.href="${pageContext.request.contextPath }${loc }";
		
	</script>
</body>
</html>