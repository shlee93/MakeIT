<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>


	<a class="dropdown-item" href="${path }/member/memberEnrollck.do">회원가입</a>
	<a class="dropdown-item" href="${path }/member/memberLogin.do">로그인</a>
	<a class="dropdown-item" href="${path }/member/memberMyPage.do">마이페이지</a>	
	<a class="dropdown-item" href="${path }/buy/volList.do">지원자 리스트</a>
	<a class="dropdown-item" href="${path }/sell/sellmain.do">판매메인</a>
	<a class="dropdown-item" href="${path }/sell/sellDetail.do">판매디테일</a>
	<a class="dropdown-item" href="${path }/sell/sellWrite.do">판매글작성</a>
	<a class="dropdown-item" href="${path }/buy/buyDetail.do">구매디테일</a>
	<a class="dropdown-item" href="${path }/buy/buyWrite.do">구매글작성</a>
	<a class="dropdown-item" href="${path }/contest/contestMain.do">컨테스트메인</a>
	<a class="dropdown-item" href="${path }/contest/contestDetail.do">컨테스트상세</a>
	<a class="dropdown-item" href="${path }/contest/contestWrite.do">컨테스트글작성</a>
	<a class="dropdown-item" href="${path }/mainpage/mainpage.do">메인페이지</a>
	<a class="dropdown-item" href="${path }/admin/adminView.do">관리자</a>
	<a class="dropdown-item" href="${path }/intropage/intropage.do">인트로페이지</a>

   <div id="famousContentWrap">
        <P id="famousContentTitle">인기 컨텐츠!<br/><p id="famousContentTitle2">시간 되시면 둘러보세요 :)</p>
        <div id="famousContentBody">
            <div id="famousContentLeft"></div>
            <div id="famousContentRight"></div>
        </div>
    </div>
    
    
    <div id="widthBar"></div>

    <div id="recentlyViewWrap">
        <p id="recentlyViewTitle">최근 본 페이지</p>

        <div id="recentlyViewBody">
            <div id="recentlyView"></div>
            <div id="recentlyViewLeft"></div>
            <div id="recentlyViewRight"></div>
        </div>
    </div>

    <div id="similarContentWrap">
        <p id="similarContentTitle">관련 페이지</p>
        <div id="similarContentBody">
            <div id="similarContent1"></div>
            <div id="similarContent2"></div>
            <div id="similarContent3"></div>
            <div id="similarContent4"></div>
            <div id="similarContent5"></div>
        </div>
    </div>

    <div id="widthBar"></div>

    <div id="rankingViewWrap">

        <div id="rankingViewAlign">
            
            <div id="rankingViewBody">
                <div id="rankingView1stBody">
                    <p id="rankingViewTitle">랭킹</p>
                    <div id="rankingView1stBox">
                        <div id="rankingView1stLogo"></div>
                        <div id="rankingView1stPriceBody">
                            <p id="rankingView1stPriceTitle">총 판매 금액</p>
                            <p id="rankingView1stPrice"></p>
                        </div>
                        <div id="rankingView1stNickBody">
                            <div id="rankingView1stNickBox">
                                <p id="rankingView1stNick"></p>
                            </div>
                        </div>
                    </div> 
                </div>

                <div id="rankingViewMore"></div>
            </div>

            <div id="rankingDetailViewBody">
                <div id="rankingDetailViewNickBox">
                    <p id="rankingDetailViewNick">널 사랑하지 않아</p>
                    <div id="rankingDetailViewDelete"></div>
                </div>
                <div id="rankingDetailViewBox">
                    <p id="rankingDetailViewGood">만족도: 98%</p>
                    <p id="rankingDetailViewWork">작업수: (1576)</p>
                    <p id="rankingDetailViewMajor">기술: 프로그래밍</p>
                </div>
                <div id="reviewShowBox">
                    <p id="reviewShow">최근 리뷰 보기</p>
                </div>
            </div>
        </div>
    </div>
    
    <div id='reviewModalWrap'></div>
    <div id="reviewModalContent">
        <div id="reviewModalDelete"></div>
    </div>
    
    <script>
    $(function(){
        // $.ajax{ 인기 컨텐츠
        // 
        // }

        $('#famousContentBody').append("<div class='famousContent'></div>");
        $('#famousContentBody').append("<div class='famousContent'></div>");
        $('#famousContentBody').append("<div class='famousContent'></div>"); 
        $('.famousContent:eq('+0+')').css('background-color','blue');
        $('.famousContent:eq('+1+')').css('background-color','red');
        $('.famousContent:eq('+2+')').css('background-color','black');

        $.ajax({ //랭킹 컨텐츠
        	url:"${path}/member/ranking.do",
        	dataType:'json',
        	success: function(data){
           		
                var rankingNick =data[0]['MEMBERNAME'];
                var totalPrice;
                var rankingSize = 9;
                $(function commaNum(){
                	
                	var num = data[0]['SUM(SELLPRICE)'] + ""; 
                	var len = num.length;
                	var point = num.length %3;
                	
                	str = num.substring(0, point);
                	while(point < len){
                		if(str != "") str +=",";
                		str += num.substring(point, point+3);
                		point += 3;
                	}
    				totalPrice = str;
                    $('#rankingView1stPrice').html(totalPrice+'원');
                });
                
                $('#rankingView1stNick').html(rankingNick);
                var rankingViewBoxSize = $('#rankingView1stNickBox').css('width').replace('px','');
                rankingViewBoxSize = Number(rankingViewBoxSize) + 30;
                
                $('#rankingView1stNickBox').css('width', rankingViewBoxSize+'px');
                $('#rankingView1stNick').css('left','50%');
                $('#rankingView1stNick').css('top','50%');
                $('#rankingView1stNick').css('transform','translate(-50%,-50%)');
                
                for(var i=1; i<10; i++){
                	

	                	var num = data[i]['SUM(SELLPRICE)'] + ""; 
	                	var len = num.length;
	                	var point = num.length %3;

	                	str = num.substring(0, point);
	                	while(point < len){
	                		if(str != "") str +=",";
	                		str += num.substring(point, point+3);
	                		point += 3;
	                	}
	    				totalPrice2 = str;
	    				data[i]['SUM(SELLPRICE)'] = str;

                }
                
                for(var i =0; i<rankingSize; i++){
                    var rankingNick2 = data[i+1]['MEMBERNAME'];
                    var totalPrice2 = data[i+1]['SUM(SELLPRICE)'];
                          
                    $('#rankingViewBody').append('<div class="rankingViewBox"></div>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewLogo"></div>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewPriceBox"></div>');
                    $('.rankingViewBox:eq('+i+') .rankingViewPriceBox').append('<p class="rankingViewPriceTitle"></p>');
                    $('.rankingViewBox:eq('+i+') .rankingViewPriceBox').append('<p class="rankingViewPrice">'+totalPrice2+'원</p>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewNickBox"></div>');
                    $('.rankingViewBox:eq('+i+') .rankingViewNickBox').append('<p class="rankingViewNick">'+rankingNick2+'</p>');
                    $('#rankingViewBody').append('<div class="rankingWidthBar"></div>');
                    
                }

        	},
        	error: function(){
        		console.log('통신실패');
        	}

        });

    });
    
    $('#reviewShowBox').click(function(){
        setTimeout(function(){
            $('#reviewModalWrap').css('display','block');    
        },10);
        setTimeout(function(){
            $('#reviewModalWrap').css('opacity','0.4');    
        },30);



        setTimeout(function(){
            // $('#reviewModalContent').css('opacity','1');
            $('#reviewModalContent').css('height','10px');
            $('#reviewModalContent').css('width','700px');
        },10);
        setTimeout(function(){
            $('#reviewModalContent').css('height','750px');
        },450);

    })

    $('#reviewModalDelete').click(function(){
        setTimeout(function(){
            $('#reviewModalWrap').css('opacity','0');    
        },10);
        setTimeout(function(){
            $('#reviewModalWrap').css('display','none');    
        },1000);
 
        setTimeout(function(){
            $('#reviewModalContent').css('height','10px');
        },10);
        setTimeout(function(){
            $('#reviewModalContent').css('height','0px');
            $('#reviewModalContent').css('width','0px');
        },650);
    })

    $(document).on('click','#rankingDetailViewDelete', function(){
        $('#rankingDetailViewBody').css('width','0px');
        $('#rankingDetailViewBody').css('opacity','0');
    })
    $(document).on('click','.rankingViewBox',function(){
        var viewPosition = $(this).position().top;
        // $.ajax{}
        var good =99;
        var allWork =3643;
        var major = "프로그래밍";

        if($('#rankingViewBody').css('height') == '639px'){
            viewPosition = vi	ewPosition-535;
            $('#rankingDetailViewBody').css('top',viewPosition+'px');
            $('#rankingDetailViewBody').css('width','300px');
            $('#rankingDetailViewBody').css('opacity','1');
        }
        else{
            viewPosition = viewPosition-1055;
            $('#rankingDetailViewBody').css('top',viewPosition+'px');
            $('#rankingDetailViewBody').css('width','300px');
            $('#rankingDetailViewBody').css('opacity','1');
        }
    })

    $('#rankingViewMore').click(function(){
        if($('#rankingViewBody').css('height') == '639px'){
            $('#rankingViewWrap').css('height','1160px');
            $('#rankingViewBody').css('height','1160px');
            
            var viewPosition = ($('#rankingDetailViewBody').position().top-860);
            $('#rankingDetailViewBody').css('top',viewPosition+'px');
    
        }
        else{
            $('#rankingViewWrap').css('height','639px');
            $('#rankingViewBody').css('height','639px');
            
            $('#rankingDetailViewBody').css('top','0px');
            $('#rankingDetailViewBody').css('width','0px')
            $('#rankingDetailViewBody').css('opacity','0')
        }
    })

    $('#rankingView1stBody').click(function(){
            if($('#rankingViewBody').css('height') == '639px'){

                $('#rankingDetailViewBody').css('top','-340px');
                $('#rankingDetailViewBody').css('width','300px');
                $('#rankingDetailViewBody').css('opacity','1');
            }
            else{

                $('#rankingDetailViewBody').css('top','-860px');
                $('#rankingDetailViewBody').css('width','300px');
                $('#rankingDetailViewBody').css('opacity','1');
            }
    });



    var famousContentRightCallback = true;
    $('#famousContentRight').click(function(){
        var leftVal =  $('.famousContent').css('left').replace('px','');

        if(famousContentRightCallback){
            if(leftVal != -2000){
                leftVal = Number(leftVal)-1000;
                $('.famousContent').css('left', leftVal+'px');
            }

            famousContentRightCallback = false;
            setTimeout(function(){
                famousContentRightCallback = true;
            },750);   
        }else{
            console.log('block');
        }

    });

    var famousContentLeftCallback = true;
    $('#famousContentLeft').click(function(){
        var leftVal =  $('.famousContent').css('left').replace('px','');

        if(famousContentLeftCallback){
            if(leftVal != 0){
                leftVal = Number(leftVal)+1000;

                $('.famousContent').css('left', leftVal+'px');
            }
            famousContentLeftCallback = false;
            setTimeout(function(){
                famousContentLeftCallback = true;
            },750);
        }else{
            console.log('block');
        }
    });

    </script>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 


