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
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>

	<%
	int pageNumber = 1;
// 	if (request.getParameter("pageNumber") != null) {
// 		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
// 	}
	%>
	<jsp:include page="../common/navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</thead>
				<tbody>
					
					<tr>
						<td></td>
						<td><a href="view.jsp?bbsID">
								</a></td>
						<td></td>
						<td></td>
					</tr>


				</tbody>
			</table>
			
			
			
		
			<div class="pull-right">
				<a href="write" class="btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>