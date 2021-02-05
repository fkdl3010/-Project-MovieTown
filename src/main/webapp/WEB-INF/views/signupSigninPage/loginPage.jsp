<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
  <link rel="stylesheet" href="/movie/assets/style/singupSigninPageCss/loginPage.css"/>
</head>

<body>
  <div class="main-wrapper">
  	
    <div class="logo">
     <a href="main_page.do"><i class="fas fa-video fa-5x"></i></a>
    </div>
  
    	<div class="header">
      	<div class="heading">로그인</div>
      	<div class="heading-contents">무비콕에 오신 걸 환영합니다.</div>
    	</div>
    	<div class="control-form">
     	 <form class="login-form" id="loginForm" name="loginForm" method="post">
        	<input type="text" class="login-input" id="id" name="id" placeholder="아이디" />
        	<input type="password" class="login-input" id="pw" name="pw" placeholder="비밀번호" />
        	<input type="checkbox" name="rememberId" id="rememberId"/>
        	<label for="rememberId">아이디 저장</label>
        	<input type="button" value="로그인" class="login-btn" onclick="fn_login(this.form)" />
      	</form>
    	</div>
    	<div class="footer">
      	<a href="/movie/find_idpw_page.do"><span class="footer-link id-pw">아이디 / 비밀번호 찾기</span></a>
      	<a href="#" data-target="#layerpop" data-toggle="modal"><span class="footer-link signUp">회원가입</span></a>
    	</div>
  </div>

<script type="text/javascript">
	function fn_login(f){
		if(f.id.value == '' || f.pw.value == ''){
			alert('아이디와 비밀번호를 모두 입력하세요');
			return;
		} else {
			f.action="login.do";
			f.submit();
		}
	}
	
	window.onload = function(){
		if("${cookie.id.value}" != ""){
			document.querySelector('#id').value ="${cookie.id.value}";
			document.querySelector('#rememberId').checked = true;
		}
		
	}
	
	console.log("${cookie.id.value}");
	
</script>

  <!-- modal -->
  <div class="modal fade" id="layerpop" >
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- header -->
        <div class="modal-header">
          <!-- 닫기(x) 버튼 -->
          <button type="button" class="close" data-dismiss="modal">×</button>
          <!-- header title -->
          <h4 class="modal-title">개인 정보 수집 · 이용에 대한 동의</h4>
        </div>
        <!-- body -->
        <div class="modal-body">
            <%@ include file="privacyAgreementPage.jsp" %>
        </div>
        <!-- Footer -->
        <div class="modal-footer">
          <button type="button" id="close-btn" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>