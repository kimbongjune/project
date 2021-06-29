<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<style>
* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {width:1200px;margin:0 auto;height:100%;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
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
	.section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
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





.con_area {
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
	.subject 
	{
	    float: left;
	    width: 100%;
	    height: 53px;
	    padding-bottom: 10px;
	    border-bottom: 1px solid #bababa;
	}
	.subject td
	{
	    float: left;
	    margin-left: 7px;
	    border-radius: 5px;
	    width: 15%;
	    height: 30px;
	    line-height: 30px;
	    text-align: center;
	    border: 1px solid #999;
	    overflow: hidden;
	    margin-top:15px;
	}
	.acount 
	{
	    float: left;
	    display: block;
	    width: 96%;
	    font-size: 14px;
	    color: #585858;
	    background-color: #fdfdfd;
	    border-bottom: 1px solid #c1c1c1;
	    line-height: 1.7em;
	    padding: 2%;
	    margin: 0px;
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
	.go_list #button
	{
	    border: 1px solid #a5a5a5;
	    padding: 1%;
	    width: 150px;
	}
</style>
	<div class="con_area">
	<table width="90%" height="auto" align="center">
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td class="photo"><img src="./images/d.png" width="100%" height="100%"></td>
						<td>
							<table width="100%" class="space">
								<tr>
									<td colspan="2" class="view_title"><h2>장수 온천호텔[우수숙박시설 굿스데이]</h2></td>
								</tr>
								<tr>
									<td colspan="2" width="100%"><p class="review_css"></p></td>
								</tr>
								<tr>
									<td><dt>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</dt></td>
									<td class="view_address">전라북도 장수군 번암면 장수로 673-14</td>
								</tr>
								<tr>
									<td><dt>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</dt></td>
									<td class="view_number">063-000-0000</td>
								</tr>
								<tr class="favorite">
									<td>
										<table>
											<tr>
												<td class="homepage"><a href="#"><img src="./images/home.jpg" style="float:left; margin:3px 0px 0px 15px;"><span style="float:left; margin-left:2px;">홈페이지</span></a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="100%">
					<tr class="subject">
						<td>소개</td>
						<td>이용안내</td>
						<td>지도 및 주변관광지</td>
						<td>여행지 후기</td>
					</tr>
					<tr class="acount">
						<td>
							<div>25년 전통의 장수온천 호텔이 새롭게 새단장했다.</div>
							<div>모던하면서도 안락하게 인테리어 된 객실 30실을 갖추고 있으며, 넓은 주차장을 보유하고 있는 장수온천호텔은 친절하고 청결하다.</div>
							<div>현대감각으로 꾸며진 모든 객실은 고객의 휴식에 불편이 없도록 갖추어져 있으며 아늑한 실내 분위기와 친절 봉사로 성심성의를 다하고 있다.</div>
						</td>
					</tr>
					<tr>
						<td class="de_text">
						모던하면서도 안락하게 인테리어 된 객실 30실을 갖추고 있으며, 넓은 주차장을 보유하고 있는 장수온천호텔은 친절하고 청결하다. 현대감각으로 꾸며진 모든 객실은 고객의 휴식에 불편이 없도록 갖추어져 있으며 아늑한 실내 분위기와 친절 봉사로 성심성의를 다하고 있다.   온돌과 더블룸이 공간구성과 부족함 없이 준비된 객실비품, 포근함과 안락함을 주는 인테리어로 완성된 객실은 고객에게 내 집과 같은 편안함을 주기 위한 장수온천 호텔의 마음이 담긴 공간이다. 영원히 간직하고 싶은 마음, 가족처럼 편안한 분위기, 직원은 고객 여러분에게 준비된 모습과 최상의 서비스, 최선을 다하는 모습으로 다가갈 것이다.   주변관광지로 대성산, 봉화산, 의사전해산 추모비, 방화동 자연휴양림 등이 있다.
						</td>
					</tr>
					<tr class="photo_shot">
						<td>
							<div class="section">
								<input type="radio" name="slide" id="slide01" checked>
								<input type="radio" name="slide" id="slide02">
								<input type="radio" name="slide" id="slide03">
									<div class="slidewrap">
									<ul class="slidelist">
										<!-- 슬라이드 영역 -->
										<li class="slideitem">
											<a>
												<div class="textbox">
													<h3>첫번째 슬라이드</h3>
													<p>첫번째 슬라이드 입니다.</p>
												</div>
												<img src="./images/d.png" style="height:400px;">
											</a>
										</li>
										<li class="slideitem">
											<a>
												<div class="textbox">
													<h3>두번째 슬라이드</h3>
													<p>두번째 슬라이드 입니다.</p>
												</div>
												<img src="./images/d.png" style="height:400px;">
											</a>
										</li>
										<li class="slideitem">
											<a>
												
												<div class="textbox">
													<h3>두번째 슬라이드</h3>
													<p>두번째 슬라이드 입니다.</p>
												</div>
												<img src="./images/d.png" style="height:400px;">
											</a>
										</li class="slideitem">

									<!-- 좌,우 슬라이드 버튼 -->
									<div class="slide-control">
										<div>
											<label for="slide03" class="left"></label>
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
								</ul>
								<!-- 페이징 -->
								<ul class="slide-pagelist">
									<li><label for="slide01"></label></li>
									<li><label for="slide02"></label></li>
									<li><label for="slide03"></label></li>
								</ul>
							</div>
						</div>
						</td>
					</tr>
					<tr class="go_list">
						<td><input type="button" value="목록으로" id="button"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
<%@ include file="footer.jsp" %>