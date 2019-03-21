<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<%@ page import="java.util.*" %> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</head>
<body style='max-width: 300px;'>
	<div class="row">
    	<div class="col-md-12">
      		<form id='messageSendFrm' action='${path}/message/messageSend.do'>
      		<input type='hidden' name='sendId' value='${sendId}'>
			<input type='hidden' name='receiveId' value='${receiveId}' readonly >
	           
           	<table class="table">
              	<tr>
	                <th>보낸사람</th>
	                <td><c:out value='${sendId}'></c:out></td>
	                <th>받는사람</th>
	                <td><c:out value='${receiveId}'></c:out></td>
              	</tr>
                <tr>
                   	<td colspan="4">
		               	<textarea rows="10" cols="75" id="messageContent" name = "messageContent"></textarea>
		            </td>
                </tr>
                <tr>
                   	<td colspan='2'>
                      	<button type='button' class="btn btn-outline-info slidetopleft" onclick="fn_closeMessage();">취소</button>
                      	<button type='button' class="btn btn-outline-info slidetopleft" onclick="fn_messageSend();">보내기</button>
                   	</td>
                   	<td></td>
                   	<td></td>
                   	<script>
                   		function fn_messageSend()
                   		{
                   			$('#messageSendFrm').submit();
                   		}
                   		function fn_closeMessage()
                   		{
                   			self.close();
                   		}
                   	</script>
               	</tr>
           	</table>
           	</form>
        </div>
    </div>
</body>
</html>