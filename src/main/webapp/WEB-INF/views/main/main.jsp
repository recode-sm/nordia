<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="whatinput-types-initial whatinput-types-mouse" lang="ko" dir="ltr" data-whatinput="mouse" data-whatintent="mouse"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="./플레이포럼_files/f.txt"></script>

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=1100">


<link rel="shortcut icon" href="https://cdn.playforum.net/image/logo/favicon.png">
<title>플레이포럼</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Roboto:wght@300;400;500;700&display=swap">

<!-- <link rel="canonical" href="https://www.playforum.net/"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adManager.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.foundation.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webfonts.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autobox.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templates.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plugin.style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/design.style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menubar.css">







<script type="text/javascript" async="" src="./플레이포럼_files/analytics.js.다운로드"></script><script src="./플레이포럼_files/jquery.min.js.다운로드"></script>
<script src="./플레이포럼_files/jquery-ui.min.js.다운로드"></script>
<script src="./플레이포럼_files/slick.min.js.다운로드"></script>
<script src="./플레이포럼_files/jquery.rwdImageMaps.min.js.다운로드"></script>
<script src="./플레이포럼_files/what-input.js.다운로드"></script>
<script src="./플레이포럼_files/foundation.min.js.다운로드"></script>
<script src="./플레이포럼_files/menubar.js.다운로드"></script>
<script src="./플레이포럼_files/user.style.js.다운로드"></script>
<script src="./플레이포럼_files/clipboard.min.js.다운로드"></script>
<script src="./플레이포럼_files/jquery.timepicker.min.js.다운로드"></script>
<script src="./플레이포럼_files/jquery.tabslet.min.js.다운로드"></script>
<script src="./플레이포럼_files/common.js.다운로드"></script>


<script type="text/javascript">

	$(document).ready(function(e) {
		// 이미지맵
		$('img[usemap]').rwdImageMaps();
		bannerpop.banner(".banner_event_box");					// 기능성배너 이벤트
		bannerpopMulti.bannerLoad();                            // 멀티 기능성 배너 이벤트

		// 기사뷰 이미지관련
		
		// 기사본문 부분 복사하기 저작권 표시
		$('#article-view-content-div').on('copy', function(e){			
			var sel = window.getSelection();
			var copyFooter = "<br/><br/>출처 : 플레이포럼(https://www.playforum.net)<br/>";
			var copyHolder = $('<div>', {html: sel+copyFooter, id:'copy_text', style: {position: 'absolute', left: '-99999px'}});
			$('body').append(copyHolder);
			var str = $('#copy_text').html();
			$('#copy_text').html(str.replace(/(\r\n|\n|\r)/gm, "<br />"));
			sel.selectAllChildren( copyHolder[0] );
			window.setTimeout(function() {
				copyHolder.remove();
			},0);
		});
	});

	// 도메인
	var SITE_DOMAIN = 'https://www.playforum.net'
	,___currentTime	= 1669545257;

	// 즐겨찾기 스크립트
	function bookmark() {
		window.external.AddFavorite("https://www.playforum.net", "플레이포럼")
	}

</script>

