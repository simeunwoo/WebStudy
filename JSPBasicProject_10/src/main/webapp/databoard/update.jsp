<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	DataBoardDAO dao=DataBoardDAO.newInstance();
	DataBoardVO vo=dao.databoardUpdateData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 600px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>수정하기</h3>
		<div class="row">
		<form method="post" action="update_ok.jsp">
			<table class="table">
				<tbody>
					<tr>
						<th width=15% class="text-right">이름</th>
						<td width=85%>
							<input type=text name=name size=20 class="input-sm" required
							value="<%=vo.getName()%>">
							<input type="hidden" name=no value="<%=vo.getNo()%>">
						</td>
					</tr>
					<tr>
						<th width=15% class="text-right">제목</th>
						<td width=85%>
							<input type=text name=subject size=60 class="input-sm" required
							value="<%=vo.getSubject()%>">
						</td>
					</tr>
					<tr>
						<th width=15% class="text-right">내용</th>
						<td width=85%>
							<textarea rows="10" cols="62" name=content><%=vo.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<th width=15% class="text-right">비밀번호</th>
						<td width=85%>
							<input type=password name=pwd size=10 class="input-sm">
						</td>
					</tr>
					<tr>
						<td colspan=2 class="text-center">
							<button class="btn-sm btn-danger">수정하기</button>
							<input type=button value="취소" class="btn-sm btn-primary"
							onclick="javascript:history.back()">
						</td>
					</tr>					
				</tbody>
			</table>
		</form>
		</div>
	</div>
</body>
</html>