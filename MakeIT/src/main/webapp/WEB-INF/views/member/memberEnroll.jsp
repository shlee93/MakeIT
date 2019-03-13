<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
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
        </div>
        <div class="col-md-10">
            <form name='signupform' action="${path }/member/memberEnrollEnd.do" method="POST" onsubmit='return fn_enroll_validate()' enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-12 signUpTitle">
                    	<c:if test="${memberLevel==1 }">
							<h1>개인회원가입</h1>
						</c:if>
						<c:if test="${memberLevel==2 }">
							<h1>기업회원가입</h1>
						</c:if>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                	<div class="col-md-2 mb-2">
	                    <c:if test="${memberLevel==1 }">
							<span>프로필사진</span><span class="text-danger">*</span>
						</c:if>
						<c:if test="${memberLevel==2 }">
							<span>회사사진</span><span class="text-danger">*</span>
						</c:if>
					</div>
                    <div class="col-md-6 mb-2">
                        <div class="filebox bs3-primary preview-image">
				           <label for="memberProfile">사진 선택</label> 
				           <input type="file" name="memberProfile" id="memberProfile" class="upload-hidden" accept=".gif, .jpg, .png"> 
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
                        <input type="text" id='memberId' name='memberId' class='form-control' value='' placeholder="아이디 입력" required>
                        <input type='hidden' name='idValid' value='0'>
                        <input type="hidden" name="memberLevel" value="${memberLevel }">
                    </div>
                    <div class="col-md-3 mb-2">
                        <input type='button' onclick='fn_checkduplicate();' class='btn btn-primary' value='중복체크'>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>비밀번호</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="password" id='password' name='password' class='form-control' value='' placeholder="비밀번호 입력" required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <span>비밀번호확인</span><span class="text-danger">*</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="password" id='cpassword' name='cpassword' class='form-control' value='' placeholder="비밀번호 확인" required>
                    </div>
                    <div class="col-md-3 mb-2" id="ck_password">
						<div id="alert-success" style="color: green;">비밀번호가 일치합니다.</div>
						<div id="alert-danger" style="color: red;">비밀번호가 일치하지 않습니다.</div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${memberLevel==1 }">
                        	<span>이름</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${memberLevel==2 }">
                        	<span>회사명</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="text" id='memberName' name='memberName' class='form-control' value='' placeholder="이름 입력" required>
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                    	<c:if test="${memberLevel==1 }">
                        	<span>생년월일</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${memberLevel==2 }">
                        	<span>사업개시일</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="date" id='birth' name='birth' class='form-control' value='' maxlength="6" placeholder="예시 : 900123" required>
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
                            <option value="001">한국은행</option>
                            <option value="010">KDB산업은행</option>
                            <option value="011">IBK기업은행</option>
                            <option value="012">한국수출입</option>
                            <option value="020">NH농협은행</option>
                            <option value="021">SH수협은행</option>
                            <option value="030">신한은행</option>
                            <option value="031">KB국민은행</option>
                            <option value="032">우리은행</option>
                            <option value="033">SC제일은행</option>
                            <option value="034">씨티은행</option>
                            <option value="035">KEB하나은행</option>
                            <option value="040">DGB대구은행</option>
                            <option value="041">BNK부산은행</option>
                            <option value="042">광주은행</option>
                            <option value="043">제주은행</option>
                            <option value="044">전북은행</option>
                            <option value="045">BNK경남은행</option>
                            <option value="050">케이뱅크</option>
                            <option value="051">카카오뱅크</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-2">
                        <input type="text" class='form-control' id='memberAccount' name='memberAccount' placeholder="계좌번호 입력" required>   
                    </div>
                    <div class="col-md-3 mb-2">
                        <input type='button' onclick='fn_accountCheck();' class='btn btn-primary' value='계좌인증'>
                        <input type='hidden' name='accountValid' id="accountValid" value='0'>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${memberLevel==1 }">
                        	<span>연락처</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${memberLevel==2 }">
                        	<span>대표연락처</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type="tel" class='form-control' id='memberPhone' name='memberPhone' maxlength="11" placeholder="연락처를 (-) 없이 입력해주세요" required>   
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${memberLevel==1 }">
                        	<span>이메일</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${memberLevel==2 }">
                        	<span>대표이메일</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-3 mb-2">
                        <input type="text" id='memberEmail' name='memberEmail' class='form-control' value='' placeholder="이메일" required>
                    </div>
                    <div class="col-md-1 mb-2 memberNo-center">
                        <span>@</span>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select class='form-control' id='joinEmailDomain' name='joinEmailDomain' required>
                            <option value=''disabled selected>
                                domain.com
                            </option>
                            <option value='naver.com'>
                                naver.com
                            </option>   
                            <option value='hanmail.net'>
                                hanmail.net
                            </option>
                            <option value='gmail.com'>
                                gmail.com
                            </option>
                            <option value='hanmir.com'>
                                hanmir.com
                            </option>
                            <option value='nate.com'>
                                nate.com
                            </option>   
                        </select>
                    </div>
                    <div class="col-md-3 mb-2">
                    	<input type='button' onclick='fn_checkEmail();' class='btn btn-primary' value='이메일 인증'>
                    	<input type='hidden' name='emailValid' id="emailValid" value='0'>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-1 mb-2"></div>
                    <div class="col-md-2 mb-2">
                        <c:if test="${memberLevel==1 }">
                        	<span>주소</span><span class="text-danger">*</span>
                        </c:if>
                        <c:if test="${memberLevel==2 }">
                        	<span>회사주소</span><span class="text-danger">*</span>
                        </c:if>
                    </div>
                    <div class="col-md-6 mb-2">
                        <input type='text' class='form-control' id ='addSearch' name='addSearch' placeholder='입력 하시려면 클릭하세요' required>
                        <input type='text' class='form-control' id="addDetail" name='addDetail' placeholder='상세 주소를 입력하세요' required>
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
                        <label for="webDesign">웹디자인</label><input type='checkbox' name='interest' id="webDesign" value="웹디자인">
                    </div>
                    <div class="col-md-2 mb-2">
                        <label for="networkProtect">네트워크보안</label><input type='checkbox' name='interest' id="networkProtect" value="네트워크보안">
                    </div>
                    <div class="col-md-2 mb-2">
                        <label for="programming">개발</label><input type='checkbox' name='interest' id="programming" value="개발">
                    </div>
                    <div class="col-md-3 mb-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <input type="submit" class="btn btn-primary" value="회원가입">
                    </div>
                    <div class="col-md-2">
                        <input type="button" class="btn btn-primary" value="취소">
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
		<form action="" name="accountCheckFrm">
			<input type="hidden" name="accountNo"/>
			<input type="hidden" name="bankCode"/>
		</form>
    </div>
    
    