<style type="text/css">
/* 사이트 기본 색 */
.user-point,a.user-point,
.poll-columns .poll-state.going
{color:#ed5c26 !important}
.user-bg,.user-bg:hover,.user-bg:active,.user-bg:focus,li[id*="slick-"].slick-active button[data-role],.tabs .is-active a,
.checkbox-group > input[type="radio"]:checked + label::before, .checkbox-group > input[type="checkbox"]:checked + label::before,
.radio-group > input[type="radio"]:checked + label::before, .radio-group > input[type="checkbox"]:checked + label::before,
.poll-view .poll-view-state.going,.poll-view .poll-radio input[type="radio"]:checked + label::before,.poll-view .poll-radio input[type="checkbox"]:checked + label::before,
.nd-switch.user-bg input[type="checkbox"]:checked + label,.nd-switch.user-bg input[type="radio"]:checked + label,
.nd-switch.user-bg input[type="checkbox"]:checked + label::before,.nd-switch.user-bg input[type="radio"]:checked + label::before,
.switch-group.user-bg > .nd-switch input[type="checkbox"]:checked + label,.switch-group.user-bg > .nd-switch input[type="radio"]:checked + label
{background-color:#ed5c26 !important}
.user-border,
.checkbox-group input[type="checkbox"] + label::before, .checkbox-group input[type="radio"] + label::before,
.radio-group input[type="checkbox"] + label::before, .radio-group input[type="radio"] + label::before,
.poll-view .poll-radio input[type="radio"] + label:hover strong::before,.poll-view .poll-radio input[type="checkbox"] + label:hover strong::before,
.poll-view .poll-radio input[type="radio"]:checked + label  strong::before,.poll-view .poll-radio input[type="checkbox"]:checked + label  strong::before,
#gallery-wrap .gallery-content.view-page .gallery-thumb .nav-content.slick-current::before
{border-color:#ed5c26 !important}
.user-border-top {border-top-color:#ed5c26 !important}
.user-border-bottom {border-bottom-color:#ed5c26 !important}
.user-border-left {border-left-color:#ed5c26 !important}
.user-border-right {border-right-color:#ed5c26 !important}
.checkbox-group input[type="checkbox"] + label::before, .checkbox-group input[type="radio"] + label::before,
.radio-group input[type="checkbox"] + label::before, .radio-group input[type="radio"] + label::before {opacity:.3}
.checkbox-group > input[type="radio"]:checked + label::before, .checkbox-group > input[type="checkbox"]:checked + label::before,
.radio-group > input[type="radio"]:checked + label::before, .radio-group > input[type="checkbox"]:checked + label::before {opacity:initial}

/* view */
@media screen and (max-width: 1220px) {
	#sticky-header .aht-btn {display:none !important}
}


/* site size */
.width-1100 {width:1100px}
.max-width-1100 {max-width:1100px}
.min-width-1100 {min-width:1100px}
</style>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async="" src="./플레이포럼_files/js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53779474-1');
</script>

<script type="text/javascript" src="./플레이포럼_files/wcslog.js.다운로드"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "14e739f88564984";
if(window.wcs) {
  wcs_do();
}
</script>
<meta class="foundation-mq"><meta http-equiv="origin-trial" content="Az6AfRvI8mo7yiW5fLfj04W21t0ig6aMsGYpIqMTaX60H+b0DkO1uDr+7BrzMcimWzv/X7SXR8jI+uvbV0IJlwYAAACFeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A+USTya+tNvDPaxUgJooz+LaVk5hPoAxpLvSxjogX4Mk8awCTQ9iop6zJ9d5ldgU7WmHqBlnQB41LHHRFxoaBwoAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A7FovoGr67TUBYbnY+Z0IKoJbbmRmB8fCyirUGHavNDtD91CiGyHHSA2hDG9r9T3NjUKFi6egL3RbgTwhhcVDwUAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="></head>
<body class=" " style="">
<nav class="skip-nav">
	<a href="https://www.playforum.net/#user-menu" onclick="document.getElementById(&#39;user-menu&#39;).tabIndex = -1;document.getElementById(&#39;user-menu&#39;).focus();return false;" class="user-border"><span>주요서비스 바로가기</span></a>
	<a href="https://www.playforum.net/#user-container" onclick="document.getElementById(&#39;user-container&#39;).tabIndex = -1;document.getElementById(&#39;user-container&#39;).focus();return false;" class="user-border"><span>본문 바로가기</span></a>
	<a href="https://www.playforum.net/#user-footer" onclick="document.getElementById(&#39;user-footer&#39;).tabIndex = -1;document.getElementById(&#39;user-footer&#39;).focus();return false;" class="user-border"><span>매체정보 바로가기</span></a>
	<a href="https://www.playforum.net/#userLogin" onclick="document.getElementById(&#39;userLogin&#39;).tabIndex = -1;document.getElementById(&#39;userLogin&#39;).focus();return false;" class="user-border"><span>로그인 바로가기</span></a>
	<a href="https://www.playforum.net/#userSearch" onclick="document.getElementById(&#39;userSearch&#39;).tabIndex = -1;document.getElementById(&#39;userSearch&#39;).focus();return false;" class="user-border"><span>기사검색 바로가기</span></a>
	<a href="https://www.playforum.net/#allService" onclick="document.getElementById(&#39;allService&#39;).tabIndex = -1;document.getElementById(&#39;allService&#39;).focus();return false;" class="user-border"><span>전체서비스 바로가기</span></a>
</nav>

<div class="off-canvas-wrapper">
	<div class="off-canvas-wrapper-inner" data-off-canvas-wrapper="">
		<div class="off-canvas-content" data-off-canvas-content="">

			<!-- wrap //-->
			<div id="user-wrap" class="min-width-1100">
				<div id="user-wrapper">

				<!-- header //-->
				<header id="user-header" class="posi-re float-center">
					<h2 class="show-for-sr">상단영역</h2>
					
					<div class="clearfix text-center">
</div>

<style type="text/css">
#header-wrapper.basic, #header-wrapper .mode-inner, #nav-header {width:1100px}
#user-nav .user-menu .secline > ul {border-color:#ed5c26}
</style>

<!-- 메뉴 시작 //-->
<div id="header-wrapper" class="vertical basic left " data-main-code="/index.html" data-sub-code="/index.html" data-serial-code="/index.html" data-multi-code="">

	<!-- 로고영역 //-->
	<header id="nav-header">
		<h1 class="user-logo text-left">
			<a href="https://www.playforum.net/" target="_top">
				<img src="./플레이포럼_files/toplogo_20220711112802.png" alt="플레이포럼">
			</a>
		</h1>
		<div class="user-banner">
					</div>
		<div class="user-banner text-right">
			<!--인터넷-윤리강령--><script type="text/javascript">var ___BANNER = "ban_1658132611";</script><script type="text/javascript" charset="utf-8" src="./플레이포럼_files/1.js.다운로드" id="ban_1658132611" data-append="true"></script><div class="banner_box"><a href="https://inc.or.kr/main/" target="_blank"><img src="./플레이포럼_files/1655800880257723505.jpg" class="float-center" alt=""></a>
</div>
<!--//인터넷-윤리강령-->		</div>
	</header>
	<!--// 로고영역 -->

	<!-- 최상단영역 //-->
	<div id="user-gnb">
		<div class="mode-inner">
			<!-- 왼쪽 //-->
			<div class="user-intro text-left">
				<ul>
					<li><a href="https://www.playforum.net/news/articleList.html?sc_level=T&amp;view_type=sm" class="button">헤드라인</a></li>
					<li><a href="https://www.playforum.net/news/articleList.html?sc_level=I&amp;view_type=sm" class="button">중요기사</a></li>
				</ul>
			</div>
			<!--// 왼쪽 -->

			<!-- 오른쪽 //-->
			<div class="user-intro text-right">
				<ul>
											<li>편집 : 2022-11-27 02:37 (일) </li>
									</ul>
			</div>
			<!--// 오른쪽 -->
		</div>
	</div>
	<!--// 최상단영역 -->

	<!-- 메뉴바 //-->
	<nav id="user-nav" class="user-bg">
		<div class="mode-inner">
			<!-- 섹션 //-->
			<ul id="user-menu" class="user-menu no-bullet">
								<li class="secline" style="width: 74px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N3&amp;view_type=sm" target="_top" data-code="S1N3" class="a-active a-hover">게임</a>
					<ul class="no-bullet" style="min-width: 74px; visibility: visible; display: none;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N5&amp;view_type=sm" target="_top" data-code="S2N5">취재·기획</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N6&amp;view_type=sm" target="_top" data-code="S2N6">인터뷰·칼럼</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N4&amp;view_type=sm" target="_top" data-code="S2N4">해외</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 100px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N2&amp;view_type=sm" target="_top" data-code="S1N2" class="">e스포츠</a>
					<ul class="no-bullet" style="min-width: 100px; visibility: visible; display: none;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N2&amp;view_type=sm" target="_top" data-code="S2N2">이슈·기획</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N13&amp;view_type=sm" target="_top" data-code="S2N13">현장취재</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N14&amp;view_type=sm" target="_top" data-code="S2N14">인터뷰</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 74px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N4&amp;view_type=sm" target="_top" data-code="S1N4">테크</a>
					<ul class="no-bullet" style="min-width: 74px;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N9&amp;view_type=sm" target="_top" data-code="S2N9">IT</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N15&amp;view_type=sm" target="_top" data-code="S2N15">블록체인</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N16&amp;view_type=sm" target="_top" data-code="S2N16">가상화폐</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 130px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N5&amp;view_type=sm" target="_top" data-code="S1N5" class="">리뷰/프리뷰</a>
					<ul class="no-bullet" style="min-width: 130px; visibility: visible; display: none;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N7&amp;view_type=sm" target="_top" data-code="S2N7">게임</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N17&amp;view_type=sm" target="_top" data-code="S2N17">하드웨어</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N18&amp;view_type=sm" target="_top" data-code="S2N18">콘텐츠</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 114px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N7&amp;view_type=sm" target="_top" data-code="S1N7">포토/영상</a>
					<ul class="no-bullet" style="min-width: 114px;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N8&amp;view_type=sm" target="_top" data-code="S2N8">게임</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N19&amp;view_type=sm" target="_top" data-code="S2N19">e스포츠</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 130px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N9&amp;view_type=sm" target="_top" data-code="S1N9" class="">컬처/스포츠</a>
					<ul class="no-bullet" style="min-width: 130px; visibility: visible; display: none;">
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N10&amp;view_type=sm" target="_top" data-code="S2N10">골프</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N11&amp;view_type=sm" target="_top" data-code="S2N11">OTT</a>
						</li>
												<li class="sub">
							<a href="https://www.playforum.net/news/articleList.html?sc_sub_section_code=S2N12&amp;view_type=sm" target="_top" data-code="S2N12">웹툰·소설</a>
						</li>
											</ul>
				</li>
								<li class="secline" style="width: 118px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N6&amp;view_type=sm" target="_top" data-code="S1N6" class="">이슈&amp;셀럽</a>
					<ul class="no-bullet" style="min-width: 118px; display: none;">
											</ul>
				</li>
								<li class="secline" style="width: 124px;">
					<a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N1&amp;view_type=sm" target="_top" data-code="S1N1" class="">실시간뉴스</a>
					<ul class="no-bullet" style="min-width: 124px; display: none;">
											</ul>
				</li>
							</ul>
			<!--// 섹션 -->
			
			<div class="user-etc">
				<!-- 로그인 //-->
				<div id="userLogin" class="user-logbox">
					<a href="https://www.playforum.net/member/login.html" target="_top" class="item">로그인</a>
				</div>
				<!--// 로그인 -->

				<!-- 검색 //-->
				<div id="userSearch" class="user-search">
					<button type="button" class="sch-btns"><i class="icon-search-thin"><span class="show-for-sr">검색버튼</span></i></button>
					<fieldset class="user-search-form">
						<form name="head-search" method="get" action="https://www.playforum.net/news/articleList.html" class="clearfix">
							<input type="hidden" name="sc_area" value="A">
							<input type="hidden" name="view_type" value="sm">
							<label class="show-for-sr" for="search">기사검색</label>
							<input type="text" name="sc_word" id="search" onkeydown="if(event.keyCode==13){if(this.form.sc_word.value != &#39;&#39;){this.form.submit();}else{alert(&#39;검색어를 입력해주세요&#39;);return false;}}" placeholder="검색어를 입력해주세요" title="기사검색">
							<button type="button" title="기사검색" onclick="if(this.form.sc_word.value != &#39;&#39;){this.form.submit();}else{alert(&#39;검색어를 입력해주세요&#39;);this.form.sc_word.focus();return false;}"><i class="icon-search-thin"><span class="show-for-sr">검색</span></i></button>
						</form>
					</fieldset>
				</div>
				<!--// 검색 -->
			</div>

		</div>
	</nav>
	<!--// 메뉴바 -->

</div>
<!--// 메뉴 끝 -->

<script type="text/javascript">
<!--
//메뉴 스타일 불러옴 : 메뉴 /script/menubar.js 와 같이 사용되어야 함
var menuIndexHold = true,
menuOverHold = true,
submenuStyle = "vertical",
sizeMode = "basic",
subShow = "hold",
submenuPosi = "left",
effectSwitch = "on",
subSlideSpeed = 150,
subFadeSpeed = 150;

$(document).ready(function(){

	// 검색창
	var $navHeader = $("#user-nav")
		, $search = $navHeader.find(".user-search")
		, $searchBtns = $navHeader.find(".sch-btns")
		, $searchForm = $search.find(".user-search-form");

	$searchBtns.on({
		click: function(){
			$search.toggleClass('active');
			if($search.hasClass('active')) {
				$searchForm.find('input#search').focus();
			}
		}
	});	

});
//-->
</script>

				</header>
				<!--// header -->
				
								
				<!-- container //-->
				<section id="user-container" class="posi-re text-left">
					<h2 class="show-for-sr">본문영역</h2>
					
										<div id="layer-popups" class="float-center width-1100"></div>
					
                    <div class="posi-re float-center width-1100"><div id="floating_banner_left" class="view-aside left-wing" data-scroll="y" data-top-margin="20" data-down-margin="15" data-duration="300">
<!--221027_오버워치--><script type="text/javascript">var ___BANNER = "ban_1666856618";</script><script type="text/javascript" charset="utf-8" src="./플레이포럼_files/11.js.다운로드" id="ban_1666856618"></script><!--//221027_오버워치--><style>
.custom-box01{width:250px;}
.custom-box01 .inner{padding:10px;border:4px solid #000;}
</style>




<div id="floating_banner_right" class="view-aside right-wing" data-scroll="n" data-top-margin="20" data-down-margin="15" data-duration="300">
<!--무기미도_221024--><script type="text/javascript">var ___BANNER = "ban_1666572087";</script><script type="text/javascript" charset="utf-8" src="./플레이포럼_files/10.js.다운로드" id="ban_1666572087"></script><!--//무기미도_221024--></div>
</div>					

<style type="text/css">
/* edit skin css START */
body {background-color:#f4f4f4}
#idx40 .index-columns.grid-1 {padding-right:20px}
#idx40 .index-columns.grid-2 {padding-right:10px}
#idx40 .width-160 {width:160px}
#idx40 .width-320 {width:320px}
#idx40 .height-372 {min-height:372px}
#idx40 .height-434 {min-height:434px}
#idx40 .height-642 {min-height:642px}

/* box skin */
.box-skin .header > strong, .box-skin .header > a,
.box-skin .header .skin-column > strong, .box-skin .header .skin-column > a {font-weight:bold}
.box-skin.line {padding:20px;border-color:#dcdcdc}
.box-skin.idx--box {padding:40px}
.box-skin.idx--box .header > strong, .box-skin.idx--box .header > a,
.box-skin.idx--box .header .skin-column > strong, .box-skin.idx--box .header .skin-column > a {margin-bottom:1.875rem}
.box-skin.idx--double .container > .skin-column:first-child:nth-last-child(2) {padding-right:5px}
.box-skin.idx--double .container > .skin-column:last-child:nth-child(2) {width:270px}
/* edit skin css END */
</style>


<!-- 편집판 //-->
<div id="idx40" class="index-wrap float-center" style="width:1100px">
	<!-- 내용 //-->
	<div class="clearfix">
<article class="box-skin idx--double ">
<header class="header"></header>
<section class="container">
<article class="skin-column"><style type="text/css">
#skin-11 > .item {float:left;position:relative;width:33.33333%;min-height:1px}
#skin-11 > .item.large {width:66.66667%}
#skin-11 .frame::after {content:'';position:absolute;z-index:2;left:0;top:0;width:100%;height:100%;background:url(/image/autobox/box-overbg-medium.png) 0 100% repeat-x}
#skin-11 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-11 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-11 .photo-titbg {padding:0 35px 16px 20px;background:none}
#skin-11 .item.large .photo-titbg {padding:0 50px 25px 30px}
#skin-11 .auto-titles {position:relative}
#skin-11 .item.large .auto-titles {font-size:25px;font-weight:700;letter-spacing:-.0125em}
#skin-11 .item.movie .auto-titles {padding-left:32px}
#skin-11 .item.movie .auto-titles::before {content:'';overflow:hidden;position:absolute;z-index:2;left:0;top:2px;width:22px;height:20px;background:url(/image/autobox/autobox-icons.png) 0 -150px no-repeat}
#skin-11 .height-182 {height:182px}
#skin-11 .height-364 {height:364px}
</style>
<div id="skin-11" class="auto-article"><div class="item large">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401647" target="_top">
				<span class="frame height-364"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401647_19910_424.png)"></em></span>
				<span class="photo-titbg">
					<strong class="auto-titles size-18 line-4x2 auto-fontF onload">던파 신규 지역 '선계', 캐릭터 '아처' 첫 공개...기존 콘텐츠도 대대적 개선</strong>
				</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401644" target="_top">
				<span class="frame height-182"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401644_19886_3143.jpg)"></em></span>
				<span class="photo-titbg">
					<strong class="auto-titles size-18 line-4x2 auto-fontF onload">투자자들 곡소리 나는데...이석우 두나무 대표는 인스타에 자랑?</strong>
				</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401642" target="_top">
				<span class="frame height-182"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401642_19881_2953.jpg)"></em></span>
				<span class="photo-titbg">
					<strong class="auto-titles size-18 line-4x2 auto-fontF onload">울분 토로한 장현국 대표..."위믹스 상장폐지는 업비트 갑질"</strong>
				</span>
			</a>
		</div>
</div>
</article>
<article class="skin-column"><style type="text/css">
#skin-12 .titles {display:inline-block;overflow:hidden;position:absolute;z-index:10;left:10px;top:13px;padding:0 15px;font-size:14px;font-weight:500;line-height:22px;color:#fff;background-color:rgba(0,0,0,.35);border-radius:2rem;text-transform:uppercase}
#skin-12, #skin-12 .item {position:relative}
#skin-12 .item {font-size:0}
#skin-12 .frame::after {content:'';position:absolute;z-index:2;left:0;top:0;width:100%;height:100%;background:url(/image/autobox/box-overbg-medium.png) 0 100% repeat-x}
#skin-12 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-12 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-12 .content {position:absolute;z-index:10;left:0;bottom:0;width:100%;padding:0 40px 20px 20px}
#skin-12 .photo-btn {height:28px;width:28px;top:10px;font-size:16px;color:#fff;background-color:rgba(0,0,0,.5);border:1px solid #555;transition:background-color .3s, border-color .3s}
#skin-12 .photo-btn:hover {background-color:#000;border-color:transparent}
#skin-12 .photo-btn.prev {right:37px}
#skin-12 .photo-btn.next {right:10px}
#skin-12 .height-364 {height:364px}
</style>
<div id="skin-12" class="auto-article">
<h6 class="titles">주요기사</h6>
<div id="roll-12" class="wrapper slick-initialized slick-slider"><button type="button" class="photo-btn prev slick-arrow" style="display: block;"><i class="icon-angle-left-thin"><span class="show-for-sr">prev</span></i></button><div aria-live="polite" class="slick-list"><div class="slick-track" style="opacity: 1; width: 1890px; transform: translate3d(-270px, 0px, 0px);" role="listbox"><div class="dis-none item slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 270px;" tabindex="-1">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401601" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401601_19826_519.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">유저 소통도 ‘가상공간’에서...넥슨타운, ‘데이브’ 황재호 디렉터 라이브 미팅 성황</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 270px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401648" target="_top" tabindex="0">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401648_19916_3958.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">3개월간 테스트 끝낸 '메이플스토리 월드' 연말부터 본격적으로 시장 공략</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide" data-slick-index="1" aria-hidden="true" style="width: 270px;" tabindex="-1" role="option" aria-describedby="slick-slide01">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401634" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401634_19872_1025.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">한일 양국 팬심 저격, 블루 아카이브 IP의 힘</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide" data-slick-index="2" aria-hidden="true" style="width: 270px;" tabindex="-1" role="option" aria-describedby="slick-slide02">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401618" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401618_19843_1317.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">크래프톤의 북미 독립 스튜디오 언노운 월즈,  300억 원 규모 크래프톤 주식 매수 완료</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide" data-slick-index="3" aria-hidden="true" style="width: 270px;" tabindex="-1" role="option" aria-describedby="slick-slide03">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401607" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401607_19834_3016.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">위메이드 장현국 대표, “메타버스는 블록체인을 통해 연결된 거대한 게임 생태계”</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide" data-slick-index="4" aria-hidden="true" style="width: 270px;" tabindex="-1" role="option" aria-describedby="slick-slide04">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401601" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401601_19826_519.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">유저 소통도 ‘가상공간’에서...넥슨타운, ‘데이브’ 황재호 디렉터 라이브 미팅 성황</span>
			</span>
		</a>
        </div><div class="dis-none item slick-slide slick-cloned" data-slick-index="5" aria-hidden="true" style="width: 270px;" tabindex="-1">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401648" target="_top" tabindex="-1">
				<span class="frame height-364">
<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/photo/202211/401648_19916_3958.jpg)"></em></span>
			<span class="content">
				<span class="auto-titles size-18 line-4x1 auto-fontF onload">3개월간 테스트 끝낸 '메이플스토리 월드' 연말부터 본격적으로 시장 공략</span>
			</span>
		</a>
        </div></div></div>




<button type="button" class="photo-btn next slick-arrow" style="display: block;"><i class="icon-angle-right-thin"><span class="show-for-sr">next</span></i></button></div>
</div>
<script type="text/javascript">
<!--
(function() {
		
	$('#roll-12').slick({
		arrows: true, // 화살표표시
		prevArrow: '<button type="button" class="photo-btn prev"><i class="icon-angle-left-thin"><span class="show-for-sr">prev</span></i></button>', // 이전버튼
		nextArrow: '<button type="button" class="photo-btn next"><i class="icon-angle-right-thin"><span class="show-for-sr">next</span></i></button>', // 다음버튼
		dots: false, // pager
		infinite: true, // 무한넘기기
		autoplay: false, // 자동전환
		//autoplaySpeed: 3000, // 자동전환속도
		speed: 300, // 넘기는 속도
		draggable: false // 제스처(모바일용)
	});

})();
//-->
</script>
</article>
</section>
</article><div class="box-margins " style="margin-bottom:40px;"></div>
	</div>
	<!--// 내용 -->
	<div class="index-row">
		<div class="index-columns grid-1 width-320">
			<!-- 내용 //-->
			<div class="clearfix">
<article class="box-skin height-434  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N3&amp;view_type=sm" target="_top" class="btm-Kor">게임</a></header>
<section class="content"><style type="text/css">
#skin-13 > .item.for-text {padding:16px;border-top:1px solid rgba(0,0,0,.08)}
#skin-13 > .item:last-child {padding-bottom:0} 
#skin-13 .item.noimage > a {min-height:220px}
#idx40 #skin-13 .frame {margin-left:-21px;margin-right:-21px}
#skin-13 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-13 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-13 .content {display:block;padding:16px}
#skin-13 .frame + .content {position:relative;z-index:5;margin-top:-22px;padding:12px 16px;background-color:#fff}
#skin-13 .auto-titles {position:relative}
#skin-13 .item.noimage .auto-titles {font-size:23px;font-weight:700}
</style>
<div id="skin-13" class="auto-article"><div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401647" target="_top"><span class="frame">
						<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401647_19910_424_v150.jpg)"></em>
					</span><span class="content">
						<strong class="auto-titles size-18 line-4x2 auto-fontA onload">던파 신규 지역 '선계', 캐릭터 '아처' 첫 공개...기존 콘텐츠도 대대적 개선</strong>
						
					</span>
				</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401633" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">스마일게이트 인디게임&amp;컬쳐 페스티벌  ‘버닝비버 2022’ 전시팀 및 연사 공개</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401623" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">LoL·배그 이어 차세대 e스포츠 가능성 엿보이는 신작 4종은?</a>
			</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:40px;"></div>
	<style type="text/css">	
	#INC_TAB_B_3_container .tabs-navs .tabs-item a {color:#66676c;background-color:#f6f6f6;border-top-color:#bb0000 !important}
	#INC_TAB_B_3_container .tabs-navs .tabs-item.active a {color:#bb0000;background-color:#ffffff}
	#INC_TAB_B_3_container .tabs-panel {height:auto}
	</style>
	<div id="INC_TAB_B_3_container" class="tabs-wrap type-B">
	<ul id="INC_TAB_B_3" class="tabs-navs expanded">
		<li class="tabs-item active"><a href="https://www.playforum.net/#" target="_top" data-tabs-target="#panel1">인기기사</a></li>
		<li class="tabs-item"><a href="https://www.playforum.net/#" target="_top" data-tabs-target="#panel2">최신기사</a></li>
	</ul>
	<div id="panel1" class="tabs-panel active" style="display: block;">
<style type="text/css">
#skin-14 .auto-num, #skin-14 .auto-titles {overflow:hidden;float:left;line-height:35px}
#skin-14 .auto-num {width:20px;margin-right:15px;color:#ff435c;text-align:center}
#skin-14 .auto-titles {width:calc(100% - 35px);text-overflow:ellipsis;white-space:nowrap}
</style>
<div id="skin-14" class="auto-article"><div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401584" target="_top">
				<em class="auto-num size-20">1</em>
				<span class="auto-titles size-15 auto-fontA onload">2K, ‘시드 마이어의 문명 VI’ 리더 패스 첫 번째 팩 ‘위대한 협상가’ 공개</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401596" target="_top">
				<em class="auto-num size-20">2</em>
				<span class="auto-titles size-15 auto-fontA onload">데브시스터즈, 연말 맞아 신세계사이먼 프리미엄 아울렛 야외 공간에 ‘쿠키런 인 원더랜드’ 오픈</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401623" target="_top">
				<em class="auto-num size-20">3</em>
				<span class="auto-titles size-15 auto-fontA onload">LoL·배그 이어 차세대 e스포츠 가능성 엿보이는 신작 4종은?</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401591" target="_top">
				<em class="auto-num size-20">4</em>
				<span class="auto-titles size-15 auto-fontA onload">최초 80레벨·3주년…리니지 시리즈 '핫이슈'</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401588" target="_top">
				<em class="auto-num size-20">5</em>
				<span class="auto-titles size-15 auto-fontA onload">라이엇, 모바일 e스포츠 확대 노력...‘방과 후 동와리’ 개최</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401624" target="_top">
				<em class="auto-num size-20">6</em>
				<span class="auto-titles size-15 auto-fontA onload">국내 4대 거래소, '위믹스' 상장폐지 결정...위메이드 '맞불'</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401569" target="_top">
				<em class="auto-num size-20">7</em>
				<span class="auto-titles size-15 auto-fontA onload">[포토] '지스타 2022' 관람객들 눈 호강! 코스프레 모음</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401580" target="_top">
				<em class="auto-num size-20">8</em>
				<span class="auto-titles size-15 auto-fontA onload">시연·소통·인플루언서...올해 지스타 키워드 셋</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401627" target="_top">
				<em class="auto-num size-20">9</em>
				<span class="auto-titles size-15 auto-fontA onload">이이스노 게임즈, '무기미도' 이상한 나라 이벤트 실시</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401616" target="_top">
				<em class="auto-num size-20">10</em>
				<span class="auto-titles size-15 auto-fontA onload">담금질 돌입한 넥슨 신작 3종...2023년 기대감 고조</span>
			</a>
		</div>
</div>	</div>
	<div id="panel2" class="tabs-panel" style="display: none;">
<style type="text/css">
#skin-45 > .item:not(:first-child) {margin-top:12px}
</style>
<div id="skin-45" class="auto-article"><div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401648" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">3개월간 테스트 끝낸 '메이플스토리 월드' 연말부터 본격적으로 시장 공략</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401647" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">던파 신규 지역 '선계', 캐릭터 '아처' 첫 공개...기존 콘텐츠도 대대적 개선</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401641" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">‘V&amp;A 뷰티’ 론칭 1주년 기념 고객 감사   BIG프로모션 실시</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401640" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">오버워치 2, 시즌2 앞두고 경험치 2배 부스트 등 푸짐한 혜택 제공</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401639" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">브라운더스트, 신규 용병 및 조력자 그룹 ‘백의 악마’ 6인 업데이트</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401638" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">위믹스3.0, 신규 NCP 쟁글 운영사 ‘크로스앵글’ WONDER 5로 정식 합류</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401637" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">넥슨, 피파온라인4·피파모바일 태극 전사 오프라인 응원전 진행</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401636" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">스마일게이트 스토브인디, 창작자 지원 위한 ‘펀딩팩’ 프로그램 런칭</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401635" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">라인게임즈, '엑소스 히어로즈’ 신규 시그니처 영웅 ‘모모링’ 공개</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401634" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">한일 양국 팬심 저격, 블루 아카이브 IP의 힘</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401633" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">스마일게이트 인디게임&amp;컬쳐 페스티벌  ‘버닝비버 2022’ 전시팀 및 연사 공개</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401632" target="_top" class="auto-titles size-15 line-3x1 auto-fontA onload">네오위즈, 모바일 3매치 퍼즐 게임 ‘오 마이 앤’ 스크린샷 첫 공개</a>
		</div>
</div>	</div>
</div>
<script>$('#INC_TAB_B_3_container').tabslet({
		mouseevent: 'hover', 
		attribute: 'data-tabs-target', 
		animation: false
	});</script>
			</div>
			<!--// 내용 -->
		</div>
		<div class="index-columns width-full">
			<!-- 내용 //-->
			<div class="clearfix">

			</div>
			<!--// 내용 -->
			<div class="index-row">
				<div class="index-columns grid-1 width-320">
					<!-- 내용 //-->
					<div class="clearfix">
<article class="box-skin height-434  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N2&amp;view_type=sm" target="_top" class="btm-Kor">e스포츠</a></header>
<section class="content"><style type="text/css">
#skin-15 > .item.for-text {padding:16px;border-top:1px solid rgba(0,0,0,.08)}
#skin-15 > .item:last-child {padding-bottom:0} 
#skin-15 .item.noimage > a {min-height:220px}
#idx40 #skin-15 .frame {margin-left:-21px;margin-right:-21px}
#skin-15 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-15 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-15 .content {display:block;padding:16px}
#skin-15 .frame + .content {position:relative;z-index:5;margin-top:-22px;padding:12px 16px;background-color:#fff}
#skin-15 .auto-titles {position:relative}
#skin-15 .item.noimage .auto-titles {font-size:23px;font-weight:700}
</style>
<div id="skin-15" class="auto-article"><div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401588" target="_top"><span class="frame">
						<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401588_19755_334_v150.jpg)"></em>
					</span><span class="content">
						<strong class="auto-titles size-18 line-4x2 auto-fontA onload">라이엇, 모바일 e스포츠 확대 노력...‘방과 후 동와리’ 개최</strong>
						
					</span>
				</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401566" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">넥슨, ‘FIFA 온라인 4’ 리그 ‘2022 eK 리그 챔피언십 시즌 2’ 결승전 곽준혁 황제 등극</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401565" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">TFT 용의 땅 챔피언십, 성황리에 마무리</a>
			</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:40px;"></div><article class="box-skin height-434  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N4&amp;view_type=sm" target="_top" class="btm-Kor">테크</a></header>
<section class="content"><style type="text/css">
#skin-16 > .item.for-text {padding:16px;border-top:1px solid rgba(0,0,0,.08)}
#skin-16 > .item:last-child {padding-bottom:0} 
#skin-16 .item.noimage > a {min-height:220px}
#idx40 #skin-16 .frame {margin-left:-21px;margin-right:-21px}
#skin-16 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-16 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-16 .content {display:block;padding:16px}
#skin-16 .frame + .content {position:relative;z-index:5;margin-top:-22px;padding:12px 16px;background-color:#fff}
#skin-16 .auto-titles {position:relative}
#skin-16 .item.noimage .auto-titles {font-size:23px;font-weight:700}
</style>
<div id="skin-16" class="auto-article"><div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401648" target="_top"><span class="frame">
						<em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401648_19916_3958_v150.jpg)"></em>
					</span><span class="content">
						<strong class="auto-titles size-18 line-4x2 auto-fontA onload">3개월간 테스트 끝낸 '메이플스토리 월드' 연말부터 본격적으로 시장 공략</strong>
						
					</span>
				</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401638" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">위믹스3.0, 신규 NCP 쟁글 운영사 ‘크로스앵글’ WONDER 5로 정식 합류</a>
			</div>
<div class="item for-text">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401644" target="_top" class="auto-titles size-15 line-4x2 auto-fontA onload">투자자들 곡소리 나는데...이석우 두나무 대표는 인스타에 자랑?</a>
			</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:40px;"></div>
					</div>
					<!--// 내용 -->
				</div>
				<div class="index-columns width-full">
					<!-- 내용 //-->
					<div class="clearfix">

					</div>
					<!--// 내용 -->
					<div class="index-row">
						<div class="index-columns grid-2 width-160">
							<!-- 내용 //-->
							<div class="clearfix">

							</div>
							<!--// 내용 -->
						</div>
						<div class="index-columns width-full">
							<!-- 내용 //-->
							<div class="clearfix">

							</div>
							<!--// 내용 -->
						</div>
					</div>
					<!-- 내용 //-->
					<div class="clearfix">
<article class="box-skin height-434  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N7&amp;view_type=sm" target="_top" class="btm-Kor">포토/영상</a></header>
<section class="content"><style type="text/css">
#skin-17 > .item {float:left;position:relative;width:calc(33.33333% - 6px);margin-left:6px;margin-top:22px}
#skin-17 > .item.large {float:none;width:auto;margin-left:0;clear:both}
#skin-17 > .item:first-child {margin-top:0}
#idx40 #skin-17 .item.large .frame {margin-left:-21px;margin-right:-21px}
#skin-17 .item.large .frame::after {content:'';position:absolute;z-index:2;left:0;top:0;width:100%;height:100%;background:url(/image/autobox/box-overbg-medium.png) 0 100% repeat-x}
#skin-17 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-17 .item.large .auto-images.movie::after {left:50%;right:auto;top:50%;bottom:auto;width:64px;height:64px;background-position:-30px -50px;-ms-transform:translate(-50%, -50%);transform:translate(-50%, -50%)}
#skin-17 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-17 .photo-titbg {padding:20px 10px;background:none}
#skin-17 .photo-titbg.cover {padding:8px 16px;background:rgba(0,0,0,.5);opacity:0;transition:opacity .3s}
#skin-17 a:hover .photo-titbg.cover {opacity:1}
#skin-17 .auto-titles {position:relative}
</style>
<div id="skin-17" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401589" target="_top">
					<span class="frame"><em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401589_19757_5526_v150.jpg)"></em></span>
					<span class="photo-titbg text-center">
						<span class="auto-titles size-18 line-4x1 auto-fontF onload">[포토] 3년 만의 정상 개최 '지스타 2022' 현장 스케치</span>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401569" target="_top">
					<span class="frame line"><em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401569_19687_4134_v150.jpg)"></em></span>
					<span class="photo-titbg cover">
						<span class="auto-titles size-13 line-4x3 auto-fontF">[포토] '지스타 2022' 관람객들 눈 호강! 코스프레 모음</span>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401537" target="_top">
					<span class="frame line"><em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401537_19615_232_v150.jpg)"></em></span>
					<span class="photo-titbg cover">
						<span class="auto-titles size-13 line-4x3 auto-fontF">[포토] '크래프톤' 신작...시연 위한 관람객 '북적'</span>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401541" target="_top">
					<span class="frame line"><em class="auto-images" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401541_19634_3928_v150.jpg)"></em></span>
					<span class="photo-titbg cover">
						<span class="auto-titles size-13 line-4x3 auto-fontF">[포토] 구글 매출 1위! '승리의 여신: 니케' 지스타서 인기 입증</span>
					</span>
				</a>
			</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:40px;"></div><article class="box-skin line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N5&amp;view_type=sm" target="_top" class="btm-Kor">리뷰/프리뷰</a></header>
