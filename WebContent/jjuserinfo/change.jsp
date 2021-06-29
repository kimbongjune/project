<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "회원정보 수정"; %>
<%@ include file="../include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String name = null;
String birth = null;
String gender = null;
String phonenumber = null;

try
{
	name = user.getName();
	birth = user.getBirth();
	gender = user.getGender();
	phonenumber = user.getPhonenumber();
}catch(Exception e)
{
	
}

if(name == null)
{
	%><script>
		alert("비회원 진입 불가능합니다.");
		window.location="../jjmain/main.jsp";
	  </script><%
}
%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function()					
{
	var nickname = "<%= nickname %>";
	var pw = '';
	
	$("#pw_check").click(function()
	{		
		pw = $('#pw').val();
		
		$.ajax({
			type : "post",
			url: "changecheck.jsp",
			data: "nickname=" + nickname + "&pw=" + pw,
			dataType: "HTML",
			success : function(data) 
			{
				data = data.trim();
				//alert(data);
				if(data == "true")
				{
					$('#main_bg').css("display","block");
					$('#check_pw').css("display","none");
					
					
				}else
				{
					alert('비밀번호를 확인해주세요.');
				}
			}
		});
	});
});

var ispasswordCheck = "N";

function check()
{
	
	
	
	if(joinfrm.password.value == "")				//비밀번호 공란일시 알림
	{	
		alert("비밀번호를 입력하세요");
		joinfrm.password.focus();
		return false;
	}
	
	if(joinfrm.passwordcheck.value == "")			//비밀번호 확인 공란일시 알림
	{	
		alert("비밀번호확인을 입력하세요.");
		joinfrm.passwordcheck.focus();
		return false;
	}
	
	if(ispasswordCheck == "N")					//비밀번호 작성기준 불일치 시 알림
	{
		alert("비밀번호 양식을 확인해주세요");
		return false;
	}

	return true;
}

//핸들러이미지셀렉트 메소트 시작
function handleImgFileSelect(e) 
{
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	//확장자 확인하는것
	filesArr.forEach(function(f)
	{
		if(!f.type.match("image.*"))
		{
			alert("이미지만가능");
			return;
		}
		
		sel_file = f; 
		
		var reader = new FileReader(); //파일 읽을꺼임 아마도
		
		//window.onload 랑 비슷하겟지
		reader.onload = function(e)
		{
			//선택된 파일번호에 이미지를 넣어줌
			$("#profile").attr("src",e.target.result);
		}
		reader.readAsDataURL(f); //??? 읽어온 파일 url 이겟지 아마
	});
}


	
$(document).ready(function()					
{
	//프로필사진 미리보기 스크립트...
	//아마 아이디가 파일네임의 밸류가 바뀌면 메소드 실행하란거일꺼임
	$("#fileid").on("change", handleImgFileSelect);	
	
	$('#btnup').click(function(e)
	{
		e.preventDefault();
		$('#fileid').click();
	});


	//비밀번호 체크
    $('#password').keyup(function()
    {														
      $('#spanMsg2').html('');
      ispasswordCheck = "N";
    });
	
	//비밀번호 키보드 입력시 span 메시지 초기화
    $('#passwordcheck').keyup(function()
    {
    	//비밀번호 확인 키보드 입력시 코드실행 
    	var length = $(this).val().length;
    	var num = $("#password").val().search(/[0-9]/g);						//본문에 숫자 검사
    	var eng = $("#password").val().search(/[a-z]/ig);						//본문에 영어 소문자 검사
    	var spe = $("#password").val().search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);	//본문에 특수문자 검사
    	
    	if(length < 6 || length > 12)
    	{	
    		$('#spanMsg2').html('비밀번호는 6글자 이상 12글자 이하만 입력 가능합니다.');
    	}else if($('#password').val() != $('#passwordcheck').val())
        {
	        $('#spanMsg2').html('비밀번호가 일치하지 않습니다.');
	    }else if($("#password").val().search(/\s/) != -1)
    	{
    		$('#spanMsg2').html('비밀번호는 공백 없이 입력가능합니다.');
    	}else if(num < 0 || eng < 0 || spe < 0 )
    	{
    		$('#spanMsg2').html('비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.');
    	}else if($('#password').val() == $('#passwordcheck').val())
	    {
			$('#spanMsg2').html('비밀번호가 일치합니다.');
			ispasswordCheck = "Y"
        }
    });
});



