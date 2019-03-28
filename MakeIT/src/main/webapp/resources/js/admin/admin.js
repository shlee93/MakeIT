//게시글 승인 탭 세부 메뉴 버튼 클릭 화면전환
$(document).on('click','.approval-li',function(){
	
	var approval_Tab_Status=$('#approval-tab-status').val();
	
	if(approval_Tab_Status=='approval'){
		$('#approval-status').val($(this).children('input').val());
		$('#delete-status').val($(this).children('input').val());
		var approvalStatus=$('#approval-status').val();
		var deleteStatus=$('#delete-status').val();
		var $click_Li=$(this);
		var $all_Li=$('.approval-li');
		
		
		$.ajax({
			url:"approvalView.do",
			data:{
				"approvalStatus":approvalStatus
			},
			dataType:"html",
			success:function(data){

				$('#nav-approval2').html(data);
				$all_Li.removeClass('active');
				$click_Li.addClass('active');
				
				$.ajax({
					url:"deleteView.do",
					data:{
						"deleteStatus":deleteStatus
					},
					dataType:"html",
					success:function(data){

						$('#nav-delete').html(data);
					}
				})
			}
		})
		
	}else if(approval_Tab_Status=='delete'){
		$('#approval-status').val($(this).children('input').val());
		$('#delete-status').val($(this).children('input').val());
		var approvalStatus=$('#approval-status').val();
		var deleteStatus=$('#delete-status').val();
		
		var $click_Li=$(this);
		var $all_Li=$('.approval-li');
		
		$.ajax({
			url:"deleteView.do",
			data:{
				"deleteStatus":deleteStatus
			},
			dataType:"html",
			success:function(data){

				$('#nav-delete').html(data);
				$all_Li.removeClass('active');
				$click_Li.addClass('active');
				
				$.ajax({
					url:"approvalView.do",
					data:{
						"approvalStatus":approvalStatus
					},
					dataType:"html",
					success:function(data){

						$('#nav-approval2').html(data);
					}
				})
			}
		})
	}
})

//미승인 게시글 검색
$(document).on('keyup','#approval-search-inp',function(){
	
	var approvalStatus=$('#approval-status').val();
	var approvalSearch=$('#approval-search-inp').val();
	var approvalOption=$('#approval-select option:selected').val();
	var $approval_Tbl=$('.approval-tbl');
	console.log(approvalSearch);
	if(approvalOption!='nosort'){
		
		$.ajax({
			url:"search2ApprovalView.do",
			data:{
				
				"approvalStatus":approvalStatus,
				"approvalSearch":approvalSearch,
				"approvalOption":approvalOption
			},
			dataType:"html",
			success:function(data){
				console.log(data);
				$approval_Tbl.html(data);
			}
		})
	}else{

		return false;
	}
})

//삭제된 게시물
$(document).on('keyup','#delete-search-inp',function(){
	
	//삭제된 게시글 리스트에 필요한 변수
	var deleteStatus=$('#delete-status').val();
	var deleteSearch=$('#delete-search-inp').val();
	var deleteOption=$('#delete-select option:selected').val();
	var $delete_Tbl=$('.delete-tbl');
	
	if(deleteOption!='nosort'){
		
		$.ajax({
			url:"search2DeleteView.do",
			data:{
				
				"deleteStatus":deleteStatus,
				"deleteSearch":deleteSearch,
				"deleteOption":deleteOption
			},
			dataType:"html",
			success:function(data){
				console.log(data);
				$delete_Tbl.html(data);
			}
		})
	}
})

//결제 시스템
$(document).on('click','.click-refund',function(){
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp51275730');
	IMP.request_pay({
		pg : 'kcp', // version 1.1.0부터 지원.
		pay_method : 'trans',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '주문명:결제테스트',
		amount : 1,
		buyer_email : 'iamport@siot.do',
		buyer_name : '구매자이름',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456',
		m_redirect_url : 'adminView.do'
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			alert(msg);
			
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		
	});
})


