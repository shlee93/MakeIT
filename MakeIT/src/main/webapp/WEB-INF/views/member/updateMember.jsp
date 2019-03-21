<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<%
	List<String> interestList = (List)request.getAttribute("interestList");
%>
<!-- Member CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />
<style>
.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}



/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        	<div style='position:fixed; margin-top: 10em;'>
    			<span onclick='fn_back()' style='cursor:pointer; font-size: 4em;'><i class="fas fa-arrow-circle-left"></i></span>    				           
          	 	<script>
           			function fn_back()
	           		{
	           			history.back();
	           		}
	           	</script>
           	</div>
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12 signUpTitle">
					<h1>정보수정</h1>
                </div>
            </div>
            <form name='updateFrm' id="updateFrm" action="${path }/member/memberUpdateEnd.do" method="POST" onsubmit='return fn_enroll_validate()' enctype="multipart/form-data">
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                	<div class="col-md-2 mb-2">
	                    <c:if test="${member.MEMBERLEVEL==1 }">
							<span>프로필사진</span><span class="text-danger">*</span>
						</c:if>
						<c:if test="${member.MEMBERLEVEL==2 }">
							<span>회사사진</span><span class="text-danger">*</span>
						</c:if>
					</div>
                    <div class="col-md-6 mb-2">
	                    <div class="filebox bs3-primary preview-image">
	                    	<div class="upload-display">
	                    		<div class="upload-thumb-wrap">
	                    			<c:if test="${member.REIMG != null }">
		                    			<img src="${path }/resources/upload/member/${member.REIMG}" class="upload-thumb">
		                            </c:if>
		                            <c:if test="${member.REIMG == null }">
		                            	<img src="${path }/resources/image/logo1.png" alt=""/>
		                            </c:if>
                    			</div>
                   			</div>
				            <label for="memberProfile">사진 선택</label> 
				            <input type="file" name="memberProfile" id="memberProfile" class="upload-hidden" accept=".gif, .jpg, .png">
				            <input type="hidden" name="profileImg" id="profileImg" value="${member.REIMG }">
				        </div>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>아이디</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="text" id='memberId' name='memberId' class='form-control' value='${member.MEMBERID }' placeholder="아이디 입력" readonly>
                        <input type='hidden' name='idValid' value='1'>
                        <input type="hidden" name="memberLevel" value="${member.MEMBERLEVEL }">
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${member.MEMBERLEVEL==1 }">
                        	<span>이름</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${member.MEMBERLEVEL==2 }">
                        	<span>회사명</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="text" id='memberName' name='memberName' class='form-control' value='${member.MEMBERNAME }' placeholder="이름 입력" required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                    	<c:if test="${member.MEMBERLEVEL==1 }">
                        	<span>생년월일</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${member.MEMBERLEVEL==2 }">
                        	<span>사업개시일</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="date" id='birth' name='birth' class='form-control' value='${member.BIRTH }' required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>계좌번호</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select class="form-control" id="bank" name="bank">
                        	<option disabled selected>은행을 선택하세요</option>
                            <option value="001" ${member.BANKCODE=='001'?'selected':'' }>한국은행</option>
                            <option value="010" ${member.BANKCODE=='010'?'selected':'' }>KDB산업은행</option>
                            <option value="011" ${member.BANKCODE=='011'?'selected':'' }>IBK기업은행</option>
                            <option value="012" ${member.BANKCODE=='012'?'selected':'' }>한국수출입</option>
                            <option value="020" ${member.BANKCODE=='020'?'selected':'' }>NH농협은행</option>
                            <option value="021" ${member.BANKCODE=='021'?'selected':'' }>SH수협은행</option>
                            <option value="030" ${member.BANKCODE=='030'?'selected':'' }>신한은행</option>
                            <option value="031" ${member.BANKCODE=='031'?'selected':'' }>KB국민은행</option>
                            <option value="032" ${member.BANKCODE=='032'?'selected':'' }>우리은행</option>
                            <option value="033" ${member.BANKCODE=='033'?'selected':'' }>SC제일은행</option>
                            <option value="034" ${member.BANKCODE=='034'?'selected':'' }>씨티은행</option>
                            <option value="035" ${member.BANKCODE=='035'?'selected':'' }>KEB하나은행</option>
                            <option value="040" ${member.BANKCODE=='040'?'selected':'' }>DGB대구은행</option>
                            <option value="041" ${member.BANKCODE=='041'?'selected':'' }>BNK부산은행</option>
                            <option value="042" ${member.BANKCODE=='042'?'selected':'' }>광주은행</option>
                            <option value="043" ${member.BANKCODE=='043'?'selected':'' }>제주은행</option>
                            <option value="044" ${member.BANKCODE=='044'?'selected':'' }>전북은행</option>
                            <option value="045" ${member.BANKCODE=='045'?'selected':'' }>BNK경남은행</option>
                            <option value="050" ${member.BANKCODE=='050'?'selected':'' }>케이뱅크</option>
                            <option value="051" ${member.BANKCODE=='051'?'selected':'' }>카카오뱅크</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-2">
                        <input type="text" class='form-control' id='memberAccount' name='memberAccount' placeholder="계좌번호 입력" value="${member.ACCOUNT }" required>   
                    </div>
                    <div class="col-md-3 mb-2">
                        <div id="account-danger" style="color: red;">입금받을 계좌번호를 입력하세요. 잘못 입력하여 생기는 불이익은 본 사이트는 책임지지 않습니다.</div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${member.MEMBERLEVEL==1 }">
                        	<span>연락처</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${member.MEMBERLEVEL==2 }">
                        	<span>대표연락처</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="tel" value="${member.PHONE }" class='form-control' id='memberPhone' name='memberPhone' maxlength="11" placeholder="연락처를 (-) 없이 입력해주세요" required>   
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                	<div class="col-md-2 mb-2">
                        <c:if test="${member.MEMBERLEVEL==1 }">
                        	<span>이메일</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${member.MEMBERLEVEL==2 }">
                        	<span>대표이메일</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-1 mb-2">
                        <input type="text" id='memberEmail' name='memberEmail' class='form-control' value='${email }' placeholder="이메일" required>
                    </div>
                    <div class="col-md-1 mb-2 memberNo-center">
                        <span>@</span>
                    </div>
                    <div class="col-md-2 mb-2">
                    	<input type="text" class="form-control" id="joinEmailDomain" name="joinEmailDomain" value='${domain }' placeholder="직접입력" required>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select class='form-control' id='emailDomain' name='emailDomain'>
                            <option value='' selected>
								직접입력
                            </option>
                            <option value='naver.com' ${domain=='naver.com'?'selected':'' }>
                                naver.com
                            </option>   
                            <option value='hanmail.net' ${domain=='hanmail.net'?'selected':'' }>
                                hanmail.net
                            </option>
                            <option value='gmail.com' ${domain=='gmail.com'?'selected':'' }>
                                gmail.com
                            </option>
                            <option value='hanmir.com' ${domain=='hanmir.com'?'selected':'' }>
                                hanmir.com
                            </option>
                            <option value='nate.com' ${domain=='nate.com'?'selected':'' }>
                                nate.com
                            </option>   
                        </select>
                    </div>
                    <div class="col-md-3 mb-2">
                    	<input type='button' onclick='fn_checkEmail();' class="btn btn-outline-info slidetopleft" value='이메일 인증'>
                    	<input type='hidden' name='emailValid' id="emailValid" value='1'>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${member.MEMBERLEVEL==1 }">
                        	<span>주소</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${member.MEMBERLEVEL==2 }">
                        	<span>회사주소</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type='text' class='form-control' id ='addSearch' name='addSearch' placeholder='입력 하시려면 클릭하세요' value="${firstAdd }" required>
                        <input type='text' class='form-control' id="addDetail" name='addDetail' placeholder='상세 주소를 입력하세요' value="${addDetail }" required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>관심분야</span>
                    </div>
                    <div class="col-md-2 mb-2">
                        <label for="webDesign">웹디자인</label><input type='checkbox' name='interest' id="webDesign" value="웹디자인"<%=interestList!=null && interestList.contains("웹디자인")?"checked":""%>>
                    </div>
                    <div class="col-md-2 mb-2">
                        <label for="networkProtect">네트워크보안</label><input type='checkbox' name='interest' id="networkProtect" value="네트워크보안"<%=interestList!=null && interestList.contains("네트워크보안")?"checked":""%>>
                    </div>
                    <div class="col-md-2 mb-2">
                        <label for="programming">개발</label><input type='checkbox' name='interest' id="programming" value="개발"<%=interestList!=null && interestList.contains("개발")?"checked":""%>>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <input type="submit" id="updateBtn" class="btn btn-outline-info slidetopleft" value="수정">
                    </div>
                    <div class="col-md-2">
                        <input type="button" id="cancleBtn" class="btn btn-outline-info slidetopleft" value="취소">
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </form>
        </div>
        <div class="col-md-1">
        </div>
		<form action="" name="checkIdDuplicateFrm">
			<input type="hidden" name="memberId"/>
		</form>
		<form action="" name="emailCheckFrm">
			<input type="hidden" name="email"/>
		</form>
    </div>
    
    
