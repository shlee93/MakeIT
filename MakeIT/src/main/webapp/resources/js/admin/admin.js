//회원 검색 Ajax
$(document).on('keyup','#search-id',function(){
	var searchId=$('#search-id').val();
	
	$.ajax({
		url:"memberSearch.do",
		data:{"searchId":searchId},
		dataType:"html",
		success:function(data){
			$('.member-view').html(data);
		}
	});
});
//회원정보 수정 팝업
$(document).on('click','.member-id',function(){
	var memberId=$(this).text();
	//console.log(memberId);
	window.open("memberDetailView.do?memberId="+memberId,"memberWin","width=500, height=500, top=200,left=1000");
	
	
});
$(document).on('click','#member-sort-reverse',function(){
	var memberSort=$('#member-sort option:selected').val();
	var ascDesc;
	var $sortBtn=$(this);
	
	if(memberSort=='memberid'){
		if($('#memberIdSort').val()==0){
			$('#memberIdSort').val(1);
		}else{
			$('#memberIdSort').val(0);
		}
		ascDesc=$('#memberIdSort').val();
	}else if(memberSort=='membername'){
		if($('#memberNameSort').val()==0){
			$('#memberNameSort').val(1);
			
		}else{
			$('#memberNameSort').val(0);
		}
		ascDesc=$('#memberNameSort').val();
	}else if(memberSort=='address'){
		if($('#addressSort').val()==0){
			$('#addressSort').val(1);
			
		}else{
			$('#addressSort').val(0);
		}
		ascDesc=$('#addressSort').val();
	}else if(memberSort=='gradeno'){
		if($('#gradeNoSort').val()==0){
			$('#gradeNoSort').val(1);
			
		}else{
			$('#gradeNoSort').val(0);
		}
		ascDesc=$('#gradeNoSort').val();
	}else if(memberSort=='entdate'){
		if($('#entDateSort').val()==0){
			$('#entDateSort').val(1);
			
		}else{
			$('#entDateSort').val(0);
		}
		ascDesc=$('#entDateSort').val();
	}else if(memberSort=='birth'){
		if($('#birthSort').val()==0){
			$('#birthSort').val(1);
			
		}else{
			$('#birthSort').val(0);
		}
		ascDesc=$('#birtsSort').val();
	}
	
	if(memberSort!="nosort"){
		$.ajax({
			
			url:"memberSortAdmin.do",
			data:{
				"memberSort":memberSort,
				"ascDesc":ascDesc
			},
			dataType:"html",
			success:function(data){
				$('.member-view').html(data);
				console.log(data);
				if(ascDesc==1){
					$sortBtn.html("▲");
				}else{
					$sortBtn.html("▼");
				}
			}
		});
		
	}else{
		return false;
	}
})

//회원 정렬 이벤트
$(document).on('change','#member-sort',function(){
	var memberSort=$('#member-sort option:selected').val();
	var ascDesc=0;
	var $sortBtn=$('#member-sort-reverse');
	if(memberSort!="nosort"){
		$.ajax({
			
			url:"memberSortAdmin.do",
			data:{
				"memberSort":memberSort,
				"ascDesc":ascDesc
			},
			dataType:"html",
			success:function(data){
				$('.member-view').html(data);
				console.log(data);
				$('#member-sort-reverse').css({
					'display':'block'
				});
				if(ascDesc==1){
					$sortBtn.html("▲");
				}else{
					$sortBtn.html("▼");
				}
				
			}
		});
		
	}else{
		$('#member-sort-reverse').css({
			'display':'none'
		});
		return false;
	}
	
	
})
//회원 정보 페이징 처리
$(document).on('click','.member-page',function(){
	var cPage=$(this).children('.cPage').val();
	console.log(cPage);
	var viewStatus=$('#view-status').val();
	var memberSort=$('#member-sort option:selected').val();
	var ascDesc=0;
	if(viewStatus=='member'){
		
		if(memberSort=='memberid'){
			
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
		}
		
		$.ajax({
			url:"memberSortAdmin.do",
			data:{
					"cPage":cPage,
					"memberSort":memberSort,
					"ascDesc":ascDesc
				},
			dataType:"html",
			success:function(data){
				$('.member-view').html(data);
				console.log(data);
				
			}
			
		})
	}
	
})

