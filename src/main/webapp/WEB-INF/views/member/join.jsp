<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="whatinput-types-initial whatinput-types-mouse" lang="ko" dir="ltr" data-whatinput="mouse" data-whatintent="mouse"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="https://cdn.playforum.net/image/logo/favicon.png">
<title>회원가입</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Roboto:wght@300;400;500;700&display=swap">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>

<!-- </script><script src="./회원정보 - 플레이포럼1_files/jquery.min.js.다운로드"></script> -->
<!-- <script src="./회원정보 - 플레이포럼1_files/what-input.js.다운로드"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/foundation.min.js"></script>
<!-- <script src="./회원정보 - 플레이포럼1_files/jquery.rwdImageMaps.min.js.다운로드"></script> -->
<!-- <script src="./회원정보 - 플레이포럼1_files/md5.js.다운로드"></script> -->
<!-- <script src="./회원정보 - 플레이포럼1_files/js.cookie-2.2.1.min.js.다운로드"></script> -->
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


<script>
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);		
	var telCheck = RegExp(/^[0-9]{11}$/);		 
	// 아이디 체크 함수
	function userIdCheck(user_id) {
		var userIdCheck = RegExp(/^[a-z0-9_\-@]{5,10}$/);  // 영문소문자 or 숫자 or _-@ , 5~10 글자만
		if(!userIdCheck.test(user_id)) return false;
		return true;
	}

	$(document).ready(function() {
		//아이디중복검사
		$('#findId_btn').on('click', function(){
			var $user_id = $(this).closest('form').find('#user_id');
			if($user_id.val() == ""){
				$("#user_id-div-p").html('아이디를 입력해주세요.');
				$("#user_id-div").removeClass('success').addClass('alert').show();
				$user_id.focus();
				return;
			}else{
				
				if(userIdCheck($user_id.val()) === false) {
					$("#user_id-div-p").html('5~10자의 영문소문자, 숫자와 특수기호(_),(-),(@)만 사용 가능합니다.');
					$("#user_id-div").removeClass('success').addClass('alert').show();
					$user_id.focus();
					return;			
				}
				$.ajax({
					type: "POST",
					url:  "findId",
					data: { "user_id" : $user_id.val() },
					dataType : 'text',					
					success: function(res){
						if(res.trim() == "Y") {	
							$("#user_id-div-p").html($user_id.val() + '는 이미 사용중이거나 사용할수 없는 아이디입니다.');
							$("#user_id-div").removeClass('success').addClass('alert').show();
						}else{
							$("#user_id-div-p").html($user_id.val() + '는 사용 가능한 아이디입니다.');
							$("#user_id-div").removeClass('alert').addClass('success').show();
							$('#checkMember').val('Y');
						}						
					},
					error:function(request, status, error){
						alert('ajax error!!!');
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
				});
			}
		});
		
		
		//submit 이벤트
		$('.member-join').on('submit','#memberRegForm', function(){			
			if($('#checkMember').val() != 'Y') {
				alert("회원가입여부를 확인 해주세요");
				return false;
			}
			if($('#user_id').val() == "") {
				alert("아이디를 바르게 입력하세요.");
				$('#user_id').focus();
				return false;
			}else{
				if(userIdCheck($('#user_id').val()) === false) {
					alert("5~10자의 영문 소문자, 숫자와 특수기호(_),(-),(@)만 사용 가능합니다.");
					$('#user_id').focus();
					return false;
				}
			}
						
			if($('#passwd1').val() == "") {
				alert("비밀번호를 바르게 입력하세요.");
				$('#passwd1').focus();
				return false;
			}
			if($('#passwd2').val() == "") {
				alert("비밀번호를 바르게 입력하세요.");
				$('#passwd2').focus();
				flag=1;
				return false;
			} 
			if($('#passwd1').val() != $('#passwd2').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#passwd1').focus();
				return false;
			}
			if($('#email').val() == "") {
				alert("이메일을 바르게 입력하세요.");
				$('#email').focus();
				return false;
			}
			if($('#email').val() != "") {
				if (!emailCheck.test($('#email').val())) {
					alert("이메일 주소 양식에 맞게 입력하세요.");
					$('#email').focus();
					return false;
				}								
			}
			if($('#tel').val() != "") {
				if (!telCheck.test($('#tel').val())) {
					alert("연락처를 바르게 입력하세요.");
					$('#tel').focus();
					return false;
				}								
			}
		});
				
	});
</script>

<meta class="foundation-mq"></head>
<body>


<div id="user-wrap" class="for-members">
	<div class="row expanded">
		<header class="mb-header">
			<h1 class="logo">
<!-- 				<a href="http://www.playforum.net/"> -->
<!-- 					<img src="./회원정보 - 플레이포럼1_files/toplogo_20220711112802.png" alt="플레이포럼">				</a> -->
			</h1>
		</header>
   
<!-- 회원가입 //-->
<div class="member-join mb-container">

	<!-- 약관동의 //-->
	<header class="join-header">
		<h1 class="join-header-title">회원정보</h1>
		<p class="join-header-guide">입력항목중 (<span class="user-point">*</span>) 는 필수입력 표시입니다.</p>
	</header>

	<form name="memberRegForm" id="memberRegForm" method="post" action="joinAct">	
		<input type="hidden" name="checkMember" id="checkMember" value="N">	
					
		<article id="member_info_article" class="mb-content" style="">
			<h3 class="join-subject">필수입력사항</h3>

				<!-- 회원ID //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label for="user_id" class="text-left medium-middle"><strong class="key-point">회원ID</strong></label>
					</div>
					<div class="medium-8 columns">
						<div class="input-group">
							<input type="text" name="user_id" id="user_id" class="input-group-field" placeholder="ID입력" title="회원ID" value="">
							<div class="input-group-button">
								<button type="button" onclick="return false;" id="findId_btn" class="button secondary small">중복검사</button>
							</div>
						</div>
					</div>
				</fieldset>

				<div id="user_id-div" class="dis-none success callout" data-closable="">
					<p id="user_id-div-p" class="padright-25"></p>
					<button class="close-button" aria-label="Dismiss alert" type="button" data-close="">
						<span>×</span>
					</button>
				</div>
				<!--// 회원ID -->
			
				<!-- 비밀번호 //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label for="passwd1" class="text-left medium-middle"><strong class="key-point">비밀번호</strong></label>
					</div>
					<div class="medium-8 columns">
						<input type="password" name="passwd1" id="passwd1" placeholder="비밀번호 입력" title="비밀번호">
						<span class="help-text marbtm-16">영문, 숫자, 특수문자 중 2가지 이상 조합하여 8~32자 내로 입력.</span>
					</div>
				</fieldset>
				<!--// 비밀번호 -->

				<!-- 비밀번호확인 //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label for="passwd2" class="text-left medium-middle"><strong class="key-point">비밀번호확인</strong></label>
					</div>
					<div class="medium-8 columns">
						<input type="password" name="passwd2" id="passwd2" placeholder="비밀번호 검증을 위한 입력" title="비밀번호확인">
					</div>
				</fieldset>
				<!--// 비밀번호확인 -->
				
				<!-- 이메일 //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label for="email" class="text-left medium-middle"><strong class="key-point">email</strong></label>
					</div>
					<div class="medium-8 columns">
						<input type="text" name="email" id="email" placeholder="email@norida.com" title="email">
					</div>
				</fieldset>
				<!--// 이메일 -->
			
				<!-- 연락처 //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label class="text-left medium-middle"><strong>연락처</strong></label>
					</div>
					<div class="medium-8 columns">
						<input type="number" name="tel" id="tel" maxlength="11" placeholder="입력시 ( - ) 를 제외한 번호만 입력" title="연락처">
					</div>					
				</fieldset>
				<!--// 연락처 -->		

				<!-- 이벤트 등 프로모션 알림 메일 수신 //-->
				<fieldset class="row expanded small-collapse medium-uncollapse">
					<div class="medium-4 columns">
						<label class="text-left medium-middle"><strong class="key-point">알림메일</strong></label>
					</div>
					<div class="medium-8 columns">
						<div class="radio-group nd-pink">
							<input type="radio" name="letter" id="letter-y" title="이벤트 등 프로모션 알림 메일 수신희망" value=1 checked=""> 
							<label for="letter-y">수신희망</label>
							<input type="radio" name="letter" id="letter-n" title="이벤트 등 프로모션 알림 메일 수신거부" value=0> 
							<label for="letter-n">수신거부</label>
						</div>
						<span class="help-text marbtm-16">※ 이벤트, 프로모션 등 알림</span>
					</div>
				</fieldset>
				<!--// 이벤트 등 프로모션 알림 메일 수신 -->
			
			
			<button class="button user-bg large expanded martop-25">등록하기</button>
		</article>

	</form>
	</div>
		<footer class="mb-footer">
			©
			<span class="user-point">노르디아</span>			All rights reserved.
		</footer>
	</div>
</div>
<!--// user wrap -->
</body>
</html>
