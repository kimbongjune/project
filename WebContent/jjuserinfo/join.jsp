<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "회원가입"; %>
<%@ include file="../include/header.jsp" %>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>

var isIDCheck = "N"; 						//아이디 중복 검사 여부
var ismailcheck = "N";						//이메일 인증번호 체크 여부
var ispasswordCheck = "N";
var isbirth = "N";
var isphonenumber = "N";
function check()
{
	if(!$("input:radio[name='join']").is(":checked"))
	{
		alert("안내사항을 확인해주세요.");
		return false
	}
	
	if(joinfrm.email.value == "")			//메일 공란일시 알림
	{	
		alert("이메일을 입력하세요");
		joinfrm.email.focus();
		return false;
	}
	
	if(joinfrm.name.value == "")			//이름 공란일시 알림
	{	
		alert("이름을 입력하세요");
		joinfrm.name.focus();
		return false;
	}
	
	if(joinfrm.nickname.value == "")				//닉네임 공란일시 알림
	{	
		alert("닉네임을 입력하세요");
		joinfrm.nickname.focus();
		return false;
	}
	
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
	
	if(joinfrm.birth.value == "")			//생년월일 확인 공란일시 알림
	{	
		alert("생년월일을 입력하세요.");
		joinfrm.birth.focus();
		return false;
	}
	
	if(joinfrm.gender.value == "")			//생년월일 확인 공란일시 알림
	{	
		alert("성별 입력하세요.");
		joinfrm.gender.focus();
		return false;
	}
	
	if(joinfrm.phonenumber.value == "")			//생년월일 확인 공란일시 알림
	{	
		alert("휴대전화를 입력하세요.");
		joinfrm.phonenumber.focus();
		return false;
	}
	
	if(isIDCheck == "N")					//아이디 중복검사 미 수행시 알림
	{
		alert("닉네임 중복확인을 해주세요.");
		return false;
	}
	if(isIDCheck == "S")					//아이디 중복검사 수행하고 아이디 중복일때 알림
	{
		alert("중복된 닉네임이 존재합니다.");
		return false;
	}
	if(ismailcheck == "N")					//이메일 인증번호 일치하지 않거나 미입력일때 알림
	{
		alert("메일 인증번호를 확인해주세요");
		return false;
	}
	if(ispasswordCheck == "N")					//비밀번호 작성기준 불일치 시 알림
	{
		alert("비밀번호 양식을 확인해주세요");
		return false;
	}
	if(isbirth == "N")						//생년월일 작성기준 불일치 시 알림
	{
		alert("생년월일 양식을 확인해주세요");
		return false;
	}
	if(isphonenumber == "N")						//휴대폰 작성기준 불일치 시 알림
	{
		alert("휴대전화 양식을 확인해주세요");
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
	var check = 1;
	$('.showpw').on('click',function(){
		if(check == 1)
		{
			$('input[type="password"]').attr('type','text');
			check = 2;
		}else
		{
			$('#password').attr('type','password');
			$('#passwordcheck').attr('type','password');
			check = 1;
		}
	});

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
	
	//이름 체크
	$("#name").keyup(function(event)
	{
		var orgVal = $(this).val();
		var keyVal = $(this).val();
		keyVal = keyVal.replace(/[a-z0-9]/gi,"");						//본문에 영어 소문자, 숫자 제거
		keyVal = keyVal.replace(" ","");								//본문에 공란 제거
		keyVal = keyVal.replace(/[.,<>`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi, '');	//본문에 특수문자 제거
		$(this).val(keyVal);			
		if(orgVal == keyVal && orgVal != "")
		{				
			$('#spanname').html('');
		}else
		{	
			$('#spanname').html('이름은 한글만 입력가능합니다.');
		}
		
	});
	
	//닉네임 체크
	$('#nickname').keyup(function(event)
	{
		var leng = $(this).val().length;
		var orgval2 = $(this).val();
		var keyval2 = $(this).val();
			keyval2 = keyval2.replace(/[.,<>`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi, '');
			keyval2 = keyval2.replace(" ","");
		$(this).val(keyval2);
		if(orgval2 == keyval2 && orgval2 != "")
		{				
			$('#spanMsg').html('');
		}else
		{
			$("#spanMsg").html("닉네임은 특수기호를 사용하실수 없습니다.");
			$(this).val('');
		}
		if(leng > 8)
		{
			$("#spanMsg").html("닉네임은 2~7글자를 입력해주세요.");
			$(this).val('');
		}
	});
	
	//생년월일 체크
	$('#birth').keyup(function(event)
	{
		var leng = $(this).val().length;
		var orgVal3 = $(this).val();
		var keyVal3 = $(this).val();
		keyVal3 = keyVal3.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' );
		keyVal3 = keyVal3.replace(/[a-z]/gi,"");						//본문에 영어 소문자, 숫자 제거
		keyVal3 = keyVal3.replace(" ","");								//본문에 공란 제거
		keyVal3 = keyVal3.replace(/[.,<>`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi, '');	//본문에 특수문자 제거
		$(this).val(keyVal3);			
		if(orgVal3 == keyVal3 && orgVal3 != "" && leng < 7)
		{				
			$('#spanbirth').html('');
		}else
		{	
			$('#spanbirth').html('생년 월일은 숫자만 가능합니다. 예)210628');
			$(this).val('');
		}
		if(leng == 6)
		{
			isbirth = "Y";
		}
	});
	
	//폰 체크
	$('#phonenumber').keyup(function(event)
	{
		var phleng  = $(this).val().length;
		var orgVal4 = $(this).val();
		var keyVal4 = $(this).val();
		keyVal4 = keyVal4.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' );
		keyVal4 = keyVal4.replace(/[a-z]/gi,"");						//본문에 영어 소문자, 숫자 제거
		keyVal4 = keyVal4.replace(" ","");								//본문에 공란 제거
		keyVal4 = keyVal4.replace(/[.,<>`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi, '');	//본문에 특수문자 제거
		if(orgVal4 == keyVal4 && orgVal4 != "" && phleng < 12)
		{
			$('#spanphonenumber').html('');
		}else
		{	
			$('#spanphonenumber').html('전화번호는 11자리 숫자로 입력해주세요 예)01012345678');
			$(this).val('');
		}
		if(phleng == 11)
		{
			isphonenumber = "Y";
		}
	});
	
	//메일 정상적인가 체크
	$('#mail').keyup(function(event)
	{	
		var orgval3 = $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		var keyval3 = $(this).val( $(this).val().replace(/[,<>`~!#$%^&*|₩₩₩'₩';:₩/?]/gi, ''));
			keyval3 = $(this).val( $(this).val().replace(" ",""));
			
		if(orgval3 == keyval3 && orgval3 != "")
		{				
			$('#spanmail').html('');
		}else
		{
			$("#spanmail").html("이메일은 영문과 숫자만 입력가능합니다.");
		}
	});
	
	//인증메일 체크
	$("#mailcheck").click(function()
	{
		//이메일 인증
		var mailaddr = $('#email').val();
		
		$("#spanmail").html("인증 메일 발송중입니다. 잠시만 기다려주세요...");
		$("#sendCode").val("");
		
		$.ajax
		({
			type : "post",
			url: "../SendMail.do?email=" + mailaddr,
			dataType: "HTML",
			success : function(data) 
			{	
				data = data.trim();
				//alert(data);
				if(data == "ERROR")						
				{
					$("#spanmail").html("메일을 발송하지 못하였습니다. 메일주소를 확인해주세요.");
				}else if(data == "ERROR2")
				{
					$("#spanmail").html("중복된 이메일입니다.");
				}else
				{	
					alert("인증메일이 발송되었습니다");
					$("#spanmail").html("메일이 발송되었습니다. 인증번호를 확인 후 입력해주세요.");
					$("#sendCode").val(data);
				}
			}
		});			
	});
		
	//인증번호 체크
	$("#codecheck").click(function()
		{
			
			if($("#code").val() == "")
			{
				$("#codemail").html("인증번호를 입력해 주세요.");
			}
			else if($("#sendCode").val() != $("#code").val())
			{
				$("#codemail").html("올바른 인증번호를 입력해 주세요.");
			}
			else if($("#sendCode").val() == $("#code").val())
			{
				$("#codemail").html("올바른 인증번호 입니다.");
				ismailcheck = "Y";
				$("#email").attr("readonly",true);
				$('#email').css({"background-color": "#E6E6E6"});
				$("#code").attr("readonly",true);
				$('#code').css({"background-color": "#E6E6E6"});
				$('#mailcheck').prop("disabled", true);
				$('#codecheck').prop("disabled", true);
			}
		
		});
	
	/* 중복체크 */
	$("#idcheck").click(function()
	{
		$("#nickname").keypress(function()
		{
			$("#spanMsg").html("");
		});
		
		$.ajax({
			type : "post",
			url: "joincheck.jsp?nickname=" + $("#nickname").val(),
			dataType: "HTML",
			success : function(data) 
			{
				data = data.trim();
				//alert(data);
				$("#spanMsg").html(data)
				if(data == "사용 가능한 닉네임입니다.")
				{
					isIDCheck = "Y";
				}
				if(data == "중복된 닉네임이 존재합니다.")
				{
					isIDCheck = "S";
				}
			}
		});
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
		border: 1px solid black;
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
		width: 400px;
	    height: 45px;
	    border: 2px solid;
	    font-size: 15px;
	}
	input[type="password"]
	{
		width: 400px;
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
	h3
	{
		font-size:18pt;
		margin-bottom:10px;
	}
</style>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
		<!-- 제목용 -->
		
		<div style="text-align:center">
			<h1 style="margin:50px">회원가입</h1>
			<hr style="margin-bottom:50px">
		</div>
		
		<!-- 사용영역 -->
		<div id="main_bg">
			<!-- 폼시작 -->
			<form id="joinfrm" name="joinfrm" method="post" action="../Join.do" onsubmit="javascript:return check();" enctype="multipart/form-data">
				
				<!-- 프로필 이미지영역 -->
				<div>
					<input type="file" id="fileid" name="fileid" accept="img/*" onchange="javascript:changeValue(this);" hidden>
					<img class="profile" id="profile" src="../image/profile.png">
				</div>
				
				<!-- 프로필 사진 -->
				<br>
				<input id="btnup" name="btnup" class="leftmenu2" type="button" value="프로필사진 변경">
				<br>
				
				<!-- 이메일 입력영영 -->
				<div>
					<h3>이메일</h3><br>
					<div style="padding-left:100px">
						<input autofocus id="email" name="email" class="int" type="text" placeholder="이메일을 입력 해주세요.">
						<input id="mailcheck" name="mailcheck" class="leftmenu2" type="button" value="이메일인증">
					</div>
				</div>
				
				<!-- 이메일 입력양식 안내 영역 -->
				<span id="spanmail" name="spanmail"></span>
				<br>
				
				<!-- 이메일 인증번호 입력 영역 -->
				<div style="padding-left:100px">
					<input id="code" name="code" class="int" type="text" placeholder="인증번호를 입력해주세요">
					<input id="codecheck" name="codecheck" class="leftmenu2" type="button" value="인증확인">
				</div>
				
				<!-- 이메일 인증번호 안내 영역 -->
				<span id="codemail" name="codemail"></span>
				
				<!-- 비밀! -->
				<input type="hidden" id="sendCode" name="sendCode" value="">
				
				<!-- 이름 입력 영역 -->
				<div>
					<h3>이름</h3>
					<input id="name" name="name" class="int" type="text" placeholder="이름을 입력 해주세요.">
				</div>
				<br>
				
				<!-- 이름입력 안내 영역 -->
				<span id="spanname" name="spanname"></span>
				
				<!-- 닉네임 영역 -->
				<div>
					<h3>닉네임</h3>
					<div style="padding-left:100px">
						<input id="nickname" name="nickname" class="int" type="text" placeholder="닉네임은 2~7 글자만 입력 가능합니다.">
						<input id="idcheck" class="leftmenu2" type="button" value="중복확인" >
					</div>
				</div>
				
				<!-- 이름 입력 안내 영역 -->
				<span id="spanMsg" name="spanMsg"></span>
				
				<!-- 비밀번호 입력 영역 -->
				<div>
					<h3>비밀번호</h3><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="password" name="password" class="int" type="password" placeholder="영문, 숫자, 특수문자 포함 6~12자 작성">
					<img src="../image/eyeshapevariant.png" class="showpw" />
				</div>
				
				<!-- 비밀번호 확인영역 -->
				<div>
					<h3>비밀번호확인</h3><br>					
					<input id="passwordcheck" name="passwordcheck" class="int" type="password" placeholder="비밀번호를 확인 해주세요.">
				</div>
				<br>
				
				<!-- 비밀번호 안내 영역 -->
				<span id="spanMsg2" name="spanMsg2"></span>
				
				<!-- 생년월일 입력 영역 -->
				<div>
					<h3>생년월일</h3>
					<input id="birth" name="birth" class="int" type="text" placeholder="생년월일은 6자리 숫자로 입력해주세요 ex) 950823">
				</div>
				<br>
				
				<!-- 생년월입 안내영역 -->
				<span id="spanbirth"></span>
				
				<!-- 성별 입력 영역 -->
				<div>
					<h3>성별</h3>
					<input id="gender" name="gender" class="int" type="text" placeholder="성별은 한글 2글자만 입력 가능합니다.">
				</div>
				<br>
				
				<!-- 휴대폰 번호 입력영역 -->
				<div>
					<h3>휴대전화</h3>
					<input id="phonenumber" name="phonenumber" class="int" type="text" placeholder="휴대전화 번호를 입력해주세요.">
				</div>
				<br>
				
				<!-- 휴대폰 번호 안내영역 -->
					<span id="spanphonenumber"></span>
				
				<!-- 아래 여백용 -->
				<div style="margin-top:50px ; margin-bottom:50px">
				
				<!-- 이걸읽어? -->
				<textarea class="textarea" readonly>
				
개인정보보호법에 따라 이젠플레이트에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 검색, 보기 등 대부분의 이젠플레이트 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 게시물 작성, 커뮤니티 이용 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 이젠플레이트는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 이젠플레이트가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 이메일을 필수항목으로 수집합니다. 

2. 수집한 개인정보의 이용
이젠플레이트 및 이젠플레이트 관련 제반 서비스의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 법령 및 이젠플레이트 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.

3. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</textarea>
				</div>
			
				<!-- 여백용 -->
				<p style="margin-bottom:50px;">
					<input type="radio" name="join" value="join" style="margin-top:5px;">안내사항을 모두 확인하였으며, 이에 동의합니다.
				</p>
				
				<!-- 서브밋! -->
				<input id="submit" name="submit" class="leftmenu2" type="submit" value="가입완료">
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>