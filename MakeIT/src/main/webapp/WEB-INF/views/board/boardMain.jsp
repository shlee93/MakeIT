<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardMain.css" />


<section id="tabs" class="project-tab">
		<div class="container">
    		<div class="row">
            	<div class="col-md-12">
                	<nav>
                        <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-member-tab" data-toggle="tab" href="#nav-member"
                                role="tab" aria-controls="nav-member" aria-selected="true">자유 게시판</a>
         
                            <input type="hidden" id="view-status" value="member"/>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                    <!-- 회원관리 탭 -->
                        <div class="tab-pane fade show active" id="nav-member" role="tabpanel" aria-labelledby="nav-member-tab">
                            <!--회원 검색 div  -->
                            <div class="member-search">
                                <div id="search-icon"><img src="${path }/resources/images/search.png"/></div>
                                <input id="search-id" type="text" placeholder="검색할 회원의 아이디를 입력해주세요" size="50"/>
                                <select id="member-sort">
                                    <option class="member-sort-option" value="nosort">정렬</option>
                                    <option class="member-sort-option" value="memberid">아이디</option>
   
                                </select>
                                <input type="hidden" id="memberIdSort" value="0"/>
                                <input type="hidden" id="memberNameSort" value="0"/>
                                <input type="hidden" id="addressSort" value="0"/>
                                <input type="hidden" id="entDateSort" value="0"/>
                                <input type="hidden" id="birthSort" value="0"/>
                                <input type="hidden" id="gradeNoSort" value="0"/>
                                <button id="member-sort-reverse" style="display:none">▼</button>
                            </div>
                            <div id="writeBoardBtn">
                            	<p>글쓰기</p>
                            </div>
                            <hr>
                            <div id="boardDetailView">
								<div id="boardDetailNav">
										<p id="boardTitle"></p>
										<p id="boardViews"></p>
										<p id="boardDate"></p>
										<p id="boardNo"></p>
										<div id="boardModifyBtn"><p id="boardModifyText">수정</p></div>
									</div>
									
									<div id="boardDetailBox">
										<div id="boardDetailContent"><p></p></div>
									</div>
									
									<div id="boardDetailCommentBox">
										<div id="boardDetailComment">
											<p id="commentSum"></p>
	
										</div>
										<div id="boardDetailWriteBox">
											<div id="boardDetailWrite"><input id="boardDetailWrite" type="text"></div>
											<div id="boardDetailwriteButton"></div>
										</div>
									</div>
                            </div>
                            <table class="table member-view" cellspacing="0">
                                <!-- 회원 정보 출력 테이블 -->
                                <c:choose>
                                	<c:when test="${not empty memberList }">
                                		<thead>
		                                    <tr>
		                                        <th>글번호</th>
		                                        <th>제목</th>
		                                        <th>아이디</th>
		                                        <th>날짜</th>
		                                        <th>조회수</th>

		                                    </tr>
		                                </thead>
		                                <tbody>
                                		<c:forEach items="${memberList }" var="member">
	                                				<tr class="boardView" style="cursor:pointer">
				                                        <td class="boardFreeNo">${member.get("FREENO")}</td>
				                                        <td>${member.get("FREETITLE")}</td>
				                                        <td class="boardViewId">${member.get("MEMBERID")}</td>
				                                        <td>${member.get("FREEDATE")}</td>
				                                        <td>${member.get("FREEVIEWS")}</td>
				                                    </tr>
                                		</c:forEach>
                                			<tr>
                                				<td colspan="7">${memberPageBar }</td>
                                			</tr>
                                		</tbody>
                                	</c:when>
                                	<c:otherwise>

											<tr>
												<th>회원정보가 없습니다.</th>
											</tr>

										</tbody>
									</c:otherwise>
                                </c:choose>
	                    	</table>
                        </div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	//마이페이지에서 넘어올때 값
	var infoFreeNo = "${infoFreeNo}";
	console.log(infoFreeNo);
	if(infoFreeNo != ""){
	$(function(){

		$.ajax({
 			url:"${path}/board/freeboardView.do",
   			dataType:"json",  
  			data: {"freeNo":infoFreeNo},
 			success: function(data){
 				console.log(data);
 				
 				//자유게시판 보드 생성
 				$('#boardTitle').html(data["boardList"][0]["FREETITLE"]);
 				$('#boardViews').html("조회수 "+data["boardList"][0]["FREEVIEWS"]);
 				$('#boardDate').html("| "+data["boardList"][0]["FREEDATE"]);
 				$('#boardNo').html(data["boardList"][0]["FREENO"]);
 				$('#boardDetailContent').html(data["boardList"][0]["FREECONTENT"]);
 				
 				if(data["memberId"] == data["boardList"][0]["MEMBERID"]){
 					$('#boardModifyBtn').css('display','block');
 				}else{
 					$('#boardModifyBtn').css('display','none');
 				}
 				
 				//이미지 생성
 				var boardImgSize = data["boardImgList"].length;
 				if(boardImgSize != 0){
 					for(var i=0; i<boardImgSize; i++){
 						var imgSrc = "${path }/resources/upload/board/"+data["boardImgList"][i]["FREEIMGRE"];
 						console.log(imgSrc);
 						$('#boardDetailBox').append("<div class='boardDetailImg'><img class='boardDetailImg2' src="+imgSrc+"/></div>");
 					}
 				}
 				$('#boardDetailBox').append("<div id='boardLogo'><img src='${path}/resources/image/logo2.png'/></div>");
 				
 				var commentSum = data["boardCommentList"].length;
 				$('#commentSum').html("댓글 수 "+commentSum);
 				
 				if(commentSum != 0){

					for(var i=0; i<commentSum; i++){
						if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){

							$('#boardDetailComment').append("<div class='commentDiv'></div>");
		 					$('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
		 					$('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
		 					$('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
		 					
		 					//댓글달기
		 					$('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
							
		 					//댓글삭제
		 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
		 						$('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
		 					} 
		 			
						}
						else{

							$('#boardDetailComment').append("<div class='recommentDiv'></div>");
							$('.recommentDiv:last-child()').append("<div class='recommentImg'><img src='${path}/resources/images/recomment.png'/></div>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
		 					
		 					//댓글삭제
		 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
		 						$('.recommentDiv:last-child()').append("<p class='recommentDelete'>| 삭제</p>");
		 					} 
						}
	 				
					}

 				}
 				
 			},
 			error: function(){
 				console.log("ㅠㅠ 통패에에에에ㅔㅔㅔ ㅠㅠ");
 			}
		}); 
		
		setTimeout(function(){
			
			//자유게시판 디테일  크기 구하기 1/4
			$('#boardDetailNav').css('height','70px');
			var navHeight = $('#boardDetailNav').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 2/4
			$('#boardDetailBox').css('height','max-content');
			var boxHeight = $('#boardDetailBox').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 3/4
			$('#boardDetailCommentBox').css('height','max-content');
			var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 4/4
			var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
			
			//자유게시판 디테일  최종크기
			var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

			$('#boardDetailView').css('height',sumHeight);
			setTimeout(function(){
				$('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
				$('#boardDetailNav').css('opacity','1');
				$('#boardDetailBox').css('opacity','1');
				$('#boardDetailCommentBox').css('opacity','1');
			}, 300);
		}, 300);	
		
	});
		
	
	}
	
	
	//게시판 디테일 보기 클릭 이벤트
	$(document).on('click','.boardView',function(){
		$(window).scrollTop("500");
		$('.boardDetailImg2').remove();
		$('.boardDetailImg').remove();
		$('#boardLogo').remove();
		$('.commentDiv').remove();
		$('.recommentDiv').remove();
		
		var freeNo = $(this).children('.boardFreeNo').text();

  		$.ajax({
 			url:"${path}/board/freeboardView.do",
   			dataType:"json",  
  			data: {"freeNo":freeNo},
 			success: function(data){
 				console.log(data);
 				
 				//자유게시판 보드 생성
 				$('#boardTitle').html(data["boardList"][0]["FREETITLE"]);
 				$('#boardViews').html("조회수 "+data["boardList"][0]["FREEVIEWS"]);
 				$('#boardDate').html("| "+data["boardList"][0]["FREEDATE"]);
 				$('#boardNo').html(data["boardList"][0]["FREENO"]);
 				$('#boardDetailContent').html(data["boardList"][0]["FREECONTENT"]);
 				
 				if(data["memberId"] == data["boardList"][0]["MEMBERID"]){
 					$('#boardModifyBtn').css('display','block');
 				}else{
 					$('#boardModifyBtn').css('display','none');
 				}
 				
 				//이미지 생성
 				var boardImgSize = data["boardImgList"].length;
 				if(boardImgSize != 0){
 					for(var i=0; i<boardImgSize; i++){
 						var imgSrc = "${path }/resources/upload/board/"+data["boardImgList"][i]["FREEIMGRE"];
 						console.log(imgSrc);
 						$('#boardDetailBox').append("<div class='boardDetailImg'><img class='boardDetailImg2' src="+imgSrc+"/></div>");
 					}
 				}
 				$('#boardDetailBox').append("<div id='boardLogo'><img src='${path}/resources/image/logo2.png'/></div>");
 				
 				var commentSum = data["boardCommentList"].length;
 				$('#commentSum').html("댓글 수 "+commentSum);
 				
 				if(commentSum != 0){

					for(var i=0; i<commentSum; i++){
						if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){

							$('#boardDetailComment').append("<div class='commentDiv'></div>");
		 					$('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
		 					$('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
		 					$('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
		 					
		 					//댓글달기
		 					$('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
							
		 					//댓글삭제
		 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
		 						$('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
		 					} 
		 			
						}
						else{

							$('#boardDetailComment').append("<div class='recommentDiv'></div>");
							$('.recommentDiv:last-child()').append("<div class='recommentImg'><img src='${path}/resources/images/recomment.png'/></div>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
		 					$('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
		 					
		 					//댓글삭제
		 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
		 						$('.recommentDiv:last-child()').append("<p class='recommentDelete'>| 삭제</p>");
		 					} 
						}
	 				
					}

 				}
 				
 			},
 			error: function(){
 				console.log("ㅠㅠ 통패에에에에ㅔㅔㅔ ㅠㅠ");
 			}
		}); 
  		//댓글달기 버튼 클릭 이벤트
  		$(document).on('click','.recommentButton',function(){
  			$('.recommentInputBox').remove();
  			
  			$(this).parent().append('<div class="recommentInputBox"></div>');
  			$('.recommentInputBox:last-child()').append('<input type="text" class="recommentInput"/>');
  			$('.recommentInputBox:last-child()').append('<div class="recommentSubmit"></div>');
  			$('.recommentInputBox:last-child()').append('<div class="recommentClose"></div>');
  		});
  		//댓글달기 닫기 버튼 이벤트
  		$(document).on('click','.recommentClose',function(){
  			$('.recommentInputBox').remove();
  		});
  		
  		//댓글달기 입력 이벤트
  		$(document).on('click','.recommentSubmit',function(){
  			
			var inputText = $(this).parent().children('.recommentInput').val();
			var commentNo = $(this).parent().parent().children(".commentNo").text();
			
			$(this).parent().children('.recommentInput').val("");
  			if(inputText == ""){
  				console.log("텍스트를 입력하세요~");
  			}
  			else{
  				
	  			var freeNo = $('#boardNo').text();
	  			/* $('#boardDetailWrite input').html(""); */

	  			$.ajax({
	  				url:"${path}/board/insertreComment.do",
	  				data:{"inputText":inputText,"freeNo":freeNo,"commentNo":commentNo},
	  				dataType:"json",
	  				success: function(data){
	  					console.log(data);
	  					
	  					$('.commentDiv').remove();
	  					$('.recommentDiv').remove();
	  					
	  	 				var commentSum = data["boardCommentList"].length;
	  	 				$('#commentSum').html("댓글 수 "+commentSum);
	  	 				if(commentSum != 0){
	
	  						for(var i=0; i<commentSum; i++){
	  							if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){
	
	  								$('#boardDetailComment').append("<div class='commentDiv'></div>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
	  			 					//댓글달기
	  			 					$('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
	  								
	  			 					//댓글삭제
	  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
	  			 						$('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
	  			 					} 
	  			 			
	  							}
	  							else{
	
	  								$('#boardDetailComment').append("<div class='recommentDiv'></div>");
	  								$('.recommentDiv:last-child()').append("<div class='recommentImg'></div>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
	  			 					//댓글삭제
	  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
	  			 						$('.recommentDiv:last-child()').append("<p class='recommentDelete'>| 삭제</p>");
	  			 					} 
	  							}
	  		 				
	  						}
	
	  	 				}
	  	 				setTimeout(function(){
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 1/4
	  	 					$('#boardDetailNav').css('height','70px');
	  	 					var navHeight = $('#boardDetailNav').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 2/4
	  	 					$('#boardDetailBox').css('height','max-content');
	  	 					var boxHeight = $('#boardDetailBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 3/4
	  	 					$('#boardDetailCommentBox').css('height','max-content');
	  	 					var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 4/4
	  	 					var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  최종크기
	  	 					var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

	  	 					$('#boardDetailView').css('height',sumHeight);
	  	 					setTimeout(function(){
	  	 						$('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
	  	 						$('#boardDetailNav').css('opacity','1');
	  	 						$('#boardDetailBox').css('opacity','1');
	  	 						$('#boardDetailCommentBox').css('opacity','1');
	  	 					}, 300);
	  	 				}, 300);
	  					
	  				},
	  				error: function(){
	  					console.log("실패~~");
	  				}
	  			});
  			}
  		});
 	
  		
  		//댓글 쓰기 엔터 이벤트
  		$(document).on('keyup','#boardDetailWrite input', function(e){
  			
  			if(e.keyCode == 13){

  				
  				var inputText = $('#boardDetailWrite input').val();
  	  			$('#boardDetailWrite input').val("");
  	  			if(inputText == ""){
  	  				console.log("텍스트를 입력하세요~");
  	  			}
  	  			else{
  	  				
  		  			var freeNo = $('#boardNo').text();
  		  			/* $('#boardDetailWrite input').html(""); */

  		  			$.ajax({
  		  				url:"${path}/board/insertComment.do",
  		  				data:{"inputText":inputText,"freeNo":freeNo},
  		  				dataType:"json",
  		  				success: function(data){
  		  					console.log(data);
  		  					
  		  					$('.commentDiv').remove();
  		  					$('.recommentDiv').remove();
  		  					
  		  	 				var commentSum = data["boardCommentList"].length;
  		  	 				$('#commentSum').html("댓글 수 "+commentSum);
  		  	 				if(commentSum != 0){
  		
  		  						for(var i=0; i<commentSum; i++){
  		  							if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){
  		
  		  								$('#boardDetailComment').append("<div class='commentDiv'></div>");
  		  			 					$('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
  		  			 					$('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
  		  			 					$('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
  		  			 					//댓글달기
  		  			 					$('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
  		  								
  		  			 					//댓글삭제
  		  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
  		  			 						$('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
  		  			 					} 
  		  			 			
  		  							}
  		  							else{
  		
  		  								$('#boardDetailComment').append("<div class='recommentDiv'></div>");
  		  								$('.recommentDiv:last-child()').append("<div class='recommentImg'></div>");
  		  			 					$('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
  		  			 					$('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
  		  			 					$('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
  		  			 					//댓글삭제
  		  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
  		  			 						$('.recommentDiv:last-child()').append("<p class='recommentDelete'>| 삭제</p>");
  		  			 					} 
  		  							}
  		  		 				
  		  						}
  		
  		  	 				}
  		  	 			setTimeout(function(){
  		  				
  		  				//자유게시판 디테일  크기 구하기 1/4
  		  				$('#boardDetailNav').css('height','70px');
  		  				var navHeight = $('#boardDetailNav').css('height').replace("px","");
  		  				
  		  				//자유게시판 디테일  크기 구하기 2/4
  		  				$('#boardDetailBox').css('height','max-content');
  		  				var boxHeight = $('#boardDetailBox').css('height').replace("px","");
  		  				
  		  				//자유게시판 디테일  크기 구하기 3/4
  		  				$('#boardDetailCommentBox').css('height','max-content');
  		  				var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
  		  				
  		  				//자유게시판 디테일  크기 구하기 4/4
  		  				var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
  		  				
  		  				//자유게시판 디테일  최종크기
  		  				var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

  		  				$('#boardDetailView').css('height',sumHeight);
  		  				setTimeout(function(){
  		  					$('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
  		  					$('#boardDetailNav').css('opacity','1');
  		  					$('#boardDetailBox').css('opacity','1');
  		  					$('#boardDetailCommentBox').css('opacity','1');
  		  				}, 300);
  		  			}, 300);	
  		  					
  		  				},
  		  				error: function(){
  		  					console.log("실패~~");
  		  				}
  		  			});
  	  			}
  	  			
  				
  				
  			}
  		})
  		
  		
  		//댓글 쓰기 버틀 클릭 이벤트
  		$(document).on('click','#boardDetailwriteButton',function(){
  			
  			var inputText = $('#boardDetailWrite input').val();
  			$('#boardDetailWrite input').val("");
  			if(inputText == ""){
  				console.log("텍스트를 입력하세요~");
  			}
  			else{
  				
	  			var freeNo = $('#boardNo').text();
	  			/* $('#boardDetailWrite input').html(""); */

	  			$.ajax({
	  				url:"${path}/board/insertComment.do",
	  				data:{"inputText":inputText,"freeNo":freeNo},
	  				dataType:"json",
	  				success: function(data){
	  					console.log(data);
	  					
	  					$('.commentDiv').remove();
	  					$('.recommentDiv').remove();
	  					
	  	 				var commentSum = data["boardCommentList"].length;
	  	 				$('#commentSum').html("댓글 수 "+commentSum);
	  	 				if(commentSum != 0){
	
	  						for(var i=0; i<commentSum; i++){
	  							if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){
	
	  								$('#boardDetailComment').append("<div class='commentDiv'></div>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
	  			 					$('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
	  			 					//댓글달기
	  			 					$('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
	  								
	  			 					//댓글삭제
	  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
	  			 						$('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
	  			 					} 
	  			 			
	  							}
	  							else{
	
	  								$('#boardDetailComment').append("<div class='recommentDiv'></div>");
	  								$('.recommentDiv:last-child()').append("<div class='recommentImg'></div>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
	  			 					$('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
	  			 					//댓글삭제
	  			 					if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
	  			 						$('.recommentDiv:last-child()').append("<p class='recommentDelete'>| 삭제</p>");
	  			 					} 
	  							}
	  		 				
	  						}
	
	  	 				}
	  	 				setTimeout(function(){
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 1/4
	  	 					$('#boardDetailNav').css('height','70px');
	  	 					var navHeight = $('#boardDetailNav').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 2/4
	  	 					$('#boardDetailBox').css('height','max-content');
	  	 					var boxHeight = $('#boardDetailBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 3/4
	  	 					$('#boardDetailCommentBox').css('height','max-content');
	  	 					var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  크기 구하기 4/4
	  	 					var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
	  	 					
	  	 					//자유게시판 디테일  최종크기
	  	 					var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

	  	 					$('#boardDetailView').css('height',sumHeight);
	  	 					setTimeout(function(){
	  	 						$('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
	  	 						$('#boardDetailNav').css('opacity','1');
	  	 						$('#boardDetailBox').css('opacity','1');
	  	 						$('#boardDetailCommentBox').css('opacity','1');
	  	 					}, 300);
	  	 				}, 300);	
	  					
	  				},
	  				error: function(){
	  					console.log("실패~~");
	  				}
	  			});
  			}
  			
  		});
  		
  		
  		//댓글 삭제 이벤트
  		$(document).on('click','.commentDelete',function(){
  			
  			if(confirm("댓글을 삭제하시겠습니까?"))
            {
               var commentNo = $(this).parent().children('.commentNo').text();
                 var freeNo = $('#boardNo').text();
                  
                  $.ajax({
                    url:"${path}/board/commentDelete.do",
                    dataType:"json",
                    data:{"commentNo":commentNo,"freeNo":freeNo},
                    success: function(data){
                       console.log(data);
                       
                       
                       $('.commentDiv').remove();
                       $('.recommentDiv').remove();
                       
                        var commentSum = data["boardCommentList"].length;
                        $('#commentSum').html("댓글 수 "+commentSum);
                        if(commentSum != 0){

                          for(var i=0; i<commentSum; i++){
                             if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){

                                $('#boardDetailComment').append("<div class='commentDiv'></div>");
                                 $('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
                                 $('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
                                 $('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
                                 //댓글달기
                                 $('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
                                
                                 //댓글삭제
                                 if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
                                    $('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
                                 } 
                           
                             }
                             else{

                                $('#boardDetailComment').append("<div class='recommentDiv'></div>");
                                $('.recommentDiv:last-child()').append("<div class='recommentImg'></div>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
                                 //댓글삭제
                                 if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
                                    $('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
                                 } 
                             }
                           
                          }
                        }
                        setTimeout(function(){
                           
                           //자유게시판 디테일  크기 구하기 1/4
                           $('#boardDetailNav').css('height','70px');
                           var navHeight = $('#boardDetailNav').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 2/4
                           $('#boardDetailBox').css('height','max-content');
                           var boxHeight = $('#boardDetailBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 3/4
                           $('#boardDetailCommentBox').css('height','max-content');
                           var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 4/4
                           var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  최종크기
                           var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

                           $('#boardDetailView').css('height',sumHeight);
                           setTimeout(function(){
                              $('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
                              $('#boardDetailNav').css('opacity','1');
                              $('#boardDetailBox').css('opacity','1');
                              $('#boardDetailCommentBox').css('opacity','1');
                           }, 300);
                        }, 300);   
                       
                       
                    },
                    error: function(){
                       console.log("실패");
                    }
                 }) 
            }
            else
            {
               return;
            } 
  		});
  		
  		
  		//댓댓글 삭제 이벤트
  		$(document).on('click','.recommentDelete',function(){
  			
  			if(confirm("댓글을 삭제하시겠습니까?"))
            {
               var commentNo = $(this).parent().children('.recommentNo').text();
                 var freeNo = $('#boardNo').text();
                  
                  $.ajax({
                    url:"${path}/board/commentDelete.do",
                    dataType:"json",
                    data:{"commentNo":commentNo,"freeNo":freeNo},
                    success: function(data){
                       console.log(data);
                       
                       
                       $('.commentDiv').remove();
                       $('.recommentDiv').remove();
                       
                        var commentSum = data["boardCommentList"].length;
                        $('#commentSum').html("댓글 수 "+commentSum);
                        if(commentSum != 0){

                          for(var i=0; i<commentSum; i++){
                             if(data["boardCommentList"][i]["FREECOMMENTLEVEL"] == "1"){

                                $('#boardDetailComment').append("<div class='commentDiv'></div>");
                                 $('.commentDiv:last-child()').append("<p class='commentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
                                 $('.commentDiv:last-child()').append("<p class='commentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
                                 $('.commentDiv:last-child()').append("<p class='commentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
                                 //댓글달기
                                 $('.commentDiv:last-child()').append("<p class='recommentButton'>댓글달기</p>");
                                
                                 //댓글삭제
                                 if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
                                    $('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
                                 } 
                           
                             }
                             else{

                                $('#boardDetailComment').append("<div class='recommentDiv'></div>");
                                $('.recommentDiv:last-child()').append("<div class='recommentImg'></div>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentNick'>"+data["boardCommentList"][i]["MEMBERID"]+"</p>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentContent'>"+data["boardCommentList"][i]["FREECOMMENTCONTENT"]+"</p>");
                                 $('.recommentDiv:last-child()').append("<p class='recommentNo' style='display:none'>"+data["boardCommentList"][i]["FREECOMMENTNO"]+"</p>");
                                 //댓글삭제
                                 if(data["memberId"] == data["boardCommentList"][i]["MEMBERID"]){
                                    $('.commentDiv:last-child()').append("<p class='commentDelete'>| 삭제</p>");
                                 } 
                             }
                           
                          }
                        }
                        setTimeout(function(){
                           
                           //자유게시판 디테일  크기 구하기 1/4
                           $('#boardDetailNav').css('height','70px');
                           var navHeight = $('#boardDetailNav').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 2/4
                           $('#boardDetailBox').css('height','max-content');
                           var boxHeight = $('#boardDetailBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 3/4
                           $('#boardDetailCommentBox').css('height','max-content');
                           var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  크기 구하기 4/4
                           var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
                           
                           //자유게시판 디테일  최종크기
                           var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

                           $('#boardDetailView').css('height',sumHeight);
                           setTimeout(function(){
                              $('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
                              $('#boardDetailNav').css('opacity','1');
                              $('#boardDetailBox').css('opacity','1');
                              $('#boardDetailCommentBox').css('opacity','1');
                           }, 300);
                        }, 300);   
                       
                       
                    },
                    error: function(){
                       console.log("실패");
                    }
                 }) 
            }
            else
            {
               return;
            }
  		});
  		
		setTimeout(function(){
			
			//자유게시판 디테일  크기 구하기 1/4
			$('#boardDetailNav').css('height','70px');
			var navHeight = $('#boardDetailNav').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 2/4
			$('#boardDetailBox').css('height','max-content');
			var boxHeight = $('#boardDetailBox').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 3/4
			$('#boardDetailCommentBox').css('height','max-content');
			var commentHeight = $('#boardDetailCommentBox').css('height').replace("px","");
			
			//자유게시판 디테일  크기 구하기 4/4
			var writeHeight = $('#boardDetailWriteBox').css('height').replace("px","");
			
			//자유게시판 디테일  최종크기
			var sumHeight = Number(navHeight) + Number(boxHeight) + Number(commentHeight) + Number(writeHeight)-50;

			$('#boardDetailView').css('height',sumHeight);
			setTimeout(function(){
				$('#boardDetailNav').css({'transition:':'ease-in-out','transition-duration':'0.7s'});
				$('#boardDetailNav').css('opacity','1');
				$('#boardDetailBox').css('opacity','1');
				$('#boardDetailCommentBox').css('opacity','1');
			}, 300);
		}, 300);		
	});
	
	//게시글 작성 이동
	$('#writeBoardBtn').click(function(){
		location.href="${path}/board/writeBoard.do";
	});
	
	//게시글 수정 이동
	$("#boardModifyBtn").click(function(){
		var freeNo = $(this).parent().children('#boardNo').text();
		location.href="${path}/board/boardModify.do?freeNo="+freeNo;
	});
	
	//회원 검색 Ajax
	$(document).on('keyup','#search-id',function(e){
			
			if(e.keyCode == 13){

				var searchId=$('#search-id').val();
				var memberSort=$('#member-sort option:selected').val();
				$.ajax({
					url:"${path }/board/boardSearch.do",
					data:{"searchId":searchId,"memberSort":memberSort},
					dataType:"html",
					success:function(data){
						$('.member-view').html(data);
					}
				});
			}
	});
	
	
	//페이징
	$(document).on('click','.member-page',function(){
		var cPage=$(this).children('.cPage').val();
		var viewStatus=$('#view-status').val();
		var memberSort=$('#member-sort option:selected').val();
		if(viewStatus=='member'){
			
			
			/* 			if(memberSort=='memberid'){
							ascDesc=$('#memberIdSort').val();
				console.log(ascDesc);
			}else if(memberSort=='membername'){
				
				ascDesc=$('#memberNameSort').val();
			}else if(memberSort=='address'){
				
				ascDesc=$('#addressSort').val();
			}else if(memberSort=='gradeno'){
				
				ascDesc=$('#gradeNoSort').val();
			}else if(memberSort=='entdate'){
				
				ascDesc=$('#entDateSort').val();
			}else if(memberSort=='birth'){
				
				ascDesc=$('#birthSort').val();
			}  */
			
			$.ajax({
				url:"${path}/board/memberSortboard.do",
				data:{
						"cPage":cPage,
						"memberSort":memberSort
					},
				dataType:"html",
				success:function(data){
					$('.member-view').html(data);
					
				}
				
			})
		}
	});
</script>
                        
	

<!-- <div id="boardDetailNav">
		<p id="boardTitle">췍췍 석 ㅊ체체체asdasdasdasdasd체체</p>
		<p id="boardViews">조회수 123432</p>
		<p id="boardLike">좋아요 865</p>
		<p id="boardDate">| 2018/01/11</p>
	</div>
	
	<div id="boardDetailBox">
		<div id="boardDetailContent"><p>!!!asdsadasdadaskdnasdas<br/>adasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssudjsauuiujsajandasdasbhdsbdas</p></div>
		<div id="boardUpButton"></div>
	</div>
	
	<div id="boardDetailCommentBox">
		<div id="boardDetailComment"></div>
		<div id="boardDetailWriteBox">
			<div id="boardDetailWrite"><input id="boardDetailWrite" type="text"></div>
			<div id="boardDetailwriteButton"></div>
		</div>
	</div> -->










<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>