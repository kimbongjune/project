<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "자유 게시판";%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../js/javascript.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- a링크가 li에 꽉차게 해주는 스타일 -->
<style>
.com_page2 >li >a 
{
  display: block;
}
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
    width: 1120px;
    margin: 0 auto;
    padding: 0;
}

.lsBtn:hover 
{
	cursor: pointer;
}

.lsBtn2:hover
{
	cursor: pointer;
}

.com_head
	{
	    text-align: center;
	    width: 100%;
	    height: auto;
	    min-height: 120px;
	    margin-bottom: 20px;
	    padding-top: 40px;
	    padding-bottom: 40px;
	    background-position: center;
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.7em;
	    display: inline-block;
	    background-color: #F0F0F0;
	}
</style>
<link type="text/css" rel="stylesheet" href="../css/list.css"></link>
<div class="com_head" style="vertical-align:middle;">
		<h1 style="cursor:default !important;">자유게시판</h1>
		<h4>말하고, 나누고, 쓰고 싶은 생각을 자유롭게 말해보아요~~~</h4>
		<h5>유저들의 즐겁고, 매너있는 자유게시판을 만들어보아요~~~</h5>
</div>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
		<div id="comlist_bg" class="info_main_bg">
			<com_body>
				<div>
		<%for(int i = 0 ; i < list.Total() ; i++)
		{ItemVo item = list.Get(i);%>	
		<div style="width:100%;margin-left:6.5%;" onclick="location.href ='com_view.jsp?boardtype=4&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>&t=<%= t %>'">
			<div class="com_box" style="width:257px; height:177px; overflow:hidden;">
				<div class="com_title" style="text-align:center; position: relative; font-size:15pt; color:black !important;">
				<%
					String ctitle = null;
				  	if(item.getTitle().length() > 15)
					{
						ctitle  = item.getTitle().substring(0,15);
						ctitle += "..";
					}else
					{
						ctitle  = item.getTitle();
					}
				%>
				<%= ctitle %>
				</div>
				<br>
				<div class="com_text" style="height:50px; word-wrap:break-word;">
				<%
					String cBody = null;
					
					if(item.getReplacebody() != null){
				  		if(item.getReplacebody().length() > 40)
						{
				  			cBody  = item.getReplacebody().substring(0,40);
				  			cBody += "..";
						}else 
						{
							cBody  = item.getReplacebody();
						}
						
					  	if(item.getReplacebody().length() < 30)
						{%>
					  		<br>
						<%}
					}
				%>
				<%= cBody %>
				</div>
				<div style="margin-top:40px !important;"><ul class="com_date"><li>작성자 : <%= item.getNickname() %></li><li>등록일 : <%= item.getDate() %></li><li>조회수 :  <%= item.getHit() %></li></ul>
				</div>
				<br>
				<%if(i%3==2){%><br><%}%>
			</div>
		</div>
		<%}%>
		
		</div>
			<div align="center" class="com_ListSearch">
			<div style="padding-left:600px;">
			<%
			if(wrt)
			{
				if(utype.equals("1") || utype.equals("2") || utype.equals("3"))
				{
			%>
					<input type="button" value="글쓰기" onclick="gowrite()" class="ab">
			<%
				}
			}
			%>
			</div>
				<form name="comlistfrm" method="post" action="com_list.jsp">
					<select id="listtype" name="t" style="border: black solid 1px; height:22px; margin-left:115px;">
						<option value="1" <% if(t.equals("1")) out.print("selected");%>>제목+내용</option>
						<option value="2" <% if(t.equals("2")) out.print("selected");%>>제목만</option>
						<option value="3" <% if(t.equals("3")) out.print("selected");%>>내용만</option>
						<option value="4" <% if(t.equals("4")) out.print("selected");%>>작성자</option>
					</select>
					<input type="text" id="k" name="k" value="<%= k %>" style="height:20px; border: black solid 1px;">&nbsp;&nbsp;&nbsp;<input type="submit" value="검색" class="lsBtn2"><br>
				</form>
			</div>
			<div id="count" style="vertical-align: middle;">
				
				<form id="com_listfrm" name="com_listfrm" method="get" action="com_list.jsp?<%=listtype%>&page=<%=curpage%>&k=<%=k%>">
				<ul class="com_page2">
					<li><a href="com_list.jsp?page=<%=1 %>&listtype=<%= listtype %>&k=<%= k %>">&lt;&lt;</a></li>
					<%
						if( curpage > 1)
						{
							%>
							<li><a href="com_list.jsp?type=<%= type %>&page=<%= curpage - 1%>&k=<%= k %>&listtype=<%= listtype %>&t=<%= t %>">&lt;</a></li>
							<%
						}else
						{
							//1페이지 일 경우 자바스크립트 실행
							%>
							<li><a href="javascript:alert('첫 페이지입니다.');">&lt;</a></li>
							<%
						}
					
						for(int i = startpageno; i <= endpageno; i++) 
						{
							if(i == curpage)
							{
								%><li style="background-color:red;"><a href="com_list.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= i %>&t=<%= t %>"><strong><%=i %></strong></a></li><%
								continue;
							}
							%><li><a href="com_list.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= i %>&t=<%= t %>"><%=i %></a></li><%
						}
						
						if( curpage < maxpage)
						{
							%><li><a href="com_list.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= curpage + 1 %>&t=<%= t %>">&gt;</a></li><%
						}else
						{
							//최대페이지를 초과하면 자바스크립트 실행
							%>
							<li><a href="javascript:alert('마지막 페이지입니다.');">&gt;</a></li>
							<%
						}
						%><li><a href="com_list.jsp?listtype=<%= listtype %>&k=<%= k %>&page=<%= maxpage %>&t=<%= t %>">&gt;&gt;</a></li>
				</ul>
				</form>
			
			</div>
		
		
		<form id="wrdfrm" name="wrfrm" method="post" action="com_write.jsp">
			<input type="hidden" id="k" name="k" value="<%= k %>">
			<input type="hidden" id="page" name="page" value="<%= pages %>">
			<input type="hidden" id="boardtype" name="boardtype" value="4>">
		</form>
			

	</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>