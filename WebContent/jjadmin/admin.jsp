<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "게시글관리 페이지"; %>
<script src="../js/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<link type="text/css" rel="stylesheet" href="../css/sub.css"></link>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	int oredertype;
	String orderby = request.getParameter("orderby"); if(orderby == null) { orderby = ""; }
	try
	{
		oredertype= Integer.parseInt(request.getParameter("oredertype"));	
	}catch(Exception e)
	{
		oredertype = 0;
	}
	 
	try
	{
		user = (UserVo)session.getAttribute("login");
		utype = user.getType();
		if(!utype.equals("1"))
		{	
			%>
			<script>
				alert("비 정상적인 접근 입니다.");
				location.href="../jjmain/main.jsp";
			</script>
			<%
		}
	}catch(Exception e)
	{
		%>
		<script>
			alert("비 정상적인 접근 입니다.");
			location.href="../jjmain/main.jsp";
		</script>
		<%
	}

	String Ad = "1"; // Admin.java 에 넘겨줘서 page를 분별하는 변수
	
	type = "1";
	String admin_listtype = request.getParameter("admin_listtype");
	String where = request.getParameter("boadrtype");
	String BoardType = request.getParameter("boadrtype");
	if(where == null)
	{
		where = "";
	}
	
	if(admin_listtype == null)
	{
		admin_listtype = "";
	}
	
		
	AdminListDto admindto = new AdminListDto();
	ListVo Admin_list;
	
	if(k == null)
	{
		k="";
	}	
	admindto.setType(admin_listtype);
	admindto.setOrder(Integer.toString(oredertype));
	admindto.setFormal(orderby);
	int admin_curpage = 1;
	System.out.print(k);
	
	try
	{
		//페이지 번호가 잘못넘어와도 admin_curpage==1, 받아온 문자열을 정수로 변환
		admin_curpage = Integer.parseInt(request.getParameter("page"));
	}catch(Exception e)
	{
		
	}
	
	UserDto userdto = new UserDto();
	UserListVo userlist;
	userlist = userdto.userlist(admin_curpage);
	
	admindto.setSearch(k);
	list = admindto.GetList(admin_curpage);
		//out.print(admin_curpage);
		//총 게시물수 얻어옴
		int admin_maxrecord = admindto.getTotal();
		//System.out.print("총 게시물 수는 : " + admin_maxrecord);
		
		//게시물 시작번호
		int admin_startno = 0;
		
		//페이지당 게시물 갯수
		int admin_percount = 5;
		//만약 페이지가 잘못 넘어와도 페이지 번호를 1로 초기화 시켜줌
		
		//게시물 시작번호
		admin_startno = (admin_curpage - 1) * admin_percount + 1;
		
		//페이지 시작 번호
		int admin_startpageno = ((admin_curpage - 1) / admin_percount) * admin_percount + 1;
		//끝 페이지 번호
		int admin_endpageno = (admin_startpageno + admin_percount) - 1;
		
		//최대 페이지 번호
		int admin_maxpage = admin_maxrecord / 10;
		if(admin_maxrecord % admin_percount != 0 )
		{
			admin_maxpage++;
		}
		
		if(admin_endpageno >= admin_maxpage)
		{
			admin_endpageno = admin_maxpage;
		}
		//userlist 페이징 코드
	
