<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "공지사항 게시판"; %> 
<%@ include file="../include/header.jsp" %>
<script src="../js/jquery-3.6.0.min.js"></script>
<%
	try
	{
		view_no = Integer.parseInt(request.getParameter("no"));	
		%><script>alert(view_no);</script><%
	}catch(Exception e){%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%return;
	}
%>
<%@ include file="../param/viewparam.jsp" %>
<script>
	function golist1()
	{
		
		window.location = "notice_list.jsp<%= param %>";
	};
</script>
<%@ include file="../js/javascript.jsp" %>
<%
	
	if(view_vo2.getTitle() == null)
	{
		%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
		return;
	}
	
	
	if(view_vo2.getBoardtype() == 5)
	{
		%>
		<script>
			alert("삭제된 게시물 입니다.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
		return;
	}
	
%>
<script type="text/javascript">
function gomodify() 
{
	if(confirm("게시글을 수정 하시겠습니까?") != 1)
	{
		return;
	}
	$("#modfrm").submit();
}
</script>
<style>
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
	
	com_body 
	{
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.3em;
	}
	
	th
	{
		border: #DDDDDD solid 1px;
		border-left:none;
		border-right:none;
		vertical-align: middle;
	}
	td
	{
		vertical-align: middle;
	}
	.comBtn 
	{
	    display: inline-block;
	    border-top: #dbdada solid 1px;
	    border-left: #dbdada solid 1px;
	    border-bottom: #dbdada solid 1px;
	    border-right: #dbdada solid 1px;
	    background-color: #fcfcfc;
	    padding: 8px 16px;
	    box-shadow: inset -1px -1px 1px #fff;
	    margin-left: 10px;
	    text-decoration: none;
	    cursor : pointer;
	}
	
	.comBtn:hover, .comBtn:active 
	{
	    color: #777;
	}

	.btnDiv
	{
		margin: auto;
		margin-bottom : 150px;
		border: solid black 0px; 
		width: 60%;"
	}
	
	.replyTable
	{
	    margin: auto;
	    margin-bottom: 150px;
	    border: solid black 0px;
	    width: 60%;
	    aling:center;
	 }
	 
	 .box
	 {
	 	border: 1px solid black;
	 }
	 
	 .rbodybox
	 {
		border: 1px solid black;	 
	 }
	 
	 #rbody
	 {
	 	border: 1px solid black;
	 }
	 
	 .bodySize
	 {
	 	vertical-align: top !important;
	 	height: 300px;
	 }
</style>
<div class="com_head">
		<h1 style="cursor:default !important;">공지사항</h1>
		<h4>전주에 빠지다에서는 전주에 대한</h4>
		<h5>중요한 소식과 정보를 신속하게 제공합니다.</h5>
</div>

	<form id="modfrm" name="modfrm" method="post" action="../Modify.do<%= param %>">
		<input type="hidden" id="k" name="k" value="<%= k %>">
		<input type="hidden" id="page" name="page" value="<%= view_pages %>">
		<input type="hidden" id="boardtype" name="boardtype" value="2">
		<input type="hidden" id="no" name="no" value="<%= view_no %>">
	</form>
	<form id="delfrm" name="delfrm" method="post" action="../Del.do">
		<input type="hidden" id="no" name="no" value="<%= view_no %>">
		<input type="hidden" id="nickname" name="nickname" value="<%=nickname%>">
	</form> 
	<table style="margin:auto; border-top: solid black 1px; width: 60%;">
		<tr height="50px">
			<td colspan="5" text-align="left"><h2>&nbsp;&nbsp;&nbsp;<%= view_vo2.getTitle() %></h2></td>
			<td text-align="right"></td>
		</tr>
	</table>

	<table text-align="center" style="margin:auto; border-spacing:0px; width:60%; border-bottom:#DDDDDD solid 1px;">
		<tr height="40px">
			<th style="background-color:#F9F9F9; width:20%;">작성자</th>
			<th><%= view_vo2.getNickname() %></th>
			<th style="background-color:#F9F9F9; width:20%;">날짜</th>
			<th><%= view_vo2.getDate() %></th>
			<th style="background-color:#F9F9F9; width:20%;">조회수</th>
			<th style="width:10%;"><%= view_vo2.getHit() %></th>
		</tr>
			<%for(int i = 0 ; i <= view_list.Total() ; i++){
			if(view_list.Total() != 0){out.print("<tr height='330px'>"); break;}
			else{out.print("<tr height='10px'>");} break;}%>
			<td colspan="6" style="text-align:center !important; vertical-align:top !important;"><br>
			<%for(int i = 0 ; i < view_list.Total() ; i++){
				FileVo fvo = view_list.Get(i);
				if(view_list.Total() != 0)
				{out.print("<img src ='../include/ViewImage.jsp?f=" + fvo.getAttachname() + "'" + " Style= 'width:300px; height:300px; margin:20px;'>");}}%>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="bodySize">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=view_vo2.getBody()%><br><br></td>
		</tr>
	</table><br>

<div class="btnDiv">
	<table>
		<tr>
			<td colspan="5" style="text-align:right;">
				<input type="button" id="golist" class="comBtn" name="golis" value="목록" onclick="golist1();">
			</td>
			<td style="width:90%;"></td>
			<td style="text-align:right;">
			<% if(mod)
			{
				%>
				<input type="button" class="comBtn" id="gomodify" name="gomodify" value="수정" onclick="gomodify();"></td>
				<td><input type="button" class="comBtn" id="godel" name="godel" value="삭제" onclick="godel();"></td>
				<%
			}
			%>					
		</tr>
	</table>
</div>
<%@ include file="../include/footer.jsp" %>