<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid whitezzz "style="height:100px;"></div>
		<div class="container text-center py-5" style="max-width: 200px; ">
			<div class="mx-auto text-center mb-5" style="max-width: 200px;">
				<h5 class="section-title py-12"></h5>
				<h1 class="mb-0 " >QnA</h1>
			</div>
		</div>
<div class="wrapper row3">
  <main class="container clear">
   <table class=table>
    <tr>
     <td> 
      <a href="../replyboard/insert.do" class="btn btn-sm btn-primary">등록</a>
     </td>
    </tr>
   </table>
   <table class="table">
    <tr>
      <th width="10%" class="text-center">번호</th>
      <th width="45%" class="text-center">제목</th>
      <th width="15%" class="text-center">작성자</th>
      <th width="20%" class="text-center">작성일</th>
      <th width="10%" class="text-center">조회수</th>
    </tr>
    <c:set var="count" value="${count }"/>
    <c:forEach var="rbvo" items="${rbList }">
     <tr>
      <td width="10%" class="text-center">${count }</td>
      <td width="45%">
       <c:if test="${rbvo.group_step>0 }">
        &nbsp;&nbsp;
        <img src="../replyboard/re_icon.png">
       </c:if>
       ${rbvo.subject}
      </td>
      <td width="15%" class="text-center">${rbvo.name }</td>
      <td width="20%" class="text-center">${rbvo.dbday }</td>
      <td width="10%" class="text-center">${rbvo.hit }</td>
    </tr>
    <c:set var="count" value="${count-1}"/>
    </c:forEach>
   </table>
   <table class="table">
     <tr>
       <td class="text-center">
        <a href="#" class="btn btn-sm btn-info">이전</a>
         ${curpage } page / ${totalpage } pages
        <a href="#" class="btn btn-sm btn-info">다음</a>
       </td>
     </tr>
   </table>
  </main>
</div>
</body>
</html>