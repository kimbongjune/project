<%@page import="org.json.simple.JSONArray"%>

<%@page import="tv.dto.*"%>

<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String checktype = request.getParameter("checktype");

AdminChart chart = new AdminChart();

JSONArray jsonArray = null;

if(checktype == null){ checktype = ""; }

else if(checktype.equals("1"))	{	jsonArray = chart.getAddress();	}

else if(checktype.equals("2"))	{	jsonArray = chart.getAge();	}

if(jsonArray == null){	out.println("ERROR");	}
else{	out.println(jsonArray);	}

%>
