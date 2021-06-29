<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.dto.*" %>

<%
UserDto dto = new UserDto();
String nickname = request.getParameter("nickname");
String pw = request.getParameter("pw");
System.out.println(nickname);
System.out.println(pw);

if(dto.pwcheck(nickname, pw))
{
	out.print("true");
}else
{
	out.print("false");
}


%>