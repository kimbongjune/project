<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	<!-- 구글차트 시작, 구글차트 라이브러리 임포트 -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<style>
		table, tr, td
		{
			text-align:center;
  			border-collapse : collapse;
  			border-bottom: 1px solid #C4D0E4;
		}
		#trtop
		{
			border-top:2px solid #C4D0E4;
		}
		#trmiddle
		{
			border-top:1px solid #C4D0E4;
			border-bottom:1px solid #C4D0E4;
		}
		#trbottom
		{
			border-top:1px solid #C4D0E4;
			border-bottom:1px solid #C4D0E4;
		}
		#tdbottom
		{
			border-bottom:1px solid #C4D0E4;
			border-right:1px solid #C4D0E4;
		}
		#tdright, #remove, #yremove, #care, #ycare, #death, #total
		{
			border-right:1px solid #C4D0E4;
		}
		.btn
		{
			background-color: #1877F2;
			color: white;
			border: none;
			width: 120px;
			height: 45px;
			cursor: pointer;
		}
		.s_title_in3 
		{
		    padding-left: 20px;
		    font-size: 18px;
		    line-height: 24px;
		    color: #222;
		    margin-top: 16px;
		}
		.s_title_in3::before {
		    display: inline-block;
		    content: '';
		    width: 12px;
		    height: 12px;
		    margin-left: -16px;
		    margin-right: 8px;
		    border: 3px solid #47a8d1;
		}
		.s_title_in2 {
		    padding-left: 20px;
		    font-size: 22px;
		    line-height: 26px;
		    color: #222;
		    margin-top: 24px;
		}
		.s_title_in2::before 
		{
		    display: inline-block;
		    content: '';
		    width: 9px;
		    height: 16px;
		    margin-left: -20px;
		    margin-right: 7px;
		    background-color: #405985;
		    border-right: 4px solid #47c1d1;
		}
		.t_date 
		{
		    display: inline-block;
		    margin-left: 4px;
		    font-size: 0.7em;
		}
		.st_title 
		{
		    padding: 12px 0;
		    border-bottom: 2px solid #000;
		   	width:100%;
		}
		.sub_top .st_title > div 
		{
		    padding: 8px 0;
		}
		.st_title::after 
		{
		    display: block;
		    content: '';
		    clear: both;
		}
		.st_title h3 
		{
		    display: block;
		    font-weight: 500;
		    font-size: 32px;
		    line-height: 40px;
		    letter-spacing: -0.08em;
		    color: #333;
		}
		.st_title a
		{
		    display: inline-block;
		    font-size: 1.2rem;
		    padding: 8px 15px;
		    border: 1px solid #666;
		    border-radius: 5px;
		    font-weight: 600;
		    color: #000;
		    line-height: 1.5rem;
		    vertical-align: middle;
		    text-decoration: none;
		}
	</style>
<%
		Date today = new Date();															//오늘 날짜 얻는 객체 생성
		
		Calendar cal4 = new GregorianCalendar(Locale.KOREA);								//날짜를 계산하여 얻는 객체 생성(그레고리안 역법, 한국표준시간)
		Calendar cal3 = new GregorianCalendar(Locale.KOREA);
		Calendar cal2 = new GregorianCalendar(Locale.KOREA);
		Calendar cal1 = new GregorianCalendar(Locale.KOREA);
		cal4.add(Calendar.DATE, -4);														//오늘부터 4일전의 날짜를 얻음
		cal3.add(Calendar.DATE, -3);
		cal2.add(Calendar.DATE, -2);
		cal1.add(Calendar.DATE, -1);
		
		
		SimpleDateFormat todayFormat = new SimpleDateFormat("MM/dd");						//날짜 데이터를 얻어서 형식에 맞게 포맷해주는 객체 생성 ex)05/12
		
		String fourday_str	 = todayFormat.format(cal4.getTime());							//4일전의 날짜를 얻는 변수를 생성하고 가져와서 저장
		String threeday_str  = todayFormat.format(cal3.getTime());							//3일전의 날짜를 얻는 변수를 생성하고 가져와서 저장
		String twoday_str    = todayFormat.format(cal2.getTime());							//2일전의 날짜를 얻는 변수를 생성하고 가져와서 저장
		String yesterday_str = todayFormat.format(cal1.getTime());							//어제의 날짜를 얻는 변수를 생성하고 가져와서 저장
		String today_str 	 = todayFormat.format(today);									//오늘 날짜를 얻는 변수를 생성하고 가져와서 저장
		
