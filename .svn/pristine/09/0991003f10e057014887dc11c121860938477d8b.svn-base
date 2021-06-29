<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% 

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

/*

	view 공통 파라미터는 param.jsp에 선언되어 있음
	
	공통파라미터 목록
	boolean mod 
	int view_no
	boolean namecheck 

*/		


	//파일명에 따라 쓸 파라미터를 결정
	url = request.getServletPath();
	System.out.println(url);
	url =  url.substring(url.lastIndexOf("/") + 1);
	System.out.println(url);
	url = url.replace(".jsp", "");
	System.out.println(url);

	
	
	BoardDto view_dto = new BoardDto();
	BoardVo view_vo2 = new BoardVo();
	if(url.equals("notice_view")) { view_vo2 = view_dto.NewsView(view_no ); }
	if(url.equals("jj_view"    )) { view_vo2 = view_dto.EnjoyView(view_no );}
	if(url.equals("hotel_view" )) { view_vo2 = view_dto.RoomView(view_no ); }
	if(url.equals("com_view"   )) { view_vo2 = view_dto.ComView(view_no );  }
	
	FileListDto view_fdto = new FileListDto();
	//no번 게시물에 대한 첨부파일을 다 가져오자
	FileListVo view_list =  view_fdto.GetList(view_no);
	
	
	
	String view_pages = request.getParameter("page");
	String boardtype= request.getParameter("boardtype");
	
	String param = "?no=" + view_no + "&page=" + curpage + "&k=" + k + "&boardtype=" + boardtype +"&t=" + t;
	
	if(nickname != null)
	{
		if(nickname.equals(view_vo2.getNickname()))
		{
			mod = true;
		}
		namecheck = true;
	}

	if(k == null)
	{
		k = "";
	}
	
	if(view_pages == null)
	{
		view_pages = "";
	}

////////////////////////////notice_view.jsp 끝///////////////////////////////////////	
	
////////////////////////////jj_view.jsp 시작///////////////////////////////////////	

	String select2 = request.getParameter("select");
	String nick2 = request.getParameter("nickname");
	
////////////////////////////jj_view.jsp 끝///////////////////////////////////////	
	
////////////////////////////jj_view.jsp 시작///////////////////////////////////////	
	
	String select3 = request.getParameter("select");
	String nick3 = request.getParameter("nickname");
	
////////////////////////////jj_view.jsp 끝///////////////////////////////////////	

	
	
	
	
%>