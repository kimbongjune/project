<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "숙소 게시판"; %> 
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../js/javascript.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12fbe440b3e1b228e8961391ab33c8b6&libraries=services"></script>
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
%>
<%@ include file="../param/viewparam.jsp" %>
<script>
	function golist3() 
	{
		
		window.location = "hotel_list.jsp<%= param %>";
	};
</script>
	<% 	
	if(view_vo2.getTitle() == null){%>
		<script>
			alert("정상적인 경로를 이용해주세요.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%return;
	}
	
	if(view_vo2.getBoardtype() == 5){%>
		<script>
			alert("삭제된 게시물 입니다.");
			window.location = "../jjmain/main.jsp" ;
		</script>
		<%
		return;
	}
%>	



<script>

	$(document).ready(function()					
	{
		var nickname = "<%= nickname %>";
		var no ='<%=view_no%>';
		var pages ='<%=view_pages%>';
		var k = '<%=k%>';
		var boardtype ='<%=boardtype%>';
		
		$(".map").attr('style', "display:none;");
		
		$("#good").click(function()
		{
			$.ajax
			({
				type : "post",
				url: "../Agree.do",
				data :"no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype + "&nick=" + nickname + "&select=good",
				dataType: "HTML",
				success : function(data) 
				{	
					data = data.trim();
					//alert(data);
					if(data == "ERROR")						
					{
						alert("좋아요 버튼은 회원만 누르실 수 있습니다.");
					}else
					{	
						alert("좋아요 버튼을 누르셨습니다.");
						window.location.reload();
					}
				}
			});	
		});
		
			$("#hate").click(function()
			{
				$.ajax
				({
					type : "post",
					url: "../Agree.do",
					data :"no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype + "&nick=" + nickname + "&select=hate",
					dataType: "HTML",
					success : function(data) 
					{	
						data = data.trim();
						if(data == "ERROR")						
						{
							alert("싫어요 버튼은 회원만 누르실 수 있습니다.");
						}else
						{	
							alert("싫어요 버튼을 누르셨습니다.");
							window.location.reload();
						}
					}
				});	
			});
	});
	function gomodify() 
	{
		if(confirm("게시글을 수정 하시겠습니까?") != 1)
		{
			return;
		}
		$("#modfrm").submit();
	}
	function map() {
		$("#content").attr('style', "display:none;");
		$("#content2").attr('style', "display:none;");
		$("#map").attr('style', "display:");
		mapping();
		
	}
	function content() {
		$("#map").attr('style', "display:none;");
		$("#content").attr('style', "display:");
		$("#content2").attr('style', "display:");
	}
	function mapping() 
	{
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			/* 좌표를 어디서 구해오지? */
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		/* 주소위치를 변수명으로 변경 */
		geocoder.addressSearch('<%= view_vo2.getAddress() %>', function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {

		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });

		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		    	/* 찾으시는곳에 타이틀 넣을까? */
		        content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= view_vo2.getTitle() %></div>'
		    });
		    infowindow.open(map, marker);

		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
		}); 
	}
