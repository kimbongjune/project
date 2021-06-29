<%@page import="tv.dto.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String category = request.getParameter("category");

String boardtype = request.getParameter("str");

AdminChart chart = new AdminChart();

String table = chart.getBoardTable(boardtype,category);
out.println(table);

%>
