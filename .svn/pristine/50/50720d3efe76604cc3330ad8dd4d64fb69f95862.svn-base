<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "자유 게시판"; %>
<%@ include file="/include/header.jsp" %>
<%
if(user == null)
{
	%>
	<script>
		alert("로그인이 필요한 서비스입니다.");		
		location.href="../jjmain/main.jsp";
	</script>
	<%
}
%>
<link type="text/css" rel="stylesheet" href="../css/write.css"></link>
<script type="text/javascript" src="../js/smart.js" charset="utf-8"></script>
<script type="text/javascript" src="/Travle/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	function can() 
	{
		if(confirm("게시글 목록으로 돌아가시겠습니까?") != 1)
		{
			return;
		}
		/* 보드타입이 무엇? 수정해야함 */
		window.location='com_list.jsp?k=<%=k%>&boardtype=<%=type%>&page=<%=pages%>';
	}
</script>
<!-- 메인컨테이너 -->
<div id="mct">
	<!-- 여백용  -->
	<div class="con_area">
		<!-- 사용 영역 -->
		<div id="main_bg">
			<!-- 폼시작 -->
			<div style="width:100%;">
				<form id="writeFrm" name="writeFrm" method="post" action="../Write.do">
				
					<!-- 히든으로 보드타입/닉네임 넘김-->
					<!-- 1 = 소식게시판 2 = 뭐하지게시판 3 = 숙소정보게시판 4 = 자유게시판 -->
					<input type="hidden" id="boardtype" name="boardtype" value="4">
					<!-- 실험용으로 닉네임 밸류 1로 해둠 -->
					<input type="hidden" id="nickname" name="nickname" value="<%= nickname %>">
				
					<!-- 게시판 이름 영역 -->
					<h1 style="margin:50px"><%= t_name %></h1>
					
					<!-- 제목 입력하는 영역 -->
					<div id="titlediv" style="width:100%; padding:12px; vertical-align: middle;">
						<p style="margin-bottom:20px; margin-top:20px; border:solid 1px;"></p>
						<span>
							<strong style="font-size:15pt; padding:45px;">제목:</strong>
							<input style="height:23px;" type="text" id="title" name="title" size="100%">
						</span>
						<p style="margin-bottom:20px; margin-top:20px; border:solid 1px;"></p>
					</div>
					
					<div style="width:100%; margin:20px; display: inline-block;">
						<!-- 스마트에디터 실행되는 영역 -->
						<textarea rows="30" cols="30" id="body" name="body" style="width:95%;"></textarea>
					</div>
					<!-- 이동 버튼 -->
					<div>
						<input type="button" value="저장하기" class="leftmenu2" id="check">
						<input type="button" value="목록으로" class="leftmenu2" onClick="can();">
					</div>
					
				</form>
				<!-- 폼끝 -->
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp" %>