<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="tv.vo.*"%>
<%@ page import="tv.dto.*"%>
<%
UserVo user = null;
String nickname = null;
String utype = null;
String photo = null;
String mail = null;
String sc = null;
String sessionV = null;
UserDto sidto = new UserDto();

user = (UserVo) session.getAttribute("login");

if (user != null) {
	nickname = user.getNickname();
	utype = user.getType();
	photo = user.getPhoto();
	mail = user.getMail();

	sc = sidto.Session_Ip_Check(mail); //DB에 저장된 세션ID
	sessionV = session.getId(); //현재 브라우저 세션ID

	if (!(sc.equals(sessionV))) {

		session.removeAttribute("login");

		nickname = null;
		utype = null;
		photo = null;
		mail = null;
		user = null;

		out.println("<script>alert('다른 곳에서 로그인 되어 로그아웃 되었습니다.'); location.href='../jjmain/main.jsp';</script>");
	}
}
%>
<%@ include file="../param/param.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.select {
	margin-left: 5px;
	vertical-align: middle;
}

#nav_menu4 fieldset {
	width: 100%;
	border: none;
	margin: 0;
	padding: 0;
	width: 280px;
	line-height: 56px;
	padding: 0;
	border: 2px solid #d7182a;
	background: #fff;
	border-radius: 10px;
	display: block;
	position: relative;
	top: -20px;
	float: right;
	left: 60px;
}

option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

#nav_menu4 input[type="text"] {
	width: 130px;
	background: 0;
	border: 0;
	height: 30px;
	vertical-align: middle;
}

#nav_menu4 input[type="submit"] {
	vertical-align: middle;
	width: 32px;
	height: 0;
	padding: 32px 0 0;
	background-image: url('../image/totalsearch.png');
	overflow: hidden;
}

#load 
{
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: block;
    opacity: 0.8;
    background: white;
    z-index: 99;
    text-align: center;
}

#load > img 
{
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 100;
}
	

</style>
<link type="text/css" rel="stylesheet" href="../css/include.css"></link>
<link type="text/css" rel="stylesheet" href="../css/font.css"></link>
<title><%=t_name%></title>
<meta charset="UTF-8" />
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	function sitemap() {
		window.location = "../include/sitemap.jsp";
	}

	function chat() {

		window
				.open("../jjchat/chatting.jsp", "채팅창",
						"width=650px,height=900px");
	}

	function logout() {
		//컨펌해서 로그아웃 할건지 홗인하기.
		window.location.href = "../jjuserinfo/logout.jsp";
	}

	function gomain() {
		window.location.href = "../jjmain/main.jsp";
	}
	$(document).ready(function() {

		$("#navigation .gnb > li").on("mouseenter focusin", function() {
			var gnblay_h = $('#all').height() - 353;
			$(this).children("div").stop().slideDown(300);
			$(".gnb_lay").css("height", gnblay_h);
			$(".gnb_lay").show();
		}).on("mouseleave focusout", function() {
			$(this).children("div").stop().slideUp(300);
			$(".gnb_lay").hide();
		});

		$("#navigation").hover(function() {
			$(".navi_sub1").hide(0);
			$(".navi_sub2").hide(0);
			$(".navi_sub3").hide(0);

			if (!tu)
				var tu = $(window).width();
			window.onresize = resize;
			function resize() {
				var tu = $(window).width();
			}

			if ('980' <= tu && tu <= '1119') {
				$("#nav_menu1, #nav_menu2, #nav_menu3").animate({
					width : '320px'
				}, 0);

			} else {
				$("#nav_menu1, #nav_menu2, #nav_menu3").animate({
					width : '370px'
				}, 0);
			}

		});
	});

	$(document).ready(function() {
		$(".main").click(function() {
			if ($(".sub").is(":visible")) {
				$(".sub").slideUp();
			} else {
				$(".sub").slideDown();
			}
		});
	});
	
	$(document).ready(function() {
	    $("#load").hide();
	});
	
