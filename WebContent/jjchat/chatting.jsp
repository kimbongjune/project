<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "채팅"; %> 
<%

	UserVo user = null;
	String nickname = null;
	String utype = null;
	String photo = null;
	String mail = null;
	
	try
	{
		user = (UserVo)session.getAttribute("login");
		nickname = user.getNickname();
		utype = user.getType();
		photo = user.getPhoto();
		mail = user.getMail();
	}catch(Exception e)
	{
		%>
		<script>
			alert("로그인을 해주세요!");
			window.close();
		</script>
		<%
	}
	
	if(user == null)
	{
		%>
		<script>
			alert("로그인을 해주세요!");
			window.close();
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
<style>
	
	.back
	{
		width: 100%;
		height: 100%;
		
	}
	
	.textarea
	{
		border: black solid 1px;
		resize: none;
	}
	
	.btn
	{
		background-color: #1877F2;
		color: white;
		border: none;
		width: 93px;
		height: 45px;
		cursor:pointer;
	}

	.location
	{
		position: absolute;
		left:11%;
	}
	
	.mytalk
	 {
	    float: right;
	    min-height: 24px;
	    max-width: 200px;
	    left: 120px;
	    background-color: #ffec42;
	    border-radius: 3px;
	    z-index: 2;
	    padding: 0px 4px 0px 4px;
	    word-break: break-all;
	    display: block;
	    font-size: 12px;
	    text-color:black;
	    margin-right: 20px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    text-align:left;
	    clear:both; /*연속된 float 일시 라인 정렬이 깨지지 않도록 하는 css*/
	}
	
	.othertalk
	{	
		float: left;
		position: relative;
	    min-height: 24px;
	    max-width: 200px;
	    right: -2px;
	    background-color: #ffffff;
	    border-radius: 3px;
	    z-index: 2;
	    padding: 0px 4px 0px 4px;
	    word-break: break-all;
	    display: block;
	    font-size: 12px;
	    margin-left: 20px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    text-align:left;
	    clear:both;
	}
	
	.othertalk2
	{
		float: left;
		position: relative;
	    right: -2px;
	    padding: 0px 4px 0px 4px;
	    display: block;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    clear:both;
	}

</style>
<script>
		//마지막으로 받은 메세지 번호 + 1
		var lastNo = "0";
	
		window.onload = function()
		{
			setInterval(function() //0.5초마다 실행됨 1000은 1초임
			{
				ReceiveMsg();
				
			},500);	
		}
		
		function notifyChat()
		{
			window.open('../jjchat/chatting.jsp');
			setTimeout(function () {
                notify();
            }, 5000);
		}
		
		
		var strByteLength = function(s,b,i,c){
			  for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			  return b;
			}
		
		function ReceiveMsg()
		{
			var mParam = "chatno=" + lastNo + "&nickname=<%= nickname %>";
			$.ajax
			({
				url: "getChat.jsp",
				type: "post",
				cache: "false",
				dataType: "html",
				data: mParam,
				success: function(data)
				{
					data = data.trim();
					
					if(data == "fail"){
						//아이디 없음
						alert("무야호");
					}else
					{
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
								if(chatbody.length > 89)
								{
									$("#msgList").append("<div class='mytalk'>"  +chatbody + "</div>");
								}
								else
								{
									$("#msgList").append("<div class='mytalk'>"  +chatbody + "</div>");
								}
							}else if(checknick == "남이쓴글")
							{
								$()
								$("#msgList").append("<br><br><div class='othertalk2' style='margin-right:390px; width:250px; text-align:left; align:left;'>&nbsp;&nbsp;<img src='../include/ViewImage.jsp?f="+ photo +"' style='width:30px; height:30px; border-radius:100%;'>&nbsp;<font font-size='30px'>" + nickname + "</div>" + "<div class='othertalk'>" + chatbody + "</div><br>");							
							}else
							{
								//환영인사!
								$("#msgList").append( "<br>" + chatbody + "<br>" + nickname + "<br><br>");
							}
						}
					}
				},
				error: function (request, status, error)
				{
					
				}
			});			
		}
						
		function SendMsg()
		{
			var chatbody = $("#chatbody").val();
			
			if(chatbody == "")
			{
				alert("전송 할 메시지를 입력하세요.");
				return false;
			}else
			{
				
				var mParam = "chatbody=" + chatbody + "&nickname=<%= nickname %>";
				$.ajax
				({
					url: "addChat.jsp",
					type: "post",
					cache: "false",
					dataType: "html",
					data: mParam,
					success: function(data)
					{
						$('.textarea').val('');
					}
				});		
			}
		}
		
		window.onkeydown=function(event)
		{
		    if(event.keyCode==13)
		    {
		    	
		    	event.preventDefault();
		    	SendMsg();
		    	$("#chatbody").focus();
		    }
		}
		
		function getOut()
		{
			window.close();
		}
		
		
		$(document).ready(function() {
		    $('.textarea').on('keydown', function() {
		        $('#text_cnt').html("("+$(this).val().length+" / 100)");
		 
		        if($(this).val().length > 100) {
		            $(this).val($(this).val().substring(0, 100));
		            $('#text_cnt').html("(100 / 100)");
		        }
		    });
		});

</script>
</head>
<body>
<div class="back">
	<div align="center"><h1>채팅방</h1></div>
	<div class="location"><!-- 화면위치조절용 DIV시작 -->
		<div id="backgroundDiv" align="center" style="width:500px; min-height:600px; height:auto; background-color:#B2C7D9; overflow:auto "> <!-- 대화창배경 DIV시작 -->
			<div>
			
			</div>
			<div id="msgList">
			
			</div>
			<br><br>
		</div> <!-- 대화창배경 DIV끝 -->
		<br>
			<!-- 채팅입력 DIV시작 -->
			<div id="coversation" align="center" style="width:500px;">
				<span id="writeDiv">
					<br>
					<span><textarea class="textarea" rows="3" cols="45" placeholder="대화를 입력하세요" style="padding:10px;" id="chatbody" autofocus></textarea></span>
					<span style="float:right;"><input type="button" value="전송" style="padding: 10px 30px;" class="btn" onclick="javascript:SendMsg();"><br>
					<div id="text_cnt" style="text-align:right; margin-right:15px; float:right;">(0 / 100)</div></span>
				</span>
			</div>
			<div id="msgList">
			
			</div>
		<!-- 채팅입력 DIV끝 -->
		<!-- 접속유저 DIV 시작 -->
			<div id="ChatUserList">
			
			</div>
		<!-- 접속유저 DIV 시작 -->
		<!--  나가기 DIV 시작 -->
			<div id="getOut" align="center">
				<br><br>
				<input type="button" value="나가기" class="btn" onclick="getOut()">
			</div>
		<!--  나가기 DIV 끝 -->
	</div><!-- 화면위치조절용 DIV끝 -->
</div>
</body>
</html>