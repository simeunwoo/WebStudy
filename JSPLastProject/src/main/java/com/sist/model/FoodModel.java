package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class FoodModel {

	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request,HttpServletResponse response)
	{
		CommonsModel.footerPrint(request);
		
		// 사용자 요청값 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<FoodVO> fList=FoodDAO.foodListData(map);
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		int count=FoodDAO.foodListCount();
		
		// DB 연동 => 출력할 데이터 전송
		request.setAttribute("fList", fList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		
		// Cookie 저장
		Cookie cookie=new Cookie("food_"+fno, fno);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		// 브라우저로 전송
		response.addCookie(cookie);
		
		return "redirect:../food/detail.do?fno="+fno+"&type="+type;
	}
	
	// 상세 보기
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response)
	{
		CommonsModel.footerPrint(request);
		
		// 사용자 요청 데이터 받기 => fno, type(좋아요/찜/댓글)
		/*
		 * 	맛집(1) / 레시피(2) / 서울 여행(3) / 상품(4)
		 */
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		
		// DB 연동
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		
		String addr=vo.getAddress(); // 서울 종로구 명륜2가 21-14
		String addr1=addr.substring(addr.indexOf(" ")+1); // 종로구 명륜2가 21-14
		String addr2=addr1.substring(0,addr1.indexOf(" ")); // 종로구
		
		List<FoodVO> rList=FoodDAO.foodNearListData(addr2);
		
		request.setAttribute("vo", vo);
		request.setAttribute("type", type);
		request.setAttribute("rList", rList);
		
		boolean bCheck=false;
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null)
		{
			Map map=new HashMap();
			map.put("cno", fno);
			map.put("type", type);
			map.put("id", id);
			
			int count=AllJjimDAO.allJjimCheck(map);
			if(count==1)
				bCheck=true;
			else
				bCheck=false;
			
			request.setAttribute("check", bCheck);
		}
		
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
	
	// 검색
	// _ok.do => redirect : 이전에 존재하는 화면으로 이동
	// ajax => void : 자체 파일에서 처리
	// 일반 => main.jsp
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request,HttpServletResponse response)
	{
		CommonsModel.footerPrint(request);
		
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String ss=request.getParameter("ss"); // ss : 주소
		if(ss==null)
			ss="마포";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("ss", ss);
		map.put("start", start);
		map.put("end", end);
		
		// DB 연동 => 데이터 읽기
		List<FoodVO> fList=FoodDAO.foodFindListData(map);
		
		// 총 페이지 읽기
		int totalpage=FoodDAO.foodFindTotalPage(ss);
		
		// BLOCK 별 처리
		final int BLOCK=10;		
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("ss", ss);
		request.setAttribute("fList", fList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
}
