<!DOCTYPE html>
<!-- saved from url=(0043)https://www.playforum.net/member/login.html -->
<html class="whatinput-types-initial whatinput-types-mouse whatinput-types-keyboard" lang="ko" dir="ltr" data-whatinput="mouse" data-whatintent="mouse"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="https://cdn.playforum.net/image/logo/favicon.png">
<title>로그인 - 플레이포럼</title>
<link rel="canonical" href="https://www.playforum.net/">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/css2">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/foundation.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/custom.foundation.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/webfonts.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/font.style.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/media.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/autobox.style.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/templates.style.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/member.style.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/style.min.css">
<link rel="stylesheet" href="./로그인 - 플레이포럼_files/design.style.css"><script src="./로그인 - 플레이포럼_files/jquery.min.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/what-input.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/foundation.min.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/jquery.rwdImageMaps.min.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/md5.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/js.cookie-2.2.1.min.js.다운로드"></script>
<script src="./로그인 - 플레이포럼_files/common.js.다운로드"></script>

<!--[if lt IE 10]>
<link rel="stylesheet" href="https://cdn.playforum.net/css/style.ie9.css">
<script src="https://cdn.playforum.net/script/html5shiv.min.js"></script>
<![endif]-->

<style type="text/css">
/* 사이트 기본 색 */
.user-point {color:#ed5c26 !important}
.user-bg,.user-bg:hover,.user-bg:active,.user-bg:focus,li[id*="slick-"].slick-active button[data-role],.join-type-a:hover,
.nd-switch.user-bg input[type="checkbox"]:checked + label,.nd-switch.user-bg input[type="radio"]:checked + label,
.nd-switch.user-bg input[type="checkbox"]:checked + label::before,.nd-switch.user-bg input[type="radio"]:checked + label::before,
.switch-group.user-bg > .nd-switch input[type="checkbox"]:checked + label,.switch-group.user-bg > .nd-switch input[type="radio"]:checked + label
{background-color:#ed5c26 !important}
.user-border {border-color:#ed5c26 !important}
.nd-checkbox.check-pink input[type="checkbox"]:checked ~ .nd-checked::before, .nd-checkbox.check-pink input[type="radio"]:checked ~ .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"]:checked ~ .nd-checked::before, .nd-radio.radio-pink input[type="radio"]:checked ~ .nd-checked::before {background-color:#ed5c26 !important;border-color:#ed5c26 !important}
.nd-checkbox.check-pink input[type="checkbox"] + .nd-checked::before, .nd-checkbox.check-pink input[type="radio"] + .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"] + .nd-checked::before, .nd-radio.radio-pink input[type="radio"] + .nd-checked::before,
.checkbox-group.nd-pink input[type="radio"] + label::before, .checkbox-group.nd-pink input[type="checkbox"] + label::before,
.radio-group.nd-pink input[type="radio"] + label::before, .radio-group.nd-pink input[type="checkbox"] + label::before {border-color:#ed5c26 !important;opacity:.5}
.nd-checkbox.check-pink input[type="checkbox"]:checked + .nd-checked::before, .nd-checkbox.check-pink input[type="radio"]:checked + .nd-checked::before, 
.nd-radio.radio-pink input[type="checkbox"]:checked + .nd-checked::before, .nd-radio.radio-pink input[type="radio"]:checked + .nd-checked::before,
.checkbox-group.nd-pink input[type="radio"]:checked + label::before, .checkbox-group.nd-pink input[type="checkbox"]:checked + label::before,
.radio-group.nd-pink input[type="radio"]:checked + label::before, .radio-group.nd-pink input[type="checkbox"]:checked + label::before {background:#ed5c26 !important;border-color:transparent !important;opacity:1}

</style>
<script>

	$(document).ready(function(){
		loginform.getloadCookieId();
		$('#id_save', 'form#loginForm').on('click', function(e) {
			loginform.alertIdSaveCookie();	
		});
	});
	
	var loginform = {
		cookieName:md5("userLoginKey"),
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
	
			this.checkIdSaveCookie(this.$_user_id.val());
			$("form[name=loginForm]").submit();
		},
		//쿠키에서 아이디 로드
		getloadCookieId:function() {		
			if(Cookies.get(this.cookieName)) {
			    var jsonData = JSON.parse(Cookies.get(this.cookieName));
			    if(jsonData.bool === true && jsonData.key != "") {
			    	this.$_user_id.val(jsonData.key);
			    	this.$_id_save.attr("checked", true);
			    }
			}
			
			if(this.$_user_id.val() == "") this.$_user_id.focus();
			else this.$_user_pw.focus();
		},
		//아이디저장 추가
		checkIdSaveCookie:function(cVal) {
			var checkbool = this.$_id_save.is(':checked');
			if(checkbool === true) {
				var data = {'bool':checkbool, 'key':cVal};
				Cookies.set(this.cookieName, data, {expires:7});
			}else Cookies.remove(this.cookieName);
		},
		//아이디 저장 사용시 경고문구 출력
		alertIdSaveCookie:function() {
			var checkbool = this.$_id_save.is(':checked');
			if(checkbool === true) {
				alert('공공장소 PC인 경우는 보안을 위해 사용을 자제해주세요.');
			}
		}
	}
	
	function snslogin(tp, url, w, h) {
		window.open(url, "snslogin", "width="+w+", height="+h+", scrollbars=1");
	}
	
			$.ajax({
			type: "POST",
			url:  "/member/loginFail.ajax.php",
			cache: false,
			dataType : 'html',
			data: {},
			success: function(html){ 
				$('#chapcha_div').html(html);
				return false;
			},
			error:function(request,status,error){
				//alert('ajax통신 오류!!!');
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//self.location.reload();
			}
		});
	
</script>
<meta class="foundation-mq"></head>
<body class="">
<nav class="skip-nav">
	<a href="https://www.playforum.net/member/login.html#user-wrap" onclick="document.getElementById(&#39;user-wrap&#39;).tabIndex = -1;document.getElementById(&#39;user-wrap&#39;).focus();return false;" class="user-border"><span>본문 바로가기</span></a>
</nav><!--[if lt IE 10]>

<div id="user-wrap" class="for-members login-page">
	<div class="row expanded">
		<header class="mb-header">
			<h1 class="logo">
				<a href="http://www.playforum.net/">
					<img src="./로그인 - 플레이포럼_files/toplogo_20220711112802.png" alt="플레이포럼">				</a>
			</h1>
		</header>
<div class="mb-container">
	<h1 class="mb-titles">회원로그인</h1>
	<!-- 로그인 폼 //-->
	<form name="loginForm" id="loginForm" method="post" action="https://www.playforum.net/member/login.php">
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
	
	<a href="https://www.playforum.net/member/" class="mb-joins-link">아직 플레이포럼 회원이 아닌가요? <span class="user-point">회원가입</span></a>

	</div>

		<footer class="mb-footer">
			©
			<span class="user-point">플레이포럼</span>			All rights reserved.
		</footer>
	</div>
</div>
<!--// user wrap -->





</body></html>