//1차 카테고리 버튼 클릭 화면전환 이벤트
$(document).on('click','.first-interest',function(){
	var interestNo=$(this).children('.interest-no').val();
	var $secondInter_tbl=$('#second-interest-tbl');
	var $click_li=$(this);
	var $interest_li=$('.first-interest');
	var $currentInterest=$('#current-interest');
	$.ajax({
		url:"adminFirstInterestView.do",
		data:{
			"interestNo":interestNo,
		},
		dataType:"html",
		success:function(data){
			console.log(data);
			$currentInterest.val(interestNo);
			$secondInter_tbl.children('tbody').html(data);
			$interest_li.removeClass('active');
			$click_li.addClass('active');
		}
		
	})
	
});

//2차카테고리 1차카테고리 변경
$(document).on('click','.update-interest',function(){
	var curr_Interest=$('#current-interest').val();
	var interestNo=$(this).parent().siblings('.interest-info').children('.change-interest').val();
	var deInterestNo=$(this).parent().siblings('.deInterest-info').children('.deInterest-no').val();
	var deInterestVal=$(this).parent().siblings('.deInterest-info').children('.deInterest-val').val();
	var $secondInter_tbl=$('#second-interest-tbl');
	var updateFlag=confirm('이 카테고리를 수정하시겠습니까?');
	console.log(interestNo);
	if(updateFlag==true){
		
		$.ajax({
			url:'updateInterestAdmin.do',
			data:{
				"currInterest":curr_Interest,
				"interestNo":interestNo,
				"deInterestNo":deInterestNo,
				"deInterestVal":deInterestVal
			},
			dataType:"html",
			success:function(data){
				alert("수정완료!");
				$secondInter_tbl.children('tbody').html(data);
			}
		})
	}else{
		return false;
	}
})

//2차 카테고리 삭제
$(document).on('click','.category-delete-btn',function(){
	var deInterestNo=$(this).parent().parent().parent().prev('.interest-back').children('.deInterest-info').children('.deInterest-no').val();
	var curr_Interest=$(this).parent().parent().parent().prev('.interest-back').children('.deInterest-info').children('.interest-no').val();
	var $secondInter_tbl=$('#second-interest-tbl');

	$.ajax({
		url:"deleteInterestAdmin.do",
		data:{
			"deInterestNo":deInterestNo,
			"currInterest":curr_Interest
		},
		dataType:"html",
		success:function(data){
			alert("삭제완료!");
			$secondInter_tbl.children('tbody').html(data);
			
		}
	})
});
// 카테고리 추가 버튼
$(document).on('click','#insert-interest-btn',function(){
	
	var deInterestVal=$('#insert-deInterest-val').val();
	var curr_Interest=$(this).parent().parent().parent().siblings('.interest-back').children('.deInterest-info').children('.interest-no').val();
	var $secondInter_tbl=$('#second-interest-tbl');
	
	$.ajax({
		url:"insertInterestAdmin.do",
		data:{
			"deInterestVal":deInterestVal,
			"currInterest":curr_Interest
		},
		dataType:"html",
		success:function(data){
			alert("등록완료!");
			$secondInter_tbl.children('tbody').html(data);
			
		}
	})
	
})

//카테고리 삭제뷰 버튼 클릭시 삭제버튼 슬라이드 이벤트
$(document).on('click','.delete-btn-view',function(){
	var $delete_back=$(this).parent().parent().next('.delete-btn-back-tr').children().children();
	var $delete_back_tr=$(this).parent().parent().next('.delete-btn-back-tr');
	var $delete_back_tr_all=$('.delete-btn-back-tr');
	var $delete_back_all=$('.delete-btn-back');
	console.log($delete_back_tr);
	console.log(!$delete_back_all.is(':hidden'));
	console.log($delete_back_tr.index());

	for(var i=0;i<$delete_back_tr_all.length;i++){
		if(!$delete_back_tr_all.eq(i).is(':hidden')){
			// $delete_back_all.slideUp('slow');
			$delete_back_all.css({
				'display':'none'
			});
			
			// $delete_back_tr_all.slideUp('slow');
			$delete_back_tr_all.css({
				'display':'none'
			});

		}
		console.log('up3');
	}

	$delete_back_tr.slideDown('slow');
	$delete_back.slideDown('slow');

});
//카테고리 추가뷰 버튼 클릭시 등록버튼 슬라이드 이벤트
$(document).on('click','#insert-interest-view',function(){
	var $insert_back=$(this).parent().parent().next('#insert-interest-back').children().children();
	var $insert_back_tr=$(this).parent().parent().next('#insert-interest-back');

	$insert_back_tr.slideDown('slow');
	$insert_back.slideDown('slow');


});