</script>
<style>
* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {width:100%;margin:0 auto;height:100%;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative; padding: 0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}
	
	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	/* input에 체크되면 텍스트 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}

	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:30px;background:url('../image/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('../image/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}





	.con_area 
	{
	    width: 1120px;
	    margin: 0 auto;
	    padding: 0;
	}
	.review_css
	{
		float: left;
	    padding: 1%;
	    width: 98%;
	    font-size: 90%;
	    font-weight: 600;
	    color: #636363;
	    margin-top: 5px;
	    border-top: 1px dashed #bbb;
	    border-bottom: 1px dashed #bbb;
	    background-color: #fcfbfb;
	}
	.view_title
	{
		line-height: 1.5em;
		font-size: 30px;
	    color: #222;
	    padding-bottom: 20px;
	}
	dt
	{
		text-indent: 20px;
	    float: left;
	    font-weight: bold;
	}
	.view_address
	{
		float: left;
	    text-align: left;
	    line-height: 1.5em;
	}
	.view_number
	{
		float: left;
	    text-align: left;
	    line-height: 1.5em;
	}
	.homepage
	{
		border-radius: 3px;
	    font-size: 13px;
	    height: 30px;
	    line-height: 30px;
	    text-indent: 30px;
	    width: 100%;
	    border: 1px solid #bebebe;
	    cursor: pointer;
	    float: left;
	    margin-right: 8px;
	    margin-bottom: 5px;
	}
	a
	{
		color: #555;
		text-decoration: none;
	}
	.de_text
	{
	    float: left;
	    margin: 20px 15px 20px 15px;
	    padding: 1%;
	    line-height: 1.6em;
	    font-size: 15px;
	}
	.photo_shot 
	{
	    display: inline-block;
	    float: left;
	    width: 100%;
	    height: 550px;
	    border-top: 1px solid #bababa;
	}
	.go_list 
	{
	    display: inline-block;
	    width: 100%;
	    margin: 25px auto;
	    text-align: center;
	    border-top: 1px solid #bababa;
	    margin-top: 50px;
	    
	}
	.space
	{
		margin-left:20px;		
	}
	.favorite 
	{
	    float: left;
	    margin: 20px 0 0 10px;
	}
	.photo
	{
	    width: 320px;
	    height: 250px;
	    float: left;
	    border: 1px solid #e5e5e5;
	}
	.go_list #button, #gomodify, #godel
	{
	    border: none;
	    padding: 1%;
	    width: 150px;
	    font-weight: bold;
	}
	
		.subtitle
	{	
		
		font-size: 20px;
		width: 50px;
		vertical-align: middle;
		text-align: right;
	}
	
	.agreeBtn
	{
		border: 0px solid white;
		cursor: pointer;
		
	}
	
	.subtitle2
	{
		vertical-align: middle;
		font-size: 20px;
		font-weight: bold;
	}
	
	#button, #gomodify, #godel
	{
		
		border-radius: 4px;
		cursor:pointer;
		background-color: #555;
    	color: white;
	}.photo > img
	{
	    width: 320px;
	    height: 250px;
	}		
</style>
<form id="modfrm" name="modfrm" method="post" action="../Modify.do<%= param %>">
	<input type="hidden" id="k" name="k" value="<%= k %>">
	<input type="hidden" id="page" name="page" value="<%= view_pages %>">
	<input type="hidden" id="boardtype" name="boardtype" value="3">
	<input type="hidden" id="no" name="no" value="<%= view_no %>">
</form>
<form id="delfrm" name="delfrm" method="post" action="../Del.do">
	<input type="hidden" id="no" name="no" value="<%= view_no %>">
	<input type="hidden" id="nickname" name="nickname" value="<%=nickname%>">
</form> 

<div class="con_area">
	<table width="90%" height="auto" align="center"><!-- supTable -->
		<tr>
			<td>
				<table width="100%" style="border-bottom: 1px solid #bababa;"> <!-- table0 -->
					<tr>
						<td class="photo"><% String body = view_vo2.getBody().replace("\""," ' ");
						if (body.indexOf("<img") != -1) 
						{
							String temp = body.substring(body.indexOf("<img"));
						%>
							<!-- 이미지 넣을곳 -->
							<p class="photo"><%= temp.substring(temp.indexOf("<img"), (temp.indexOf(">")+1)) %></p>
						<%	
						}
						else
						{
						%>
							<!-- 이미지 넣을곳 -->
							<img src="../image/s.png" class="photo">
						<%
						}
						%></td>
						<td>
							<table width="100%" class="space"><!-- class="space" -->
								<tr>
									<td colspan="2" class="view_title"><h2><%=view_vo2.getTitle() %></h2></td>
								</tr>
								<tr>
									<td colspan="2" width="100%"><p class="review_css"></p></td>
								</tr>
								<tr>
									<td><dt>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</dt></td>
									<td class="view_address"><%= view_vo2.getAddress() %></td>
								</tr>
								<tr>
									<td><dt>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</dt></td>
									<td class="view_number"><%= view_vo2.getNumber() %></td>
								</tr>
								<tr class="favorite">
									<td>
										<table>
											<tr>
												<td class="homepage"><a href="#"><img src="../image/home.jpg" style="float:left; margin:3px 0px 0px 15px;"><span style="float:left; margin-left:2px;">홈페이지</span></a></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle"><button type="button" class="agreeBtn" value="좋아요" id="good"><img src="../image/like.PNG"></button> </td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle2"><%= view_vo2.getGood() %></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle"><button type="button" class="agreeBtn" value="싫어요" id="hate"><img src="../image/hate.PNG"></button></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle2"><%= view_vo2.getHate() %></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
											</tr>
										</table>
									</td>
								</tr>
							</table> <!-- class="space" -->
						</td>
					</tr>
					<tr align="center" style="margin:10px;">
						<td onclick="content();">
							<h2>소개</h2>
						</td>
						<td onclick="map();">
							<h2>지도</h2>
						</td>
					</tr>
				</table><!-- table0 -->
				<table width="100%"> <!-- table1 -->
					<tr class="photo_shot" id="map" style="display:none;">
						<td colspan="99">
							<!-- 지도 div -->
							<div id="map"  style="width:1200px;margin-bottom:50px;"></div>
						</td>
					</tr>
					<tr>
						<td class="de_text" id="content">
						<%= view_vo2.getBody()%>
						</td>
					</tr>
					<tr class="go_list">
						<td><input type="button" value="목록으로" id="button" onclick="golist3();" >
						<%if(mod){%>
							<input type="button" id="gomodify" name="gomodify" value="수정" onclick="gomodify();">
							<input type="button" id="godel" name="godel" value="삭제" onclick="godel();"><%
						  }%>
						</td>
					</tr>
				</table><!-- table1 -->
			</td>
		</tr>
	</table><!-- supTable -->
</div>
<%@ include file="../include/footer.jsp" %>