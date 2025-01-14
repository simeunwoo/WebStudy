<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">공지 사항</h2>
			<table class="table">
			<tr>
				<th width="10%" class="text-center">번호</th>
				<th width="55%" class="text-center">제목</th>
				<th width="10%" class="text-center">작성자</th>
				<th width="15%" class="text-center">작성일</th>
				<th width="10%" class="text-center">조회수</th>
			</tr>
			<c:set var="count" value="${count }"/>
			<c:forEach var="vo" items="${nList }">
				<tr>
					<td width="10%" class="text-center">${count }</td>
					<td width="55%"><a href="../notice/detail.do?no=${vo.no }">[${vo.notice_type }]&nbsp;${vo.subject }</a></td>
					<td width="10%" class="text-center">${vo.name }</td>
					<td width="15%" class="text-center">${vo.dbday }</td>
					<td width="10%" class="text-center">${vo.hit }</td>
				</tr>
			<c:set var="count" value="${count-1 }"/>
			</c:forEach>
			<tr>
				<td colspan="6" class="text-center">
					<a href="#" class="btn btn-sm btn-warning">이전</a>
						${curpage } page / ${totalpage } pages
					<a href="#" class="btn btn-sm btn-danger">다음</a>
				</td>
			</tr>
		</table>
		</main>
	</div>
</body>
</html>