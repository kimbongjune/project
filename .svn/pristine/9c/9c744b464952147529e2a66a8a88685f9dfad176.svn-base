<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="config.jsp" %>
<%@ page import="java.io.*" %>   
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
%> 
<%
String uploadPath = baseProjectPath + "\\travle\\WebContent\\image\\upload";
//out.print(uploadPath +"<br>");

String filename = request.getParameter("f");

String fullname = uploadPath + "\\" + filename;

//out.print(fullname);

response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   


File file = new File(fullname);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];

//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}

fileIn.close();
ostream.flush();
ostream.close();
%>