<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/heml; charset="UTF-8">
<meta name="viewport" content="width=device-width" ,intial-scale="1">
<%-- 반응형 웹 디자인 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<%--같은 폴더안에있는 bootstrap을 이용하겠다.--%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<jsp:include page="../common/navigation.jsp"></jsp:include>	
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${boardDTO.bbsTitle}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${boardDTO.userID}</td>

					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${boardDTO.bbsDate}</td>

					</tr>
					<tr>
						<td>글 내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">
						${boardDTO.bbsContent}</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">
						<a href="${pageContext.request.contextPath}/resources/upload/${boardDTO.file}" download>${boardDTO.file}</a></td>
					</tr>
				</tbody>
			</table>
			<a href="board" class="btn btn-primary">목록</a>
			<c:if test="${sessionScope.userID == boardDTO.userID}">
				<a href="update?bbsID=${boardDTO.bbsID}" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까 ?')" href="deleteAct?bbsID=${boardDTO.bbsID}" class="btn btn-primary">삭제</a>
			</c:if>

		</div>
	</div>
</body>
</html>