<section class="content"><style type="text/css">
#skin-18 > .item {min-height:81px}
#skin-18 > .item:not(:first-child) {margin-top:15px}
#skin-18 .frame {width:120px}
#skin-18 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-18 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-18 .content {display:block}
#skin-18 .frame + .content {display:inline-block;width:calc(100% - 130px);padding-left:20px}
</style>
<div id="skin-18" class="auto-article"><div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401474" target="_top" class="auto-valign"><span class="frame line for-middle">
					<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401474_19467_442_v150.jpg)"></em>
				</span><span class="content for-middle">
					<strong class="auto-section marbtm-8 size-15 line-3x1 user-point">게임</strong>
					<strong class="auto-titles size-18 line-4x2 auto-fontA onload">'무기미도-니케', 아름다운 미소녀 앞세워 태풍의 핵으로 급부상</strong>
				</span>
			</a>
		</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:20px;"></div><article class="box-skin line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N9&amp;view_type=sm" target="_top" class="btm-Kor">컬처/스포츠</a></header>
<section class="content"><style type="text/css">
#skin-43 > .item {min-height:81px}
#skin-43 > .item:not(:first-child) {margin-top:15px}
#skin-43 .frame {width:120px}
#skin-43 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-43 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-43 .content {display:block}
#skin-43 .frame + .content {display:inline-block;width:calc(100% - 130px);padding-left:20px}
</style>
<div id="skin-43" class="auto-article"><div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401453" target="_top" class="auto-valign"><span class="frame line for-middle">
					<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401453_19422_4010_v150.jpg)"></em>
				</span><span class="content for-middle">
					<strong class="auto-section marbtm-8 size-15 line-3x1 user-point">골프</strong>
					<strong class="auto-titles size-18 line-4x2 auto-fontA onload">LPGA 넬리 코다, 세계 랭킹 1위 탈환!</strong>
				</span>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401335" target="_top" class="auto-valign"><span class="frame line for-middle">
					<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401335_19107_1953_v150.jpg)"></em>
				</span><span class="content for-middle">
					<strong class="auto-section marbtm-8 size-15 line-3x1 user-point">골프</strong>
					<strong class="auto-titles size-18 line-4x2 auto-fontA onload">"굿 샷! 나는 할 수 있다!"...골프 두려움을 없애는 꿀팁 공개!</strong>
				</span>
			</a>
		</div>
