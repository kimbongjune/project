<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.text-red 
{
    color: red;
}
.text-black
{
	color:black;
}
a
{
	text-decoration: none;
    color: #000;
    border: none;
    margin: 0;
    padding: 0;
}
</style>
 
<input type="button" id="searchfrm">
<input type="text" id="k">
<div id="highlight">this is a new bar and bar</div>
<p id="highlight2">
	<a id="highlight2" href="../jjnotice/notice_view.jsp?no=">123</a>
</p><br>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() 
{
	$('#searchfrm').click(function () {
	    var search = $('#k').val();
	    alert(search);
		    $("#highlight2:contains('"+search+"')").each(function () {
		        var regex = new RegExp(search,'gi');
		        $(this).html( $(this).text().replace(regex, "<span class='text-red'>"+search+"</span>") );
		        $("#highlight:contains('"+search+"')").css({color:"red"});
		    });
	});
});
</script>
