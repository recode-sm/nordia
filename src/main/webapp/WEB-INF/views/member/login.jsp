<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/icon/d4.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/?family=Noto+Sans+KR:wght@300;400;500;700&family=Roboto:wght@300;400;500;700&display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.foundation.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webfonts.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autobox.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templates.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/design.style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontello.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/foundation.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<style type="text/css">
/* 사이트 기본 색 */
.user-point {color:#0099a4 !important}
.user-bg,.user-bg:hover,.user-bg:active,.user-bg:focus,li[id*="slick-"].slick-active button[data-role],.join-type-a:hover,
.nd-switch.user-bg input[type="checkbox"]:checked + label,.nd-switch.user-bg input[type="radio"]:checked + label,
.nd-switch.user-bg input[type="checkbox"]:checked + label::before,.nd-switch.user-bg input[type="radio"]:checked + label::before,
.switch-group.user-bg > .nd-switch input[type="checkbox"]:checked + label,.switch-group.user-bg > .nd-switch input[type="radio"]:checked + label
{background-color:#0099a4 !important}
.user-border {border-color:#0099a4 !important}
.nd-checkbox.check-pink input[type="checkbox"]:checked ~ .nd-checked::before, .nd-checkbox.check-pink input[type="radio"]:checked ~ .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"]:checked ~ .nd-checked::before, .nd-radio.radio-pink input[type="radio"]:checked ~ .nd-checked::before {background-color:#0099a4 !important;border-color:#0099a4 !important}
.nd-checkbox.check-pink input[type="checkbox"] + .nd-checked::before, .nd-checkbox.check-pink input[type="radio"] + .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"] + .nd-checked::before, .nd-radio.radio-pink input[type="radio"] + .nd-checked::before,
.checkbox-group.nd-pink input[type="radio"] + label::before, .checkbox-group.nd-pink input[type="checkbox"] + label::before,
.radio-group.nd-pink input[type="radio"] + label::before, .radio-group.nd-pink input[type="checkbox"] + label::before {border-color:#0099a4 !important;opacity:.5}
.nd-checkbox.check-pink input[type="checkbox"]:checked + .nd-checked::before, .nd-checkbox.check-pink input[type="radio"]:checked + .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"]:checked + .nd-checked::before, .nd-radio.radio-pink input[type="radio"]:checked + .nd-checked::before,
.checkbox-group.nd-pink input[type="radio"]:checked + label::before, .checkbox-group.nd-pink input[type="checkbox"]:checked + label::before,
.radio-group.nd-pink input[type="radio"]:checked + label::before, .radio-group.nd-pink input[type="checkbox"]:checked + label::before {background:#0099a4 !important;border-color:transparent !important;opacity:1}

</style>

<script type="text/javascript">
	$(document).ready(function(){		
	//		loginform.getloadCookieId();
		$('#id_save', 'form#loginForm').on('click', function(e) {
			loginform.alertIdSaveCookie();	
		});
	});

</script>

<title>로그인 - nordia</title>
</head>
<body>
<div id="user-wrap" class="for-members login-page">
	<div class="row expanded">
<!-- 		<header class="mb-header"> -->
<!-- 			<h1 class="logo"> -->
<!-- 				<a href="http://www.playforum.net/"> -->
<!-- 					<img src="./로그인 - 플레이포럼_files/toplogo_20220711112802.png" alt="플레이포럼">				</a> -->
<!-- 			</h1> -->
<!-- 		</header> -->

			<div class="mb-container">
				<h1 class="mb-titles">회원로그인</h1>
				<!-- 로그인 폼 //-->
				<form name="loginForm" id="loginForm" method="post" action="loginAct">
					<input type="hidden" name="backUrl" value="">
			
					<fieldset>
						<label for="user_id" class="show-for-sr">로그인</label>
						<input type="text" name="user_id" id="user_id" class="xlarge marbtm-5" tabindex="1" placeholder="아이디" title="아이디">
					</fieldset>
			
					<fieldset>
						<label for="user_pw" class="show-for-sr">비밀번호</label>
						<input type="password" name="user_pw" id="user_pw" class="xlarge marbtm-5" tabindex="2" placeholder="비밀번호" title="비밀번호">
					</fieldset>
					
					<div id="chapcha_div"></div>
			
						<div id="loginForm-div" class="success callout" style="display:none;" data-closable="">
							<p id="loginForm-div-p"></p>
							<button class="close-button" aria-label="Dismiss alert" type="button" data-close="">
								<span>×</span>
							</button>
						</div>
					
						<div class="row collapse small-up-1 medium-up-2 mary-15">
							<div class="columns">
								<label class="nd-checkbox check-pink">
								<input type="checkbox" name="id_save" id="id_save"> 
								<span class="nd-checked">아이디 저장</span>
								</label>
							</div>
							<div class="columns">
							<!-- 로그인메뉴 //-->
								<div class="member-links">
									<a href="https://www.playforum.net/member/findMyInfo.html#find-id">아이디 찾기</a>
									<a href="https://www.playforum.net/member/findMyInfo.html#find-pw">비밀번호 찾기</a>
								</div>
							<!--// 로그인메뉴 -->
							</div>
						</div>
			
					<button type="submit" class="button expanded large user-bg mary-25" tabindex="3" onclick="javascript:loginform.checkLogin();return false;">로그인</button>
				</form>
				<!--// 로그인 폼 -->
	
				<a href="join" class="mb-joins-link">아직 플레이포럼 회원이 아닌가요? <span class="user-point">회원가입</span></a>

		</div>
		
		
<script>	
	var loginform = {
		$_user_id:$('#user_id', 'form#loginForm'),
		$_user_pw:$('#user_pw', 'form#loginForm'),
		$_id_save:$('#id_save', 'form#loginForm'),
		checkLogin:function(){
			if(this.$_user_id.val() == ''){
				$("#loginForm-div-p").html('아이디를 입력하세요');
				$("#loginForm-div").removeClass('success').addClass('alert').show();
				this.$_user_id.focus();
				return false;
			}
			if(this.$_user_pw.val() == ''){
				$("#loginForm-div-p").html('비밀번호를 입력하세요');
				$("#loginForm-div").removeClass('success').addClass('alert').show();
				this.$_user_pw.focus();
				return false;
			}
	
			$("form[name=loginForm]").submit();
		}		
	}	
</script>
		
		<footer class="mb-footer">
			©
			<span class="user-point">노르디아</span>			All rights reserved.
		</footer>
	</div>
</div>


</body>
</html>