</div>
</section>
</article>
					</div>
					<!--// 내용 -->
				</div>
			</div>
			<!-- 내용 //-->
			<div class="clearfix">

			</div>
			<!--// 내용 -->
		</div>
	</div>
	<!-- 내용 //-->
	<div class="clearfix">
<style type="text/css">
#skin40-tab {margin-bottom:2.5rem;padding:2.5rem;background-color:#fff;border:1px solid #dcdcdc}
#skin40-tab .tabs-header {display:block;margin-bottom:1.25rem;font-size:1.875rem;font-weight:bolder;line-height:1.125;letter-spacing:-.075em;color:#000;text-align:center}
#skin40-tab .tabs-navs {display:block;margin-bottom:2.5rem;font-size:0;text-align:center}
#skin40-tab .tabs-navs::before {content:normal}
#skin40-tab .tabs-navs > .tabs-item {display:inline-block;overflow:hidden;float:none;margin-left:.75rem;vertical-align:middle}
#skin40-tab .tabs-navs > .tabs-item:first-child {margin-left:0}
#skin40-tab .tabs-navs > .tabs-item > a {padding:0 2rem;font-size:1rem;font-weight:bolder;line-height:2.375rem;letter-spacing:-.05em;color:#000;background-color:#fff;border:none;border-radius:2rem;border:1px solid #707070}
#skin40-tab .tabs-navs > .tabs-item.active > a {color:#fff;background-color:#ff435c;border-color:transparent}
</style>

