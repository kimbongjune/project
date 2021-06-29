<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="tv.dto.*" %>
<%@ page import="tv.vo.*" %>
<%
ChatDto dto = new ChatDto();
UserVo vo = (UserVo)session.getAttribute("login");
String chatno = request.getParameter("chatno");
String nickname = vo.getNickname();

if(nickname != null)
{

	out.print(dto.ChatGet(chatno, nickname));
	System.out.print(dto.ChatGet(chatno, nickname));

}else
{
	out.print("fail");
}

%>