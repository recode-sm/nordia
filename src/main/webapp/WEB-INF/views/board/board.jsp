<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					</tr>
				    <c:forEach var="boardDTO" items="${boardList}">
 						<tr onclick="location.href='${pageContext.request.contextPath}/view?bbsID=${boardDTO.bbsID}'">
 							<td>${boardDTO.bbsID}</td>
					    	<td class="left">${boardDTO.bbsTitle}</td>
					    	<td>${boardDTO.userID}</td>
					    	<td><fmt:parseDate var="bbsDate" value="${boardDTO.bbsDate}" pattern="yyyy-MM-dd"/>
					    		<fmt:formatDate value="${bbsDate}" pattern="yyyy.MM.dd"/>
					    		</td>
					    	</tr>     
				    </c:forEach>
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
			
			<c:if test="${pageVO.startPage > pageVO.pageBlock}">
				<a href="${pageContext.request.contextPath}/board?nowPage=${pageVO.startPage-pageVO.pageBlock}">Prev</a>
			</c:if>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${ pageVO.endPage}" step="1">
				<a href="${pageContext.request.contextPath}/board?nowPage=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${endPage < pageCount }">
				<a href="${pageContext.request.contextPath}/board?nowPage=${pageVO.startPage+pageVO.pageBlock}">Next</a>
			</c:if>
					
			<div class="pull-right">
				<a href="write" class="btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>