<script>
	function fn_accountCheck(){
		var bankCode=$("#bank").val().trim();
	       
		if(!bankCode || bankCode.length<=0)
		{
		   alert("은행을 선택하세요.");
		   return;   
		   
		}
		var accountNo=$('#memberAccount').val().trim();
		if(!accountNo || accountNo.length<=0)
		{
		   alert("계좌번호를 입력하세요.");
		   return;   
		}
		var url="${path}/member/checkAccount";
		var title="계좌 인증";
		var shape="left=200px, top=100px, width=500px, height=300px";
		
		var popup=open("",title,shape);
		
		accountCheckFrm.accountNo.value=accountNo;
		accountCheckFrm.bankCode.value=bankCode;
		accountCheckFrm.target=title;
		accountCheckFrm.action=url;
		accountCheckFrm.method="post";
		accountCheckFrm.submit();    
	}
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
		if(!domain || domain.length<=0)
		{
		   alert("도메인을 선택하세요.");
		   return;   
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
        $("#alert-success").hide();
        $("#alert-danger").hide();
    	$("input").keyup(function(){
    	    var pwd1=$("#password").val();
    	    var pwd2=$("#cpassword").val();
    	    if(pwd1 != "" || pwd2 != ""){
    	        if(pwd1 == pwd2){
    	            $("#alert-success").show();
    	            $("#alert-danger").hide();
    	        }else{
    	            $("#alert-success").hide();
    	            $("#alert-danger").show();
    	        }    
    	    }
    	});
    });


    			
        function fn_enroll_validate()
        {
            if($('input[name=idValid]')[0].value=='0')
            {
                alert('아이디 중복체크를 해주세요');
                return false;   
            }
            
            if($('input[name=emailValid]')[0].value=='0'){
            	alert('이메일 인증을 해주세요');
            	return false;
            }
            
            if($('input[name=accountValid]')[0].value=='0'){
            	alert('계좌 인증을 해주세요');
            	return false;
            }
            
            if($('#memberId').val().trim().length==0)
            {
                alert("아이디를 입력하세요!");
                $('#memberId').focus();
                
                return false;   
            }
            
            if($('#password').val().trim().length==0)
            {
                alert("패스워드를 입력하세요!");
                $('#password').focus();
                return false;
            }
            
            var joinPw=$("#password").val().trim();
            

            if(!/^[a-zA-Z0-9]{8,20}$/.test(joinPw))
            { 
                alert('비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.'); 
                $('#password').focus();
                return false;
            }
            
            var chk_num = joinPw.search(/[0-9]/g); 
            var chk_eng = joinPw.search(/[a-z]/ig);
        
            if(chk_num < 0 || chk_eng < 0)
        
            { 
                alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
                $('#password').focus();
                return false;
            }    

            if($('#cpassword').val().trim().length==0)
            {
                alert("패스워드를 입력하세요!");
                $('#cpassword').focus();
                return false;
            }
            
            var joincPw=$("#cpassword").val().trim();
            
            if(!/^[a-zA-Z0-9]{8,20}$/.test(joinPw))
            { 
                alert('비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.'); 
                $('#cpassword').focus();
                return false;
            }
            
            var chk_cnum = joincPw.search(/[0-9]/g); 
            var chk_ceng = joincPw.search(/[a-z]/ig);
        

            if(chk_cnum < 0 || chk_ceng < 0)
            { 
                alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
                $('#cpassword').focus();
                return false;
            }    
            
            if(joinPw != joincPw){
            	alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
            	$('#cpassword').focus();
            	return false;
            }
            
            if($('#memberName').val().trim().length==0)
            {
                alert("이름을 입력하세요");
                $('#memberName').focus();
                return false;
            }
            
            if($('#memberNo').val().trim().length==0)
            {
                alert("주민등록번호를 입력하세요");
                $('#memberNo').focus();
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
            var f=document.signupform;
            if(f.joinEmailDomain.value=='')
            {
                alert("이메일 도메인을 선택해주세요");
                $('#joinEmailDomain').focus();
                return false;
            }   
            return true;
        };      

    	function fn_checkduplicate(){
    		var memberId=$("#memberId").val().trim();
       
    		if(!memberId || memberId.length<6)
    		{
    		   alert("아이디를 6글자 이상 입력하세요~!");
    		   return;   
    		   
    		}
    		
    		if(!/^[a-zA-Z0-9]{6,20}$/.test(memberId))
    		 { 
    		     alert('아이디는 숫자와 영문자 조합으로 6~20자리를 사용해야 합니다.'); 
    		     $('#memberId').focus();
    		     return false;
    		 }
    		var url="${path}/member/duplicateCheck";
    		var title="아이디 중복체크";
    		var shape="left=200px, top=100px, width=300px, height=200px";
    		
    		var popup=open("",title,shape);
    		
    		checkIdDuplicateFrm.memberId.value=memberId;
    		checkIdDuplicateFrm.target=title;
    		checkIdDuplicateFrm.action=url;
    		checkIdDuplicateFrm.method="post";
    		checkIdDuplicateFrm.submit();    
    	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