//카테고리 추가뷰 취소버튼
$(document).on('click','#insert-interest-btn-cansel',function(){
	var $insert_back=$(this).parent();
	var $insert_back_tr=$(this).parent().parent().parent();

	$insert_back_tr.slideUp('slow');
	$insert_back.slideUp('slow');


});
//카테고리 삭제뷰 버튼 이후 취소버튼 클릭시 삭제뷰 사라지는 이벤트
$(document).on('click','.category-delete-cancel',function(){
	var $delete_back=$(this).parent();
	var $delete_back_tr=$(this).parent().parent().parent();
	console.log($delete_back);
	console.log($delete_back_tr);

	$delete_back.slideUp('slow');
	$delete_back_tr.slideUp('slow');

});



//거래 현황 확인 이벤트
$(document).on('click', '.deal-info-back', function () {

	var div = $(this).next();
	if (div.is(':hidden')) {
		div.slideDown('slow');
	} else {
		div.slideUp('slow');
	} 

});

//신고 회원 보기 이벤트
$(document).on('click', '.report-tab-back', function () {

	var div = $(this).next();
	if (div.is(':hidden')) {
		div.slideDown('slow');

	} else {
		div.slideUp('slow');
	}

});

//faq 카테고리 클릭 이벤트
$(document).on('click', '.faq-slide', function () {

	var $faq_list = $(this).parent().next();

	if ($faq_list.is(':hidden')) {

		$faq_list.slideDown('slow');
		$(this).html("▲");

	} else {

		$faq_list.slideUp('slow');
		$(this).html("▼");

	}

});


//faq 답변 보기 이벤트
$(document).on('click', '.answer-slide', function () {

	var $slide_btn = $(this);
	var $answer = $slide_btn.siblings('.faq-answer');

	if ($answer.is(':hidden')) {
		$answer.slideDown('slow');
		$(this).html("▲");

	} else {
		$answer.slideUp('slow');
		$(this).html("▼");


	}

});

//faq 카테고리 추가 이벤트
$(document).on('click', '.faq-category-insert', function () {

	var $faq_insert_back=$('#faq-insert-back');
	$faq_insert_back.slideDown('slow');
	$faq_insert_back.css("display","flex");
});
//faq 카테고리 추가 div 삭제 이벤트
$(document).on('click', '.add-faq-category-cansel', function () {

	var $faq_insert_back=$('#faq-insert-back');
	$faq_insert_back.slideUp('slow');
	
});

$(document).on('click','#add-faq-category-btn',function(){
	
	var category=$("#input-faq-category").val();
	$.ajax({
		url:"insertFaqCategory.do",
		data:{
			"category":category,
		},
		dataType:"html",
		success:function(data){
			console.log(1);
		}
	})
	
})


//faq 질문,답변 추가 이벤트
$(document).on('click', '.add-question', function () {
	window.open("insertFaqQna.do","faqtWin","width=500, height=500, top=200,left=1000");
//	var $faq_back = $(this).parent().parent('.faq-back');
//	var $question = $('<textarea type="text" class="input-question"/>');
//	var $answer = $('<textarea type="text" class="input-answer"/>');
//	var $faq_list = $faq_back.children('.faq-list-back').children('.faq-list');
//	var $list_question = $('<li id="faq-question"></li>');
//	var $list_answer = $('<div id="faq-answer"></div>');
//	var $addButton = $('<button type="button" class="add-faq">추가</button>');
//	var $cancelButton = $('<button type="button" class="add-faq-cancel">취소</button>');
//	$list_question.append($question);
//	$list_question.append($answer);
//	$list_question.append($addButton);
//	$list_question.append($cancelButton);
//
//	$faq_list.append($list_question);
//	$(this).remove();
//	console.log($question);
});
//faq 질문 삭제 뷰 이벤트
$(document).on('click','.question-delete-view',function(){
	var $delete_question=$(this).siblings('.question-delete-back');
	var $delete_question_all=$('.question-delete-back');
	console.log($delete_question_all);
	for(var i=0;i<$delete_question_all.length;i++){
		if(!$delete_question_all.eq(i).is(':hidden')){
			// $delete_back_all.slideUp('slow');
			$delete_question_all.eq(i).css({
				'display':'none'
			});

		}

	}
	$delete_question.slideDown('slow');

});
//질문 삭제뷰 버튼 이후 취소버튼 클릭시 삭제뷰 사라지는 이벤트
$(document).on('click','.question-delete-cancel',function(){
	var $delete_question=$(this).parent('.question-delete-back');


	$delete_question.slideUp('slow');

});

//faq 질문 수정 이벤트
$(document).on('click','.question-update',function(){

	confirm("수정하시겠습니까?")
});
//faq 답변 수정 이벤트
$(document).on('click','.answer-update',function(){

	confirm("수정하시겠습니까?")
})

