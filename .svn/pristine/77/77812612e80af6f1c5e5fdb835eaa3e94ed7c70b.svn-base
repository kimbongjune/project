<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "회원탈퇴"; %>
<%@ include file="../include/header.jsp" %>
<%
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
			location.href="../jjmain/main.jsp";
		</script>
		<%
	}
	
	if(user == null)
	{
		%>
		<script>
			alert("로그인을 해주세요!");		
			location.href="../jjmain/main.jsp";
		</script>
		<%
	}
%>
<style>
	h1
	{
		color: #777777;
	}
		
	.btn
	{
		background-color: #777777;
		color: white;
		border: none;
		width: 93px;
		height: 45px;
		border-radius: 4px;
		margin-bottom: 50px;
	}
	
	.box
	{
		border: 1px solid black;
		margin: auto;
		width: 60%;
		margin-bottom: 30px;
	}
	
	#mct
	{
	 	width: 100%;
	   	height: auto;
	   	margin: 0 auto;
	   	color: #777;
	}
	
	.con_area {
	    width: 1120px;
	    margin: 0 auto;
	    padding: 0;
	}
</style>
<script>
	function Check()
	{
		//라디오값 체크 안했거나 비동의 시 탈퇴진행 불가
		if(!$("input:radio[name='out1']").is(":checked") || !$("input:radio[name='out2']").is(":checked") || $("input:radio[value='2']").is(":checked") )
		{
			alert("안내사항에 동의하셔야 탈퇴가 가능합니다.")
			return false;
		}
		return true;
	}
	
	$(document).ready(function() {
		$("#nooo").hover(function() {
			var top = Math.floor(Math.random() * (1000 - 0 + 1)) + 0;
			var left = Math.floor(Math.random() * (1800 - 0 + 1)) + 0;
			$("#nooo").css({
				   "position" : "absolute",
				   "top" : + top +"px",
				   "left" : + left +"px"
				});
		})
		
	})
</script>

<div style="text-align:center;">
	<h1 style="margin:50px">회원탈퇴</h1>
</div>
<div id="mct">
	<div class="con_area">
		<form id="joinoutfrm" name="joinoutfrm" method="post" action="../Joinout.do" onsubmit="javascript:return Check();">
			<input type="hidden" id="nickname" name="nickname" value="<%= nickname %>">
			<div class="box">
				※ 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능 합니다.<br><br>
				<font color="orange">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</font> 하오니 신중하게 선택하시기 바랍니다.<br><br>
			</div>
			<div align="center">
				<input type="radio" id="out1" name="out1" value="1"> 동의
				<input type="radio" id="out1" name="out1" value="2"> 비동의<br><br>
			</div>
			<div class="box">
				 ※  탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다..<br><br>
				자유게시판에 올린 게시글 및 댓글은 탈퇴시 자동 삭제되지 않고 그대로 남아 있습니다..<br><br>
				삭제를 원하는 게시글이 있다면 <font color="orange">반드시 탈퇴 전 삭제 하기시 바랍니다.</font>.<br><br>
				탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제.<br><br>
				해드릴 수 없습니다.<br><br>
			</div>
			<div align="center">
				<input type="radio" id="out2" name="out2" value="1"> 동의
				<input type="radio" id="out2" name="out2" value="2"> 비동의<br><br><br><br>
			</div>
			<div align="center">
				<input class="btn " id="nooo" type="submit" value="회원탈퇴">
				<input class="btn " type="button" value="취소">
			</div>
		</form>
	</div>
</div> 
<%@ include file="../include/footer.jsp" %>