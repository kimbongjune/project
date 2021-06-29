<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	String no 	= (String)request.getParameter("no"); 	//게시판의 no
	String k 	= request.getParameter("k"); 			//게시판의 body
	if(k == null)
	{
		k="";	
	}
	String t 	= request.getParameter("t");		
	if(t == null)
	{
		t="1";	
	}
	String type = request.getParameter("type");
	
	
	//파일명에 따라 쓸 파라미터를 결정
	String url = request.getServletPath();
	System.out.println(url);
	url =  url.substring(url.lastIndexOf("/") + 1);
	System.out.println(url);
	url = url.replace(".jsp", "");
	System.out.println(url);
	
	
	String listtype = "";

	
	
	if(url.equals("notice_list")) {  listtype = (String)request.getParameter("listtype"); }
	if(url.equals("jj_list"    )) {  listtype = request.getParameter("listtype");         }
	if(url.equals("hotel_list" )) {  listtype = request.getParameter("listtype");		  }
	if(url.equals("com_list"   )) {  listtype = request.getParameter("listtype");		  }
	
	
	//첨부파일을 가져오기 위한 객체
	BoardDto fdto = new BoardDto(); //jj_list 객체,jj_hotellist 객체
	
	
	
	//utype 유저타입이 null 값이 아니면 wrt 글쓰기가 가능하게 만듬 (utype은 header에 선언되어 있음)
	boolean wrt = false; 
	if(utype != null) { wrt = true; }
	
	
//////////////////////////게시판페이징시작//////////////////////////////////////////////

	int pages = 1;

	ListDto dto = new ListDto(); //list 객체

	
	
	if(url.equals("notice_list")) { dto.setWhere("boardtype='1'"); }
	if(url.equals("jj_list"    )) { dto.setWhere("boardtype='2'"); }
	if(url.equals("hotel_list" )) { dto.setWhere("boardtype='3'"); }
	if(url.equals("com_list"   )) { dto.setWhere("boardtype='4'"); }
	
	
	//검색값 초기화
	if(k == null) { k=""; }
	
	
	//게시판 타입 초기화
	if(url.equals("notice_list")) { if(listtype == null) { listtype  = "1"; } }
	if(url.equals("jj_list"    )) { if(listtype == null) { listtype  = "1"; } }
	if(url.equals("hotel_list" )) { if(listtype == null) { listtype  = "1"; } }
	if(url.equals("com_list"   )) { if(listtype == null) { listtype  = "1"; } }
	

	dto.setType(listtype);
	dto.setSearch(k);
	String order = request.getParameter("order");
	if(order == null)
	{
		order = "1";
	}
	dto.setOrder(order);
	int curpage = 1;

	try
	{
		//페이지 번호가 잘못넘어와도 curpage==1, 받아온 문자열을 정수로 변환
		curpage = Integer.parseInt(request.getParameter("page"));
	}catch(Exception e){}
	
	ListVo list = dto.GetList(curpage);

	
	//총 게시물수 얻어옴
	int maxrecord = dto.getTotal();
	
	
	//게시물 시작번호
	int startno = 0;

		
	//페이지당 게시물 갯수  ----- 게시판마다 뿌려주는 게시물수가 다르니 이곳을 수정하자!
	int percount = 10;

	
	//게시물 시작번호
	startno = (curpage - 1) * percount + 1;

	
	//페이지 시작 번호
	int startpageno = ((curpage - 1) / percount) * percount + 1;

	
	
	//끝 페이지 번호
	int endpageno = (startpageno + percount) - 1;

	
	//최대 페이지 번호
	int maxpage = maxrecord / percount;

	if(url.equals("notice_list")) { if(maxrecord % percount != 0 ) { maxpage++; }}
	else{if(maxrecord % 9 != 0 ) { maxpage++; }}

	if(endpageno >= maxpage) { endpageno = maxpage; }

//////////////////////////게시판페이징끝//////////////////////////////////////////////


//////////////////////////main.jsp 시작 //////////////////////////////////////////////



//////////////////////////main.jsp 끝 //////////////////////////////////////////////



//////////////////////////////view 공통 파라미터 시작//////////////////////////////////////


	boolean mod = false; //닉네임이 null 값이 아니고 작성자 아이디면 true로 변경해서 수정과 삭제를 가능하게 해줌
	
	
	//view 페이지 게시물 번호
	int view_no; 	//게시물번호
	boolean namecheck = false; //com_view.jsp에서만 사용하는 변수

















//////////////////////////////view 공통 파라미터 끝//////////////////////////////////////



%>