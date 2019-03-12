//관리자 회원정보 업데이트
$(document).on('click','#member-update',function(){
	var memberId=$('.panel-title').text();
	var phone=$('#phone').val();
	var email=$('#email').val();
	var address=$('#address').val();
	var reportCount=$('#reportCount').val();
	var $member_table=$(opener.document).find('.member-view');
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

$(document).on('click','#insertQna',function(){
	var question=$('#question').val();
	var answer=$('#answer').val();
	var faqCategory=$('#faq-category option:selected').val();
	var $faq_tab=$(opener.document).find('#nav-faq');
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

$(document).on('click','#updateQna',function(){
	var question=$('#question').val();
	var answer=$('#answer').val();
	var faqCategory=$('#faq-category option:selected').val();
	var faqNo=$('#faq-no').val();
	var $faq_tab=$(opener.document).find('#nav-faq');
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
	
	
})