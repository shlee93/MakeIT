<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

	<div class='row'>
	    <div class='col-md-1' id='nav'>
	     	<div style='position:fixed; margin-top: 10em;'>
	    			<span onclick='fn_back()' style='cursor:pointer; font-size: 6em;'><i class="fas fa-arrow-circle-left"></i></span>    				           
	          	 	<script>
	           			function fn_back()
		           		{
		           			history.back();
		           		}
		           	</script>
	           	</div>
	     </div>
	    <div class='col-md-10' id='section' >
				<table id="example" class="table table-striped table-bordered" style="text-align:center;">
	                    <thead>
	                        <tr>
	                         	<th>구매자ID</th>
	                            <th>선택한 옵션</th>
	                            <th>옵션내용</th>
	                            <th>기한</th>
	                            <th>작업진행상황</th>      
	                            <th>상태변경</th>                      
	                        </tr>
	                    </thead>
	                     <tbody>
	                      <c:forEach items="${buyerList}" var="buyerList" varStatus="status">
	                        <tr> 
	                            <td>${buyerList.MEMBERID}</td>
	                            <td>${buyerList.SELLOPTIONNO}</td>
	                            <td>${buyerList.SELLOPTIONCONTENT}</td>
	                            <td>${buyerList.SELLDEADLINE}</td>
	                            <td>${buyerList.STATUSNAME}</td>
	                            <td>
	                            	<button type="button" onclick="fn_statusChange(${buyerList.SELLOPTIONCODE},${buyerList.SELLNO})">작업완료</button>
	                            	
	                            </td>
	                        </tr>
	                      </c:forEach>
	                      
	                    </tbody>
	                </table>
                <form id="statuschange">
                	<input type="hidden" id="statusInput">
                </form>  
                <script>                
                function fn_statusChange(no, sellno){
                	console.log(no);
                	console.log(sellno);
                	location.href="${path}/sell/sellSpecUpdate.do?no="+no+"&&sellno="+sellno; 
                } 
                </script>  
	    </div>
        <div class='col-md-1'></div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>