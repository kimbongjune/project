<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="testfrm" name="testfrm" action="test13.jsp" method="get">
		<input type="text" id="k" name="k">
		<select class="sch_sel" title="�˻��׸�" id="boardtype" name="boardtype">
			<option value="0" selected="selected">���հ˻�</option>
			<option value="1">��������</option>
			<option value="2">����</option>
			<option value="3">����</option>
			<option value="4">�����Խ���</option>
		</select>
		<input type="checkbox" name="t" id="t1" value="total" checked="checked"> <label for="sch_sco1">��ü</label> 
		<input type="checkbox" name="t" id="t2" value="title" > <label for="sch_sco2">����</label>
		<input type="checkbox" name="t" id="t3" value="content"> <label for="sch_sco3">����</label> 
		<input type="checkbox" name="t" id="t4" value="writer"> <label for="sch_sco4">�ۼ���</label>
		<input type="submit" value="������">
	</form>
</body>
</html>