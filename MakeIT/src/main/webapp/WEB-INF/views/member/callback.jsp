<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("ayo0PcF7e31pJS4Lbj1N", "http://localhost:9090/makeit/callback");
  // 접근 토큰 값 출력
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		var frm=opener.document.naverLoginform;
		frm.email.value=naver_id_login.getProfileData('email');
		frm.name.value=naver_id_login.getProfileData('name');
		frm.img.value=naver_id_login.getProfileData('profile_image');
		frm.token.value=naver_id_login.oauthParams.access_token;
		
		frm.submit();
		self.close();
	}
</script>
</body>
</html>