//탭 클릭시 뷰 스테이터스 전환
$(document).on('click','#nav-member-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("member");
});
$(document).on('click','#nav-approval-tab',function(){
	var $view_Status=$("#view-status");
	var $approval_View_Status=$('#approval-tab-status');
	$view_Status.val("approval");
	$approval_View_Status.val("approval");
});
$(document).on('click','#nav-approval2-tab',function(){
	var $view_Status=$("#view-status");
	var $approval_View_Status=$('#approval-tab-status');
	$view_Status.val("approval");
	$approval_View_Status.val("approval");
});
$(document).on('click','#nav-delete-tab',function(){
	var $view_Status=$("#view-status");
	var $approval_View_Status=$('#approval-tab-status');
	$view_Status.val("delete");
	$approval_View_Status.val("delete");
});
$(document).on('click','#nav-report-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("report");
});
$(document).on('click','#nav-payment-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("payment");
});
$(document).on('click','#nav-refund-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("refund");
});
$(document).on('click','#nav-category-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("category");
});
$(document).on('click','#nav-faq-tab',function(){
	var $view_Status=$("#view-status");
	$view_Status.val("faq");
	
});
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
	var cPage=$(this).parent().parent().siblings('tr').children('td').children('ul').children('.active').children().text();
	var searchId=$('#search-id').val();
	//console.log(memberId);
	window.open("memberDetailView.do?memberId="+memberId+"&cPage="+cPage+"&searchId="+searchId,"memberWin","width=500, height=500, top=200,left=1000");
	
	
});
$(document).on('click','#member-sort-reverse',function(){
	var memberSort=$('#member-sort option:selected').val();
	var ascDesc;
	var $sortBtn=$(this);
	var searchId=$('#search-id').val();
	
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
				"searchId":searchId,
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
	var searchId=$('#search-id').val();
	if(memberSort!="nosort"){
		$.ajax({
			
			url:"memberSortAdmin.do",
			data:{
				"searchId":searchId,
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
	var viewStatus=$('#view-status').val();
	//회원 관리에 필요한 변수
	var searchId=$('#search-id').val();
	var memberSort=$('#member-sort option:selected').val();
	var ascDesc=0;
	//신고관리에 필요한 변수
	var reportStatus=$('#report-view-status').val();
	var $report_tab=$('.panel-info');
	//결제현황리스트에 필요한 변수
	var paymentStatus=$('#payment-view-status').val();
	var $payment_Tab=$('.payment-view-div');
	var paySortCheck=$('#payment-sort-check').val();
	//미승인 게시글 리스트에 필요한 변수
	var approvalStatus=$('#approval-status').val();
	var approvalSearch=$('#approval-search-inp').val();
	var approvalOption=$('#approval-select option:selected').val();
	var $approval_Tbl=$('#nav-approval2');
	//삭제된 게시글 리스트에 필요한 변수
	var deleteStatus=$('#delete-status').val();
	var deleteSearch=$('#delete-search-inp').val();
	var deleteOption=$('#delete-select option:selected').val();
	var $delete_Tbl=$('#nav-delete');
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
					"ascDesc":ascDesc,
					"searchId":searchId
				},
			dataType:"html",
			success:function(data){
				$('.member-view').html(data);
				
			}
			
		})
	}else if(viewStatus=="report"){
		
		//신고관리 페이징처리
		$.ajax({
			url:"selectReportListView.do",
			data:{
					"cPage":cPage,
					"reportStatus":reportStatus
				},
			dataType:"html",
			success:function(data){
				$report_tab.html(data);
				
			}
			
		})
	}else if(viewStatus=="payment"){
		
		$.ajax({
			url:"selectPaymentListView.do",
			data:{
				"cPage":cPage,
				"paymentStatus":paymentStatus
			},
			dataType:"html",
			success:function(data){
				$payment_Tab.html(data);
			}
		})
	}else if(viewStatus=="approval"){
		$.ajax({
			url:"searchApprovalView.do",
			data:{
				"cPage":cPage,
				"approvalStatus":approvalStatus,
				"approvalSearch":approvalSearch,
				"approvalOption":approvalOption
			},
			dataType:"html",
			success:function(data){
				$approval_Tbl.html(data);
			}
		})
	}else if(viewStatus=="delete"){
		$.ajax({
			url:"searchDeleteView.do",
			data:{
				"cPage":cPage,
				"deleteStatus":deleteStatus,
				"deleteSearch":deleteSearch,
				"deleteOption":deleteOption
			},
			dataType:"html",
			success:function(data){
				$delete_Tbl.html(data);
			}
		})
	}
	
})

