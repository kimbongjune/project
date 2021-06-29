<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "내가 쓴 글보기"; %>
<%@ include file="../include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String name = null;
String birth = null;
String gender = null;
String phonenumber = null;
listtype = request.getParameter("listtype");
if(listtype == null)
{
	listtype = "1";
}
try
{
	name = user.getName();
	birth = user.getBirth();
	gender = user.getGender();
	phonenumber = user.getPhonenumber();
}catch(Exception e)
{
	
}

if(nickname == null)
{
	%><script>
		alert("로그인이 필요한 서비스입니다.");
		window.location="../jjmain/main.jsp";
	  </script><%
}

ListDto writeList = new ListDto();
ListVo write_List;
if(k == null)
{
	k="";
}	

curpage = 1;
System.out.println(k);
System.out.println(listtype);

try
{
	//페이지 번호가 잘못넘어와도 admin_curpage==1, 받아온 문자열을 정수로 변환
	curpage = Integer.parseInt(request.getParameter("page"));
}catch(Exception e)
{
	
}
writeList.setSearch(k);
writeList.setType(listtype);
write_List = writeList.GetUserWriteList(curpage, nickname);
	//out.print(admin_curpage);
	//총 게시물수 얻어옴
	maxrecord = writeList.getTotal();
	//System.out.print("총 게시물 수는 : " + admin_maxrecord);
	
	//게시물 시작번호
	 startno = 0;
	
	//페이지당 게시물 갯수
	 percount = 5;
	//만약 페이지가 잘못 넘어와도 페이지 번호를 1로 초기화 시켜줌
	
	//게시물 시작번호
	startno = (curpage - 1) * percount + 1;
	
	//페이지 시작 번호
	startpageno = ((curpage - 1) / percount) * percount + 1;
	//끝 페이지 번호
	endpageno = (startpageno + percount) - 1;
	
	//최대 페이지 번호
	maxpage = maxrecord / 10;
	if(maxrecord % percount != 0 )
	{
		maxpage++;
	}
	
	if(endpageno >= maxpage)
	{
		endpageno = maxpage;
	}
%>
<link type="text/css" rel="stylesheet" href="../css/sub.css"></link>
<link type="text/css" rel="stylesheet" href="../css/list.css"></link>
<style>
.sNotice 
{
    text-align: center; 
	margin: auto;
}

th, td
{
	vertical-align: middle;
	text-align:center
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<div id="mct">
	<div style="text-align:center">
		<h1 style="margin:50px">내가 쓴 글보기</h1>
		<hr>
		<br><br>
	</div>
</div>
<div class="notice_listdiv">
	<table border="1" class="notice_listTable">
		<tr class="notice_ListTh">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%for(int i = 0 ; i < write_List.Total() ; i++)
		{
			ItemVo item = write_List.Get(i);
			String run = "";
			
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
		<tr class="notice_listContent">
			<td class="notice_ListNo"><%= item.getNo() %></td>
			<td>
				<%if(item.getBoardtype() != 5){%>
				<a href="<%=run %>?boardtype=1&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>"><%= item.getTitle() %></a>
				<%}else{%>
				<strong style="color:red;" onclick="alert('게시판 이용원칙에 벗어난 게시물로 판단되어 관리자에 의해 삭제된 게시물입니다. 자세한 사항은 관리자 메일로 문의해주세요.')"><%= item.getTitle() %></strong>
				<%}%>
			</td>
			<td class="notice_ListWriter"><%= item.getNickname() %></td>
			<td class="notice_ListDate"><%= item.getDate() %></td>
			<td class="notice_ListHit"><%= item.getHit()%></td>
		</tr>
	  <%}%>
	</table>
</div>
<br><br><br>
		<div id="count">
			<ul>
				<li><a href="writelist.jsp?page=<%=1 %>&listtype=<%= listtype %>&k=<%= k %>">&lt;&lt;</a></li><!-- 첫페이지가기 -->
				<%
				if( curpage > 1)
				{
				%>
					<li><a href="writelist.jsp?type=<%= type %>&page=<%= curpage - 1%>&k=<%= k %>&listtype=<%= listtype %>">&lt;</a></li><!-- 앞페이지가기 -->		
				<%
				}else
				{
				
				%>
					<li><a href="javascript:alert('첫 페이지입니다.');">&lt;</a></li><!-- 앞페이지가기 -->
				<%
				}
				for(int i = startpageno; i <= endpageno; i++) 
				{
					if(i == curpage)
					{
					//현재 페이지 빨간색으로 강조할부분
						%>
							<li class="page"><a href="writelist.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= i %>"><strong><%= i %></strong></a></li>
						<%
						continue;
					}
				%>
					<li class="page"><a href="writelist.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= i %>"><%= i %></a></li>
				<%
				}
				if( curpage < maxpage)
				{
					%><li><a href="writelist.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= curpage + 1 %>">&gt;</a></li><%
				}else
				{
					//최대페이지를 초과하면 자바스크립트 실행
					%>
					<li><a href="javascript:alert('마지막 페이지입니다.');">&gt;</a></li>
					<%
				}
				%> 	
				<li><a href="writelist.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= maxpage%>">&gt;&gt;</a></li>
			</ul>
		</div>
<div class="sNotice">
	<form name="notice_listfrm" method="post" action="writelist.jsp">
			<select id="listtype" name="listtype" style="border: black solid 1px; height:22px;">
			<option value="1" <% if(listtype.equals("1")) out.print("selected");%>>제목+내용</option>
			<option value="2" <% if(listtype.equals("2")) out.print("selected");%>>제목만</option>
			<option value="3" <% if(listtype.equals("3")) out.print("selected");%>>내용만</option>
			<option value="4" <% if(listtype.equals("4")) out.print("selected");%>>작성자</option>
			</select>&nbsp;
			<input type="text" id="k" name="k" value="<%= k %>" style="height:20px; border: black solid 1px;">&nbsp;&nbsp;&nbsp;<input type="submit" value="검색" class="lsBtn2" >
			&nbsp;&nbsp;&nbsp;<br>
	</form>
</div>	
<br><br>
<br>
<br>
<%@ include file="../include/footer.jsp" %>