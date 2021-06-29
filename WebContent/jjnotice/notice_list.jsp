<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "공지사항 게시판";%>
<%@ include file="/include/header.jsp" %>
<%@ include file="../js/javascript.jsp" %>

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

.lsBtn:hover 
{
	cursor: pointer;
}

.lsBtn2:hover
{
	cursor: pointer;
}
</style>
<div id="noticelist_bg">
<form id="wrdfrm" name="wrfrm" method="post" action="notice_write.jsp">
	<input type="hidden" id="k" name="k" value="<%= k %>">
	<input type="hidden" id="page" name="page" value="<%= pages %>">
	<input type="hidden" id="boardtype" name="boardtype" value="1>">
</form>
<div class="list_head">
		<h1 style="cursor:default !important;">공지사항</h1>
		<h4>전주에 빠지다에서는 전주에 대한</h4>
		<h5>중요한 소식과 정보를 신속하게 제공합니다.</h5>
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
		<%for(int i = 0 ; i < list.Total() ; i++)
		{
			ItemVo item = list.Get(i);
		%>
		<tr class="notice_listContent">
			<td class="notice_ListNo"><%= item.getNo() %></td>
			<td><a href="notice_view.jsp?boardtype=1&t=<%=t %>&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>"><%= item.getTitle() %></a></td>
			<td class="notice_ListWriter"><%= item.getNickname() %></td>
			<td class="notice_ListDate"><%= item.getDate() %></td>
			<td class="notice_ListHit"><%= item.getHit()%></td>
		</tr>
	  <%}%>
	</table>
</div>
<br><br><br>
<div class="notice_ListSearch">
	<form name="notice_listfrm" method="post" action="notice_list.jsp">
		<a href="notice_list.jsp?page=<%=1 %>&t=<%= t %>&k=<%= k %>">&lt;&lt;</a> 
			<%
			if( curpage > 1)
			{
				%>
				<a href="notice_list.jsp?type=<%= type %>&page=<%= curpage - 1%>&k=<%= k %>&t=<%= t %>">&lt;</a>
				<%
			}else
			{
				//1페이지 일 경우 자바스크립트 실행
				%>
				<a href="javascript:alert('첫 페이지입니다.');">&lt;</a>
				<%
			}
			for(int i = startpageno; i <= endpageno; i++) 
			{
				if(i == curpage)
				{
					%><a style="background-color:red;" href="notice_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= i %>"><%=i %></a><%
					continue;
				}
				%><a href="notice_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= i %>"><%=i %></a><%
			}
			if( curpage < maxpage)
			{
				%><a href="notice_list.jsp?jj_t=<%= t %>&k=<%= k %>&page=<%= curpage + 1 %>">&gt;</a><%
			}else
			{
				//최대페이지를 초과하면 자바스크립트 실행
				%>
				<a href="javascript:alert('마지막 페이지입니다.');">&gt;</a>
				<%
			}
			%><a href="notice_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= maxpage %>">&gt;&gt;</a>
			<br><br><br><br>
		</form>
</div>
<div class="sNotice">
	<form name="notice_listfrm" method="post" action="notice_list.jsp">
			<select id="t" name="t" style="border: black solid 1px; height:22px;">
			<option value="1" <% if(t.equals("1")) out.print("selected");%>>제목+내용</option>
			<option value="2" <% if(t.equals("2")) out.print("selected");%>>제목만</option>
			<option value="3" <% if(t.equals("3")) out.print("selected");%>>내용만</option>
			<option value="4" <% if(t.equals("4")) out.print("selected");%>>작성자</option>
			</select>&nbsp;
			<input type="text" id="k" name="k" value="<%= k %>" style="height:20px; border: black solid 1px;">&nbsp;&nbsp;&nbsp;<input type="submit" value="검색" class="lsBtn2" >
			&nbsp;&nbsp;&nbsp;<br>
			</div>
	</form>
<br><br>
<div style="text-align:right; margin-right:24%;">
		<%if(wrt)
		{
			if(utype.equals("1")){%>
				<input type="button" value="글쓰기" onclick="gowrite()" class="lsBtn">
			<%}
		}%>	
</div>
</div>
<br>
<br>
<%@ include file="/include/footer.jsp" %>