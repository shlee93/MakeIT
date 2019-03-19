//qna 검색
$(document).on('keyup','#search-qna',function(){
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	
	$.ajax({
		url:"qnaSearch.do",
		data:{
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#qna-table').children('tbody').html(data);
		}
	});
});

//qna 페이지 넘기기
$(document).on('click','.member-page',function(){
	
	var cPage=$(this).children('.cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	
	$.ajax({
		url:"qnaSearch.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#qna-table').children('tbody').html(data);
		}
	})
})
//질문 유형 선택시
$(document).on('change','#qna-sort',function(){
	
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	
	$.ajax({
		url:"qnaSearch.do",
		data:{
			
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#qna-table').children('tbody').html(data);
		}
	})
})

//qna 게시글 등록 화면 전환
$(document).on('click','#insert-qna-view',function(){
	
	var cPage=$('.active').children('.page-link').text();
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	
	$.ajax({
		url:"insertQnaView.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
})

//qna 게시글 상세보기
$(document).on('click','.qna-title',function(){
	
	var cPage=$('.active').children('.page-link').text();
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	var qnaNo=$(this).siblings('input').val();
	
	$.ajax({
		url:"detailQnaView.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck,
			"qnaNo":qnaNo
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
});
//qna 게시글 상세보기
$(document).on('click','.qna-title-reple',function(){
	
	var cPage=$('.active').children('.page-link').text();
	var searchQna=$('#search-qna').val();
	var filter=$('#search-filter option:selected').val();
	var sortCheck=$('#qna-sort option:selected').val();
	var qnaNo=$(this).siblings('input').val();
	
	$.ajax({
		url:"detailQnaView.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck,
			"qnaNo":qnaNo
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
});

//qna 뒤로가기 버튼
$(document).on('click','#back-list',function(){
	
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	$.ajax({
		url:"qnaBack.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
})
//텍스트 에어리어 크기조절

$(document).on('keyup','textarea', function() {
	 var textEle=$(this);
	 textEle[0].style.height = 'auto';
	 var textEleHeight = textEle.prop('scrollHeight');
	 textEle.css('height', textEleHeight);
});


//게시글 등록
$(document).on('click','#insert-qna',function(){
	
	var writer=$('#qna-writer').text();
	var pass=$('#qna-pass').val();
	var passCk=$('#qna-pass-ck').val();
	var categoryNo=$('#category option:selected').val();
	var title=$('#qna-title').val();
	var content=$('#qna-content').val();
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	if(pass==passCk){
		
		if(title==""){
			alert("제목을 입력해주세요!");
			$('#qna-title').focus();
			return false;
		}else if(content==""){
			alert("내용을 입력해주세요!");
			$('#qna-content').focus();
			return false;
		}else if(categoryNo==0){
			alert("질문 유형을 선택해주세요!");
			$('#category').focus();
			return false;
		}else{
			
			$.ajax({
				
				url:"insertQnaEnd.do",
				data:{
					"writer":writer,
					"pass":pass,
					"categoryNo":categoryNo,
					"title":title,
					"content":content,
					"cPage":cPage,
					"searchQna":searchQna,
					"filter":filter,
					"sortCheck":sortCheck
					
				},
				dataType:"html",
				success:function(data){
					alert("등록 완료! 최대한 빨리 답변 해드리겠습니다.");
					$('#nav-qna').html(data);
				}
			})
		}
	}else{
		alert('비밀번호를 다시 입력해주세요.');
		$('#qna-pass').focus();
	}
	
	
});
//수정 버튼 클릭
$(document).on('click','#update-qna',function(){
	
	var qnaNo=$('#qnaNo').val();
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	$.ajax({
		url:"updateQNa.do",
		data:{
			"qnaNo":qnaNo,
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
			
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
});
//게시글 수정
$(document).on('click','#update-qna-end',function(){
	
	var qnaNo=$('#qnaNo').val();
	var writer=$('#qna-writer').text();
	var categoryNo=$('#category option:selected').val();
	var title=$('#qna-title').val();
	var content=$('#qna-content').val();
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	if(title==""){
		alert("제목을 입력해주세요!");
		$('#qna-title').focus();
		return false;
	}else if(content==""){
		alert("내용을 입력해주세요!");
		$('#qna-content').focus();
		return false;
	}else if(categoryNo==0){
		alert("질문 유형을 선택해주세요!");
		$('#category').focus();
		return false;
	}else{
		
		$.ajax({
			
			url:"updateQnaEnd.do",
			data:{
				"qnaNo":qnaNo,
				"writer":writer,
				"categoryNo":categoryNo,
				"title":title,
				"content":content,
				"cPage":cPage,
				"searchQna":searchQna,
				"filter":filter,
				"sortCheck":sortCheck
				
			},
			dataType:"html",
			success:function(data){
				alert("수정 완료! 최대한 빨리 답변 해드리겠습니다.");
				$('#nav-qna').html(data);
			}
		})
	}
	
})
//게시글 삭제
$(document).on('click','#delete-qna',function(){
	var flag=confirm("게시글을 삭제 하시겠습니까?");
	var qnaNo=$('#qnaNo').val();
	
	if(flag){
		$.ajax({
			
			url:"deleteQnaEnd.do",
			data:{
				"qnaNo":qnaNo,
				
			},
			dataType:"html",
			success:function(data){
				alert("삭제 완료!");
				$('#nav-qna').html(data);
			}
		})
	}
	
})

//답변 게시글 등록
$(document).on('click','#insert-qna-admin',function(){
	
	var writer=$('#qna-writer').text();
	var pass=$('#qna-pass').val();
	var categoryNo=$('#category option:selected').val();
	var title=$('#qna-title').val();
	var content=$('#qna-content').val();
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	var qnaNo=$('#qnaNo').val();
	if(title==""){
		alert("제목을 입력해주세요!");
		$('#qna-title').focus();
		return false;
	}else if(content==""){
		alert("내용을 입력해주세요!");
		$('#qna-content').focus();
		return false;
	}else if(categoryNo==0){
		alert("질문 유형을 선택해주세요!");
		$('#category').focus();
		return false;
	}else{
		
		$.ajax({
			
			url:"insertQnaEndAdmin.do",
			data:{
				"writer":writer,
				"pass":pass,
				"categoryNo":categoryNo,
				"title":title,
				"content":content,
				"cPage":cPage,
				"searchQna":searchQna,
				"filter":filter,
				"sortCheck":sortCheck,
				"qnaRefNo":qnaNo
				
			},
			dataType:"html",
			success:function(data){
				alert("답변 완료!");
				$('#nav-qna').html(data);
			}
		})
	}
	
})

//답변하기 클릭
$(document).on('click','#reple-qna',function(){
	
	var qnaNo=$('#qnaNo').val();
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	$.ajax({
		url:"repleQna.do",
		data:{
			"qnaNo":qnaNo,
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
			
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
});

$(document).on('click','#nav-qna-tab',function(){
	
	var cPage=$('#cPage').val();
	var searchQna=$('#search-qna').val();
	var filter=$('#filter').val();
	var sortCheck=$('#sortCheck').val();
	
	$.ajax({
		url:"qnaBack.do",
		data:{
			"cPage":cPage,
			"searchQna":searchQna,
			"filter":filter,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$('#nav-qna').html(data);
		}
	})
})
