		// 카테고리 삭제뷰 버튼 클릭시 삭제버튼 슬라이드 이벤트
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
                    console.log('up');
                    // $delete_back_tr_all.slideUp('slow');
                    $delete_back_tr_all.css({
                        'display':'none'
                    });
                    console.log('up2');
                }
                console.log('up3');
            }
            
            console.log('up4');
            $delete_back_tr.slideDown('slow');
            console.log('up5');
            $delete_back.slideDown('slow');
            

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

        //카테고리 수정 이벤트
        $(document).on('click','.update-category',function(){
            confirm('이 카테고리를 수정하시겠습니까?');

        });

        // 거래 현황 확인 이벤트
        $(document).on('click', '.deal-info-back', function () {

            var div = $(this).next();
            if (div.is(':hidden')) {
                div.slideDown('slow');
            } else {
                div.slideUp('slow');
            } 

        });

        // 신고 회원 보기 이벤트
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
            var $faq_back = $('<div class="faq-back"></div>');
            var $category = $('<div id="add-faq-category"></div>');
            var $input_category = $('<input type="text" class="input-category"/>');
            var $addButton = $('<button type="button" class="add-faq-Category">추가</button>');
            var $cancelButton = $('<button type="button" class="add-faq-category-cancel">취소</button>');
            console.log($category.children());

            $category.append($input_category);
            $category.append($addButton);
            $category.append($cancelButton);
            $faq_back.append($category);

            $('#nav-faq').append($faq_back);

        });

        //faq 질문,답변 추가 이벤트
        $(document).on('click', '.add-question', function () {
            var $faq_back = $(this).parent().parent('.faq-back');
            var $question = $('<textarea type="text" class="input-question"/>');
            var $answer = $('<textarea type="text" class="input-answer"/>');
            var $faq_list = $faq_back.children('.faq-list-back').children('.faq-list');
            var $list_question = $('<li id="faq-question"></li>');
            var $list_answer = $('<div id="faq-answer"></div>');
            var $addButton = $('<button type="button" class="add-faq">추가</button>');
            var $cancelButton = $('<button type="button" class="add-faq-cancel">취소</button>');
            $list_question.append($question);
            $list_question.append($answer);
            $list_question.append($addButton);
            $list_question.append($cancelButton);

            $faq_list.append($list_question);
            $(this).remove();
            console.log($question);
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