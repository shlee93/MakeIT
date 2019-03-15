<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   	
	<style>
		/* div
		{
			border:1px solid red;
		} */
		header
		{
	       	margin-bottom:-150px;
	       }
	       
	       	html,body{
			height: 100%;
		}   
		
	   /* div
	   {
	    border:1px solid red;  
	   } */	
	   
	
	    
	</style>
</head>

<body>
	<div class='container-fluid' id="total">
    	<div class='row'>
    		<div class='col-md-1' id='left-nav' ></div>    
        	<div class='col-md-10' id='section' style='padding:50px' >
            	<div class='row'>
            	
                	<div class="col-md-6" id="img-container" style='padding:1px; width: 100%; height: 600px;'>
                		<div class='row' id='mainImgContainer'>
                	   		<img class="mainImg" id='${contestMainImg.CONTESTIMGNO}' src="${path}/resources/upload/contest/${contestMainImg.CONTESTIMGRE}" style='max-height: 400px; min-height: 600px; width: 100%;'>
                    	</div>
                    	<div class='row'>
                    		<c:forEach items="${contestSubImgList}" var="contestSubImgList">
                   		                             
	                        	<div class="col-md-3 subImg" style='padding:1px;'>
	                            	<img class="subImgs" id='${contestSubImgList.CONTESTIMGNO}' src="${path}/resources/upload/contest/${contestSubImgList.CONTESTIMGRE}" style='width: 100%; height: 100%;'>     
	                        	</div>
                        
                        	</c:forEach> 
                        	<script>
	                     		$(document).on('click','.subImgs',function(){
	                    			var imgIndex = $(this).parent('.subImg').prevAll().length;	
	                    		
	                    			var url1 = $(this).attr('src');
	                    			var url2 = $('.mainImg').attr('src');
	                    			$('.mainImg').attr('src',url1);
	                    			$(this).attr('src',url2);	                    		
	                    		})
                        	</script>                                                                     
                    	</div>
                    
                    	<div class='row'>
                        	<nav id=tab-list>
                            	<div class="nav nav-tabs nav-fill detail" id="nav-tab" role="tablist">
                                	<a class="nav-item nav-link active detail" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상세설명</a>                                    
                                	<a class="nav-item nav-link detail" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">기업소개</a>                                    
                            	</div>
                        	</nav>
                        	<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                            	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            		<textarea rows="34" style='width:36.5em;'>
                            			${contestObj.CONTESTCONTENT }
                            		</textarea>                                
                            	</div>
                            
                            	<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                	${contestObj.INTRODUCTION }
                            	</div>                                
                        	</div>
                    	</div>                   
                	</div>
                
                	<div class="col-md-6 fixed" style='position:fixed; margin-top: -5em; margin-right: 50em;'>                   
                    	<div class="row " style="text-align:center; margin-left:-5em;" >
                        	<div class="col-md-10">
                        	
 			                   	<!-- 똥글뱅이 -->
                        		<div class="row align-items-center">			                  
			                  		<div class="holderCircle">
			                        	<div class="round"></div>
			                        	<div class="dotCircle">
			                           		<span class="itemDot active itemDot1" data-tab="1">
	       			                       		<i class="far fa-heart donggeulI"></i>
				                           		<span class="forActive"></span>
			                           		</span>
				                           <span class="itemDot itemDot2" data-tab="2">
					                           <i class="fa fa-comments donggeulI"></i>
					                           <span class="forActive"></span>
				                           </span>
				                           <span class="itemDot itemDot3" data-tab="3">
					                           <i class="fa fa-user donggeulI"></i>
					                           <span class="forActive"></span>
				                           </span>
				                           <span class="itemDot itemDot4" data-tab="4">
					                           <i class="fa fa-tags donggeulI"></i>
					                           <span class="forActive"></span>
				                           </span>
					                       <span class="itemDot itemDot5" data-tab="5">
					                           <i class="fa fa-upload donggeulI"></i>
				                           	   <span class="forActive"></span>
				                           </span>
				                           <span class="itemDot itemDot6" data-tab="6">
					                           <i class="fa fa-briefcase donggeulI"></i>
				                           	   <span class="forActive"></span>
				                           </span>
				                        </div>
			                        	<div class="contentCircle">
				                           <div class="CirItem title-box active CirItem1">
			                           		   <!-- 작성자 이미지 컨테이너 -->			                        	
				                        	   <div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
											   <div class="image_outer_container">
											   	   <div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
												   </div>
											   </div>
											</div>
											<br/>
											<button class='btn btn-primary'>찜하기</button>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-clock-o"></i> -->
			                            </div>
			                           
			                           	<div class="CirItem title-box active CirItem2">
			                              	<!-- 작성자 이미지 컨테이너 -->			                        	
			                        	  	<div class="d-flex justify-content-center h-100" style='margin-bottom:-8em;'>
											 	<div class="image_outer_container">
												 	<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
													</div>
											 	</div>
										  	</div>
											
										  	</br>
											
											<c:set var='currentId' value='${memberMap.get("MEMBERID")}'/>								
				                          	<c:choose>
										    	<c:when test="${currentId eq contestObj.MEMBERID}">
										    		<form id='contestDetailFrm'>
										    			<input id='contestDelNo' name='contestDelNo' type='hidden' value='${contestObj.CONTESTNO}'/>
										    		</form>
											    	<input type='button' class='btn btn-primary' onclick='fn_contestDelSubmit()' value='삭제하기'/>
											    	
											    	<!-- 컨테스트 삭제 스크립트 -->
											    	
											    	<script>
											    		function fn_contestDelSubmit()
											    		{
											    			$('#contestDetailFrm').attr('action','${path}/contest/contestDel.do');
											    			$('#contestDetailFrm').submit();
											    		}
											    	</script> 
											    	  
										      	</c:when>
										      	<c:otherwise>
										      		<button class="btn btn-primary">쪽지보내기</button>
										      	</c:otherwise>
										 	</c:choose>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-clock-o"></i> -->
		                           		</div>
			                           
			                           	<div class="CirItem title-box CirItem3">
		                              		
		                              		<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -5em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
													</div>
												</div>
											</div>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-user"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem4">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -5em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
													</div>
												</div>
											</div>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-tags"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem5">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -5em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
													</div>
												</div>
											</div>
			                              	<!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
			                              	<!-- <i class="fa fa-upload"></i> -->
			                           	</div>
			                           	<div class="CirItem title-box CirItem6">
			                              	<!-- 작성자 이미지 컨테이너 -->
			                        	
				                        	<div class="d-flex justify-content-center h-100" style='margin-bottom: -8em;'>
												<div class="image_outer_container">
													<div class="image_inner_container">
														<img src="${path}/resources/upload/member/${contestObj.REIMG}">
													</div>
												</div>
											</div>
											
											</br>
											<c:choose>
										    	<c:when test="${currentId eq contestObj.MEMBERID}">
											    	<button type="button" class='btn btn-primary' onclick='fn_contestModify()'>수정하기</button>
											    	<script>
											    		function fn_contestModify()
											    		{
											    			$('#contestDetailFrm').attr('action','${path}/contest/contestModify.do');
											    			$('#contestDetailFrm').submit();
											    		}
											    	</script>									    							    	   
										      	</c:when>
									      		<c:otherwise>
									      			<input type='button' class="btn btn-primary" onclick='fn_applicantAccess_modal()' value='지원하기'>									      			
									      		</c:otherwise>
									 		</c:choose>
			                              <!-- <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->			                              
		                           		</div>
		                        	</div>
		                     	</div>			                  
			               </div>			               
               			   <!-- 동글뱅이 끝-->	
			               
			               <!-- 동글뱅이 스크립트 -->
			               <script>			               
						        let i=2;						
							
								$(document).ready(function()
								{
									var radius = 200;
									var fields = $('.itemDot');
									var container = $('.dotCircle');
									var width = container.width();
							 		radius = width/2.5;
							 
								    var height = container.height();
									var angle = 0, step = (2*Math.PI) / fields.length;
									
									fields.each(function() 
									{
										var x = Math.round(width/2 + radius * Math.cos(angle) - $(this).width()/2);
										var y = Math.round(height/2 + radius * Math.sin(angle) - $(this).height()/2);									
									
										$(this).css(
										{
											left: x + 'px',
											top: y + 'px'
										});
										angle += step;
									});
								
								
									$('.itemDot').click(function()
									{									
										var dataTab= $(this).data("tab");
										$('.itemDot').removeClass('active');
										$(this).addClass('active');
										$('.CirItem').removeClass('active');
										$( '.CirItem'+ dataTab).addClass('active');
										i=dataTab;
									
										$('.dotCircle').css(
										{
											"transform":"rotate("+(360-(i-1)*36)+"deg)",
											"transition":"2s"
										});
										
										$('.itemDot').css(
										{
											"transform":"rotate("+((i-1)*36)+"deg)",
											"transition":"1s"
										});									
									});								
								});						         
							</script>                        	
                        	<!-- 동글뱅이 스크립트 끝 -->                             	
	                        
                          	<div class='row' style='margin-top: -4em;'>
                       			<div class='col-md-2'></div>
	                        	
	                        	<!-- 작성자 소개 -->  	
                          		<div class='col-md-8'>
                          			<p>${contestObj.INTRODUCTION}</p>
                          		</div>
                          		<!-- 작성자 소개 끝 -->
                          		
                       			<div class='col-md-2'></div>                          		
                       		</div>                          	
                    	</div>                    	
                	</div>                      
  				</div>        
       		</div>
   		</div>   		    
    	<div class='col-md-1' id='right-nav' ></div>
    	<script>
		    function fn_applicantAccess_modal()
			{  
		    	var currentId='${memberMap.get("MEMBERID")}';
		    	var contestNo=${contestObj.CONTESTNO };
				$.ajax(
				{
					url:"${path}/contest/contestApplicantCheck.do",
		            data:{"currentId":currentId,"contestNo":contestNo},
					dataType:"json",
		            success:function(data)
		            {
		            	if(data['modal']=='modalOpen')
	            		{
		            		 $('#applicantAccessModal').modal();
	            		}
		            	else
	            		{
		            		alert("이미 지원한 게시글입니다.")
	            		}
		            }
				 });			 
			}
		    
	    	function fn_applicantList_modal(contestNo)
	    	{    		
	           	var applicantList=$('#selectApplicant');
	           	var option;
	    		$.ajax(
				{
	   				url:"${path}/contest/contestApplicantList.do",
	   	            data:{"contestNo":contestNo},
	   				dataType:"json",
	   	            success:function(data)
	   	            {
	          			option+="<option>지원자 선택</option>"
	   	            	for(var i=0; i<data.length; i++)
	            		{
	   	            		if(data[i]['APPLICANTYN']=='N')
	            			{
	   	            			option+="<option style='color:red' value='"+data[i]['APPLICANTID']+"'>";
	   	            			option+="□"+data[i]['APPLICANTID']+"</option>";
	   	            			
	   	            			applicantList.html(option);
	            			}
	   	            		else if(data[i]['APPLICANTYN']=='Y')
	            			{
	   	            			option+="<option value='"+data[i]['APPLICANTID']+"'>";
	   	            			option+="▣"+data[i]['APPLICANTID']+"</option>";
	   	            			
	   	            			applicantList.html(option);
	            			}
	            		}
	   	            }
	   			});
	    		$('#applicantListModal').modal();
	    	}    	
    	
    	</script>
    
    	<div class="modal" id="applicantAccessModal" role="dialog">
    		<form  id='contestApplicantFrm' method='post' enctype="multipart/form-data">
		   		<div class="modal-dialog">
	        		<!-- Modal content-->
		      		<div class="modal-content">
		         		<div class="modal-header">
		         			<input type='hidden' name='contestNo' value='${contestObj.CONTESTNO }'>
		         			<input type='hidden' name='applicantId' value='${currentId}'>
	            			<h4 class="modal-title">콘테스트 지원하기</h4>
		            	<button type="button" class="close" data-dismiss="modal">×</button>
		         	</div>
		         	<div class="modal-body">
		            	<table class="table">
		               		<tr>
					      		<th>
				               		첨부파일	
					      		</th>  
		               		</tr>
		               	  	<th>
		               	  		<input type='file' id='upFile' name='upFile'/>
		               	  	</th> 	
		               		<tr>
		                  		<th>
		                  			지원하기(한개의 압축파일로 올려주세요)
	                  	  		</th>
			                  	<td>
			                  		<input type="button" id="applicantSubmit" onclick='fn_applicant_submit()' class="memModal" value='지원하기'>
			                  
			                  		<script>
				                  		function fn_applicant_submit()
				                  		{			                  			
				                  			$('#applicantAccessModal').modal('hide');
				                  			
				                  			if($('#upFile').val()!='')
			                  				{
				                  				$('#contestApplicantFrm').attr('action','${path}/contest/contestApplicant.do');
				                  				$('#contestApplicantFrm').submit();
			                  				}
				                  			else
			                  				{
				                  				alert("파일을 첨부해주세요.");
			                  				}
				                  		}
			                  		
				                  		function fn_applicant_close()
				                  		{
				                  			$('#applicantAccessModal').modal('hide');
				                  		}
			                  		</script>
		                  	  	</td>
		               		</tr>		
		            	</table>
		         	</div>
		         	<div class="modal-footer">
		            	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		         	</div>                   
		  		</div>
		  	</div>
	  	</form>
	</div>
    
    
    <div class="modal" id="applicantListModal" role="dialog">
	   	<div class="modal-dialog">
      		<!-- Modal content-->
		      	<div class="modal-content">
		         	<div class="modal-header">
		            	<h4 class="modal-title">지원자 정보 조회</h4>
		            	<button type="button" class="close" data-dismiss="modal">×</button>
		         	</div>
        		<form id='applicantListFrm'>
		         	<div class="modal-body">
		            	<table class="table">
		               		<tr>
						   		<select id='selectApplicant' class='form-control'>
						     
						   		</select>
						   		<script>
					   				$(function()
				      				{
							   			var contestNo=${contestObj.CONTESTNO };
					            		$("#selectApplicant").change(function()
				       					{
							   				console.log(this.value);
				            				$.ajax(
		            						{
					            				url:"${path}/contest/applicantOneSel.do",
					            	            data:{"applicantId":this.value,"contestNo":contestNo},
					            				dataType:"json",
					            	            success:function(data)
					            	            {				            	             
					            	               $('#applicantEmail').html(data['EMAIL']);
					            	               $('#applicantInterest').html(data['INTERESTNO']);				            	               
					            	               $('#applicantGrade').html(data['GRADENO']);
					            	               $('#applicantYn').html(data['APPLICANTYN']);
					            	               $('#downLoadBtn').attr('value',"다운로드("+data['APPLICANTFILEORI']+")")
					            	               $('#applicantAcceptTarget').attr('value',data['MEMBERID']);
					            	               $('#contestOriFile').attr("value",data['APPLICANTFILEORI']);
					            	               $('#contestReFile').attr("value",data['APPLICANTFILERE']);
					            	               
					            	               if(data['APPLICANTFILEORI']!=null)
				            	            	   {
					            	            	   $('#downLoadBtn').attr('disabled',false);
				            	            	   }
					            	               if(data['APPLICANTYN']=='N')
				            	            	   {
					            	               	   $('#applicantListModalSubmit').attr("disabled",false)
				            	            	   }
				            	            	}
				            				});
				       					})
				      				})
							   </script>
							   <input id='contestOriFile'type='hidden'>
							   <input id='contestReFile' type='hidden'>	
		               		</tr>
		               		<tr>
		                  		<th>첨부파일</th>
	                  			<td>
		                  	 		<input type="button" id='downLoadBtn' class="btn btn-primary btn-block" onclick="fileDownload();" disabled>
			                
				             		<script>
										function fileDownload()
										{
											oName=$('#contestOriFile').val();
											rName=$('#contestReFile').val();
											console.log($('#contestOriFile'));
											console.log(oName);
											oName=encodeURIComponent(oName);
											location.href='${path}/contest/fileDownload.do?oName='+oName+"&rName="+rName;
										}
							 		</script>
						  		</td>
		               		</tr>
		               		<tr>
			                  	<th>이메일</th>
			                  	<td><h5 id='applicantEmail'></h5>
			               	</tr>
		               		<tr>
		                  		<th>관심분야</th>
		                  		<td><h5 id='applicantInterest'></h5></td>
		               		</tr>
		               		<tr>
		                  		<th>등급</th>
		                  		<td>
			                  	  	<h5 id='applicantGrade'></h5>	
			                  	</td>
		               		</tr>
		               		<tr>
		               	  		<th>승인여부</th>
		               	  		<td>
		               	  	  		<h5 id='applicantYn'></h5>
		               	  		</td> 	
		               		</tr>		
		            	</table>
		         	</div>
		         	<div class="modal-footer">
			         	<input type='button' class='btn btn-default' data-dismiss='modal' onclick='fn_applicant_close()' value='닫기'>
			         	
			            <button type="button" id='applicantListModalSubmit' class="btn btn-default" data-dismiss="modal" onclick='fn_applicantConfirm_submit()' disabled>승인</button>
		         	</div>
		         	<input id='applicantAcceptTarget' name='applicantAcceptTarget' type='hidden'/>
		         	<input id='contestNoHidden' name='contestNoHidden' type='hidden' value='${contestObj.CONTESTNO }'/>
		         	<input name='applicantContestTitle' type='hidden' value='${contestObj.CONTESTTITLE}'>
		         	<script>
			         	function fn_applicantConfirm_submit(contestNo)
	               		{
			         		console.log(contestNo);
	               			$('#applicantListModal').modal('hide');
	               			$('#applicantListFrm').attr('action','${path}/contest/applicantConfirm.do');
	               			$('#applicantListFrm').submit();
	               		}
               		
	               		function fn_applicant_close()
	               		{
	               			$('#applicantListModal').modal('hide');
	               		}
          		 	</script>
	         	</form>                   
		  	</div>
	  	</div>
	</div>	
</body>
</html>