%>
<script>

function LoadData()
{
	var total  = 0;																			//추가 확진자 변수
	var remove = 0;																			//격리해제자 변수
	var death  = 0;																			//사망자 변수
	var care   = 0;																			//누적 격리자 변수
	
	var mytotalArray  = new Array(5);														//추가 확진자 배열로 받기위한 변수
	var myremoveArray = new Array(4);														//격리해제자 배열로 받기위한 변수
	var	mydeathArray  = new Array(2);														//사망자 배열로 받기위한 변수
	var mycareArray   = new Array(2);															//누적 격리자 배열로 받기위한 변수
	$.ajax({
		type : "post",																		//코로나 19 API 호출 방식
		url: "CovidService.do",																//코로나 19 감염현황 API 호출 서블릿
		dataType: "xml",																	//데이터 송신타입(XML)
		success : function(xml) 
		{	
			//alert(xml);
			$(xml).find("item").each(function()												//XML데이터에서 아이템 기준으로 잘라서 반복문 형성
			{
				
				// xml 문서 item 기준으로 분리후 반복
				var decideCnt = $(this).find("decideCnt").text();							//추가 확진자를 XML데이터에서 가져오는 변수
				var clearCnt  = $(this).find("clearCnt").text();							//추가 격리해제자를 XML데이터에서 가져오는 변수
				var deathCnt  = $(this).find("deathCnt").text();							//추가 사망자를 XML데이터에서 가져오는 변수
				var careCnt   = $(this).find("careCnt").text();								//누적 격리자를 XML데이터에서 가져오는 변수
				
				mytotalArray[total]   = mytotalArray[total]   + decideCnt;					//추가 확진자를 배열로 받아 데이터값 저장
				myremoveArray[remove] = myremoveArray[remove] + clearCnt;					//격리해제자를 배열로 받아 데이터값 저장
				mydeathArray[death]   = mydeathArray[death]   + deathCnt;					//사망자를 배열로 받아 데이터값 저장
				mycareArray[care]     = mycareArray[care]     + careCnt;					//누적 격리자를 배열로 받아 데이터값 저장
	
				total++;																	//추가 확진자 배열 값 증가
				remove++;																	//격리해제자 배열 값 증가
				death++;																	//사망자 배열 값 증가
				care++;																		//누적 격리자 배열 값 증가
				
				var totallist     = mytotalArray[0]  + mytotalArray[1]						//작일, 총 추가확진자 저장하는 변수
				+ mytotalArray[2] + mytotalArray[3]  + mytotalArray[4]
				+ mytotalArray[5];
				
				var removelist    = myremoveArray[0] + myremoveArray[1];					//작일, 금일 격리해제자 저장하는 변수
				var deathlist     = mydeathArray[0]  + mydeathArray[1];						//작일, 총 사망자 저장하는 변수
				var carelist      = mycareArray[0]   + mycareArray[1];						//누적 격리자, 전일기준 누적 격리자 저장하는 변수
				
				var totalarray  = totallist.split("undefined");								//추가확진자를 저장하여 호출시 나오는 문구"undefined" 제거
				var removearray = removelist.split("undefined");							//격리해제자를 저장하여 호출시 나오는 문구"undefined" 제거
				var deatharray  = deathlist.split("undefined");								//사망자를 저장하여 호출시 나오는 문구"undefined" 제거
				var carearray   = carelist.split("undefined");								//누적 격리자를 저장하여 호출시 나오는 문구"undefined" 제거
				
				totaldecideCnt              = totalarray[1];								//총 확진자 수 
				yesterdaytotaldecideCnt     = totalarray[2];								//작일 추가확진자
				totaldecideCnt3             = totalarray[3];								//차트에 받을 변수로 3일전 확진자수
				totaldecideCnt4             = totalarray[4];
				totaldecideCnt5             = totalarray[5];
				totaldecideCnt6             = totalarray[6];
				
				totalremovereateDt         = removearray[1];								//금일 격리해제자
				yesterdayremovereateDt     = removearray[2];								//작일 격리해제자
				
				totaldeathCnt	           = deatharray[1];									//총 사망자
				yesterdaytotaldeathCnt     = deatharray[2];									//작일 총 사망자
				
				totalcareCnt 		       = carearray[1];									//누적 격리자
				yesterdaytotalcareCnt      = carearray[2];									//작일기준 누적 격리자
				
				totaldecideCntnum	       = parseInt(totaldecideCnt,10);					//총 확진자 정수형으로 변환
				yesterdaytotaldecideCntnum = parseInt(yesterdaytotaldecideCnt,10);			//작일 확진자 정수형으로 변환
				totaldecideCnt3num 		   = parseInt(totaldecideCnt3,10);					//3일전 확진자 정수형으로 변환
				totaldecideCnt4num 		   = parseInt(totaldecideCnt4,10);
				totaldecideCnt5num 		   = parseInt(totaldecideCnt5,10);
				totaldecideCnt6num 		   = parseInt(totaldecideCnt6,10);
				
				totalremovereateDtnum	   = parseInt(totalremovereateDt,10);				//금일 격리해제자 정수형으로 변환
				yesterdayremovereateDtnum  = parseInt(yesterdayremovereateDt,10);			//작일 격리해제자 정수형으로 변환
				
				totaldeathCntnum 		   = parseInt(totaldeathCnt,10);					//총 사망자 정수형으로 변환
				yesterdaytotaldeathCntnum  = parseInt(yesterdaytotaldeathCnt,10);			//작일 총 사망자 정수형으로 변환
				
				totalcareCntnum 		   = parseInt(totalcareCnt,10);						//누적 격리자 정수형으로 변환
				yesterdaytotalcareCntnum  = parseInt(yesterdaytotalcareCnt,10);				//작일기준 누적 격리자 정수형으로 변환
				
				decideCntnum  = totaldecideCntnum          - yesterdaytotaldecideCntnum;	//작일 비례 추가확진자 = 총 확진자 - 작일 확진자 
				decideCntnum1 = yesterdaytotaldecideCntnum - totaldecideCnt3num;			//작일 기준 추가확진자 = 작일 총 확진자 - 이틀전 총 확진자
				decideCntnum2 = totaldecideCnt3num 		   - totaldecideCnt4num;
				decideCntnum3 = totaldecideCnt4num		   - totaldecideCnt5num;
				decideCntnum4 = totaldecideCnt5num		   - totaldecideCnt6num;
				
				
				removereateDtnum = totalremovereateDtnum - yesterdayremovereateDtnum;		//작일 비례 격리해제자 = 총 격리해제자 - 작일 격리해제자

				deathCntnum      = totaldeathCntnum 	 - yesterdaytotaldeathCntnum;		//작일 비례 사망자 = 총 사망자 - 작일기준 총 사망자
				
				careCntnum  	 = totalcareCntnum 		 - yesterdaytotalcareCntnum;		//작일 비례 격리자 증가치 = 누적격리자 - 작일기준 격리자
				
			});
			
		}
	});
	
	var over = 0;																			//해외유입 확진자 변수
	
	var myoverArray = new Array(19);														//해외유입 확진자 배열로 받기위한 변수

	$.ajax({
		type : "post",
		url: "DistrictCovidService.do",														//코로나 19 시.도별 감염현황 API 호출 서블릿
		dataType: "xml",
		success : function(xml) 
		{	
			
			$(xml).find("item").each(function()
			{
				
				var overflowCnt = $(this).find("overFlowCnt").text();						//해외유입 확진자를 XML데이터에서 가져오는 변수
				
				myoverArray[over] = myoverArray[over] + overflowCnt;						//해외유입 확진자를 배열로 받아 데이터값 저장
				
				over++;																		//해외유입 확진자 배열 값 증가
				
				var overlist  	  = myoverArray[0]  + myoverArray[1]						//작일, 총 해외유입 확진자 저장하는 변수
				+ myoverArray[2]  + myoverArray[3]  + myoverArray[4]
				+ myoverArray[5]  + myoverArray[6]  + myoverArray[7]
				+ myoverArray[8]  + myoverArray[9]  + myoverArray[10]
				+ myoverArray[11] + myoverArray[12] + myoverArray[13]
				+ myoverArray[14] + myoverArray[15] + myoverArray[16]
				+ myoverArray[17] + myoverArray[18];
				
				var overarray = overlist.split("undefined");								//해외유입 확진자를 저장하여 호출시 나오는 문구"undefined" 제거
				
				totaloverCnt   	    = overarray[19];										//신규 해외유입 확진자
	
				totaloverCntnum     = parseInt(totaloverCnt,10);							//총 해외유입 확진자 정수형으로 변환
				
				kototaldecideCntnum = decideCntnum - totaloverCntnum;						 //국내발생 확진자 = 총 확진자 - 해외유입 확진자
				
			});
			html  = "<tr><td id='tdbottom' style='color:red'> + "  + decideCntnum + 		    "</td>";						//전일대비 확진자 증가치 소계
			html += "<td id='tdbottom' style='color:red'> +"   + kototaldecideCntnum +    "</td>";							//국내 추가확진자
			html += "<td id='tdbottom' style='color:red'> +"   + totaloverCntnum +		"</td>";							//해외유입 추가확진자
			html += "</tr>";
			$("#tblData").append(html);
			
			html=totaldecideCntnum.toLocaleString();
			$("#total").append(html);
			
			html=totalremovereateDtnum.toLocaleString();
			$("#remove").append(html);
			
			html=removereateDtnum;
			$("#yremove").append(html);
			
			html=totalcareCntnum.toLocaleString();
			$("#care").append(html);
			
			html=careCntnum;
			$("#ycare").append(html);
			
			html=totaldeathCntnum.toLocaleString();
			$("#death").append(html);
			
			html=deathCntnum;
			$("#ydeath").append(html);
			
			
			//구글차트 시작
			  google.charts.load('current', {'packages':['corechart']});					//구글차트 최신화
		      google.charts.setOnLoadCallback(drawVisualization);							//차트종류(콤보차트)
		      function drawVisualization() {												//콤보차트 작성
		          // Some raw data (not necessarily accurate)
		          var data = google.visualization.arrayToDataTable([
		            [		'일별', 				'누적 확진환자', 					'일 확진환자' ,     { role: 'annotation' }],	//X축 데이터 정보, X축데이터 이름, 우측 Y축데이터 이름
		            ['<%= fourday_str %>',   totaldecideCnt5num,      		  decideCntnum4,      		  decideCntnum4],	//날짜 1열, X축 1열 데이터, Y축 1열 데이터
		            ['<%= threeday_str %>',  totaldecideCnt4num,      		  decideCntnum3,      		  decideCntnum3],
		            ['<%= twoday_str %>', 	 totaldecideCnt3num,      		  decideCntnum2,      		  decideCntnum2],
		            ['<%= yesterday_str %>', yesterdaytotaldecideCntnum,      decideCntnum1,      		  decideCntnum1],
		            ['<%= today_str %>',  	 totaldecideCntnum, 			   decideCntnum, 			   decideCntnum]
		          ]);

		          var options = {																		//차트 스타일
		            title : '일일 및 누적 확진환자 추세',														//차트 이름
		            pointSize: 10,
		            vAxis: { 
		            	minValue: 0,
						0:{ 
		            	   ticks: [20000, 40000, 60000, 80000,100000, 120000, 140000],
		            	   title:"누적확진환자(명)"
							},														
						1:{
							ticks: [200, 400, 600, 800, 1000, 1200],
		           			title:"일 확진환자(명)"
		           			}
		               },
		               bar: {groupWidth: "20%"},
		            hAxis: {title: '누적 확진자(명)'},														//Y축 데이터 이름
		            animation: { startup: true,															//애니메이션효과 시작
		            	duration:1000,																	//2초동안 애니메이션 적용
	                 easing: 'linear-' },																//천천히 올라옴
		            seriesType: 'bars',																	//기본차트 타입(막대)
		            series: {1: {type: 'bar', targetAxisIndex:0}, 1: {type: 'line',targetAxisIndex:1}}	//배열 첫번째 차트(X축) = 막대, 배열 두번째차트(y축) = 선형
		          };

		          var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));//차트 작성 위치
		          chart.draw(data, options);
		        }
		}
	});
}
window.onload = function()
{
	LoadData();
	
}
function click()
{
	$("#chart_div").hide();
	$("#tblData").hide();
}
<%
	SimpleDateFormat todayFormat2 = new SimpleDateFormat("M.dd.");
	String date = todayFormat2.format(today);
