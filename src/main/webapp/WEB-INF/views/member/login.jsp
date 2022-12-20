<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAct">
					<h3 style="">로그인 화면</h3>
					<div class="from-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>