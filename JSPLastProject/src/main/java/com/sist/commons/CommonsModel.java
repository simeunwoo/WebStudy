package com.sist.commons;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

public class CommonsModel {

	public static void footerPrint(HttpServletRequest request)
	{
		// 1. 공지 사항
		List<NoticeVO> footNList=NoticeDAO.noticeTop5Data();
		request.setAttribute("footList", footNList);
		// 2. 인기 맛집
		// 3. 뉴스
	}
}