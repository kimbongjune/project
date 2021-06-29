<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "자유 게시판"; %> 
<%@ include file="../include/header.jsp" %>
<script src="../js/jquery-3.6.0.min.js"></script>
<%
	try
	{
		view_no = Integer.parseInt(request.getParameter("no"));	
	}catch(Exception e){%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%return;
	}

	ReplyListDto comview_listdto = new ReplyListDto();
	ReplyListVo comview_list;
	
	comview_list = comview_listdto.GetList(view_no);
%>
<%@ include file="../param/viewparam.jsp" %>
<script>
	function golist4()
	{
		 
		window.location = "com_list.jsp<%= param %>";
	};
</script>
<%@ include file="../js/javascript.jsp" %>

<%
	if(view_vo2.getTitle() == null)
	{
		%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
		return;
	}

	if(view_vo2.getBoardtype() == 5)
	{
		%>
		<script>
			alert("삭제된 게시물 입니다.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
	return;
}
	
%>
<script type="text/javascript">
function gomodify() 
{
	if(confirm("게시글을 수정 하시겠습니까?") != 1)
	{
		return;
	}
	$("#modfrm").submit();
}
</script>
<style>
	.com_head
	{
	    text-align: center;
	    width: 100%;
	    height: auto;
	    min-height: 120px;
	    margin-bottom: 20px;
	    padding-top: 40px;
	    padding-bottom: 40px;
	    background-position: center;
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.7em;
	    display: inline-block;
	    background-color: #F0F0F0;
	}
	
	com_body 
	{
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.3em;
	}
	
	th
	{
		border: #DDDDDD solid 1px;
		border-left:none;
		border-right:none;
		vertical-align: middle;
		text-align:center;
	}
	
	.comBtn 
	{
	    display: inline-block;
	    border-top: #dbdada solid 1px;
	    border-left: #dbdada solid 1px;
	    border-bottom: #dbdada solid 1px;
	    border-right: #dbdada solid 1px;
	    background-color: #fcfcfc;
	    padding: 8px 16px;
	    box-shadow: inset -1px -1px 1px #fff;
	    margin-left: 10px;
	    text-decoration: none;
	    cursor : pointer;
	}
	
	.comBtn:hover, .comBtn:active 
	{
	    color: #777;
	}

	.btnDiv
	{
		margin: auto;
		margin-bottom : 150px;
		border: solid black 0px; 
		width: 60%;"
	}
	
	 
	 .box
	 {
	 	border: 1px solid black;
	 }
	 
	 .rbodybox
	 {
		border: 1px solid black;	 
	 }
	 
	 #rbody
	 {
	 	border: 1px solid black;
	 }
</style>










<style>
.replyTable
{
    margin: auto;
    margin-bottom: 10px;
    border: solid black 0px;
    width: 60%;
    text-align:center;
 }


.replyFace1
{
	width:50px !important;
}

.replyFace2
{	
	width: 40px !important;
	height: 40px !important;
	border-radius: 50% !important;
	background-color:grey;
}

.replyFace3
{	
	width: 40px !important;
	height: 40px !important;
	border-radius: 50% !important;
	cursor: pointer !important;
	background-color:grey;
}

.replyND
{
	font-size:8px !important;
	margin-left: 10% !important;
	width: 100px !important;
	text-align: left !important;
}


.replyLine1
{
	margin-top: 1px !important;
	margin-bottom: 1px !important;
	width: 60% !important;
	border-top: 1px solid #DDDDDD !important;
	margin-left: 20% !important;
	margin-right: 20% !important;
	
}

.replyLine2
{
	margin-top: 1px !important;
	margin-bottom: 1px !important;
	width: 60% !important;
	border-bottom: 1px solid #DDDDDD !important;
	margin-left: 20% !important;
	margin-right: 20% !important;
	
}

.replyBody
{
	width: 60% !important;
	height: 120px !important;
	font-size: 15px;
	margin-left: 25% !important;
	margin-top: 10px !important;
}

.writeReply
{
	width: 60% !important;
	height: 120px !important;
	font-size: 15px;
	margin-left: 30% !important;
	margin-top: 10px !important;
}

.replyID
{
	font-size: 20px;
	border: 0px;
	background-color: white;
}

.textarea
{
	border : 1px solid gery;
	background-color: #DDDDDD;
}

.com_viewRBtn
{
	border-radius: 30% !important;
	cursor : pointer !important;
}

.bodySize
 {
 	vertical-align: top !important;
 	height: 300px;
 	text-align: left;
 }
</style>
<script>
	function rep(a, b, c) //에이작스로 데이타를 전송후 댓글 형태로 받아와서 추가함
	{
		$.ajax
		({
			type : "GET",
			url: "../ReplyWrite.do?nickname=" + a + "&combody=" + b +"&no=" + <%= view_no %>+"&comno="+ c, //아이디와 내용 게시물 번호를 ok페이지에 넘겨줌
			dataType: "HTML",
			success : function(data) 
			{	
				data.trim();
				$("#reply").html("");
				$("#reply").append(data);
				//div에 받아온 데이타를 댓글형태로 추가함
				window.location.reload();
			}
		});
	}
	
	function rem(a, b, c, jObj) //에이작스로 데이타를 전송후 댓글 형태로 받아와서 추가함
	{
		$.ajax
		({
			type : "GET",
			url: "../ReplyModify.do?nickname=" + a + "&combody=" + b +"&no=" + <%= view_no %>+"&comno="+ c, //아이디와 내용 게시물 번호를 ok페이지에 넘겨줌",
			dataType: "HTML",
			success : function(data) 
			{	
				/* data.trim();
				$("#reply").html("");
				
				$("#rbody2").append(data);
				alert(data); */
				jObj.parent().prev().find("input:text").prop("readOnly",true);
				alert("댓글 수정이 완료되었습니다.");
				
				
				//div에 받아온 데이타를 댓글형태로 추가함
				//window.location.reload();
			}
		});
	}
	
	$(document).ready(function() 
		{
			$("#buttonok").click(function()
			{
				if($("#rbody").val() == "")
				{
					alert("댓글을 입력해주세요.");
					$("#rbody").focus();
					return;
				}
				
				a = $("#rid").val();	//아이디
				b = $("#rbody").val();	 //댓글내용
				c = $("#no").val();	//게시물번호
				$("#reply").html("");
				rep(a, b, c);
				//아이디 댓글 내용을 rep메소드로 보냄
			});
			
			$(".modify").click(function()
			{	
				if($(this).parent().parent().find(".rbody").val() == "")
				{
					alert("댓글을 입력해주세요.");
					$(this).parent().parent().find(".rbody").focus();
					return;
				}
				
				a = $(this).parent().parent().find("#rid").val();	//아이디
				b = $(this).parent().parent().find("#rbody2").val();	 //댓글내용
				c = $(this).parent().parent().find("#comno").val();	//댓글번호
				$(this).parent().parent().find("#rbody").val("");
				rem(a, b, c, $(this));
				//아이디 댓글 내용을 rep메소드로 보냄
			});
			
			$("#notok").click(function()
			{
				alert("로그인 하시고 이용해주세요");
				return;
			});	
		});
	
	
	
	function modifydel(obj, comno)
	{
		if(confirm("댓글을 삭제 하시겠습니까?") != 1)
		{
			return;
		}
		window.location="../ReplyDel.do?no=<%= view_no %>&k=<%= k %>&page=<%=view_pages%>&boardtype=<%= boardtype %>&comno=" + comno;
	}
	
	function onmodify1(obj)
	{
		var con = confirm("댓글을 수정하시겠습니까?");
		if(con)
		{
			$(obj).parent().parent().children().find('#mrBody').focus();
			$(obj).parent().parent().children().find('#mrBody').prop("readonly",false);
			mrBody = $(obj).parent().parent().children().find('#mrBody').val();
			$(obj).parent().parent().children().find('#mrBody').prop("placeholder",mrBody);
			$(obj).css('display', 'none');
			$(obj).next().css('display', 'inline');
		}
	}	
	
	function onmodify2(obj)
	{
		//댓글 수정을 처리한다.
		if($(obj).parent().parent().find("#mrBody").val() == "")
		{
			alert("댓글을 입력해주세요.");
			$(obj).parent().parent().find("#mrBody").focus();
		}
		else{
			a = $(obj).parent().parent().parent().parent().parent().children().find("#replyN").val(); 	//아이디
			b = $(obj).parent().parent().parent().children().find('#mrBody').val();				      	//댓글내용
			c = $(obj).parent().parent().parent().parent().parent().children().find("#comno").val();	//댓글번호
			rem(a, b, c, $(obj));
			$(obj).css('display', 'none');
			$(obj).prev().css('display', 'inline');
		}
	}
</script>
<div class="com_head" style="vertical-align:middle;">
		<h1 style="cursor:default !important;">자유게시판</h1>
		<h4>말하고, 나누고, 쓰고 싶은 생각을 자유롭게 말해보아요~~~</h4>
		<h5>유저들의 즐겁고, 매너있는 자유게시판을 만들어보아요~~~</h5>
</div>

	<form id="modfrm" name="modfrm" method="post" action="../Modify.do<%= param %>">
		<input type="hidden" id="k" name="k" value="<%= k %>">
		<input type="hidden" id="page" name="page" value="<%= view_pages %>">
		<input type="hidden" id="boardtype" name="boardtype" value="2">
		<input type="hidden" id="no" name="no" value="<%= view_no %>">
		<input type="hidden" id="title" name="title" value="<%= view_vo2.getTitle() %>">
	</form>
	<form id="delfrm" name="delfrm" method="post" action="../Del.do">
		<input type="hidden" id="no" name="no" value="<%= view_no %>">
		<input type="hidden" id="nickname" name="nickname" value="<%=nickname%>">
	</form> 
	<table style="margin:auto; border-top: solid black 1px; width: 60%;">
		<tr height="50px">
			<td colspan="5" style="text-align:left; vertical-align:middle;"><h2>&nbsp;&nbsp;&nbsp;<%= view_vo2.getTitle() %></h2></td>
			<td text-align="right"></td>
		</tr>
	</table>

	<table text-align="center" style="margin:auto; border-spacing:0px; width:60%; border-bottom:#DDDDDD solid 1px;">
		<tr height="40px">
			<th style="background-color:#F9F9F9; width:20%;">작성자</th>
			<th><%= view_vo2.getNickname() %></th>
			<th style="background-color:#F9F9F9; width:20%;">날짜</th>
			<th><%= view_vo2.getDate() %></th>
			<th style="background-color:#F9F9F9; width:20%;">조회수</th>
			<th style="width:10%;"><%= view_vo2.getHit() %></th>
		</tr>
		<%for(int i = 0 ; i <= view_list.Total() ; i++){
			if(view_list.Total() != 0){out.print("<tr height='330px'>"); break;}
			else{out.print("<tr height='10px'>");} break;}%>
			<td colspan="6" style="text-align:center !important; vertical-align:top !important;"><br>
			<%for(int i = 0 ; i < view_list.Total() ; i++){
				FileVo fvo = view_list.Get(i);
				if(view_list.Total() != 0)
				{out.print("<img src ='../include/ViewImage.jsp?f=" + fvo.getAttachname() + "'" + " Style= 'width:300px; height:300px; margin:20px;'>");}}%>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="bodySize"><br>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=view_vo2.getBody()%><br><br></td>
		</tr>
	</table><br>
	<div class="btnDiv">
	<table>
		<tr>
			<td colspan="5" style="text-align:right;">
				<input type="button" id="golist" class="comBtn" name="golis" value="목록" onclick="golist4();">
			</td>
			<td style="width:80%;"></td>
			<td style="text-align:right;">
			<% if(mod)
			{
				%>
				<input type="button" class="comBtn" id="gomodify" name="gomodify" value="수정" onclick="gomodify();">
				<input type="button" class="comBtn" id="godel" name="godel" value="삭제" onclick="godel();">
				<%
			}
			%>		
			</td>
		</tr>
	</table>
</div>
<table class="writeReply">
	<tr>	
		<td>
			<% if(namecheck){%><img class="replyFace2" src="../include/ViewImage.jsp?f=<%= photo %>">
			<%}else{%>
			<img class="replyFace2">
			<%}%>
			<input type="text" id="rid" class="replyID" size="12px" disabled value="<% if(namecheck){ out.print(nickname); }else{ out.print("비회원"); } %>">
			<br><br><textarea cols="100" rows="5" class="textarea" id="rbody" placeholder=" 댓글작성 창 입니다." style="border:0px; resize: none;"></textarea>
			<br>
			<span style="color:#aaa;" id="TextCounter">
			
			<br><br><%if(nickname != null){%><input type="button" class="comBtn" value="댓글 작성" id="buttonok"><%	
			}else{%><input type="button" value="댓글 작성" id="notok"><%}%>
		</td>
	</tr>
</table>
<br>
<%for(int i = 0 ; i < comview_list.Total() ; i++)
	{
		ReplyVo item = comview_list.Get(i);
		if(i == 0)
		{%>
			<div class="replyLine1"></div>
		<%}%>
		<table class="replyTable">
		<tr>
			<td class="replyFace1">
				<br><img src="../include/ViewImage.jsp?f=<%= comview_listdto.Getimg(item.getNickname())%>" class="replyFace3" id="login" name="login" onclick="">
			</td>
			<td class="replyND">
				<input type="hidden" id="comno" value= "<%= item.getComno()%>">
				<br><input type="text" value="<%= item.getNickname()%>" id="replyN" readonly><br><%= item.getComdate() %>
			</td>
			<td>
			</td>
			<td width="20px">
			</td>
		</tr>
		</table>
		<table class="replyBody">
			<tr>
				<td>
				<textarea cols="100" row="5" id="mrBody" style="border:0px; resize: none;" readonly><%= item.getCombody() %></textarea>
				</td>
				<td style="text-align:right; vertical-align:bottom; padding-right:100px;">
				<%if(namecheck){
					if(user.getNickname().equals(item.getNickname())){%>
					<input type="button" class="com_viewRBtn" value=" 댓글수정 " id="replymodify" onclick="javascript:onmodify1(this);">
					<input type="button" class="com_viewRBtn" value=" 수정완료 " id="replymodify2" onclick="javascript:onmodify2(this);" style="display:none;">
					<input type="button" class="com_viewRBtn" value=" 댓글삭제 " onclick="javascript:modifydel(this,<%= item.getComno() %>)"><%}
				}else{%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}%>
				</td>
			</tr>
		</table>
			<div class="replyLine2"></div>
<%}%>
<br><br><br><br><br>
<script>
// textarea 글자수 체크
$('.textarea').keyup(function (e){
    var content = $(this).val();
    $('#Textcounter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

    if (content.length > 200){
        alert("최대 200자까지 입력 가능합니다.");
        $(this).val(textContent.substring(0, 200));
        $('#Textcounter').html("(200 / 최대 200자)");
    }
});

</script>
<%@ include file="../include/footer.jsp" %>