<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "회원정보 찾기"; %>
<%@ include file="../include/header.jsp" %>
<style>

	#find_userinfoh1
	{
		text-align: center;
		color: black;
	}
	
	.find_userinfobtn
	{
		background-color:  #F1591A;
		color: white;
		width: 93px;
		height: 45px;
		border-radius: 4px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.find_userinfobox
	{
		margin : auto;
		padding: 15px;
		border: none;
		width: 25%;
	}
	
	.find_userinfotextbox
	{
		margin : auto;
		border: 1px solid black;
		width: 100%;
		height: 45px;
	}
	
</style>
<script>
	//아이디찾기
	$(document).ready(function()					
	{
		$("input:text").keydown(function()
				{
			$("#spanphone").html("");
		});
		
		$("#findid").click(function()
		{	
			if($('#name').val() != "" && $('#phonenumber').val() != "")
			{
				var name = $('#name').val();
				var phonenumber = $('#phonenumber').val();
				$("#spanphone").html("인증 문자 발송중입니다. 잠시만 기다려주세요...");
				
				$.ajax
				({
					type : "post",
					url: "../FindID.do?phonenumber=" + phonenumber +"&name=" + name,
					dataType: "HTML",
					success : function(data) 
					{	
						data = data.trim();
						//alert(data);
						if(data == "ERROR")						
						{
							$("#spanphone").html("문자를 발송하지 못하였습니다. 회원정보를 확인해주세요.");
						}else
						{	
							alert("SMS로 아이디가 발송되었습니다");
							$("#spanphone").html("문자가 발송되었습니다..");
							
						}
					}
				});
			}else
			{
				alert("회원정보를 입력해주세요!!!");
			}
		});
	});
	
	//비밀번호 찾기
	$(document).ready(function()					
	{
		$(":text").keydown(function()
		{
			$("#codemail").html("");
		});
		
		$("#findpw").click(function()
		{
			if($('#pwmail').val() != "")
			{
				
				var mailaddr = $('#pwmail').val();
				var name = $('#pwname').val();
				$("#codemail").html("인증 메일 발송중입니다. 잠시만 기다려주세요...");
				
				$.ajax
				({
					type : "post",
					url: "../FindPW.do?mail=" + mailaddr +"&name=" + name,
					dataType: "HTML",
					success : function(data) 
					{	
						data = data.trim();
						//alert(data);
						if(data == "ERROR")						
						{
							$("#codemail").html("메일을 발송하지 못하였습니다. 회원정보를 확인해주세요.");
						}else
						{	
							alert("메일이 발송되었습니다");
							$("#codemail").html("메일이 발송되었습니다. 메일 확인후 비밀번호를 변경해주세요.");
						}
					}
				});
			}else
			{
				alert("이메일을 입력해주세요!!!");
			}
		});
	});
</script>
<p/><p/><p/><p/><p/><p/>

<h1 id="find_userinfoh1">아이디/비밀번호 찾기</h1>
	<div class="find_userinfobox">
		<strong>이름</strong><br>
		<input class="find_userinfotextbox" type="text" id="name" name="name" placeholder="이름을 입력 해주세요."><br><br>
		<strong>핸드폰번호</strong><br>
		<input class="find_userinfotextbox" type="text" id="phonenumber" name="phonenumber" placeholder="핸드폰 번호를 입력 해주세요"><br><br>
		<span id="spanphone" name="spanphone"></span>
		<div align="center">
		<input class="find_userinfobtn" type="button" id="findid" name="findid" value="아이디찾기">
		</div>
	</div>
<br><br><br><br>
	<div class="find_userinfobox">
		<strong>이름</strong><br>
		<input class="find_userinfotextbox" type="text" id="pwname" name="pwname" placeholder="이름을 입력 해주세요."><br><br>
		<strong>로그인 이메일</strong><br>
		<input class="find_userinfotextbox" width="150px" type="text" id="pwmail" name="pwmail" placeholder="이메일을 입력 해주세요." ><br><br>
		<span id="codemail" name="codemail"></span>
		<div align="center">
		<input class="find_userinfobtn" type="button" id="findpw" name="findpw" value="비밀번호찾기">
		</div>
	</div>
<br><br><br><br><br><br><br><br><br>
<%@ include file="../include/footer.jsp" %>