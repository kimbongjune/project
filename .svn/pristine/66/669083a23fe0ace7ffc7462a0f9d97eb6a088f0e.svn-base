<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="tv.dto.*" %>
<%@ page import="tv.vo.*" %>
<% String t_name = "채팅"; %> 
<%@ include file="/include/header.jsp" %>
<%
user = null;
nickname = null;
ChatDto dto = new ChatDto();


try
{
	user = (UserVo)session.getAttribute("login");
	nickname = user.getNickname();
	System.out.print(":::로그인후 이용 바랍니다.");
}catch(Exception e)
{
	
}
%>

<script>

window.onload = function()
{
	setInterval(function() //0.5초마다 실행됨 1000은 1초임
	{
		ReceiveUser();
		
	},500);
	
}

function ReceiveMsg()
{
	var mParam = "chatno=" + lastNo + "&nickname=<%= nickname %>";
	$.ajax({
		url: "getChat.jsp",
		type: "post",
		cache: "false",
		dataType: "html",
		data: mParam,
		success: function(data)
		{
			data = data.trim();
			if( data == "")
			{
				//받은 대화 내용이 없음
			}else
			{	
				var array = data.split(":");
				chatno    = array[0];
				chatbody  = array[1];
				nickname  = array[2];
				checknick = array[3];
				photo	  = array[4];
				lastNo = chatno;
				
				if(checknick == "내가쓴글")
				{
					$("#msgList").append("<br><div id='mychat' style='width:" + (chatbody.length*15) + "px;'>" + chatbody + "</div>");
				}else if(checknick == "남이쓴글")
				{
					$("#msgList").append("<br><div id='youchat'><img src='../include/ViewImage.jsp?f="+ photo +"' style='width:30px; height:30px; border-radius:100%;'>&nbsp;<font font-size='30px'>" + nickname + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "<div style='background-color:white; max-width: 180px; text-align: left; width:" + (chatbody.length*15) + "px;'>" + chatbody + "</div>" + "<br>" + "</div>");
				}else
				{
					//환영인사!
					$("#msgList").append( "<br>" + chatbody + "<br>" + nickname + "<br>");
				}
			}
		},
		error: function (request, status, error)
		{

		}
	});			
}
</script>

<%@ include file="../include/footer.jsp" %>