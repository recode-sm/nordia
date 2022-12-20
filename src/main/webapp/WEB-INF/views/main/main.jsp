<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/heml; charset="UTF-8">
<meta name="viewport" content="width=device-width" ,intial-scale="1">
<%-- 반응형 웹 디자인 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<%--같은 폴더안에있는 bootstrap을 이용하겠다.--%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<jsp:include page="../common/navigation.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				</br>
				<p>이 웹 사이트는 부트스트랩으로 만든 JSP웹 사이트입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다.</p>
				<p>
					<a class="btn btn-primary btn-pull"
						href="https://github.com/sunyoring" role="button">개발자 알아보기</a>
				</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>>
				<li data-target="#myCarousel" data-slide-to="1"></li>>
				<li data-target="#myCarousel" data-slide-to="2"></li>>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/resources/images/cityView.jpg">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/images/cityView2.jpg">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/images/cityView3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>	
</body>
</html>