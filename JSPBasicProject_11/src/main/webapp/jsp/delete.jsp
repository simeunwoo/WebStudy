<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키 한개 삭제
	// => key값을 확인
	// seoul_no
	String no=request.getParameter("no");
	Cookie[] cookies=request.getCookies();
	if(cookies!=null)
	{
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("seoul_"+no))
			{
				cookies[i].setPath("/"); // 저장 위치 확인
				cookies[i].setMaxAge(0); // 삭제
				response.addCookie(cookies[i]);
				break;
			}
		}
	}
	response.sendRedirect("list.jsp");
%>