//삭제된 게시물 복구
$(document).on('click','.return-content',function(){
	
	var flag=confirm("복구하시겠습니까?");
	var deleteStatus=$('#delete-status').val();
	var contentNo=$(this).parent().siblings('td').children('.number').val();
	alert(contentNo);
	alert(deleteStatus);
	if(flag){
		
		$.ajax({
			
			url:"updateDeleteCheck.do",
			data:{
				"contentNo":contentNo,
				"deleteStatus":deleteStatus
			},
			dataType:"html",
			success:function(data){
				alert("복구 완료!");
				$('.delete-tbl').html(data);
			}
		})
	}
	
})
$(document).on('keyup','.deInterest-val',function(){
	var deInterestVal=$(this).val();
	
	if(deInterestVal.length > 30) {
       alert("글자수는 30자로 이내로 제한됩니다.");
       $(this).val(deInterestVal.substring(0, 30));
    }
})

$(document).on('keyup','.category-val',function(){
	var categoryVal=$(this).val();
	
	if(categoryVal.length > 10) {
       alert("글자수는 10자로 이내로 제한됩니다.");
       $(this).val(categoryVal.substring(0, 10));
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

//FAQ카테고리 등록 화면 
$(document).on('click','#faq-category-view',function(){
	
	var $secondInter_tbl=$('#second-interest-tbl');
	var $click_li=$(this);
	var $interest_li=$('.first-interest');
	
	$.ajax({
		url:"adminFaqCategoryView.do",
		dataType:"html",
		success:function(data){
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
	var $curr_deInterest=$(this).parent().siblings('.deInterest-info').children('.deInterest-val');
	var $deInterest=$('.deInterest-val');
	var $secondInter_tbl=$('#second-interest-tbl');
	var updateFlag=confirm('이 카테고리를 수정하시겠습니까?');
	
	if(deInterestVal==''){
		alert("내용을 입력해주세요!");
		$curr_deInterest.focus();
		return false;
	}
	
	for(var i=0;i<$deInterest.length;i++){
		if(deInterestVal==$deInterest.eq(i).val()&&i!=$deInterest.index($(this).parent().siblings('.deInterest-info').children('.deInterest-val'))){
			alert("이미 등록된 카테고리 입니다.");
			$curr_deInterest.focus();
			return false;
		}
	}
	
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
// 2차 카테고리 추가 버튼
$(document).on('click','#insert-interest-btn',function(){
	
	var deInterestVal=$('#insert-deInterest-val').val();
	var curr_Interest=$(this).parent().parent().parent().siblings('.interest-back').children('.deInterest-info').children('.interest-no').val();
	var $secondInter_tbl=$('#second-interest-tbl');
	var $curr_deInterest=$('#insert-deInterest-val');
	var $deInterest=$('.deInterest-val');
	
	if(deInterestVal==''){
		alert("내용을 입력해주세요!");
		$curr_deInterest.focus();
		return false;
	}
	
	for(var i=0;i<$deInterest.length;i++){
		if(deInterestVal==$deInterest.eq(i).val()){
			alert("이미 등록된 카테고리 입니다.");
			$curr_deInterest.focus();
			return false;
		}
	}
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
	
});

//FAQ카테고리 추가
$(document).on('click','#insert-category-btn',function(){
	
	var category=$('#insert-category-val').val();
	var $secondInter_tbl=$('#second-interest-tbl');
	var $curr_deInterest=$('#insert-category-val');
	var $category=$('.category-val');
	
	if(category==''){
		alert("내용을 입력해주세요!");
		$curr_deInterest.focus();
		return false;
	}
	
	for(var i=0;i<$category.length;i++){
		if(category==$category.eq(i).val()){
			alert("이미 등록된 카테고리 입니다.");
			$curr_deInterest.focus();
			return false;
		}
	}
	$.ajax({
		url:"insertFaqCategory.do",
		data:{
			"category":category
		},
		dataType:"html",
		success:function(data){
			alert("등록완료!");
			$secondInter_tbl.children('tbody').html(data);
			
			$.ajax({
				
				url:"refreshFaq.do",
				dataType:"html",
				success:function(data){
					$('#nav-faq').html(data);
				}
			})
		}
	})
	
});

//FAQ 카테고리 삭제
$(document).on('click','.faq-category-delete-btn',function(){
	var $secondInter_tbl=$('#second-interest-tbl');
	var faqCategoryNo=$(this).parent().parent().parent().prev('.interest-back').children().children('.category-no').val();
	
	$.ajax({
		
		url:"deleteFaqCategoryAdmin.do",
		data:{
			"faqCategoryNo":faqCategoryNo,
		},
		dateType:"html",
		success:function(data){
			alert("삭제완료!");			
			$secondInter_tbl.children('tbody').html(data);
		}
	})

})

//FAQ 카테고리 수정
$(document).on('click','.update-category',function(){
	var category=$(this).parent().siblings('.deInterest-info').children('.category-val').val();
	var faqCategoryNo=$(this).parent().siblings('.deInterest-info').children('.category-no').val();
	var $category=$('.category-val');
	var $curr_deInterest=$('#insert-category-val');
	if(category==''){
		alert("내용을 입력해주세요!");
		$curr_deInterest.focus();
		return false;
	}
	
	for(var i=0;i<$category.length;i++){
		if(category==$category.eq(i).val()){
			alert("이미 등록된 카테고리 입니다.");
			$curr_deInterest.focus();
			return false;
		}
	}
	
	$.ajax({
		
		url:"updateFaqCategoryAdmin.do",
		data:{
			"faqCategoryNo":faqCategoryNo,
			"category":category
		},
		dateType:"html",
		success:function(data){
			alert("삭제완료!");			
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
$(document).on('click','#insert-interest-btn-cancel',function(){
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

//결제현황 카테고리 전환
$(document).on('click','.payment-view',function(){
	var $view_Status=$('#payment-view-status');
	$view_Status.val($(this).children('input').val());
	var $click_Li=$(this);
	var viewStatus=$view_Status.val();
	var $payment_Tab=$('.payment-view-div');
	$.ajax({
		url:"selectPaymentListView.do",
		data:{
			"paymentStatus":viewStatus
		},
		dataType:"html",
		success:function(data){
			$payment_Tab.html(data);
			$('.payment-view').removeClass('active');
			$click_Li.addClass('active');
		}
	})
})

//구매확정 결제현황만 출력
$(document).on('click','#paymentSort-btn',function(){
	$('#payment-sort-check').val(4);
	var $view_Status=$('#payment-view-status');
	var $click_Li=$(this);
	var viewStatus=$view_Status.val();
	var $payment_Tab=$('.payment-view-div');
	var sortCheck=$('#payment-sort-check').val();
	$.ajax({
		url:"selectPaymentListView.do",
		data:{
			"paymentStatus":viewStatus,
			"sortCheck":sortCheck
		},
		dataType:"html",
		success:function(data){
			$payment_Tab.html(data);
			
		}
	})
})

//구매확정 결제 팝업
$(document).on('click','.payment-pop',function(){
	var $view_Status=$('#payment-view-status');
	var viewStatus=$view_Status.val();
	var $click_Li=$(this);
	var specNo=$click_Li.children('input').val();
	$.ajax({
		url:"paymentPopupView.do",
		data:{
			"paymentStatus":viewStatus,
			"specNo":specNo
		},
		dataType:"html",
		success:function(data){
			$('.modal-body').html(data);
			$('#product_view').addClass('show');
		}
	})
})

//구매 확정 결제
$(document).on('click','.payment-end',function(){
	var $view_Status=$('#payment-view-status');
	var viewStatus=$view_Status.val();
	var title=$('.product-title').children('span').text();
	var specNo=$('#end-spec-no').val();
	var price=$('.cost').children('span').text();
	var $payment_Tab=$('.payment-view-div');
	var targetId=$('#payment-target').val();
	console.log(title);
	console.log(price);
	
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp51275730');
	IMP.request_pay({
		pg : 'kcp', // version 1.1.0부터 지원.
		pay_method : 'trans',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : title,
		amount : 1000,
		buyer_email : 'make_it@gmail.kr',
		buyer_name : 'MakeIT(메이크잇)',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 역삼동',
		buyer_postcode : '123-456',
		m_redirect_url : 'adminView.do'
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '<br>상점 거래ID : ' + rsp.merchant_uid;
			msg += '<br>결제 금액 : ' + rsp.paid_amount;
			msg += '<br>카드 승인번호 : ' + rsp.apply_num;
			alert(msg);
			
			$.ajax({
				
				url:"updatePaymentEnd.do",
				data:{
					"paymentStatus":viewStatus,
					"specNo":specNo,
					"targetId":targetId
				},
				dataType:"html",
				success:function(data){
					$('#close').click();
					$('.modal-body').children('.row').remove();
					$payment_Tab.html(data);
				}
			})
			
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		
	});
	
})
//환불요청 리스트 카테고리 화면전환
$(document).on('click','.refund-view',function(){
	var $view_Status=$('#refund-view-status');
	$view_Status.val($(this).children('input').val());
	var $click_Li=$(this);
	var viewStatus=$view_Status.val();
	var $payment_Tab=$('.refund-view-div');
	$.ajax({
		url:"selectRefundListView.do",
		data:{
			"refundStatus":viewStatus
		},
		dataType:"html",
		success:function(data){
			$payment_Tab.html(data);
			$('.refund-view').removeClass('active');
			$click_Li.addClass('active');
		}
	})
})
//환불 사유 팝업
$(document).on('click','.refund-pop',function(){
	var $view_Status=$('#refund-view-status');
	var viewStatus=$view_Status.val();
	var $click_Li=$(this);
	var specNo=$click_Li.children('input').val();
	console.log(viewStatus);
	window.open("refundView.do?specNo="+specNo+"&refundStatus="+viewStatus,"faqWin","width=800, height=400, top=200,left=1000");
});

/*//환불요청 결제 팝업
$(document).on('click','#refund-btn',function(){
	var $view_Status=$('#refund-view-status');
	var viewStatus=$view_Status.val();
	var $click_Li=$(this);
	var specNo=$click_Li.children('input').val();
	$.ajax({
		url:"refundPopupView.do",
		data:{
			"refundStatus":viewStatus,
			"specNo":specNo
		},
		dataType:"html",
		success:function(data){
			$('.modal-body').html(data);
			$('#product_view').addClass('show');
		}
	})
});
*/
//환불 요청 결제
$(document).on('click','#refund-btn',function(){
	var $view_Status=$(opener.document).find('#refund-view-status');
	var viewStatus=$view_Status.val();
	var title=$('#refund-title').val();
	var specNo=$('#end-spec-no').val();
	var price=$('#refund-price').val()
	var $payment_Tab=$('.refund-view-div');
	var cPage=$('#cPage').val();
	var no=$('#no').val();
	console.log(title);
	console.log(price);
	
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp51275730');
	IMP.request_pay({
		pg : 'kcp', // version 1.1.0부터 지원.
		pay_method : 'trans',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : title,
		amount : price,
		buyer_email : 'make_it@gmail.kr',
		buyer_name : 'MakeIT(메이크잇)',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 역삼동',
		buyer_postcode : '123-456',
		m_redirect_url : 'adminView.do'
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '<br>상점 거래ID : ' + rsp.merchant_uid;
			msg += '<br>결제 금액 : ' + rsp.paid_amount;
			msg += '<br>카드 승인번호 : ' + rsp.apply_num;
			alert(msg);
			
			$.ajax({
				
				url:"updateRefundEnd.do",
				data:{
					"no":no,
					"cPage":cPage,
					"refundStatus":viewStatus,
					"specNo":specNo
				},
				dataType:"html",
				success:function(data){
					$('.modal-body').children('.row').remove();
					$payment_Tab.html(data);
					self.close();
				}
			})
			
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		
	});
	
})
//환불 거부
$(document).on('click','#negative-btn',function(){
	var $view_Status=$(opener.document).find('#refund-view-status');
	console.log(viewStatus);
	var viewStatus=$view_Status.val();
	var title=$('#refund-title').val();
	var specNo=$('#end-spec-no').val();
	var price=$('#refund-price').val()
	var $payment_Tab=$(opener.document).find('.refund-view-div');
	var cPage=$('#cPage').val();
	var no=$('#no').val();
	
	$.ajax({
		
		url:"updateRefundNegativeEnd.do",
		data:{
			"cPage":cPage,
			"refundStatus":viewStatus,
			"specNo":specNo
		},
		dataType:"html",
		success:function(data){
			alert("환불 취소했습니다.");
			$payment_Tab.html(data);
			self.close();
		}
	})
})

//신고 회원 보기 이벤트
$(document).on('click', '.report-tab-back', function () {

	var div = $(this).next();
	console.log('gg');
	if (div.is(':hidden')) {
		div.slideDown('slow');
		console.log("?");
	} else {
		div.slideUp('slow');
		console.log("?1");
	}

});

//신고 승인
$(document).on('click','.report-btn',function(){
	var reportStatus=$('#report-view-status').val();
	var reportId=$(this).parent().parent().parent().parent().parent().parent().parent().prev().children().children().children('.report-id').text();
	var contentNo=$(this).siblings(".content-no").val();
	var $report_tab=$('.panel-info'); 
	console.log(contentNo);
	$.ajax({
		 url:"updateReportCount.do",
		 data:{
			 "reportId":reportId,
			 "reportStatus":reportStatus,
			 "contentNo":contentNo
		 },
		 dataType:"html",
		 success:function(data){
			 $report_tab.html(data);
			 alert("신고승인 되었습니다!");
		 }
	 })
});
$(document).on('click','.report-btn-cancel',function(){
	var reportStatus=$('#report-view-status').val();
	var reportId=$(this).parent().parent().parent().parent().parent().parent().parent().prev().children().children().children('.report-id').text();
	var contentNo=$(this).siblings(".content-no").val();
	var $report_tab=$('.panel-info');
	var reportFlag=false;
	
	$.ajax({
		 url:"updateReportCount.do",
		 data:{
			 "reportId":reportId,
			 "reportStatus":reportStatus,
			 "contentNo":contentNo,
			 "reportFlag":reportFlag
		 },
		 dataType:"html",
		 success:function(data){
			 $report_tab.html(data);
			 alert("신고거부 되었습니다!");
		 }
	 })
});

//신고 관리 게시판 카테고리 메뉴 클릭시 화면전환
$(document).on('click','.report-view',function(){
	var $view_Status=$('#report-view-status');
	$view_Status.val($(this).children('input').val());
	var reportStatus=$view_Status.val();
	var $report_tab=$('.panel-info'); 
	var $click_Li=$(this);
	$.ajax({
		url:"selectReportListView.do",
		data:{
				"reportStatus":reportStatus
			},
		dataType:"html",
		success:function(data){
			$report_tab.html(data);
			$('.report-view').removeClass('active');
			$click_Li.addClass('active');
		}
		
	})
})

//faq 카테고리 클릭 이벤트
$(document).on('click', '.faq-category', function () {

	var $faq_list = $(this).next();

	if ($faq_list.is(':hidden')) {

		$faq_list.slideDown('slow');
		$(this).children().html("▲");

	} else {

		$faq_list.slideUp('slow');
		$(this).children().html("▼");

	}
	
});


//faq 답변 보기 이벤트
$(document).on('click', '.faq-question', function () {


	var $answer = $(this).children('.faq-answer');

	if ($answer.is(':hidden')) {
		$('.faq-answer').slideUp('slow');
		$answer.slideDown('slow');
		$(this).siblings('.answer-slide').html("▲");

	} else {
		$answer.slideUp('slow');
		$(this).siblings('.answer-slide').html("▼");

	}

});

//faq 질문 검색
$(document).on('keyup','#faq-search',function(){
	var faqSearch=$('#faq-search').val();
	
	$.ajax({
		
		url:"selectFaqSearchAdmin.do",
		data:{
			"faqSearch":faqSearch,
		},
		dataType:"html",
		success:function(data){
			$('.faq-section').html(data);
		}
	})
})

//faq 화면 전환
$(document).on('click','#nav-faq-tab',function(){
	
	$.ajax({
		
		url:"selectFaqSearchAdmin.do",
		dataType:"html",
		success:function(data){
			$('#faq-search').val('');
			$('.faq-section').html(data);
		}
	})
})
//faq 카테고리 추가 이벤트
$(document).on('click', '.faq-category-insert', function () {

	var $faq_insert_back=$('#faq-insert-back');
	$faq_insert_back.slideDown('slow');
	$faq_insert_back.css("display","flex");
});
//faq 카테고리 추가 div 삭제 이벤트
$(document).on('click', '#add-faq-category-cancel', function () {

	var $faq_insert_back=$('#faq-insert-back');
	$faq_insert_back.slideUp('slow');
	
	
});


//faq 질문,답변 추가 팝업
$(document).on('click', '.add-qna', function () {
	window.open("insertFaqQna.do","faqWin","width=500, height=600, top=200,left=1000");

});
//faq 질문,답변 수정 팝업
$(document).on('click', '.qna-update', function () {
	var faqNo=$(this).siblings('.faq-no').val();
	/*var $faq_question=$(this).siblings('textarea');
	var $faq_answer=$(this).siblings('.faq-answer').children();
	var $faq_question_all=$('.faq-question').children('textarea');
	var $faq_answer_all=$('.faq-answer').children('textarea');
	$faq_question_all.removeAttr('required');
	$faq_answer_all.removeAttr('required');
	$faq_question_all.attr('readonly');
	$faq_answer_all.attr('readonly');
	$faq_question.removeAttr('readonly');
	$faq_answer.removeAttr('readonly');
	$faq_question.attr('required','required');
	$faq_answer.attr('required','required');
	$faq_question.focus();
	$(this).addClass('qna-update-end');*/
	window.open("updateFaqQna.do?faqNo="+faqNo,"faqtWin","width=500, height=600, top=200,left=1000");

});

/*$(document).on('click','.qna-update-end',function(){
	var faqNo=$(this).siblings('.faq-no').val();
	var faqQuestion=$(this).siblings('textarea').val();
	var faqAnswer=$(this).siblings('.faq-answer').children().val();
	var $faq_question=$(this).siblings('textarea');
	var $faq_answer=$(this).siblings('.faq-answer').children();
	var $faq_question_all=$('.faq-question').children('textarea');
	var $faq_answer_all=$('.faq-answer').children('textarea');
	if(faqQuestion==""||faqAnswer==""){
		
		if(faqQuestion==""){
			alert("질문을 입력해주세요!");
			$faq_question.focus();
			return false;
		}else if(faqAnswer==""){
			alert("답변을 입력해주세요!");
			$faq_answer.focus();
			return false;
		}
	}
	
	for(var i=0;i<$faq_question_all.length;i++){
		
		if(faqQuestion==$faq_question_all.eq(i).val()){
			alert("이미 등록된 질문 입니다.");
			$faq_question.focus();
			return false;
		}
	}
	$.ajax({
		
		url:"updateFaqnaEndAdmin.do",
		data:{
			"question":faqQuestion,
			"answer":faqAnswer,
			"faqCategory":faqCategory,
			"faqNo":faqNo
		},
		dataType:"html",
		success:function(data){
			$faq_tab.html(data);
			self.close();
		}
	})
	
})*/
//faq 질문 삭제 뷰 이벤트
$(document).on('click','.qna-delete-view',function(){
	var $delete_question=$(this).siblings('.qna-delete-back');
	var $delete_question_all=$('.qna-delete-back');
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
$(document).on('click','.qna-delete-cancel',function(){
	var $delete_question=$(this).parent('.qna-delete-back');


	$delete_question.slideUp('slow');

});
// 탭 이동 버튼
$(document).on('click','#move-category',function(){
	console.log("dd?");
	$('#nav-category-tab').click();
})

//FAQ 질문 답변 삭제
$(document).on('click','.qna-delete',function(){
	
	var faqNo=$(this).parent().siblings('.faq-no').val();
	var $faq_tab=$('#nav-faq');
	$.ajax({
		
		url:"deleteFaqnaAdmin.do",
		data:{
			"faqNo":faqNo
		},
		dataType:"html",
		success:function(data){
			$faq_tab.html(data);
			alert("삭제완료!");
			
		}
	})
})

//텍스트 에어리어 크기조절

$(document).on('keyup','textarea', function(){
	 var textEle=$(this);
	 console.log(textEle);
	 textEle[0].style.height = 'auto';
	 var textEleHeight = textEle.prop('scrollHeight');
	 console.log(textEleHeight);
	 textEle.css('height', textEleHeight);
});




