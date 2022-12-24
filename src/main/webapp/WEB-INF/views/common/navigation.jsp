<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main">JSP 게시판 웹 사이트</a>
	</div>
	<div class="collapse navbar-collapse"
		id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="main">메인</a></li>
			<li><a href="board">게시판</a></li>
		</ul>
		
		<c:if test="${sessionScope.userID == null}">
			<ul class="nav navebar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expended="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login">로그인</a></li>
						<li><a href="join">회원가입</a></li>
					</ul></li>
			</ul>
		</c:if>
		
		<c:if test="${sessionScope.userID != null}">
			<ul class="nav navebar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expended="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAct">로그아웃 </a></li>
					</ul></li>
			</ul>
		</c:if>
	</div>
</nav>