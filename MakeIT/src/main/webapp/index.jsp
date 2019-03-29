<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
   <jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

   <div id="famousContentWrap">
        <P id="famousContentTitle">인기 컨텐츠!<br/><p id="famousContentTitle2">시간 되시면 둘러보세요 :)</p>
        <div id="famousContentBody">
            <div id="famousContentLeft"><img src="${path }/resources/mainSource/image/leftWhite.png"/></div>
            <div id="famousContentRight"><img src="${path }/resources/mainSource/image/rightWhite.png"/></div>
        </div>
    </div>
    
    
    <div id="widthBar"></div>

    <div id="recentlyViewWrap">
        <p id="recentlyViewTitle">최근 본 페이지</p>

        <div id="recentlyViewBody">
        </div>
        <div id="recentlyViewLeft"><img src="${path }/resources/mainSource/image/leftBlack.png"/></div>
        <div id="recentlyViewRight"><img src="${path }/resources/mainSource/image/rightBlack.png"/></div>
    </div>

    <div id="similarContentWrap">
        <p id="similarContentTitle">관련 페이지</p>
        <div id="similarContentBody">
        </div>
    </div>

    <div id="widthBar"></div>

    <div id="rankingViewWrap">

        <div id="rankingViewAlign">
            
            <div id="rankingViewBody">
                <div id="rankingView1stBody">
                    <p id="rankingViewTitle">랭킹</p>
                    <div id="rankingView1stBox">
                        <div id="rankingView1stLogo"><img src="${path }/resources/mainSource/image/crownGold.png"/></div>
                        <div id="rankingView1stPriceBody">
                            <p id="rankingView1stPriceTitle">총 판매 금액</p>
                            <p id="rankingView1stPrice"></p>
                        </div>
                        <div id="rankingView1stNickBody">
                            <div id="rankingView1stNickBox">
                                <p id="rankingView1stNick"></p>
                                <p id="ranking1stId"></p>
                            </div>
                        </div>
                    </div> 
                </div>

                <div id="rankingViewMore"></div>
            </div>

            <div id="rankingDetailViewBody">
                <div id="rankingDetailViewNickBox">
                    <p id="rankingDetailViewNick"></p>
                    <p id="rankingDetailViewId" style="display:none"></p>
                    <div id="rankingDetailViewDelete"></div>
                </div>
                <div id="rankingDetailViewBox">
                    <p id="rankingDetailViewGood"></p>
                    <p id="rankingDetailViewWork"></p>
                    <p id="rankingDetailViewMajor"></p>
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
        <div id="reviewModalBody">
           <div id="reviewModalSort"></div>
        </div>
        
    </div>
    
    
    <script>
    $(function(){
       
       //최근 본 페이지
      $.ajax({
         url:"${path}/member/sawPage.do",
         dataType:"json",
         success: function(data){
            console.log(data);
            var dataSize = data["sellList"].length;
            var imgSrc;
            console.log(dataSize);

            for(var i=0; i<dataSize; i++){

               imgSrc = '${path}/resources/mainSource/image/recently'+ (i+1) +'.jpg';
               $('#recentlyViewBody').append("<div class='recentlyView'></div>");
               $('.recentlyView:last-child()').append("<img src="+imgSrc+" />");
               $('.recentlyView:last-child()').append("<div class='recentlyTitleBox'></div>");
               $('.recentlyView:last-child() .recentlyTitleBox').append("<p class='recentlyTitle'>"+data["sellList"][i]["SELLTITLE"]+"</p>");
               $('.recentlyView:last-child() .recentlyTitleBox').append("<p class='recentlysellNo' style='display:none'>"+data["sellList"][i]["SELLNO"]+"</p>");
               $('.recentlyView:last-child() .recentlyTitleBox').append("<p class='recentlyInterestNo' style='display:none'>"+data["sellList"][i]["INTERESTNO"]+"</p>");
               
            }
            var dataSize2 = data["similarList"].length;
            var sizeCheck =0;
            for(var i=0;i<dataSize2;i++){
               
               if(sizeCheck<5){
                  $('#similarContentBody').append("<div class='similarContent'><p>"+data["similarList"][i]["DETAILINTEREST"]+"</p></div>");   
               }
               sizeCheck++;
               
            
            }

         }
         ,error: function(){
            console.log('토유ㅐ!');
            var imgSrc;
            imgSrc = '${path}/resources/image/logo3.png';
            $('#recentlyViewBody').append("<div class='recentlyViewNoCookie'></div>");
            $('.recentlyViewNoCookie:last-child()').append("<img src="+imgSrc+" />");
            $('#recentlyViewBody').append("<p id='noCookieText'>최근 본 게시물이 없습니다 :)</p>");
             $('#recentlyViewBody').css('border','5px solid black');
             $('#similarContentTitle').css('opacity','0');
             $('#recentlyViewLeft').css('opacity','0');
             $('#recentlyViewRight').css('opacity','0');
         }
      });
      

       
    });
    
    $(document).on('mouseenter','.recentlyView',function(){
       $(this).children('img').css('transform','scale(1.2)');
       $(this).children('.recentlyTitleBox').children('.recentlyTitle').css('font-size','45px');
    });
    $(document).on('mouseleave','.recentlyView',function(){
       $(this).children('img').css('transform','scale(1)');
       $(this).children('.recentlyTitleBox').children('.recentlyTitle').css('font-size','35px');
    });
    $(document).on('click','.recentlyView',function(){
       var sellNo = $(this).children('.recentlyTitleBox').children('.recentlysellNo').text();
       location.href="${path }/sell/selldetail?sellno="+sellNo;
    });
    $(document).on('click','.similarContent',function(){
       
       var similarText = $(this).children('p').text();
       var locationNo;
       console.log(similarText);
       
       if(similarText == "웹"){
         locationNo = "1";
      }
      if(similarText == "모바일"){
         locationNo = "2";
      }
      if(similarText == "게임"){
         locationNo = "3";
      }
      if(similarText == "응용프로그램"){
         locationNo = "4";
      }
      if(similarText == "보안프로그램"){
         locationNo = "5";
      }
      if(similarText == "DB관리"){
         locationNo = "6";
      }
      if(similarText == "웹 디자인"){
         locationNo = "7";
      }
      if(similarText == "웹 퍼블리셔"){
         locationNo = "8";
      }
      if(similarText == "게임 디자인"){
         locationNo = "9";
      }
      if(similarText == "모의해킹"){
         locationNo = "10";
      }
      if(similarText == "침해대응"){
         locationNo = "11";
      }
      if(similarText == "보안관제"){
         locationNo = "12";
      }
      if(similarText == "컨설턴트"){
         locationNo = "13";
      }
      
       location.href="${path }/sell/sellmain.do?sCategoryFlag="+locationNo;
    });

    
    var recentlyViewRightCallback = true;
    var recentlyIndexCheck =0;
    $(document).on('click','#recentlyViewRight',function(){
       
       
        var leftVal =  $('.recentlyView').css('left').replace('px','');
      var imgSize = $('.recentlyView').prevAll().length;
      console.log(imgSize);
        if(recentlyViewRightCallback){

            if(leftVal != -800 * Number(imgSize)){
                         
               //관련페이지 오른쪽 버튼 클릭 AJAX
               recentlyIndexCheck++;
               var interestNo = $('.recentlyView:eq('+recentlyIndexCheck+')').children('.recentlyTitleBox').children('.recentlyInterestNo').text();
               console.log(interestNo);
               if(interestNo > 0){
                  
                  $.ajax({
                      url:"${path}/member/recentlyView.do",
                      dataType:"json",
                      data:{"interestNo":interestNo},
                      success: function(data){
                         console.log(data);
                        var dataSize = data.length;
                        var sizeCheck =0;
                        $('.similarContent').remove();
                        for(var i=0;i<dataSize;i++){
                           
                        if(sizeCheck<5){
                        $('#similarContentBody').append("<div class='similarContent'><p>"+data[i]["DETAILINTEREST"]+"</p></div>");   
                        
                        sizeCheck++;
                        }
                        }
                      },
                      error: function(){
                         console.log("실패~~");
                      }
                   })
               }
               
                leftVal = Number(leftVal)-800;
                console.log(leftVal);
                $('.recentlyView').css('left', leftVal+'px');
            }

            recentlyViewRightCallback = false;
            setTimeout(function(){
               recentlyViewRightCallback = true;
            },750);   
        }else{
            console.log('block');
        }

    });
    
    var recentlyViewLeftCallback = true;  
    $(document).on('click','#recentlyViewLeft',function(){
        var leftVal =  $('.recentlyView').css('left').replace('px','');
      
        if(recentlyViewLeftCallback){

            if(leftVal != 0){
               
               //관련페이지 왼쪽 버튼 클릭 AJAX
               recentlyIndexCheck--;
               var interestNo = $('.recentlyView:eq('+recentlyIndexCheck+')').children('.recentlyTitleBox').children('.recentlyInterestNo').text();
               console.log(interestNo);
               if(interestNo > 0){
                  
                  $.ajax({
                      url:"${path}/member/recentlyView.do",
                      dataType:"json",
                      data:{"interestNo":interestNo},
                      success: function(data){
                         console.log(data);
                        var dataSize = data.length;
                        var sizeCheck =0;
                        $('.similarContent').remove();
                        for(var i=0;i<dataSize;i++){
                           
                        if(sizeCheck<5){
                        $('#similarContentBody').append("<div class='similarContent'><p>"+data[i]["DETAILINTEREST"]+"</p></div>");   
                        
                        sizeCheck++;
                        }
                        }
                      },
                      error: function(){
                         console.log("실패~~");
                      }
                   })
               }
               
                leftVal = Number(leftVal)+800;

                $('.recentlyView').css('left', leftVal+'px');
            }
            recentlyViewLeftCallback = false;
            setTimeout(function(){
               recentlyViewLeftCallback = true;
            },750);
        }else{
            console.log('block');
        }
    })
 
    
    
    $(function(){

         $.ajax({
           url:"${path}/member/famousView.do",
           dataType:"json",
           success: function(data){
              console.log(data);
                $('#famousContentBody').append("<div class='famousContent'><img src='${path}/resources/mainSource/image/famous1.jpg' /></div>");
                $('#famousContentBody').append("<div class='famousContent'><img src='${path}/resources/mainSource/image/famous2.jpg'/></div>");
                $('#famousContentBody').append("<div class='famousContent'><img src='${path}/resources/mainSource/image/famous3.jpg'/></div>");
                $('.famousContent:eq(0)').append("<div class='famousContentTitleBox'></div>");
                $('.famousContent:eq(1)').append("<div class='famousContentTitleBox'></div>");
                $('.famousContent:eq(2)').append("<div class='famousContentTitleBox'></div>");
                
                $('.famousContent:eq(0) .famousContentTitleBox').append("<p>"+data[0]["DETAILINTEREST"]+"</p>"); 
                $('.famousContent:eq(1) .famousContentTitleBox').append("<p>"+data[1]["DETAILINTEREST"]+"</p>"); 
                $('.famousContent:eq(2) .famousContentTitleBox').append("<p>"+data[2]["DETAILINTEREST"]+"</p>"); 
           },
           error: function(){
              console.log('통패~');
           }
            
         });
         
         $(document).on('mouseenter','.famousContent',function(){
            $(this).children('img').css('transform','scale(1.2)');
            $(this).children('.famousContentTitleBox').children('p').css('font-size','70px');
         });
         $(document).on('mouseleave','.famousContent',function(){
            $(this).children('img').css('transform','scale(1)');
            $(this).children('.famousContentTitleBox').children('p').css('font-size','50px');
         });
       $(document).on('click','.famousContent',function(){
          
          var famousTitle = $(this).children('.famousContentTitleBox').children('p').text();
          var locationNo;
          if(famousTitle == "웹"){
             locationNo = "1";
          }
          if(famousTitle == "모바일"){
             locationNo = "2";
          }
          if(famousTitle == "게임"){
             locationNo = "3";
          }
          if(famousTitle == "응용프로그램"){
             locationNo = "4";
          }
          if(famousTitle == "보안프로그램"){
             locationNo = "5";
          }
          if(famousTitle == "DB관리"){
             locationNo = "6";
          }
          if(famousTitle == "웹 디자인"){
             locationNo = "7";
          }
          if(famousTitle == "웹 퍼블리셔"){
             locationNo = "8";
          }
          if(famousTitle == "게임 디자인"){
             locationNo = "9";
          }
          if(famousTitle == "모의해킹"){
             locationNo = "10";
          }
          if(famousTitle == "침해대응"){
             locationNo = "11";
          }
          if(famousTitle == "보안관제"){
             locationNo = "12";
          }
          if(famousTitle == "컨설턴트"){
             locationNo = "13";
          }
          
           location.href="${path }/sell/sellmain.do?sCategoryFlag="+locationNo;
       })


        $.ajax({ //랭킹 컨텐츠
           url:"${path}/member/ranking.do",
           dataType:'json',
           success: function(data){
                 
                var rankingNick =data[0]['MEMBERNAME'];
                var totalPrice;
                var rankingSize = 9;
                var ranking1stId = data[0]['MEMBERID'];
                
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
                $('#ranking1stId').html(ranking1stId);
                var rankingViewBoxSize = $('#rankingView1stNickBox').css('width').replace('px','');
                rankingViewBoxSize = Number(rankingViewBoxSize) + 30;
                
                $('#rankingView1stNickBox').css('width', rankingViewBoxSize+'px');
                $('#rankingView1stNick').css('left','50%');
                $('#rankingView1stNick').css('top','50%');
                $('#rankingView1stNick').css('transform','translate(-50%,-50%)');
                
                for(var i=1; i<9; i++){
                   
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
                    var rankingId2 = data[i+1]['MEMBERID'];
                          
                    $('#rankingViewBody').append('<div class="rankingViewBox"></div>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewLogo"><img src="${path }/resources/mainSource/image/crownsilver.png"/></div>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewPriceBox"></div>');
                    $('.rankingViewBox:eq('+i+') .rankingViewPriceBox').append('<p class="rankingViewPriceTitle"></p>');
                    $('.rankingViewBox:eq('+i+') .rankingViewPriceBox').append('<p class="rankingViewPrice">'+totalPrice2+'원</p>');
                    $('.rankingViewBox:eq('+i+')').append('<div class="rankingViewNickBox"></div>');
                    $('.rankingViewBox:eq('+i+') .rankingViewNickBox').append('<p class="rankingViewNick">'+rankingNick2+'</p>');
                    $('.rankingViewBox:eq('+i+') .rankingViewNickBox').append('<p class="rankingId">'+rankingId2+'</p>');
                    $('#rankingViewBody').append('<div class="rankingWidthBar"></div>');
                    
                }

           },
           error: function(){
              console.log('통신실패');
           }

        });

    });
    
    //리뷰 모달 보여주기
    var reviewIntervalCheck;
    $('#reviewShowBox').click(function(){
       reviewIntervalCheck = true;
       
       var memberId = $('#rankingDetailViewId').text();
       
             $.ajax({
                url:"${path}/member/rankingViewMore.do",
                data:{"memberId":memberId},
                dataType:"json",
                success: function(data){
                   console.log(data);
                   
                    setTimeout(function(){
                         $('#reviewModalWrap').css('display','block');    
                     },10);
                     setTimeout(function(){
                         $('#reviewModalWrap').css('opacity','0.4');    
                     },30);

                     setTimeout(function(){
                         $('.reviewModalBox').remove();
                        
                         $('#reviewModalContent').css('height','10px');
                         $('#reviewModalContent').css('width','700px');
                          
                         var dataSize =data.length;
                         if(dataSize > 0){
                            console.log("이프문 실행~~~~~~~~~~");
                            for(var i=0; i<dataSize; i++){
                        
                                 $('#reviewModalSort').append('<div class="reviewModalBox"></div>');
                                 $('.reviewModalBox:last-child()').append('<div class="reviewStarBox"></div>');
                                 
                                 var starNum = data[i]['SELLREVIEWSTAR'];
                                 for(var i2=0;i2<5;i2++){
                             
                                    if(starNum != 0){
                                       $('.reviewModalBox:last-child() .reviewStarBox').append('<img class="reviewStar" src="${path}/resources/mainSource/image/reviewStar.png" />');
                                       starNum --;
                                    }else{
                                       $('.reviewModalBox:last-child() .reviewStarBox').append('<img class="reviewStar" src="${path}/resources/mainSource/image/eamptyReviewStar.png" />');
                                    }
                                     
                                 }
                                 $('.reviewModalBox:last-child()').append('<p class="reviewContent">'+data[i]['MEMBERID']+' - '+data[i]['SELLREVIEWCONTENT']+'</p>');
                                 $('.reviewModalBox:last-child()').append('<p class="reviewSellNo" style="display:none">'+data[i]['SELLNO']+'</p>')
                            }
                            
                            //모달리뷰 애니메이션 인터벌
                             var reviewModalMove = setInterval(function() {
                            
                                if(reviewIntervalCheck == true){
                                 var modalTop = $('#reviewModalSort').css('top').replace('px','');
                                 var modalHeight = $('#reviewModalSort').css('height').replace('px','');
                                 console.log(modalHeight);
                                 modalHeight = modalHeight - modalHeight*2;
                                 modalTop = Number(modalTop) - 170;
                                 console.log("탑값 : "+modalTop+" /모달 높이 : "+modalHeight);
                                 $('#reviewModalSort').css('top',modalTop+'px');
                                 
                                 //모달리뷰 다보면 꺼지는 이벤트
                                 if(modalTop < modalHeight){
                                    
                                    $(function(){
                                       
                                        reviewIntervalCheck = false;
                                        $('#reviewModalSort').css('top','0px');
                                        
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
                                    });
                                 }
                                
                                }else{
                                   clearInterval(reviewModalMove);
                                }
                                  
                              
                           },3000);
                         }else{
                            
                             setTimeout(function(){
                                reviewIntervalCheck = false;
                                $('#reviewModalSort').css('top','0px');
                                
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
                                 
                             },1000);   
                         }
                         
                     },10);
                     
                     $(document).on('click','.reviewModalBox',function(){
                       
                       var sellNo = $(this).children('.reviewSellNo').text();
                       console.log(sellNo);
    
                        location.href="${path }/sell/selldetail?sellno="+sellNo;
                     });

                     
                     
                     setTimeout(function(){
                         $('#reviewModalContent').css('height','750px');
                     },450);              
                }
            })    
       
       
    })

    $('#reviewModalDelete').click(function(){
       reviewIntervalCheck = false;
       $('#reviewModalSort').css('top','0px');
       
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
    
    //랭킹 디테일 보기 클릭 이벤트
    $(document).on('click','.rankingViewBox',function(){
        var viewPosition = $(this).position().top;
        
        var memberId = $(this).find('.rankingId').html();
            
        
        $.ajax({
           url:"${path}/member/rankingViewDetail.do",
           data:{"memberId":memberId},
           dataType:"json",
           success: function(data){
              console.log(data);   
              
               var starSize=0.0;
               var star = 0.0;
              var starSum=0.0;
              starSize = data["starList"].length; 
 
              
              for(var i=0; i<starSize; i++) {
                 star = data["starList"][i]["SELLREVIEWSTAR"];
                 
                 starSum += star;
              }

              var averageStar = starSum / starSize;
              if(starSize == 0){
                 averageStar = 'X ';
              }else{
                 averageStar = averageStar.toFixed(1);
              }
              
              $('#rankingDetailViewNick').html(data["majorList"][0]["MEMBERNAME"]);
              $('#rankingDetailViewId').html(data["majorList"][0]["MEMBERID"]);
               $('#rankingDetailViewGood').html("만족도 :"+averageStar+"/5"); 
               
               if(data["workList"][0] != null){
                  $('#rankingDetailViewWork').html("작업수: ("+data["workList"][0]["SUM(SELLSPECNO)"]+")");
               }else{
                  $('#rankingDetailViewWork').html("작업수: (0)");
               }
            
              $('#rankingDetailViewMajor').html("기술: "+data["majorList"][0]["INTERESTNO"]);
           }
        })

        if($('#rankingViewBody').css('height') == '639px'){
            viewPosition = viewPosition-535;
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

       var memberId = $('#ranking1stId').html();
       console.log(memberId);
        
        $.ajax({
           url:"${path}/member/rankingViewDetail.do",
           data:{"memberId":memberId},
           dataType:"json",
           success: function(data){
              console.log(data);   
              
               var starSize=0.0;
               var star = 0.0;
              var starSum=0.0;
              starSize = data["starList"].length; 
 
              
              for(var i=0; i<starSize; i++) {
                 star = data["starList"][i]["SELLREVIEWSTAR"];
                 
                 starSum += star;
              }

              var averageStar = starSum / starSize;
              if(starSize == 0){
                 averageStar = 'X ';
              }else{
                 averageStar = averageStar.toFixed(1);
              }
              
              $('#rankingDetailViewNick').html(data["majorList"][0]["MEMBERNAME"]);
              $('#rankingDetailViewId').html(data["majorList"][0]["MEMBERID"]);
               $('#rankingDetailViewGood').html("만족도 :"+averageStar+"/5"); 
               
               if(data["workList"][0] != null){
                  $('#rankingDetailViewWork').html("작업수: ("+data["workList"][0]["SUM(SELLSPECNO)"]+")");
               }else{
                  $('#rankingDetailViewWork').html("작업수: (0)");
               }
              $('#rankingDetailViewMajor').html("기술: "+data["majorList"][0]["INTERESTNO"]);
           }
        })
       
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

