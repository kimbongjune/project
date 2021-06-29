<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>      
<%
ChatDto dto = new ChatDto();
String chatno = request.getParameter("chatno");
String chatbody = request.getParameter("chatbody");
UserVo vo = (UserVo)session.getAttribute("login");
String nickname = vo.getNickname();

if(nickname != null)
{
	out.print(dto.ChatAdd(nickname, chatbody));
}else
{
	out.print(":로그인후 이용 바랍니다.");
}
%>