<!-- Custom Tabs -->
<div id="skin40-tab" class="tabs-wrap">
	<header class="tabs-header">분야별 핫이슈</header>
	<ul class="tabs-navs">
		<li class="tabs-item active"><a rel="menu" data-tabs-target="#panel1">실시간뉴스 </a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel2">게임</a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel3">e스포츠 </a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel4">테크</a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel5">포토/영상</a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel6">컬처/스포츠</a></li>
		<li class="tabs-item"><a rel="menu" data-tabs-target="#panel7">이슈&amp;셀럽</a></li>
	</ul>
	<div id="panel1" class="tabs-panel" style="display: block;">
		<style type="text/css">
#skin-36 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-36 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-36 > .item.large, #skin-36 > .item.large + .item {margin-left:0}
#skin-36 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-36 > .item:first-child {margin-top:0}
#skin-36 .item.noimage > a {min-height:206px;padding:30px}
#skin-36 .frame.float-right {width:350px;margin-left:65px}
#skin-36 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-36 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-36 .content {display:block}
#skin-36 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-36" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401584" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401584_19740_2913_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">2K, ‘시드 마이어의 문명 VI’ 리더 패스 첫 번째 팩 ‘위대한 협상가’ 공개</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">2K는 ‘시드 마이어의 문명 VI’의 ‘리더 패스’의 첫 번째 팩 ‘위대한 협상가’를 출시했다고 23일 밝혔다.‘리더 패스’는 총 6개의 팩으로 지도자 18명을 순차적으로 만나볼 ...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401596" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401596_19821_5528_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">데브시스터즈, 연말 맞아 신세계사이먼 프리미엄 아울렛 야외 공간에 ‘쿠키런 인 원더랜드’ 오픈</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401465" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401465_19446_4544_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">‘승리의 여신: 니케’ 지스타 2022에서 무대 이벤트 및 행사 진행</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401472" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401472_19453_923_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">큐로드, 지스타 B2B 참가...마케팅 컨설팅 무료 제공!</strong>
					
				</a>
			</div>
