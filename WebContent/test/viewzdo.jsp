<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "여행 게시판"; %> 
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<%
BoardVo vo = new BoardVo();
vo.setAddress("전라북도 덕진구 반월4길 15");
vo.setTitle("우리집");
%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12fbe440b3e1b228e8961391ab33c8b6&libraries=services"></script>
<script>
	$(document).ready(function()					
	{
		$(".map").attr('style', "display:none;");
		$("#good").click(function()
		{
			$.ajax
			({
				type : "post",
				url: "../Agree.do",
				data :"no=" + no + "&page=" + pages + "&k=" + k + "&nick=" + nickname + "&select=good",
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
		geocoder.addressSearch('<%= vo.getAddress() %>', function(result, status) {

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
		        content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= vo.getTitle() %></div>'
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
	.section .slidewrap {width:1200px;margin:0 auto;height:100%;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative; padding:0px;}
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
	    max-width: 100%;
	    min-width: 320px;
	    height: auto;
	    float: left;
	    border: 1px solid #e5e5e5;
	}
	.go_list #button, #gomodify, #godel
	{
	    border: none;
	    padding: 1%;
	    width: 150px;
	    background-color: #EFEFEF;
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
		
	}
	
	.subtitle2
	{
		vertical-align: middle;
		font-size: 20px;
		font-weight: bold;
	}
	
	#button, #gomodify, #godel
	{
		background-color: #EFEFEF;
		color: black;
		border: 1px solid black;
		border-radius: 4px;
	}	
</style>
<div class="con_area">	
	<table width="90%" height="auto" align="center"><!-- supTable -->
		<tr>
			<td>
				<table width="100%" style="border-bottom: 1px solid #bababa;"> <!-- table0 -->
					<tr>
						<td class="photo"><img src="../include/ViewImage.jsp?f=d.png" width="320px" height="250px"></td>
						<td>
							<table width="100%" class="space"><!-- class="space" -->
								<tr>
									<td colspan="2" class="view_title"><h2>실험용 제목</h2></td>
								</tr>
								<tr>
									<td colspan="2" width="100%"><p class="review_css"></p></td>
								</tr>
								<tr>
									<td><dt>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</dt></td>
									<td class="view_address">실험용 주소</td>
								</tr>
								<tr>
									<td><dt>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</dt></td>
									<td class="view_number">123</td>
								</tr>
								<tr class="favorite">
									<td>
										<table>
											<tr>
												<td class="homepage"><a href="#"><img src="../image/home.jpg" style="float:left; margin:3px 0px 0px 15px;"><span style="float:left; margin-left:2px;">홈페이지</span></a></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle"><button type="button" class="agreeBtn" value="좋아요" id="good"><img src="../image/like.PNG"></button> </td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle2">1</td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle"><button type="button" class="agreeBtn" value="싫어요" id="hate"><img src="../image/hate.PNG"></button></td>
												<td /><td /><td /><td /><td /><td /><td /><td />
												<td class="subtitle2">1</td>
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
				<table width="100%" border="99"> <!-- table1 -->
					<tr class="photo_shot" id="map" style="display:none;">
						<td colspan="99">
							<!-- 지도 div -->
							<div id="map"  style="width:1200px;margin-bottom:50px;"></div>
						</td>
					</tr>
					<tr>
						<td class="de_text" id="content">
						내용입니당
						</td>
					</tr>
					<tr class="photo_shot" id="content2">
						<td>
							<div class="section">
								<input type="radio" name="slide" id="slide01" checked>
								<input type="radio" name="slide" id="slide02">
								<input type="radio" name="slide" id="slide03">
									<div class="slidewrap">
									<ul class="slidelist">
										<!-- 슬라이드 영역 -->
										<% for(int i=0; i<3; i++){%>
										<li class="slideitem">
											<a>
												<div class="textbox">
													<h3></h3>
													<p></p>
												</div>
												<img src="../include/ViewImage.jsp?f=d.png" style="height:400px;">
											</a>
										</li>
										<% }%>
									<!-- 좌,우 슬라이드 버튼 -->
									<div class="slide-control">
										<div>
											<label for="slide03" class="left" ></label>
											<label for="slide02" class="right"></label>
										</div>
										<div>
											<label for="slide01" class="left"></label>
											<label for="slide03" class="right"></label>
										</div>
										<div>
											<label for="slide02" class="left"></label>
											<label for="slide01" class="right"></label>
										</div>
									</div>

									<div class="slide-control">
										<div>
											<label for="slide02" class="left"></label>
											<label for="slide02" class="right"></label>
										</div>
										<div>
											<label for="slide01" class="left"></label>
											<label for="slide01" class="right"></label>
										</div>
								</ul>
								<!-- 페이징 -->
								<ul class="slide-pagelist">
									<li><label for="slide01" ></label></li>
									<li><label for="slide02" ></label></li>
									<li><label for="slide03" ></label></li>
								</ul>
							</div>
						</div>
						</td>
					</tr>
					<tr class="go_list">
						<td><input type="button" value="목록으로" id="button" onclick="golist2();">
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