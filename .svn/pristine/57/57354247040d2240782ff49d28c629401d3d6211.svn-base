<%@ page contentType="text/html;charset=utf-8" %>
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title><% String t_name = "로그인"; %></title>
	<link type="text/css" rel="stylesheet" href="../css/font.css"></link>
	<style>
		@charset "utf-8";

		:root
		{
		--body-background-color: #f5f6f7;
		--font-color: #4e4e4e;
		--border-gray-color : #dadada;
		--naver-green-color: orange;
		--naver-green-border-color: orange;
		}
	
	
		*{
			margin:0;
			padding:0;
		}
		
		body
		{
			background:var(--body-background-color);
		}
		
		.main-container
		{
			width:100%;
			display:flex;
			flex-direction:column;
			align-items:center;
			margin-top: 21px;
		}
		
		.main-container .main-wrap
		{
			width:768px;
		
		}
		
		.main-container .main-wrap .sel-lang-wrap .lang-select
		{
			width: 96px;
			height: 30px;
			color: var(--font-color);
			border: solid 1px var(--border-gray-color);
		}
		
		.main-container .main-wrap .logo-wrap
		{
			padding-top:55px;
		}
		
		.main-container .main-wrap .logo-wrap img
		{
			width: 231px;
			height: 75px;
		}
		
		.main-container .main-wrap header .sel-lang-wrap
		{
			display:flex;
			justify-content:flex-end;
		}
		
		.main-container .main-wrap header .logo-wrap
		{
			display:flex;	
			flex-direction: column;
			align-items: center;
		}
		
		.login-input-section-wrap
		{
			padding-top: 60px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		
		.login-input-wrap
		{
			width: 465px;
			height :48px;
			border: solid 1px var(--border-gray-color );
			background: white;
		}
		
		.password-wrap
		{
			margin-top: 13px;
		}
		
		.login-input-wrap input
		{
			border: none;
			width:430px;
			margin-top: 10px;
			font-size: 14px;
			margin-left: 10px;
			height:30px;
		}
		
		.login-button-wrap 
		{
			padding-top: 13px;
		}
		
		.login-button-wrap button
		{
			width: 465px;
			height :48px;
			font-size: 18px;
			background: var(--naver-green-color);
			color: white;
			border: solid 1px var(--naver-green-border-color);
			cursor: pointer;
		}
		
		.login-stay-sign-in
		{
			width: 465px;
			height: 52px;
			
			display: flex;
			font-size: 15px;
			color: #4e4e4e;
			align-items: center;
			justify-content: flex-start;
			border-bottom: solid 1px var(--border-gray-color);
		}
		
		.login-stay-sign-in i
		{
			font-size: 25px;
			color: #9ba1a3;
		}
		
		h1 
		{
		    display: block;
		    font-size: 2em;
		    margin-block-start: 0.67em;
		    margin-block-end: 0.67em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		    cursor: pointer;
		}
	</style>
</head>

<body>
<form id="loginfrm" name="loginfrm" method="post" action="../Login.do">
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				<h1 onclick="window.location='../jjmain/main.jsp'"><strong style="font-size:60pt; padding:45px; font-family:jua;">전주에 빠지다</strong></h1>
			</div>
		</header>
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input autofocus placeholder="이메일" type="text" id="userid" name="userid"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password" id="userpw" name="userpw"></input>
			</div>
			<div></div>
			<div class="login-button-wrap">
				<button>로그인</button>
			</div>
			<div class="login-stay-sign-in">
				<span><a href="join.jsp"> 회원가입 </a></span> &nbsp;&nbsp;&nbsp;
				<span><a href="find_userinfo.jsp">아이디 / 비밀번호 찾기</a></span>
			</div>
		</section>
		</div>
	</div>
</form>
</body>