<script>	
$('#emailDomain').change(function(){
	var domain = $('#emailDomain').val().trim();
	
	$('#joinEmailDomain').val('');
	$('#joinEmailDomain').val(domain);
	
	if(domain != ''){
		$('#joinEmailDomain').attr('readonly','readonly');
	} else{
		$('#joinEmailDomain').removeAttr('readonly');
	}
});

var sel_files=[];
$(document).ready(function(){
   //preview image 
   var imgTarget = $('.preview-image .upload-hidden');

   imgTarget.on('change', function(e){
      var files=e.target.files;
       var filesArr=Array.prototype.slice.call(files);
       console.log(files);
       var parent = $(this).parent();
       parent.children('.upload-display').remove();
       console.log("수 : " + filesArr.length);
     if(filesArr.length > 5)
     {
        alert("사진은 5개 제한입니다.");
        return;
     }
       filesArr.forEach(function(f){
           if(!f.type.match("image.*")){
              alert("확장자는 이미지 확장자만 가능합니다.");
              return;
      
           }
           console.log(f)
           sel_files.push(f);
           
           var reader=new FileReader();
           reader.onload=function(e){
              var src = e.target.result;
               parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
           }
           
           reader.readAsDataURL(f);
        })
    });
});
function fn_checkEmail(){
	var email=$("#memberEmail").val().trim();
       
	if(!email || email.length<=0)
	{
	   alert("이메일을 입력하세요.");
	   return;   
	   
	}
	var domain=$('#joinEmailDomain').val().trim();
	if($('#joinEmailDomain').val().trim().length==0)
    {
        alert("이메일 도메인을 입력해주세요");
        $('#joinEmailDomain').focus();
        return false;
    }   
	var fullEmail = email+'@'+domain;
	console.log(fullEmail);
	var url="${path}/member/checkEmail";
	var title="이메일 인증";
	var shape="left=200px, top=100px, width=500px, height=300px";
	
	var popup=open("",title,shape);
	
	emailCheckFrm.email.value=fullEmail;
	emailCheckFrm.target=title;
	emailCheckFrm.action=url;
	emailCheckFrm.method="post";
	emailCheckFrm.submit();    
}