%>
<style>
#mct 
{
 	width: 100%;
   	height: auto;
   	margin: 0 auto;
   	color: #777;
   	border-top: 1px solid #e3e3e3;
}
.con_area 
{
    width: 60%;
    margin: 0 auto;
    padding: 0;
}
.adminbutton
{
    border: solid 0.5px black;
    width: 150px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
.adminsel
{
    border: solid 0.5px black;
    width:90px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
.adminbtn
{
    border: solid 0.5px black;
    width:30px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
td
{
	vertical-align: middle;
}
</style>
<script>
	var pages = "<%= pages %>";
	var k = "<%= k %>";
	var admmintype = "<%= admin_listtype %>";
	var oredertype = "<%= oredertype %>";
	var orderby = "<%= orderby %>";
	function admindel(no , boardtype) 
	{
		if(confirm("게시글을 삭제 하시겠습니까?") != 1)
		{
			return;
		}
		window.location='../Admin.do?Ad=1&no=' + no + '&boardtype=' + boardtype + '&page=' + pages + '&k=' + k + '&admin_listtype=' +admmintype + "&oredertype=" +oredertype + "&orderby=" + orderby;
	}
	function adminrestore(no , boardtype) 
	{
		if(confirm("게시글을 복원 하시겠습니까?") != 1)
		{
			return;
		}
		window.location='../Admin.do?Ad=0&no=' + no + '&boardtype=' + boardtype + '&page=' + pages + '&k=' + k + '&admin_listtype=' +admmintype + "&oredertype=" +oredertype + "&orderby=" + orderby;
	}
	
</script>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
		<!-- 보안 : 클래스 이름,자바스크립트 이름으로 Control 로 임시로 붙였는데 마지막에는 수정해주셈 -->
		<div class="whatMenu">
			게시글 관리
		</div>
		<div class="vertical1">
			<div>
				<!-- 전체게시물 뿌려주는거 확인용 -->
				<%-- <input type="text" value="<%= admin_maxrecord %>" class="button1" id="adminbtn" style="align:center"> --%>
				<input type="button" value="게시글관리" class="button1" id="adminbtn" onClick="location.href='admin.jsp'">
				<input type="button" value="회원관리" class="button2" id="adminbtn" onClick="location.href='admin2.jsp'">
				<input type="button" value="사이트 통계" class="button3" id="adminbtn" onClick="location.href='adminChart.jsp'">
			</div>
		</div>	
		<div class="vertical2">
			<!-- 게시글관리  -->
			<div class="memberControl"  style="vertical-align: middle;">
				<form id="boadrFrm" name="boadrFrm" action="../Admin.do" method="get">
				<table border="1" class="admin_listTable">
					<tr class="adminTh" height="20px">
						<th class="adminSize1" onclick="window.location='admin.jsp?orderby=<% if(orderby.equals("no")){ out.print("no1"); }else{out.print("no");} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">번호</th>
						<th class="adminSize2" onclick="window.location='admin.jsp?orderby=<% if(orderby.equals("title")){ out.print("title1"); }else{out.print("title");} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">제목</th>
						<th class="adminSize3" onclick="window.location='admin.jsp?orderby=<% if(orderby.equals("write")){ out.print("write1"); }else{out.print("write");} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">작성자</th>
						<th class="adminSize3" onclick="window.location='admin.jsp?orderby=<% if(orderby.equals("date")){ out.print("date1"); }else{out.print("date");} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">작성일</th>
						<th class="adminSize5" onclick="window.location='admin.jsp?orderby=<% if(orderby.equals("hit")){ out.print("hit1"); }else{out.print("hit");} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">조회수</th>
						<th class="adminSize4" onclick="window.location='admin.jsp?oredertype=<%if(oredertype > 4){out.print(oredertype = 0);}else{ out.print(oredertype+1);} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">게시물타입</th>
						<th class="adminSize1" colspan="2">관리</th>
					</tr>
					<%
					String title = "";
					String BType = "";
					for(int i = 0 ; i < list.Total() ; i++)
					{ItemVo item = list.Get(i);
					
					
					if(item.getTitle().length() > 20)
					{
						title  = item.getTitle().substring(0,20);
						title += "..";
					}else
					{
						title  = item.getTitle();
					}
					if(item.getBoardtype() == 1)
					{
						BType = "공지";
					}
					if(item.getBoardtype() == 2)
					{
						BType = "음식";
					}
					if(item.getBoardtype() == 3)
					{
						BType = "숙소";
					}
					if(item.getBoardtype() == 4)
					{
						BType = "자유";
					}
					if(item.getBoardtype() == 5)
					{
						BType = "삭제";
					}
					%>
					<tr class="adminTd">
						<td><%= item.getNo() %></td>
						<%
						String run = "";
						String admin_request = "?no=" + item.getNo() + "";
						if(item.getBoardtype() == 1)
						{
							run = "../jjnotice/notice_view.jsp";
						}
						if(item.getBoardtype() == 2)
						{
							run = "../jjplay/jj_view.jsp";
						}
						if(item.getBoardtype() == 3)
						{
							run = "../jjinn/hotel_view.jsp";
						}
						if(item.getBoardtype() == 4)
						{
							run = "../jjfree/com_view.jsp";
						}
						%>
						<td>
						<%if(item.getBoardtype() == 5 ){%><span title="<%= item.getTitle() %>"><font color="red" onclick="alert('삭제된 게시글 입니다.')"><%= title %></font></span><%}%>
						<%if(item.getBoardtype() != 5 ){%><span title="<%= item.getTitle() %>" onclick="window.location='<%= run %><%= admin_request %>'"><%= title %></span><%}%>
						</td>
						<td><%= item.getNickname()%></td>  
						<td><%= item.getDate() %></td>
						<td><%= item.getHit() %></td>
						<td><%= BType %></td>
						<% 
						no = item.getNo();
						BoardType = Integer.toString(item.getBoardtype()); 
						%>
						<td>
							<%if(item.getBoardtype() != 5 ){%>
								<input type="button" class="adminbtn" value="삭제" onclick="admindel(<%=no%>,<%=BoardType%>);">
							<%}%>
							<%if(item.getBoardtype() == 5 ){%>
								<input type="button" class="adminbtn" value="삭제" onclick="alert('이미 삭제된 게시물 입니다.');">
							<%}%>
						</td>
						<td>
							<%if(item.getBoardtype() != 5 ){%>
								<input type="button" class="adminbtn" value="복원" onclick="alert('삭제된 게시물이 아닙니다.');">
							<%}%>
							<%if(item.getBoardtype() == 5 ){%>
								<input type="button" class="adminbtn" value="복원" onclick="adminrestore(<%=no%>,<%=BoardType%>);">
							<%}%>
						</td>
						<!--<td><input type="submit" value="삭제" class="btn" id="Adel" ></td>-->
					</tr>
					<%}%>
					<tr>
						<td colspan="99" style="border-top:solid 1px black">
						</td>
					</tr>
				</table>
				
				</form>
					<p/>
					<div align="center">
					<form id="com_listfrm" name="com_listfrm" method="get" action="admin.jsp">
					<input type="hidden" id="oredertype" name="oredertype" value="<%= oredertype %>">
					<input type="hidden" id="orderby" name="orderby" value="<%= orderby %>">
						<table border="1" style="vertical-align: middle;">
							<tr>
								<td style="vertical-align: middle;">
									<select id="admin_listtype" name="admin_listtype" class="adminsel" style="vertical-align: middle;">	
										<option value="1" <% if(admin_listtype.equals("1")) out.print("selected");%>>제목+내용</option>
										<option value="2" <% if(admin_listtype.equals("2")) out.print("selected");%>>제목만</option>
										<option value="3" <% if(admin_listtype.equals("3")) out.print("selected");%>>내용만</option>
										<option value="4" <% if(admin_listtype.equals("4")) out.print("selected");%>>작성자</option>
									</select>
								</td>
								<td style="vertical-align: middle;">
									<input type="text" id="k" name="k" value="<%= k %>" style="border: solid 1px black; width:150; height:21px; margin:5px; ">
								</td>
								<td style="vertical-align: middle;">
									<input type="submit" class="adminbutton" value="검색" style="vertical-align: middle;">
								</td>
							</tr>
						</table>
					<div id="count" style="vertical-align: middle;">
						<ul>							
							<li><a href="admin.jsp?page=<%=1 %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>">&lt;&lt;</a></li> 
						<%
						if( admin_curpage > 1)
						{
							%>
							<li><a href="admin.jsp?page=<%= admin_curpage - 1%>&k=<%= k %>&admin_listtype=<%= admin_listtype %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>">&lt;</a></li>
							<%
						}else
						{
							//1페이지 일 경우 자바스크립트 실행
							%>
							<li><a href="javascript:alert('첫 페이지입니다.');">&lt;</a></li>
							<%
						}
						for(int i = admin_startpageno; i <= admin_endpageno; i++) 
						{
							if(i == admin_curpage)
							{
								%><li class="page"><a href="admin.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= i %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>"><strong><%=i %></strong></a></li><%
								continue;
							}
							%><li><a href="admin.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= i %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>"><%=i %></a></li><%
						}
						if( admin_curpage < admin_maxpage)
						{
							%><li><a href="admin.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= admin_curpage + 1 %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>">&gt;</a></li><%
						}else
						{
							//최대페이지를 초과하면 자바스크립트 실행
							%>
							<li><a href="javascript:alert('마지막 페이지입니다.');">&gt;</a></li>
							<%
						}
						%> <li><a href="admin.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= admin_maxpage %>&oredertype=<%= oredertype %>&orderby=<%= orderby%>">&gt;&gt;</a></li>
						</ul>
					</div>
					</form>
				</div>
			</div>
		</div>
		</div>
</div>
<%@ include file="../include/footer.jsp" %>