</div>
	</div>
	<div id="panel2" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-37 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-37 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-37 > .item.large, #skin-37 > .item.large + .item {margin-left:0}
#skin-37 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-37 > .item:first-child {margin-top:0}
#skin-37 .item.noimage > a {min-height:206px;padding:30px}
#skin-37 .frame.float-right {width:350px;margin-left:65px}
#skin-37 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-37 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-37 .content {display:block}
#skin-37 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-37" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=197572" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202011/197572_9427_1_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">인스타 180만 화제의 모델 '강인경', 게임업계에 떴다</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">인스타 180만 팔로워, 신이 내린 몸매, 맥심 완판녀 등 다양한 수식어가 따르는 아트그라비아 모델 강인경. 매혹적인 눈빛과 감탄을 자아내는 볼륨감으로 모델 데뷔 4년 만에 많은 ...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=400730" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202209/400730_17781_2135_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">'엘든링' 개발사에 소니·텐센트 투자...카카오게임즈 반사이익?</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=400515" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202208/400515_17176_3940_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">올해 출시한 신작들의 성적표는</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=202836" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202208/202836_16681_1_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">텐센트, 유비소프트 지분 확대 속내는</strong>
					
				</a>
			</div>
</div>
	</div>
	<div id="panel3" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-38 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-38 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-38 > .item.large, #skin-38 > .item.large + .item {margin-left:0}
#skin-38 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-38 > .item:first-child {margin-top:0}
#skin-38 .item.noimage > a {min-height:206px;padding:30px}
#skin-38 .frame.float-right {width:350px;margin-left:65px}
#skin-38 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-38 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-38 .content {display:block}
#skin-38 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-38" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401588" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401588_19755_334_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">라이엇, 모바일 e스포츠 확대 노력...‘방과 후 동와리’ 개최</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">라이엇 게임즈의 모바일 MOBA 게임 '리그 오브 레전드: 와일드 리프트'(이하 와일드 리프트)가 온•오프라인을 오가는 하이브리드 게임 대회 ‘방과 후 동와리’를 개최한다. 오는 ...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401468" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401468_19656_3632_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">[PGC] 서울·히카리 "그랜드 파이널, 좋은 성적 자신"</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401466" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401466_19447_4756_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">'IEF 2022 국제 e-스포츠 페스티벌 in JEONBUK JEONJU', 리그오브레전드와 하스스톤 국가대표 선발전 실시</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401448" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401448_19414_3234_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">장인·장모 등 온가족이 즐기는 게임, '서머너즈 워'</strong>
					
				</a>
			</div>
<div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401434" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401434_19397_5918_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">발로란트 게임 체인저스 초대 세계 챔피언 뽑는다</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">세계 최고의 발로란트 여성팀을 가리는 챔피언십이 독일 베를린에서 열린다.5대5 대전형 캐릭터 기반 전술 슈팅 게임 '발로란트'의 개발 및 유통사인 라이엇 게임즈는 오는 11월 15...</em>
					</span>
				</a>
			</div>
</div>
	</div>
	<div id="panel4" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-39 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-39 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-39 > .item.large, #skin-39 > .item.large + .item {margin-left:0}
#skin-39 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-39 > .item:first-child {margin-top:0}
#skin-39 .item.noimage > a {min-height:206px;padding:30px}
#skin-39 .frame.float-right {width:350px;margin-left:65px}
#skin-39 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-39 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-39 .content {display:block}
#skin-39 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-39" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401509" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401509_19531_1714_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">위메이드 장현국 대표 "위믹스 상폐 가능성 없다"</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">부산 벡스코에서 오는 20일까지 열리는 '지스타 2022'에서 위메이드 장현국 대표가 올 한해 사업 성과와 향후 목표, 그리고 NFT 위믹스의 성장 가능성에 대해 설명하는 자리를 ...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401624" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401624_19860_715_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">국내 4대 거래소, '위믹스' 상장폐지 결정...위메이드 '맞불'</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401460" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401460_19441_278_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">컴투스 그룹 XPLA, "재무적인 손실 없는 상황"</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401445" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401445_19408_1931_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">컴투스홀딩스 "FTX 거래소 직접 투자한 바 없어...XPLA 영향 無"</strong>
					
				</a>
			</div>
</div>
	</div>
	<div id="panel5" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-40 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-40 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-40 > .item.large, #skin-40 > .item.large + .item {margin-left:0}
#skin-40 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-40 > .item:first-child {margin-top:0}
#skin-40 .item.noimage > a {min-height:206px;padding:30px}
#skin-40 .frame.float-right {width:350px;margin-left:65px}
#skin-40 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-40 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-40 .content {display:block}
#skin-40 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-40" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401516" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401516_19541_052_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">[포토] 볼거리 풍성! '지스타 2022' 호요버스 부스</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">지스타 2022에 참가한 호요버스의 부스가 신작 '붕괴: 스타레일' 및 '젠레스 존 제로' 시연 효과로 인산인해를 이루고 있다. 시연을 위한 관람객들의 발길이 끊이지 않는 모습이다...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401510" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401510_19532_204_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">[포토] 3년 만에 정상 개최 '지스타 2022' 화려한 개막 현장</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401569" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401569_19687_4134_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">[포토] '지스타 2022' 관람객들 눈 호강! 코스프레 모음</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401541" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401541_19634_3928_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">[포토] 구글 매출 1위! '승리의 여신: 니케' 지스타서 인기 입증</strong>
					
				</a>
			</div>
