package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;
import java.util.*;

@WebServlet("*.do") // 목록 요청 => list.do / insert.do / detail.do
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map clsMap=new HashMap();
	
	public void init(ServletConfig config) throws ServletException {
		clsMap.put("board/list.do", new BoardListModel());
		clsMap.put("board/detail.do", new BoardDetailModel());
		clsMap.put("board/insert.do", new BoardInsertModel());
		clsMap.put("board/insert_ok.do", new BoardInsertOkModel());
		clsMap.put("board/update.do", new BoardUpdateModel());
		clsMap.put("board/update_ok.do", new BoardUpdateOkModel());
		clsMap.put("board/delete.do", new BoardDeleteModel());
		clsMap.put("board/delete_ok.do", new BoardDeleteOkModel());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8080/JSPMiddleProject_4/board/list.jsp => URL
		// /JSPMiddleProject_4/board/list.jsp => URI
		// /JSPMiddleProject_4 => ContextPath
		String cmd=request.getRequestURI();
		cmd=cmd.substring(request.getContextPath().length()+1);
		// +1 : 예를 들면 JSPMiddleProject_4 뒤에 / 부분까지 포함한다는 뜻
		
		String jsp="";
		
		/*
		if(cmd.equals("board/list.do"))
		{
			BoardListModel model=new BoardListModel();
			jsp=model.execute(request);
		}
		else if(cmd.equals("board/detail.do"))
		{
			BoardDetailModel model=new BoardDetailModel();
			jsp=model.execute(request);
		}
		else if(cmd.equals("board/insert.do"))
		{
			BoardInsertModel model=new BoardInsertModel();
			jsp=model.execute(request);
		}
		else if(cmd.equals("board/insert_ok.do"))
		{
			BoardInsertOkModel model=new BoardInsertOkModel();
			jsp=model.execute(request);
		}
		*/
		
		Model model=(Model)clsMap.get(cmd);
		jsp=model.execute(request);
		
		// request를 해당 JSP로 전송
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
