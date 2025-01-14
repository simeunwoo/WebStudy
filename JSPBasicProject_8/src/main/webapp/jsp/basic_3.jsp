<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP => 파일을 만드는 것이 아니다
	       =================
	       public void _jspService(request)
	       {
	       		// 사용자 요청에 대한 처리 내용 코딩 => 메소드 영역에서 코딩을 하고 있다
	       		// JSP마다 request를 가지고 있다
	       }
	
	JSP
		a.jsp =======> a_jsp.java =======> a_jsp.class =======> out.write() =======> 메모리에 저장
		       실행 요청               컴파일                인터프리터  ============
		                                                        브라우저에서 실행 내용 (HTML/CSS/JS)
		                                                                          |
		                                                                         브라우저에서 읽는다
		                                                                         
	=> 지시자
	page / taglib
	====
	JSP에 대한 정보
		브라우저에 알려주는 정보 => contentType="text/html,text/xml,text/plain"
		라이브러리 읽기 => import=",", 단독 사용이 가능
		에러 시 이동하는 페이지 => errorPage="에러 내용 출력 파일"
		HTML을 출력해두는 메모리 공간 크기 => buffer="8kb" => 16kb
		
	=> 액션 태그
		<jsp:include>, <jsp:useBean>, <jsp:setProperty>
		<jsp:include> : 파일 여러개를 묶어서 한개의 파일로 제작
		<jsp:useBean> : 클래스 메모리 할당
		<jsp:setProperty> : 멤버 변수에 값을 채운다
	
	=> 자바/HTML을 구분
		<% %> : 일반 자바 코딩, 지역 변수만 사용 가능, 연산자, 제어문, 메소드 호출 영역
		<%= %> : 변수 출력 => 브라우저에 출력
	
	=> 내장 객체
		request : 사용자 요청 정보, 추가 정보
		response : 서버에서 요청에 대한 응답
			=> HTML
			=> Cookie
		session : 서버에 사용자의 일부 정보를 저장하는 공간
		application : 서버와 관련된 정보
		out : 출력 버퍼와 관련된 정보
		pageContext : JSP 파일과 관련된 정보 / 웹 흐름에 대한 정보
		
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>