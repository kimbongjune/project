<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.dto.*" %>

<%
UserDto dto = new UserDto();
String nickname = request.getParameter("nickname");
boolean nicheck = true;
if(dto.nickcheck(nickname))
{
	nicheck = false;
}

if(nickname == "")
{
	out.print("아이디를 입력해주세요");
	//out.print("NOID");
}else if(nicheck)
{
	out.print("중복된 아이디가 존재합니다.");
	//out.print("DUPID");
}else
{
	out.print("사용 가능한 닉네임입니다.");
	//out.print("NOTFOUND");
}
%>