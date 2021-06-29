<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "유저관리 페이지"; %>
<script src="../js/jquery-3.6.0.min.js"></script>

<%@ include file="/include/header.jsp" %>
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
    width: 1120px;
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
<link type="text/css" rel="stylesheet" href="../css/sub.css"></link>
<%
	int oredertype;
	try
	{
		oredertype= Integer.parseInt(request.getParameter("oredertype"));	
	}catch(Exception e)
	{
		oredertype = 0;
	}
	user = null;
	utype = null;
	try
	{
		user = (UserVo)session.getAttribute("login");
		utype = user.getType();
		if(!utype.equals("1"))
		{	
			%>
			<script>
				alert("로그인을 해주세요!");
				location.href="../jjmain/main.jsp";
			</script>
			<%
		}
	}catch(Exception e)
	{
		%>
		<script>
			alert("로그인을 해주세요!");
			location.href="../jjmain/main.jsp";
		</script>
		<%
	}


	String Ad = "2"; // Admin.java 에 넘겨줘서 page를 분별하는 변수
	
	type = "1";
	String admin_listtype = request.getParameter("admin_listtype");
	String where = request.getParameter("boadrtype");
	
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
		admindto.setSearch(k);
	}
	
	admindto.setType(admin_listtype);
	admindto.setOrder(Integer.toString(oredertype));
	int admin_curpage = 1;
	System.out.print(k);
	
	try
	{
		//페이지 번호가 잘못넘어와도 curpage==1, 받아온 문자열을 정수로 변환
		admin_curpage = Integer.parseInt(request.getParameter("page"));
	}catch(Exception e)
	{
		
	}
	
	UserDto userdto = new UserDto();
	UserListVo userlist;
	userlist = userdto.userlist(curpage);
	
	admindto.setSearch(k);
	list = admindto.GetList2(curpage);
		//out.print(curpage);
		//총 게시물수 얻어옴
		int admin_maxrecord = admindto.getTotal();
		//System.out.print("총 게시물 수는 : " + maxrecord);
		
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
<script>
function admincheck() {
	if(confirm("사용자의 회원등급을 변경하시겟습니까?") != 1)
	{
		return;
	}
} 
</script>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
	<div class="whatMenu">
		회원 관리
	</div>
	<div class="vertical1">
		<div>
			<input type="button" value="게시글관리" class="button1" id="adminbtn" onClick="location.href='admin.jsp'">
			<input type="button" value="회원관리" class="button2" id="adminbtn" onClick="location.href='admin2.jsp'">
			<input type="button" value="사이트 통계" class="button3" id="adminbtn" onClick="location.href='adminChart.jsp'">
		</div>
	</div>	
	<div class="vertical2">
		<!-- 회원관리  -->
		<div class="memberControl">
			<table border="1" class="admin_listTable">
				<tr class="adminTh" height="20px">
					<th class="adminSize4" style="width:300px">이메일</th>
					<th class="adminSize3">닉네임</th>
					<th class="adminSize3" onclick="window.location='admin2.jsp?oredertype=<%if(oredertype > 4){out.print(oredertype = 0);}else{ out.print(oredertype+1);} %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>'">권한</th>
					<th width="150px" style="vertical-align: middle;">권한관리</th>
				</tr>
				<%for(int i=0; i < list.Total(); i++){
					ItemVo item = list.Get(i);
					%>
				<tr class="adminTd">
					<% 
						String NickName = item.getNickname();
						type = item.getType(); 
					%>
					<td>
						<%
							if(item.getType().equals("5") || item.getType().equals("4"))
							{
								%><font color="red"><%= item.getMail() %></font><%
							}else
							{
								%><%=item.getMail() %><%
							}
						%>
						
					</td>
					<td><%=item.getNickname() %></td>
					<% String typeShow = item.getType(); %>
					<td>
						<%if(typeShow.equals("1")){%>관리자<%}%>
						<%if(typeShow.equals("2")){%>기자단<%}%>
						<%if(typeShow.equals("3")){%>일반유저<%}%>
						<%if(typeShow.equals("4")){%>차단유저<%}%>
						<%if(typeShow.equals("5")){%>탈퇴유저<%}%>
					</td>
					<td>
					<form id="frm" name="frm" action="../Admin.do" method="get" onsubmit="return admincheck();">
						<input type="hidden" id="oredertype" name="oredertype" value="<%= oredertype %>">
						<input type="hidden" id="k" name="k" value="<%= k %>">
						<input type="hidden" id="page" name="page" value="<%= curpage %>">
						<input type="hidden" id="admin_listtype" name="admin_listtype" value="<%= admin_listtype %>">
						<input type="hidden" name="Ad" value="2">
						<input type="hidden" name="nickname" value=<%=NickName %>>
						<select class="adminsel" name="AchangeType">
							<option value="1" <% if(typeShow.equals("1")) out.print("selected");%>>관리자</option>
							<option value="2" <% if(typeShow.equals("2")) out.print("selected");%>>기자단</option>
							<option value="3" <% if(typeShow.equals("3")) out.print("selected");%>>일반유저</option>
							<option value="4" <% if(typeShow.equals("4")) out.print("selected");%>>차단유저</option>
							<option value="5" <% if(typeShow.equals("5")) out.print("selected");%>>탈퇴유저</option>
						</select>
						<!--  a href="../Admin.do?Ad=2&nickname=<//NickName&type=<//type&AchangeType=">변경</a> -->	
						<input type="submit" class="adminbtn" value="변경">
					</form>
					</td>
				</tr>
				<%}%>
				<tr>
					<td colspan="99" style="border-top:solid 1px black">
					</td>
				</tr>
				</table>
				<p/>
				<div align="center">
				<form id="com_listfrm" name="com_listfrm" method="get" action="admin2.jsp">
				<input type="hidden" id="oredertype" name="oredertype" value="<%= oredertype %>">
					<table border="1" style="vertical-align: middle;">
							<tr>
								<td style="vertical-align: middle;">
									<select class="adminsel" id="admin_listtype" name="admin_listtype">
										<option value="1" <% if(admin_listtype.equals("1")) out.print("selected");%>>이메일</option>
										<option value="2" <% if(admin_listtype.equals("2")) out.print("selected");%>>닉네임</option>
									</select>
								</td>
								<td>
									<input type="text" id="k" name="k" value="<%= k %>" style="border: solid 1px black; width:150; height:21px; margin:5px; ">
								</td>
								<td>
									<input type="submit" class="adminbutton" value="검색" style="vertical-align: middle;">
								</td>
							</tr>
						</table>
				<div id="count" style="vertical-align: middle;">
						<ul>	
					
					<li><a href="admin2.jsp?page=<%=1 %>&admin_listtype=<%= admin_listtype %>&k=<%= k %>&oredertype=<%= oredertype %>">&lt;&lt;</a></li> 
					<%
					if( admin_curpage > 1)
					{
						%>
						<li><a href="admin2.jsp?page=<%= admin_curpage - 1%>&k=<%= k %>&admin_listtype=<%= admin_listtype %>&oredertype=<%= oredertype %>">&lt;</a></li>
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
							%><li class="page"><a href="admin2.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= i %>&oredertype=<%= oredertype %>"><strong><%=i %></strong></a></li><%
							continue;
						}
						%><li><a href="admin2.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= i %>&oredertype=<%= oredertype %>"><%=i %></a></li><%
					}
					if( admin_curpage < admin_maxpage)
					{
						%><li><a href="admin2.jsp?admin_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= admin_curpage + 1 %>&oredertype=<%= oredertype %>">&gt;</a></li><%
					}else
					{
						//최대페이지를 초과하면 자바스크립트 실행
						%>
						<li><a href="javascript:alert('마지막 페이지입니다.');">&gt;</a></li>
						<%
					}
					%> <li><a href="admin2.jsp?notice_listtype=<%= admin_listtype %>&k=<%= k %>&page=<%= admin_maxpage %>&oredertype=<%= oredertype %>">&gt;&gt;</a></li>
					</ul>
				</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/include/footer.jsp" %>