%>
</script>
<script type="text/javascript"></script>
<div id="CovidTest">
<div class="st_title">
    <div class="fl_l">
        <h3><b>국내 발생 현황</b></h3>
        <a href="../Travle/jjmain/main.jsp" style="float:right;">홈페이지 바로가기</a>
        <a href="KoreaCovid.jsp">시도별 발생 현황 바로가기</a>
    </div>
</div>
<h4 class="s_title_in2">국내 발생 현황</h4>
<h5 class="s_title_in3">누적 확진자 현황 <span class="t_date">(<%= date %> 00시 기준)</span></h5>
<table width="100%" id="tblData">
	<tr id="trtop">
		<td id="tdright" colspan="4" style="background-color:#F7FAFF"><strong>확진 환자</strong></td>
		<td id="tdright" colspan="2" style="background-color:#F7FAFF"><strong>격리 해제</strong></td>
		<td id="tdright" colspan="2" style="background-color:#F7FAFF"><strong>격리중</strong></td>
		<td colspan="2" style="background-color:#F7FAFF"><strong>사망</strong></td>
	</tr>
	<tr id="trmiddle">
		<td id="tdright">누적<br><div id="CL"></div></td>
		<td id="tdright" colspan="3">전일대비</td>
		<td id="tdright">누적</td>
		<td id="tdright">전일대비</td>
		<td id="tdright">누적</td>
		<td id="tdright">전일대비</td>
		<td id="tdright">누적</td>
		<td>전일대비</td>
	</tr>
	<tr id="trbottom">
		<td id="total" rowspan="2"></td>
		<td id="tdright">소계</td>
		<td id="tdright" style="color:#1F50A9">국내 발생</td>
		<td id="tdright" style="color:#1F50A9">해외 유입</td>
		<td id="remove" rowspan="2"></td>
		<td id="yremove" rowspan="2" style="color:#0635E3">+</td>
		<td id="care" rowspan="2"></td>
		<td id="ycare" rowspan="2" style="color:#dd0000">+</td>
		<td id="death" rowspan="2"></td>
		<td id="ydeath" rowspan="2" style="color:#dd0000">+</td>
	</tr>
</table>	
<div id="chart_div" style="width: 90%; height: 500px;"></div>
</div>								