</div>
	</div>
	<div id="panel6" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-41 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-41 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-41 > .item.large, #skin-41 > .item.large + .item {margin-left:0}
#skin-41 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-41 > .item:first-child {margin-top:0}
#skin-41 .item.noimage > a {min-height:206px;padding:30px}
#skin-41 .frame.float-right {width:350px;margin-left:65px}
#skin-41 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-41 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-41 .content {display:block}
#skin-41 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-41" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401453" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401453_19422_4010_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">LPGA 넬리 코다, 세계 랭킹 1위 탈환!</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">넬리 코다(미국)가 LPGA(미국여자프로골프) 세계랭킨 1위를 탈환했다.14일(한국시간) 넬리 코다는 미국 플로리다주 벨에어의 펠리컨 골프클럽(파70)에서 열린 LPGA 투어 펠리...</em>
					</span>
				</a>
			</div>
</div>
	</div>
	<div id="panel7" class="tabs-panel" style="display: none;">
		<style type="text/css">
#skin-42 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-42 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-42 > .item.large, #skin-42 > .item.large + .item {margin-left:0}
#skin-42 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-42 > .item:first-child {margin-top:0}
#skin-42 .item.noimage > a {min-height:206px;padding:30px}
#skin-42 .frame.float-right {width:350px;margin-left:65px}
#skin-42 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-42 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-42 .content {display:block}
#skin-42 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-42" class="auto-article"></div>
	</div>
</div>

<script>
$('#skin40-tab').tabslet({
	attribute: 'data-tabs-target', // 탭메뉴 타겟
	animation: false, // 에니메이션효과
});
</script>
	</div>
	<!--// 내용 -->
	<div class="index-row">
		<div class="index-columns grid-1 width-320">
			<!-- 내용 //-->
			<div class="clearfix">
<article class="box-skin height-372  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N6&amp;view_type=sm" target="_top" class="btm-Kor">이슈&amp;셀럽</a></header>
<section class="content"><style type="text/css">
#skin-20 > .item:not(:first-child) {margin-top:20px}
#skin-20 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-20 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
</style>
<div id="skin-20" class="auto-article"><div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401226" target="_top">
				<span class="frame line marbtm-20"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/photo/202210/401226_18693_426.jpg)"></em></span>
				<strong class="auto-titles size-18 line-4x1 auto-fontA onload">김세정, 푸켓에서 심쿵 미소 발사</strong>
				<em class="auto-sums martop-12 size-13 line-7x2 auto-fontB">배우 겸 가수 김세정이 푸켓에서 상큼한 미소로 소식을 전했다.17일 김세정은 자신의 인스타그램을 통해 "푸켓"이란 짧은 글과 여러 장의 사진, 영상을 공개했다.공개된 사진 속 김세...</em>
			</a>
		</div>
<div class="item">
			<a href="https://www.playforum.net/news/articleView.html?idxno=401220" target="_top">
				<span class="frame line marbtm-20"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/photo/202210/401220_18686_1212.jpg)"></em></span>
				<strong class="auto-titles size-18 line-4x1 auto-fontA onload">혜리, '블랙핑크 월드투어[본 핑크] 서울' 콘서트 직관 인증</strong>
				<em class="auto-sums martop-12 size-13 line-7x2 auto-fontB">가수 겸 배우 혜리가 그룹 블랙핑크 콘서트 현장을 찾아 응원에 나섰다.지난 15일 혜리는 자신의 인스타그램을 통해 "2018 첫 콘서트 그리고 2022 두번째 콘서트 여전히 멋진 ...</em>
			</a>
		</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:10px;"></div>
			</div>
			<!--// 내용 -->
		</div>
		<div class="index-columns width-full">
			<!-- 내용 //-->
			<div class="clearfix">
<article class="box-skin idx--box height-642  line">
<header class="header"><a href="https://www.playforum.net/news/articleList.html?sc_section_code=S1N1&amp;view_type=sm" target="_top" class="btm-Kor">실시간뉴스</a></header>
<section class="content"><style type="text/css">
#skin-21 > .item {float:left;width:calc(33.33333% - 14px);margin-left:21px}
#skin-21 > .item.large {float:none;width:auto;margin-top:40px;margin-bottom:32px;padding-bottom:32px;border-bottom:1px solid rgba(0,0,0,.08);clear:both}
#skin-21 > .item.large, #skin-21 > .item.large + .item {margin-left:0}
#skin-21 > .item.noimage {background-color:#f4f4f4;border:1px solid rgba(0,0,0,.05)}
#skin-21 > .item:first-child {margin-top:0}
#skin-21 .item.noimage > a {min-height:206px;padding:30px}
#skin-21 .frame.float-right {width:350px;margin-left:65px}
#skin-21 .auto-images {-webkit-transition:transform 1s ease;transition:transform 1s ease, -ms-transform 1s ease;-webkit-backface-visibility:hidden}
#skin-21 a:hover .auto-images {-ms-transform:scale(1.125, 1.125);transform:scale(1.125, 1.125)}
#skin-21 .content {display:block}
#skin-21 .item.noimage .auto-titles {font-size:20px}
</style>
<div id="skin-21" class="auto-article"><div class="item large">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401641" target="_top">
					<span class="float-right frame line"><em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401641_19879_2137_v150.jpg)"></em></span>
					<span class="content">
						<strong class="auto-titles size-35 weight-700 line-4x3 auto-fontA onload">‘V&amp;A 뷰티’ 론칭 1주년 기념 고객 감사   BIG프로모션 실시</strong>
						<em class="auto-sums martop-18 size-13 line-8x3 auto-fontB">넷마블의 자회사인 넷마블힐러비(대표 이응주)가 컨템포러리 아트&amp;뷰티 브랜드 ‘V&amp;A 뷰티(V&amp;A Beauty, 이하 V&amp;A)’ 론칭 1주년을 맞아 고객 감사 프로모션을 진행한다고 밝혔다.지난해 10월 론칭한 V&amp;A는 영국 빅토리아 알버트 박물관(Victoria and Albert Museum, 이하 V&amp;A 뮤지엄)과 단독 글로벌 뷰티 라이선스 계약을 통해 ...</em>
					</span>
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401640" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401640_19878_1911_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">오버워치 2, 시즌2 앞두고 경험치 2배 부스트 등 푸짐한 혜택 제공</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401639" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401639_19877_184_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">브라운더스트, 신규 용병 및 조력자 그룹 ‘백의 악마’ 6인 업데이트</strong>
					
				</a>
			</div>
<div class="item">
				<a href="https://www.playforum.net/news/articleView.html?idxno=401637" target="_top"><span class="frame line marbtm-16">
						<em class="auto-images ratio-32" style="background-image:url(https://cdn.playforum.net/news/thumbnail/202211/401637_19875_1610_v150.jpg)"></em>
					</span><strong class="auto-titles size-16 line-4x2 auto-fontA onload">넥슨, 피파온라인4·피파모바일 태극 전사 오프라인 응원전 진행</strong>
					
				</a>
			</div>
</div>
</section>
</article><div class="box-margins " style="margin-bottom:10px;"></div>
			</div>
			<!--// 내용 -->
			<div class="index-row">
				<div class="index-columns grid-1 width-320">
					<!-- 내용 //-->
					<div class="clearfix">

					</div>
					<!--// 내용 -->
				</div>
				<div class="index-columns width-full">
					<!-- 내용 //-->
					<div class="clearfix">

					</div>
					<!--// 내용 -->
				</div>
			</div>
			<!-- 내용 //-->
			<div class="clearfix">

			</div>
			<!--// 내용 -->
		</div>
	</div>
	<!-- 내용 //-->
	<div class="clearfix">

	</div>
	<!--// 내용 -->

</div>
<!--// 편집판 -->
					</section>
					<!--// container -->
				
				</div>

				<style type="text/css">
#user-footer.type-28 {padding:1.25rem 1.25rem 3.75rem;margin:1.875rem auto;background-color:#fff;border-width:2px 1px 1px;border-style:solid;border-color:#e73f72 #dcdcdc #dcdcdc}