</script>
</head>
<body>
	<div id="load">
	    <img src="../image/loading.gif" >
	</div>
	<!-- 사이트 전체를 감싸줄 영역 선언 -->
	<div id="all" class="clearfix">
		<!-- 헤더영역 메인! -->
		<div id="head">
			<!-- 헤더안에 제목쓰기위해 -->
			<div class="head_sec1">
				<h1 style="margin: 50px;">
					<strong style="font-size: 60pt; padding: 45px; font-family: jua;"
						onclick="gomain();">전주에 빠지다</strong>
				</h1>

				<!-- 채팅,로그인등 컨텐츠를 위한것 -->
				<div class="head_right">
					<ul class="sns">
						<li>
							<p class="leftboaer">
								<input type="button" id="chat" name="chat" value="채팅"
									onclick="chat();"
									style="font-family: 'juaa'; font-weight: bold; font-size: 18px">
							</p>
						</li>
						<li>
							<p class="leftboaer">
								<input type="button" id="sitemap" name="sitemap" value="메뉴"
									onclick="sitemap();"
									style="font-family: 'juaa'; font-weight: bold; font-size: 18px">
							</p>
						</li>
						<%
						if (nickname == null) { //로그인 안됨
						%>
						<li>
							<p class="leftboaer">
								<input type="button" id="login" name="login" value="로그인"
									onclick="window.location='../jjuserinfo/login.jsp'"
									style="font-family: 'juaa'; font-weight: bold; font-size: 18px">
							</p>
						</li>
						<%
						} else { //로그인 됨
						%>
						<li class="main"><img id="login"
							src="../include/ViewImage.jsp?f=<%=photo%>"></li>
						<li class="sub"
							style="display: none; margin-inline-start: 100px; margin-top: 10px;">
							<ul>
								<li>
								<strong><%=nickname%> 님 환영합니다!
								</strong></li><br>
								<%
								if (utype.equals("1")) {
								%>
								<li>
								<input type="button" id="change" name="change" value="회원 관리"
									class="btn" onclick="window.location='../jjadmin/admin.jsp'"></li>
								<%
								} else {
								%>
								<li>
								<input type="button" id="change" name="change" value="내정보 수정"
									class="btn"
									onclick="window.location='../jjuserinfo/change.jsp'">
								</li>
								<li>
								<input type="button" id="change" name="change" value="내가 쓴 글 보기"
									class="btn"
									onclick="window.location='../jjuserinfo/writelist.jsp'">
								</li>
								<%
								}
								%>
								<li>
								<input type="button" id="logout" name="logout" value="로그아웃"
									class="btn" onclick="javascript:logout();"></li>
							</ul>
						</li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
		</div>
		<!-- 헤더영역 끝 -->

		<!-- 네비게이션 시작 -->

		<!-- 네비게이션 영역 -->
		<div id="navi_wrap">
			<h2 class="hidden">주메뉴</h2>
			<div id="navigation">

				<!-- UL로상단메뉴 나누기 -->
				<ul class="gnb">

					<!-- 네비메뉴 첫번째 -->
					<li class="depth1" id="nav_menu1"><a
						href="../jjnotice/notice_list.jsp"><font
							style="font-family: juaa">여행플러스</font></a> <!-- 마우스 올라갓을시 보여중영역 -->
						<div class="depth2"
							style="position: relative; z-index: 200; width: 100%; background: rgb(246, 248, 250); display: none; padding-top: 30px; margin-top: 0px; padding-bottom: 50px; margin-bottom: 0px; text-align: left;">

							<!-- 첫번쨰 메뉴 안의 정보들 -->
							<ul style="padding-left: 10px;">
								<li style="padding-inline-start: 25px;"><a
									href="../jjnotice/notice_list.jsp">공지사항</a></li>
								<li><a href="#">전주소식</a>
									<ul rel="1" style="padding-inline-start: 0px;">
										<li style="padding-inline-start: 0px;"><a
											href="../jjnotice/Festival.jsp">전주행사정보</a></li>
										<li style="padding-inline-start: 0px;"><a
											href="../CvidTest.jsp">코로나19</a></li>
									</ul></li>
							</ul>
						</div></li>
				</ul>

				<ul class="gnb">

					<!-- 네비메뉴 두번째 -->
					<li class="depth1" id="nav_menu2"><a
						href="../jjplay/jj_list.jsp"><font style="font-family: juaa">여행정보</font></a>

						<!-- 마우스 올라갓을시 보여줄영역 -->
						<div class="depth2"
							style="position: relative; z-index: 200; width: 100%; padding-inline-start: 0px; background: rgb(246, 248, 250); display: none; padding-top: 30px; margin-top: 0px; padding-bottom: 50px; margin-bottom: 0px;">

							<!-- 두번째 메뉴안의 정보들 -->
							<ul style="padding-inline-start: 10px; ">
								<li style="padding-inline-start: 40px;"><a
									style="margin-left: 25px;" href="../jjplay/jj_list.jsp">여행</a>
								</li>
								<li style="padding-inline-start: 0px;"><a
									href="../jjinn/hotel_list.jsp">숙소</a></li>
							</ul>
						</div></li>
				</ul>

				<!-- 네비메뉴 세번째 -->
				<ul class="gnb">
					<li class="depth1" id="nav_menu3"><a
						href="../jjfree/com_list.jsp"><font style="font-family: juaa">자유
								게시판</font></a> <!-- 마우스 올라갓을시 보여줄영역 -->
						<div class="depth2"
							style="position: relative; z-index: 200; width: 100%; padding-inline-start: 0px; background: rgb(246, 248, 250); display: none; padding-top: 30px; margin-top: 0px; padding-bottom: 50px; margin-bottom: 0px;">

							<!-- 세번째 메뉴안의 정보들 -->
							<ul style="padding-left: 0px;">
								<li style="padding-inline-start: 95px;"><a
									href="../jjfree/com_list.jsp">자유 게시판</a>
									<ul rel="3" style="padding-inline-start: 0px;">
										<li style="padding-inline-start: 0px;"><a
											href="../jjfree/com_list.jsp">자유 게시판</a></li>
									</ul></li>
							</ul>
						</div></li>
				</ul>
				<form id="search_frm" name="search_frm" method="post"
					action="../Search.do">
					<ul class="gnb">
						<li class="depth1" id="nav_menu4">
							<fieldset>
								<legend> 통합검색</legend>
								<select id="boardtype" name="boardtype" name="selectMenu"
									class="select" title="검색항목">
									<option value="0">통합검색</option>
									<option value="1">공지사항</option>
									<option value="2">여행</option>
									<option value="3">숙소</option>
									<option value="4">자유게시판</option>
								</select> <input class="k" id="k" name="k" type="text"> <input
									class="k" type="submit" value="검색">
							</fieldset>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<!-- 네비는 끝남 -->

		<!-- 돌아가기 편하게 하자! -->
		<div id="head_sec2">
			<%@ include file="/include/home_navi.jsp"%>
		</div>