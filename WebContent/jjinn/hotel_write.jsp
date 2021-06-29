<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "숙소 게시판"; %>
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
if(wrt)
{
	if((utype.equals("4")) || (utype.equals("5")) || utype==null)
	{
		%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
		return;
	}
}else
{
	%>
	<script>
		alert("로그인을 해주세요!");
		window.location = "../jjmain/main.jsp" ;
	</script>
	<%
	return;
}
%>
<style>
.writebtn
{
    border: solid 0.5px black;
    width:60px;
    height: 27px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
</style>
<link type="text/css" rel="stylesheet" href="../css/write.css"></link>
<SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT>
<script type="text/javascript" src="/Travle/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/smart2.js" charset="utf-8"></script>
<script>
	function can() 
	{
		if(confirm("게시글 목록으로 돌아가시겠습니까?") != 1)
		{
			return;
		}
		/* 보드타입이 무엇? 수정해야함 */
		window.location='hotel_list.jsp?k=<%=k%>&boardtype=<%=type%>&page=<%=pages%>';
	}
	
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addres').value = fullRoadAddr;
            }
        }).open();
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
					<input type="hidden" id="boardtype" name="boardtype" value="3">
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
					
					<div style="width:100%; margin:20px; margin-bottom:20px; display: inline-block;">
						<!-- 스마트에디터 실행되는 영역 -->
						<textarea rows="30" cols="30" id="body" name="body" style="width:95%;"></textarea>
					</div>
					
					<div style="width:100%; padding:12px; display: inline-block; vertical-align: middle; margin-bottom: 50px;" >
						<p style="margin-bottom:20px; margin-top:20px; border:solid 1px;"></p>
						
						<!-- 주소 입력하는 영역 -->
						<div id="addrdiv" style="float: left; width:50%">
							<span style="font-size:18pt; padding:12px;">
								<strong style="font-size:15pt; padding:10px; vertical-align: middle;">주소:</strong>
								<input type="text" id="addres" name="addres" size="40%" style="height:23px;" readonly>
								<input type="button" value="주소 입력" class="writebtn" onclick="execDaumPostcode();">
							</span>
						</div>
						
						<!-- 연락처 입력하는 영역 -->
						<div id="numberdiv" style="float: left; width:50%">
							<span style="font-size:18pt;">
								<strong style="font-size:15pt; padding:10px; vertical-align: middle;">연락처:</strong>
								<input type="text" id="number" name="number" size="40%" style="height:23px;">
								<br>
								<span id="spanphonenumber" style="font-size:10pt;"></span>
							</span>
						</div>
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