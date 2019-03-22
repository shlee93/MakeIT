//관리자 회원정보 업데이트
$(document).on('click','#member-update',function(){
	var memberId=$('.panel-title').text();
	var phone=$('#phone').val();
	var email=$('#email').val();
	var address=$('#address').val();
	var reportCount=$('#reportCount').val();
	var $member_table=$(opener.document).find('.member-view');
	
	if(phone==''){
		alert('전화번호 입력값이 없습니다.');
		$('#phone').focus();
		return false;
	}else if(phone==''){
		alert('이메일 입력값이 없습니다.');
		$('#email').focus();
		return false;
	}else if(phone==''){
		alert('주소 입력값이 없습니다.');
		$('#address').focus();
		return false;
	}else if(phone==''){
		alert('신고 횟수 입력값이 없습니다.');
		$('#reportCount').focus();
		return false;
	}
	console.log($member_table);
	$.ajax({
		url:"memberUpdateAdmin.do",
		data:{
			"memberId":memberId,
			"phone":phone,
			"email":email,
			"address":address,
			"reportCount":reportCount
		},
		dataType:"html",
		success:function(data){
			$member_table.html(data);
			self.close();
		}
	})
});

// FAQ 질문 답변 등록
$(document).on('click','#insertQna',function(){
	var question=$('#question').val();
	var answer=$('#answer').val();
	var faqCategory=$('#faq-category option:selected').val();
	var $faq_tab=$(opener.document).find('#nav-faq');
	var $faq_Question=$(opener.document).find('.faq-title');
	if(question==""||answer==""){
		alert("내용을 입력해주세요!");
		if(question==""){
			$('#question').focus();
			return false;
		}else if(answer==""){
			$('#answer').focus();
			return false;
		}
	}
	
	for(var i=0;i<$faq_Question.length;i++){
		
		if(question==$faq_Question.eq(i).val()){
			alert("이미 등록된 질문 입니다.");
			$('#question').focus();
			return false;
		}
	}
	
	
	$.ajax({
		
		url:"insertFaqnaEndAdmin.do",
		data:{
			"question":question,
			"answer":answer,
			"faqCategory":faqCategory
		},
		dataType:"html",
		success:function(data){
			$faq_tab.html(data);
			self.close();
		}
	})
	
	
});
//질문 답변 수정
$(document).on('click','#updateQna',function(){
	var question=$('#question').val();
	var answer=$('#answer').val();
	var faqCategory=$('#faq-category option:selected').val();
	var faqNo=$('#faq-no').val();
	var $faq_tab=$(opener.document).find('#nav-faq');
	var $faq_Question=$(opener.document).find('.faq-title');
	
	if(question==""||answer==""){
		alert("내용을 입력해주세요!");
		if(question==""){
			$('#question').focus();
			return false;
		}else if(answer==""){
			$('#answer').focus();
			return false;
		}
	}
	
	for(var i=0;i<$faq_Question.length;i++){
		
		if(question==$faq_Question.eq(i).val()){
			alert("이미 등록된 질문 입니다.");
			$('#question').focus();
			return false;
		}
	}
	$.ajax({
		
		url:"updateFaqnaEndAdmin.do",
		data:{
			"question":question,
			"answer":answer,
			"faqCategory":faqCategory,
			"faqNo":faqNo
		},
		dataType:"html",
		success:function(data){
			$faq_tab.html(data);
			self.close();
		}
	})
	
	
});

$(document).on('keyup','textarea', function() {
	console.log($(this).val().length);
    if($(this).val().length > 450) {
       alert("글자수는 450자로 이내로 제한됩니다.");
       $(this).val($(this).val().substring(0, 450));
    }
 
});
