<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
    <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
   
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/member.css" />
<style>

</style>
<script>   
    function fn_enroll_validate()
    {
        if($('input[name=idValid]')[0].value=='0')
        {
            alert('아이디 중복체크를 해주세요');
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


</script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-1">
                nav
            </div>
            <div class="col-md-10">
                <form action="" method="POST" onsubmit='return fn_enroll_validate()'>
                    <div class="row">
                        <div class="col-md-12 signUpTitle">
                            <h1>회원가입</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>프로필사진</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="file" accept="image/*" id='memberProfile' name='memberProfile' class='form-control' value=''required>
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>아이디</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="text" id='memberId' name='memberId' class='form-control' value='' placeholder="아이디 입력" required>
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type='button' onclick='fn_checkduplicate();' class='btn btn-primary' value='중복체크'>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>비밀번호</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="password" id='password' name='password' class='form-control' value='' placeholder="비밀번호 입력" required>
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>비밀번호확인</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="password" id='cpassword' name='cpassword' class='form-control' value='' placeholder="비밀번호 확인" required>
                        </div>
                        <div class="col-md-4 mb-2" id="ck_password">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>이름</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="text" id='memberName' name='memberName' class='form-control' value='' placeholder="이름 입력" required>
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>주민등록번호</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="text" id='memberNo' name='memberNo' class='form-control' value='' maxlength="6" placeholder="주민번호 앞 6자리" required>
                        </div>
                        <div class="col-md-1 mb-2 memberNo-center">
                            <span>-</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="password" id="memberNo2" name="memberNo2" class="form-control" value='' maxlength="7" placeholder="주민번호 뒤 7자리" required>
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>계좌번호</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class="form-control" id="bank">
                                <option value="국민은행">국민은행</option>
                                <option value="우리은행">우리은행</option>
                                <option value="신한은행">신한은행</option>
                                <option value="하나은행">하나은행</option>
                                <option value="농협은행">농협은행</option>
                            </select>
                        </div>
                        <div class="col-md-3 mb-2">
                            <input type="text" class='form-control' id='memberAccount' name='memberAccount' placeholder="계좌번호 입력" required>   
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type='button' onclick='fn_checkduplicate();' class='btn btn-primary' value='계좌인증'>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>연락처</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type="tel" class='form-control' id='memberPhone' name='memberPhone' maxlength="11" placeholder="연락처를 (-) 없이 입력해주세요" required>   
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>이메일</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="text" id='memberEmail' name='memberEmail' class='form-control' value='' placeholder="이메일" required>
                        </div>
                        <div class="col-md-1 mb-2 memberNo-center">
                            <span>@</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class='form-control' id='joinEmailDomain' name='joinEmailDomain' required>
                                <option value=''>
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
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>주소</span><span class="text-danger">*</span>
                        </div>
                        <div class="col-md-5 mb-2">
                            <input type='text' class='form-control' id ='addSearch' name='addSearch' placeholder='입력 하시려면 클릭하세요' required>
                            <input type='text' class='form-control' id="addDetail" name='addDetail' placeholder='상세 주소를 입력하세요' required>
                        </div>
                        <div class="col-md-4 mb-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <span>관심분야</span>
                        </div>
                        <div class="col-md-2 mb-2">
                            <label for="webDesign">웹디자인</label><input type='checkbox' name='interest' id="webDesign" value="웹디자인">
                        </div>
                        <div class="col-md-2 mb-2">
                            <label for="networkProtect">네트워크보안</label><input type='checkbox' name='interest' id="networkProtect" value="네트워크보안">
                        </div>
                        <div class="col-md-1 mb-2">
                            <label for="programming">개발</label><input type='checkbox' name='interest' id="programming" value="프로그래밍">
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
                aside
            </div>
        </div>
    </div>
</body>
</html>