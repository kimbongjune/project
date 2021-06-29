<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	
	String no 	= (String)request.getParameter("no"); 	//게시판의 no
	String k 	= request.getParameter("k"); 			//게시판의 body
	String t 	= request.getParameter("t");			
	String type = request.getParameter("type");
	
	
	String notice_listtype = (String)request.getParameter("notice_listtype");
	String jj_listtype	   = request.getParameter("jj_listtype");
	String hotel_listtype  = request.getParameter("hotel_listtype");
	String com_listtype	   = request.getParameter("com_listtype");
	
	
	//첨부파일을 가져오기 위한 객체
	BoardDto fdto2 = new BoardDto(); //jj_list 객체
	BoardDto fdto3 = new BoardDto(); //jj_hotellist 객체
	
	
	
	
	//utype 유저타입이 null 값이 아니면 wrt 글쓰기가 가능하게 만듬 (utype은 header에 선언되어 있음)
	boolean wrt = false; 
	if(utype != null) { wrt = true; }
	
	
//////////////////////////게시판페이징시작//////////////////////////////////////////////

	int pages = 1;
	
	//notice_list 객체
	ListDto dto1 = new ListDto();
	ListVo list1;
	dto1.setWhere("boardtype='1'");
	
	//jj_list 개체
	ListDto dto2 = new ListDto();
	ListVo list2;
	dto2.setWhere("boardtype='2'");
	
	//hotel_list 객체
	ListDto dto3 = new ListDto();
	ListVo list3;
	dto3.setWhere("boardtype='3'");
	
	//com_list 객체
	ListDto dto4 = new ListDto();
	ListVo list4;
	dto4.setWhere("boardtype='4'");
	
	
	//검색값 초기화
	if(k == null)
	{
		k="";
		dto1.setSearch(k); //notice_list
		dto2.setSearch(k); //jj_list
		dto3.setSearch(k); //hotel_list
		dto4.setSearch(k); //com_list
	}
	
	
	//게시판 타입 초기화
	if(notice_listtype == null)
	{notice_listtype = "1";}
	if(jj_listtype == null)
	{jj_listtype = "1";}
	if(hotel_listtype == null)
	{hotel_listtype = "1";}
	if(com_listtype == null)
	{com_listtype = "1";}
	
	
	dto1.setType(notice_listtype);
	dto1.setSearch(k);
	
	dto2.setType(jj_listtype);
	dto2.setSearch(k);
	
	dto3.setType(hotel_listtype);
	dto3.setSearch(k);
	
	dto4.setType(com_listtype);
	dto4.setSearch(k);
	
	int curpage = 1;
	
	try
	{
		//페이지 번호가 잘못넘어와도 curpage==1, 받아온 문자열을 정수로 변환
		curpage = Integer.parseInt(request.getParameter("page"));
	}catch(Exception e){}
	
	list1 = dto1.GetList(curpage);
	list2 = dto2.GetList(curpage);
	list3 = dto3.GetList(curpage);
	list4 = dto4.GetList(curpage);
	
	//총 게시물수 얻어옴
	int maxrecord1 = dto1.getTotal();
	int maxrecord2 = dto2.getTotal();
	int maxrecord3 = dto3.getTotal();
	int maxrecord4 = dto4.getTotal();
	
	//게시물 시작번호
	int startno1 = 0;
	int startno2 = 0;
	int startno3 = 0;
	int startno4 = 0;
		
	//페이지당 게시물 갯수  ----- 게시판마다 뿌려주는 게시물수가 다르니 이곳을 수정하자!
	int percount1 = 10;
	int percount2 = 9;
	int percount3 = 9;
	int percount4 = 0;
	
	//게시물 시작번호
	startno1 = (curpage - 1) * percount1 + 1;
	startno2 = (curpage - 1) * percount2 + 1;
	startno3 = (curpage - 1) * percount3 + 1;
	startno4 = (curpage - 1) * percount4 + 1;
	
	//페이지 시작 번호
	int startpageno1 = ((curpage - 1) / percount1) * percount1 + 1;
	int startpageno2 = ((curpage - 1) / percount2) * percount2 + 1;
	int startpageno3 = ((curpage - 1) / percount3) * percount3 + 1;
	int startpageno4 = ((curpage - 1) / percount4) * percount4 + 1;
	
	
	//끝 페이지 번호
	int endpageno1 = (startpageno1 + percount1) - 1;
	int endpageno2 = (startpageno2 + percount2) - 1;
	int endpageno3 = (startpageno3 + percount3) - 1;
	int endpageno4 = (startpageno4 + percount4) - 1;
	
	//최대 페이지 번호
	int maxpage1 = maxrecord1 / percount1;
	int maxpage2 = maxrecord2 / percount2;
	int maxpage3 = maxrecord3 / percount3;
	int maxpage4 = maxrecord4 / percount4;
	
	if(maxrecord1 % percount1 != 0 ) { maxpage1++; }
	if(maxrecord2 % percount2 != 0 ) { maxpage2++; }
	if(maxrecord3 % percount3 != 0 ) { maxpage3++; }
	if(maxrecord4 % percount4 != 0 ) { maxpage4++; }
	
	if(endpageno1 >= maxpage1) { endpageno1 = maxpage1; }
	if(endpageno2 >= maxpage2) { endpageno2 = maxpage2; }
	if(endpageno3 >= maxpage3) { endpageno3 = maxpage3; }
	if(endpageno4 >= maxpage4) { endpageno4 = maxpage4; }

//////////////////////////게시판페이징끝//////////////////////////////////////////////


//////////////////////////main.jsp 시작 //////////////////////////////////////////////

	ListDto Maindto = new ListDto();
	ListVo Mainlist;
	Maindto.setWhere("boardtype='2'");
	Mainlist = Maindto.GetMainList();
	BoardDto Mainfdto = new BoardDto();

	ListDto Maindto2 = new ListDto();
	ListVo Mainlist2;
	Maindto2.setWhere("boardtype='3'");
	Mainlist2 = Maindto2.GetMainList();
	BoardDto Mainfdto2 = new BoardDto();


//////////////////////////main.jsp 끝 //////////////////////////////////////////////



//////////////////////////play.jsp 시작 //////////////////////////////////////////////

	ListDto Playdto = new ListDto();
	ListVo Playlist;
	Playdto.setWhere("boardtype='2'");
	Playlist = Playdto.GetPlayList();
	BoardDto playfdto = new BoardDto();

//////////////////////////play.jsp 끝 //////////////////////////////////////////////


//////////////////////////hotel.jsp 시작 //////////////////////////////////////////////

	ListDto hoteldto = new ListDto();
	ListVo hotellist;
	hoteldto.setWhere("boardtype='3'");
	hotellist = hoteldto.GethotelList();

//////////////////////////play.jsp 끝 //////////////////////////////////////////////






//////////////////////////////view 공통 파라미터 시작//////////////////////////////////////


	boolean mod = false; //닉네임이 null 값이 아니고 작성자 아이디면 true로 변경해서 수정과 삭제를 가능하게 해줌
	
	
	//view 페이지 게시물 번호
	int view_no; 	//게시물번호
	boolean namecheck = false; //com_view.jsp에서만 사용하는 변수



















//////////////////////////////view 공통 파라미터 끝//////////////////////////////////////



%>