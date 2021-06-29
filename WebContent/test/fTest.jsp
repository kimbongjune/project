<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="tv.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Date today = new Date();

Calendar cal = new GregorianCalendar(Locale.KOREA);
cal.add(Calendar.DATE, -5);


SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd");

String yesterday_str = todayFormat.format(cal.getTime());

String today_str = todayFormat.format(today);

Festival festival = new Festival();
String xml = festival.GetData(yesterday_str, today_str);
response.getWriter().append(xml);
%>
</body>
</html>