<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

              <div class="container mt-40">                            
                          <h3 class="text-center">실적별</h3>
                           <div class="row mt-30">                             
                              <c:forEach items="${performanceList}" var="performanceList">
                               <div class="col-md-4 col-sm-6 col-xs-10">
                                   <div class="box3" style='margin: 20px;'>
                                       <div id="performance${performanceList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${performanceList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/imageDiv.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                

                                                               var imgContainer=$('#performance${performanceList.SELLNO}');
                                                               imgContainer.append("<img src='${path}/resources/upload/sell/"+data["sellImgRe"]+ "' style='width: 100%; height: 200px;'>");
                                                      
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>                                       	
                                       </div>
                                       <div class="box-content">
                                            <h3 class="title">${performanceList.MEMBERID}</h3>                                                                                      
                                           <p class="description">
                                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad adipisci pariatur qui.
                                           </p>
                                           <ul class="icon">
                                               <li><a href="#" class="fa fa-search"></a></li>
                                               <li><a href="#" class="fa fa-link"></a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <div class='sub-description'>
                                      <div style='float:left;'>
                                           <p>${performanceList.SELLTITLE}</p>
                                      </div>
                                      <div class='infobox' style='float:right; display: inline;'>
                                         <div id="gradeprice${performanceList.SELLNO}">
                                       		<script>
                                       	  $(function()
                                                  {
                                                     var sellNo=${performanceList.SELLNO};
                                                     $.ajax({
                                                        url:"${path}/sellprice.do",
                                                        data:{"sellNo": sellNo},
                                                        dataType:"json",
                                                           success:function(data)
                                                           {
                                                                
                                                               var sellPrice=data["sellPrice"];
                                                               var priceContainer=$('#performanceList${performanceList.SELLNO}');
                                                               priceContainer.append("<p>최저가:"+sellPrice+"</p>")                                                               
                                                           }
                                                     });                                         
                                                   });   
                                       		</script>
                                         
                                       </div>
                                        <p id="performancep">등급: ${performanceList.GRADENAME} </p>
                                      </div>                                       
                                   </div>
                               </div>
                                </c:forEach>
                           
                           </div>
                             
                       </div>
                     <div id="pageBarCon">                   
                        	${pageBar}
                        </div>
                  </div>