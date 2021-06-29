<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	String s = "<p>12421asdsad<img src='/Travle/SE2/multiupload/202106171728483371ee2c-df7b-4ba0-babc-2be32f8423a7.png' title='------1-6.png'>&nbsp;</p>";

s = s.replace("\""," ' ");
s.indexOf("<");
String s2 = s.substring(s.indexOf("<img"));
/* out.print(s2.substring(s.indexOf("<img"), (s.indexOf(">") +1)));
System.out.print(s.substring(s2.indexOf("<img"), (s.indexOf(">") +1))); */
//System.out.print(s2);
System.out.print(s2.substring(s2.indexOf("<img"), (s2.indexOf(">")+1)));

/* String b = "전북 전주시 덕진구 내동길 6 (장동)";
b.indexOf("(");
System.out.print(b.indexOf("("));
String c = b.substring(b.indexOf("("));
System.out.print(c.substring(1, c.indexOf("동")+1)); */
%>
</body>
</html>