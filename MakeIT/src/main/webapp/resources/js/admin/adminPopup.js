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
})