</script>
<style>
	.con_area {
	    width: 1120px;
	    margin: 0 auto;
	    padding: 0;
	}
	h3 {
	    margin: 10px 0 0px;
	    font-size: 14px;
	    font-weight: 700;
	}
	
	.int {
	    width: 300px;
	    height: 45px;
	    border: none;
	    font-size: 15px;
	}

	.leftmenu2
    {
    	
  	 	align:center;
	    width: 100px;
	    border: 2px solid #555;
	    height: 49px;
	    overflow: hidden;
	    background-color: #555;
	    color: white;
	    cursor: pointer;
    }

	hr
	{
		border: 1px solid #ff7100;
	}

	.textarea
	{
		resize: none;
		width: 1000px;
		height:200px; 
	    background: #fff;
	    font-size: 15px;
	    border: 2px solid;
	}
	#mct
	{
	 	width: 100%;
	   	height: auto;
	   	margin: 0 auto;
	   	color: #777;
	   	border-top: 1px solid #e3e3e3;
	}
	#main_bg 
	{
	    text-align: center;
	    width: 100%;
	    height: auto;
	    min-height: 120px;
	    margin-bottom: 20px;
	    padding-top: 13px;
	    padding-bottom: 13px;
	    background-position: center;
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.7em;
	    display: inline-block;
	}
	input[type="text"]
	{
		width: 300px;
	    height: 45px;
	    border: 2px solid;
	    font-size: 15px;
	}
	input[type="password"]
	{
		width: 300px;
	    height: 45px;
	    border: 2px solid;
	    font-size: 15px;
	}
	.profile
	{
		width: 200px;
		height: 200px;
		border-radius: 50%;
		
	}
	
	#nick_check
	{
		margin-bottom: 45px;
	}
	
	#check_ok
	{
		margin-top: 40px;
	}
	
	#pw_check
	{
		margin-bottom: 50px;
	}
	
</style>
<div id="mct">
	<div class="con_area">
	<div style="text-align:center">
		<h1 style="margin:50px">회원정보수정</h1>
		<hr>
		<br><br>
	</div>
	
	<!-- 비밀번호 확인 후 수정정보 출력 -->
	<div id="check_pw">			
		<br><h2 align="center"> 비밀번호 확인 </h2><br>		
		<div align="center" id="nick_check">
			<font color="blue"> <%= nickname %> </font> 님의 회원정보를 안전하게 보호하기 위해<br>비밀번호를 한번 더 입력 해주세요.
		</div>
		<div align="center">
			<h3 >비밀번호 </h3><br> 
			<input type="password" id="pw" name="pw"> 
		</div>
		<div align="center" id="check_ok">
			<input type="button" id="pw_check" name="pw_check" class="leftmenu2" value="확인">
		</div>
	</div>
	<!-- 비밀번호 확인란 끝-->
	
		<div id="main_bg" style="display: none;">
			<form id="joinfrm" name="joinfrm" method="post" action="../Change.do" onsubmit="javascript:return check();" enctype="multipart/form-data">
				<div>
					<img class="profile" id="profile" src="../include/ViewImage.jsp?f=<%= photo %>">
					<input type="file" id="fileid" name="fileid" accept="img/*" onchange="javascript:changeValue(this);" hidden>
				</div>
				<br>
				<input id="btnup" name="btnup" class="leftmenu2" type="button" value="프로필사진 변경">
				<br>			
				<h3>이메일</h3><br>				
				<input autofocus id="email" name="email" class="int" type="text" value="<%= mail %>" readonly>
				<br>
				<h3>이름</h3><br>
				<input id="name" name="name" class="int" type="text" value="<%= name %>" readonly>	
				<span id="spanname" name="spanname"></span>
				<h3>닉네임</h3><br>		
				<input id="nickname" name="nickname" class="int" type="text" value="<%= nickname %>" readonly>		
				<span id="spanMsg" name="spanMsg"></span>
				<h3>비밀번호</h3><br>
				<input id="password" name="password" class="int" type="password" placeholder="영문, 숫자, 특수문자 포함 6~12자 작성">
				<h3>비밀번호확인</h3><br>
				<input id="passwordcheck" name="passwordcheck" class="int" type="password">
				<br>
				<span id="spanMsg2" name="spanMsg2"></span>
				<h3>생년월일</h3><br>
				<input id="birth" name="birth" class="int" type="text" value="<%= birth %>" readonly>
				<br>
				<h3>성별</h3><br>
				<input id="gender" name="gender" class="int" type="text" value="<%= gender %>" readonly>
				<br>
				<h3>휴대전화</h3><br>
				<input id="phon" name="phon" class="int" type="text" value="<%= phonenumber %>" readonly>
				<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="submit" name="submit" class="leftmenu2" type="submit" value="수정완료">
				<input class="leftmenu2" type="button" value="회원탈퇴" style="float: right;" onclick="location.href='joinout.jsp'";>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>