$('#addSearch').click(function(){
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                $('#addSearch').val(data.address);
            }
        }).open();
    });
});

$(function(){
    $("#account-danger").hide();
	$("#memberAccount").keyup(function(){
		$("#account-danger").show();
	});
});

			
    function fn_enroll_validate()
    {
    	if($('#profileImg').val().trim() == ""){
    		alert("사진을 선택해주세요");
    		$('#memberProfile').focus();
    		return false;
    	}
    	if($('input[name=emailValid]')[0].value=='0'){
        	alert('이메일 인증을 해주세요');
        	return false;
        }

    	if($('#addSearch').val().trim().length==0)
        {
            alert("주소를 검색해주세요");
            $('#addSearch').focus();
            return false;
        }
        
        if($('#addDetail').val().trim().length==0)
        {
            alert("상세주소를 입력해주세요");
            $('#addDetail').focus();
            return false;
        }
        
        var memberPhone = $('#memberPhone').val().trim();

        if(!/^[0-9]+$/.test(memberPhone))
        { 
            alert('핸드폰 번호는 숫자만 사용해야 합니다.'); 
            $('#memberPhone').focus();
            return false;
        }
        
        if($('#memberPhone').val().trim().length==0)
        {
            alert("핸드폰 번호를 입력해주세요");
            $('#memberPhone').focus();
            return false;
        }
        
        
        if($('#memberEmail').val().trim().length==0)
        {
            alert("메일 아이디를 입력해주세요");
            $('#memberEmail').focus();
            return false;
        }
        if($('#joinEmailDomain').val().trim().length==0)
        {
            alert("이메일 도메인을 입력해주세요");
            $('#joinEmailDomain').focus();
            return false;
        }   
        
        var memberAccount = $('#memberAccount').val().trim();
        
        if(!/^[0-9]+$/.test(memberAccount))
        { 
            alert('계좌번호는 숫자만 사용해야 합니다.'); 
            $('#memberAccount').focus();
            return false;
        }
        
        if($('#memberName').val().trim().length==0)
        {
            alert("이름을 입력하세요");
            $('#memberName').focus();
            return false;
        }
        
        if($('#birth').val().trim().length==0)
        {
            alert("생년월일 입력하세요");
            $('#birth').focus();
            return false;
        }

        return true;
    };      
    	
    $(function()
	{
	    fn_setDatePickerMax();
	});
	
	function fn_setDatePickerMax()
	{
	    var datePicker1 = document.getElementById('birth');
	    datePicker1.max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
	    console.log(datePicker1.val);
	   	    	
	 }
	
	$('#cancleBtn').click(function(){
		location.href = "${path}/member/memberMyPage.do";
	});
	$('#updateBtn').click(function(){
		$('#updateFrm').submit();
	})
    
    	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