/* nav */
#user-footer.type-28 .user-nav {display:block;margin-bottom:1.875rem;font-size:0;border-bottom:1px solid rgba(0,0,0,.05);white-space:nowrap;text-align:center}
#user-footer.type-28 .user-nav > a {display:inline-block;margin-right:1.25rem;font-size:.875rem;line-height:55px;vertical-align:middle}
#user-footer.type-28 .user-nav > a:last-child {margin-right:0}

/* logo */
#user-footer.type-28 .user-logo {width:200px;margin:0;padding-right:1.875rem;text-align:center}

/* address */
#user-footer.type-28 .user-address {float:left;width:calc(100% - 200px);font-size:.75rem;font-weight:300}
#user-footer.type-28 .user-address .copy {font-weight:normal;color:rgba(0,0,0,.85)}
#user-footer.type-28 .user-address .copy > a {color:inherit}
</style>


<!-- footer //-->

<jsp:include page="../common/footer.jsp" />

<!--// footer -->


<div class="clearfix text-center">
</div>
<button type="button" id="back-to-top" class="back-to-top" title="위로"><i class="icon-arrow-top"><span class="show-for-sr">위로</span></i></button>			</div>
			<!--// wrap -->

		</div>

	</div>
</div>

<script>
// Popup Json
var ___popup = [];
bannerpop.popup();
</script>
<script type="text/javascript">
// back to the top		
$(document).scroll(function(){
	var sDocumentHeight = $(document).height() - $(window).height();
	if($(document).scrollTop() > 0){	
		$('#back-to-top').fadeIn();
	}else{
		$('#back-to-top').fadeOut();
	}
});

$('#back-to-top, a[href="#top"]').click(function(){
	$('html, body').animate( {scrollTop:0}, 100);
});
</script>




<script>
$(document).ready(function(){
	// 닫기 버튼 자동 노출
	$('.ad-template.ad-close .ad-view').each(function(){
		$(this).append('<div class="ad-close-btn"><i class="icon-close"></i></div>');
	})

	// 닫기 버튼 클릭 시 이벤트
	$('body').on('click', '.ad-close-btn', function(){
		$(this).closest('.ad-view').slideUp();
	})

	// isND
	var ____is_nd = getCookie('____is_nd');
	if(____is_nd) {
				// ND IP만 광고 ID 보이기
		$('.ad-template').each(function(){
			$(this).append('<div class="ad-code-id">'+$(this).attr('id')+'</div>');
		})
		
				// 광고 ID 자동 숨김 설정 시
		$('.ad-code-id').hide();

		$('.ad-template').mouseenter(function(){
			$(this).find('.ad-code-id').show();
		}).mouseleave(function(){
			$(this).find('.ad-code-id').hide();
		})
		

			}
})



/* ****************************************** */
/* 날개배너 스크립트  */
/* ****************************************** */
$('#wingBanner .wing-banner-left .wing-banner').each(function(){
	if( $(this).data('scroll') == 'y' ) $(this).addClass('scroll-on');
});

$(window).scroll(function() {
	if( $('#wingBanner .wing-banner').length > 0 ){											// 날개배너가 있으면 작동

		var scrollingHeight_L = nonScrollingHeight_L = scrollingHeight_R = nonScrollingHeight_R = 0;

		$('#wingBanner .wing-banner').each(function(idx){
			var $_this		= $(this),														// 날개배너
				scroll		= $_this.data('scroll'),										// 날개배너 스크롤 여부
				topMargin	= $_this.data('top-margin'),									// 날개배너 상단여백
				downMargin	= $_this.data('down-margin'),									// 날개배너 하단여백
				duration	= $_this.data('duration'),										// 날개배너 스크롤 속도
				direction	= $_this.data('direction'),										// 날개배너 위치
				// bannerTop	= $_this.offset().top,											// 날개배너 상단 위치 (가변)
				bannderHeight = $_this.outerHeight();										// 날개배너 높이 (고정)

			var fixWingBannertop	= $('#wingBanner').offset().top;						// 날개배너 상단 위치 (고정)

			var articleTitleHeight	= $('#sticky-header.scroll').height();			// 날개배너 스크롤 시 상단 타이틀 높이 (기사 본문 시)
			if(!articleTitleHeight) articleTitleHeight = 0;

			var $_userFooter		= $('#user-footer'),									// 사이트 Footer
				userFooterHeight	= $_userFooter.outerHeight();							// 사이트 Footer 높이 (고정)

			var winScrollTop		= $(window).scrollTop(),								// 윈도우 스크롤 위치 (가변)
				winHeight			= $(window).height(),									// 윈도우 높이
				docHeight			= $(document).height();									// 페이지 높이

			switch (direction) {															// 날개 배너 위치 별
				case 'left':
					if(scroll == 'y') scrollingHeight_L += bannderHeight;					// 순서대로 노출되는 날개배너 중 스크롤 하는 배너의 높이값 (좌)
					else nonScrollingHeight_L += bannderHeight;								// 순서대로 노출되는 날개배너 중 스크롤 하지 않는 배너의 높이값 (좌)
					break;

				case 'right':
					if(scroll == 'y') scrollingHeight_R += bannderHeight;					// 순서대로 노출되는 날개배너 중 스크롤 하는 배너의 높이값 (우)
					else nonScrollingHeight_R += bannderHeight;								// 순서대로 노출되는 날개배너 중 스크롤 하지 않는 배너의 높이값 (우)
					break;
			}

			if(scroll == 'y') {																// 스크롤 배너만 움직임 처리
				var bannerAllHeight = siteAllHeight = 0;

				// 좌우측 각각 배너 스크롤 처리를 위해 나눠서 처리
				if(direction == 'left'){																			// 좌측 날개
					var wingBnTop_L = winScrollTop - fixWingBannertop + topMargin - nonScrollingHeight_L;			// 날개배너 스크롤 위치 (가변)

					if( articleTitleHeight ) wingBnTop_L += articleTitleHeight;										// 기사본문 시 상단 스크롤 타이틀이 나타나면 스크롤 타이틀 만큼 날개배너 위치 조정

					if((fixWingBannertop + nonScrollingHeight_L) < winScrollTop) {

						bannerAllHeight = articleTitleHeight + scrollingHeight_L + 1;								// 상단 타이틀 + 스크롤배너의 총 높이
						siteAllHeight = winHeight - userFooterHeight + downMargin;									// 윈도우 높이 + 사이트 Footer 높이

						if( (winScrollTop >= ((docHeight - userFooterHeight) - winHeight)) && (bannerAllHeight >= siteAllHeight) ) {					// 사이트 Footer 넘어가는 경우 처리
							wingBnTop_L -= ((userFooterHeight + downMargin) - (winHeight - (scrollingHeight_L + topMargin + articleTitleHeight)));
							$('#wingBanner .wing-banner-left .wing-banner.scroll-on').animate({top:wingBnTop_L+"px" },{queue: false, duration: duration});		// 마지막 배너 움직임 처리
						}
					} else {
						wingBnTop_L = 0;																			// 최상단 처리
					}
					$_this.animate({top:wingBnTop_L+"px" },{queue: false, duration: duration});

				} else {																							// 우측 날개

					var wingBnTop_R = winScrollTop - fixWingBannertop + topMargin - nonScrollingHeight_R;			// 날개배너 스크롤 위치 (가변)

					if( articleTitleHeight ) wingBnTop_R += articleTitleHeight;										// 기사본문 시 상단 스크롤 타이틀이 나타나면 스크롤 타이틀 만큼 날개배너 위치 조정

					if((fixWingBannertop + nonScrollingHeight_R) < winScrollTop) {

						bannerAllHeight = articleTitleHeight + scrollingHeight_R + 1;								// 상단 타이틀 + 스크롤배너의 총 높이
						siteAllHeight = winHeight - userFooterHeight + downMargin;									// 윈도우 높이 + 사이트 Footer 높이

						if( (winScrollTop >= ((docHeight - userFooterHeight) - winHeight)) && (bannerAllHeight >= siteAllHeight) ) {					// 사이트 Footer 넘어가는 경우 처리
							wingBnTop_R -= ((userFooterHeight + downMargin) - (winHeight - (scrollingHeight_R + topMargin + articleTitleHeight)));
							$('#wingBanner .wing-banner-right .wing-banner.scroll-on').animate({top:wingBnTop_R+"px" },{queue: false, duration: duration});		// 마지막 배너 움직임 처리
						}
					} else {
						wingBnTop_R = 0;																			// 최상단 처리
					}
					$_this.animate({top:wingBnTop_R+"px" },{queue: false, duration: duration});
				}
			}
		});
	}

});
</script>





</body>
</html>