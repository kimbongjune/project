<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<style>
table, tr, td
{
	padding: 0px 10px 0px 0px;
	text-align:right;
	border:1px solid black;
	border-collapse : collapse;
}
#city > div, #step>div
{
	cursor: pointer;
	border-radius:3px;
	box-shadow: 2px 2px 2px rgba(0,0,0,0.2);
	text-align:center;
}
#trtop
{
	border-top:3px solid #6D88B7;
}
#tdtop
{
	text-align:center;
	border-bottom:2px solid #6D88B7;
	font-weight:bold;
	font-size:15px;
}
#tdtop2
{
	text-align:center;
	border-bottom:1px solid #6D88B7;
	font-weight:bold;
	font-size:15px;
}
#tdtop3
{
	border-bottom: 1px solid #6D88B7;
	font-weight:bold;
	font-size:15px;
	
}
#id td:not(#tdtop3):not(#tdtop2):not(#tdtop):not(#trtop)
{
	border-bottom:1px solid #DDDDDD;
}
#id td
{
	border-left:1px solid #DDDDDD;
	border-right:1px solid #DDDDDD;
}
#tdleft
{
	text-align:center;
	padding:0px;
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
    float:left;
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
    float:left;
    margin-left: -215px;
    margin-top: 21px;
}
</style>

<script src="./js/jquery-3.6.0.min.js"></script>
<script type='text/javascript' src='http://www.google.com/jsapi'></script>							<!-- 구글 차트 임포트 -->
<script type='text/javascript'>google.load('visualization', '1', {'packages': ['geochart']});		<!-- 가져올 차트타입과 버전정보,차트종류 -->
google.setOnLoadCallback(drawVisualization);														//데이터가 세팅되면 펑션을 호출해 콜백한다.

function drawVisualization() {
	var data = new google.visualization.DataTable();								//데이터를 객체화 한다

	data.addColumn('string', 'Country');											//컬럼 타입과 이름 지정
	data.addColumn('number', 'Value'); 												
	data.addColumn({type:'string', role:'tooltip'});
	
	var ivalue = new Array();
	
	data.addRows([[{v:'KR-11', f:'서울특별시'},0,'#seoul']]);	//1번 컬럼 = 배열로 Country 에 지역코드와 지역이름 삽입, 2번컬럼 = 지정 숫자값 삽입, 3번컬럼 = 해당 컬럼의툴팁
	ivalue['KR-11'] = '서울';							//배열을 만들어서 지역코드에 배경색 삽입
	
	data.addRows([[{v:'KR-26', f:'부산광역시'},1,'#busan']]);
	ivalue['KR-26'] = '부산';
	
	data.addRows([[{v:'KR-27',f:'대구광역시'},2,'#daegu']]);
	ivalue['KR-27'] = '대구';
	
	data.addRows([[{v:'KR-30',f:'대전광역시'},3,'#daejeon']]);
	ivalue['KR-30'] = '대전';
	
	data.addRows([[{v:'KR-29',f:'광주광역시'},4,'#gwangju']]);
	ivalue['KR-29'] = '광주';
	
	data.addRows([[{v:'KR-28',f:'인천광역시'},5,'#incheon']]);
	ivalue['KR-28'] = '인천';
	
	data.addRows([[{v:'KR-31',f:'울산광역시'},6,'#ulsan']]);
	ivalue['KR-31'] = '울산';
	
	data.addRows([[{v:'KR-43',f:'충청북도'},7,'#chungbuk']]);
	ivalue['KR-43'] = '충북';
	
	data.addRows([[{v:'KR-44',f:'충청남도'},8,'#chungnam']]);
	ivalue['KR-44'] = '충남';
	
	data.addRows([[{v:'KR-42',f:'강원도'},9,'#gangwon']]);
	ivalue['KR-42'] = '강원';
	
	data.addRows([[{v:'KR-41',f:'경기도'},10,'#gyeonggi']]);
	ivalue['KR-41'] = '경기';
	
	data.addRows([[{v:'KR-47',f:'경상북도'},11,'#gyeongbuk']]);
	ivalue['KR-47'] = '경북';
	
	data.addRows([[{v:'KR-48',f:'경상남도'},12,'#gyeongnam']]);
	ivalue['KR-48'] = '경남';
	
	data.addRows([[{v:'KR-49',f:'제주도'},13,'#jeju']]);
	ivalue['KR-49'] = '제주';
	
	data.addRows([[{v:'KR-45',f:'전라북도'},14,'#jeonbuk']]);
	ivalue['KR-45'] = '전북';
	
	data.addRows([[{v:'KR-46',f:'전라남도'},15,'#jeonnam']]);
	ivalue['KR-46'] = '전남';

	var options = {
		colorAxis:  {minValue: 0, maxValue: 21,  colors: ['#FFB911','#FFB911','#4089DB','#4089DB','#D2F0FC','#FFB911','#FFB911','#4089DB','#4089DB','#4089DB','#FFB911','#4089DB','#4089DB','#4089DB','#4089DB','#D2F0FC','#9ECAE1','#DEEBF7','#DEEBF7','#DEEBF7','#DEEBF7','#DEEBF7',]},
		//차트 색상 스펙트럼 지정
		legend: 'none',																				//문자스타일 지정
		backgroundColor: {fill:'#FFFFFF',stroke:'#FFFFFF' ,strokeWidth:2 },							//fill = 차트 영역 HTML 색, stroke = 차트 테두리 색, strokeWidth = 테두리 너비
		datalessRegionColor: '#f5f5f5',																//지도 영역이 아닌곳에 칠해지는 색상
		displayMode: 'regions', 																	//차트 영역에 색상 지정 markers는 마커, 'text'-DataTable는 텍스트
		enableRegionInteractivity: 'true', 															//호버 효과
		resolution: 'provinces',																	//지역 분류 기준 (지방별) metros는 도시별
		sizeAxis: {minValue: 1, maxValue:1,minSize:10,  maxSize: 10},								//지역 마커 크기 
		region:'KR', //country code																	//대륙코드 - 한국
		keepAspectRatio: true,																		//지정한 width와 height로 크기가 설정됨
		width:1400,
		height:900,
		tooltip: {textStyle: {color: '#444444'}, trigger:'focus'}									//마우스가 올라갈때 발생하는 이벤트 
	};
	
	var chart = new google.visualization.GeoChart(document.getElementById('visualization')); 		//차트가 그려지는 위치 아이디 값으로 받음
	google.visualization.events.addListener(chart, 'select', function() {							//차트이 이벤트 발생 (클릭시 발생하는 이벤트)
	 	var selection = chart.getSelection();														//클릭한 차트의 배열 반환
	 	if (selection.length == 1) {																//차트의 배열이 1일시(값이 있는, 대한민국 만) 이벤트발생
	 		var selectedRow = selection[0].row;														//차트의 배열에서 0번째 배열을 가져와서 저장(지역에 기재한 숫자)
	 		var selectedRegion = data.getValue(selectedRow, 0);										//데이터에 0번 벨류값(지역코드) 받음 1 = 지역숫자 2번=확진자
	 		if(ivalue[selectedRegion] != '') {			
	 			var city = $(data.getValue(selectedRow, 2)).text();
	 			var cityArr = city.split(" ");														//클릭시 지역코드가 존재하면 이벤트 발생
	 			document.getElementsByTagName('div')[0]; 											//클릭시 바디태그 0번째 위치한 객체 안에 이벤트 적용 지금은 지역코드에 배열로 들어가있는 색으로 배경색이 바뀜
	 			$("#hi").empty();
	 			$("#hi").css('display','block');
		 		$('#city').children('div').css({'background-color' : 'white', 'color' : 'black'});
		 		$("#hi").append(cityArr[0] + "<br> 누적 확진자 :" + cityArr[1] + "<br> 전일대비 증감 :" +cityArr[2]);
		 		$(data.getValue(selectedRow, 2)).css({'background-color':'black', 'color':'white'}); //document.getElementsById는 아이디값을 받아올 수 있다
		 		
		 	
	 	}																							//document.getElementsByName 은 이름값을 받아올 수 있다.						
	 }																								//document.getElementsByClassName 은 클래스 값을 받아올 수 있다.	
});																									//ByClassName 과 ByTagName 은 배열로 값이 저장된다.										 	
	chart.draw(data, options);		
}

window.onload = function()
{
	LoadData();
}
function LoadData()
{
	var total = 0;																			//시. 군별 총 확진자 변수
	var plus  = 0;																			//시. 군별 전날대비 추가 확진자 변수
	var over  = 0;																			//시. 군별 해외유입 추가 확진자 변수
	var my_total_Array = new Array(19);														//지역별 총 확진자 배열로 받기위한 변수
	var my_plus_Array  = new Array(19);														//전날대비 추가 확진자 배열로 받기위한 변수
	var my_over_Array  = new Array(19);														//전날대비 추가 해외유입 확진자 배열로 받기위한 변수
	
	
	$.ajax({
		type : "post",
		url: "DistrictCovidService.do",														//코로나 19 시.도별 감염현황 API 호출 서블릿
		dataType: "xml",
		success : function(xml) 
		{	
			
			$(xml).find("item").each(function()
			{
				var overflow_Cnt = $(this).find("overFlowCnt").text();						//해외유입 확진자를 XML데이터에서 가져오는 변수					
				var def_Cnt = $(this).find("defCnt").text();								//시 군별 누적 확진자 받아옴
				var incDec = $(this).find("incDec").text();									//시 군별 전날대비 추가 확진자 받아옴
				
				my_total_Array[total] = my_total_Array[total] + def_Cnt;					// 확진자를 배열로 받아 데이터값 저장
				my_plus_Array[plus]   = my_plus_Array[plus]   + incDec;
				my_over_Array[over]   = my_over_Array[over]   + overflow_Cnt;				//해외유입 확진자를 배열로 받아 데이터값 저장
				
				total++;																	// 확진자 배열 값 증가
				plus++;																		//전날대비 추가확진자 배열 값 증가
				over++;																		//해외유입 확진자 배열 값 증가
				
				var total_list 		 = my_total_Array[0]  + my_total_Array[1]				//지역별 총  확진자 저장하는 변수
				+ my_total_Array[2]  + my_total_Array[3]  + my_total_Array[4]
				+ my_total_Array[5]  + my_total_Array[6]  + my_total_Array[7]
				+ my_total_Array[8]  + my_total_Array[9]  + my_total_Array[10]
				+ my_total_Array[11] + my_total_Array[12] + my_total_Array[13]
				+ my_total_Array[14] + my_total_Array[15] + my_total_Array[16]
				+ my_total_Array[17] + my_total_Array[18];
				
				var pluslist 		= my_plus_Array[0]  + my_plus_Array[1]					//지역별 추가  확진자 저장하는 변수
				+ my_plus_Array[2]  + my_plus_Array[3]  + my_plus_Array[4]
				+ my_plus_Array[5]  + my_plus_Array[6]  + my_plus_Array[7]
				+ my_plus_Array[8]  + my_plus_Array[9]  + my_plus_Array[10]
				+ my_plus_Array[11] + my_plus_Array[12] + my_plus_Array[13]
				+ my_plus_Array[14] + my_plus_Array[15] + my_plus_Array[16]
				+ my_plus_Array[17] + my_plus_Array[18];		
			
				var overlist 		= my_over_Array[0]  + my_over_Array[1]					//추가 해외유입 확진자 저장하는 변수
				+ my_over_Array[2]  + my_over_Array[3]  + my_over_Array[4]
				+ my_over_Array[5]  + my_over_Array[6]  + my_over_Array[7]
				+ my_over_Array[8]  + my_over_Array[9]  + my_over_Array[10]
				+ my_over_Array[11] + my_over_Array[12] + my_over_Array[13]
				+ my_over_Array[14] + my_over_Array[15] + my_over_Array[16]
				+ my_over_Array[17] + my_over_Array[18];
				
				var total_array = total_list.split("undefined");							// 확진자를 저장하여 호출시 나오는 문구"undefined" 제거
				var plus_Array  = pluslist.split("undefined");
				var over_Array  = overlist.split("undefined");
				
				lazaretto_Cnt  = total_array[1]											 		//검역과정 발생한 총  확진자 수 
				jeju_total_Cnt = total_array[2];												//제주도 총  확진자 수
				gyeongnam_Cnt  = total_array[3];												//경남  총  확진자 수
				gyeongbuk_Cnt  = total_array[4];												//경북  총  확진자 수
				jeonnam_Cnt    = total_array[5];												//전남  총  확진자 수
				jeonbuk_Cnt    = total_array[6];												//전북  총  확진자 수
				chungnam_Cnt   = total_array[7];												//충남  총  확진자 수
				chungbuk_Cnt   = total_array[8];												//충북  총  확진자 수
				gangwon_Cnt    = total_array[9];												//강원도 총  확진자 수
				gyeonggi_Cnt   = total_array[10];												//경기도 총  확진자 수
				sejong_Cnt     = total_array[11];												//세종시 총  확진자 수
				ulsan_Cnt      = total_array[12];												//울산  총  확진자 수
				daejeon_Cnt    = total_array[13];												//대전  총  확진자 수
				gwangju_Cnt    = total_array[14];												//광주  총  확진자 수
				incheon_Cnt    = total_array[15];												//인천  총  확진자 수
				daegu_Cnt      = total_array[16];												//대구  총  확진자 수
				busan_Cnt      = total_array[17];												//부산  총  확진자 수
				seoul_Cnt      = total_array[18];												//서울  총  확진자 수
				total_Cnt      = total_array[19];												//     총 확진자 수
				
				lazaretto_Cntnum  = parseInt(lazaretto_Cnt,10);
				jeju_total_Cntnum = parseInt(jeju_total_Cnt,10);								//지역별 총 확진자 정수형으로 변환
				gyeongnam_Cntnum  = parseInt(gyeongnam_Cnt,10);
				gyeongbuk_Cntnum  = parseInt(gyeongbuk_Cnt,10);
				jeonnam_Cntnum    = parseInt(jeonnam_Cnt,10);
				jeonbuk_Cntnum    = parseInt(jeonbuk_Cnt,10);
				chungnam_Cntnum   = parseInt(chungnam_Cnt,10);
				chungbuk_Cntnum   = parseInt(chungbuk_Cnt,10);
				gangwon_Cntnum    = parseInt(gangwon_Cnt,10);
				gyeonggi_Cntnum   = parseInt(gyeonggi_Cnt,10);
				sejong_Cntnum     = parseInt(sejong_Cnt,10);
				ulsan_Cntnum      = parseInt(ulsan_Cnt,10);
				daejeon_Cntnum    = parseInt(daejeon_Cnt,10);
				gwangju_Cntnum    = parseInt(gwangju_Cnt,10);
				incheon_Cntnum    = parseInt(incheon_Cnt,10);
				daegu_Cntnum      = parseInt(daegu_Cnt,10);
				busan_Cntnum      = parseInt(busan_Cnt,10);
				seoul_Cntnum      = parseInt(seoul_Cnt,10);
				total_Cntnum      = parseInt(total_Cnt,10);
				
	
				lazaretto_plus_Cnt  = plus_Array[1]												//검역중인 전일대비 확진자 증가치
				jeju_total_plus_Cnt = plus_Array[2];											//제주도 전일대비 확진자 증가치
				gyeongnam_plus_Cnt  = plus_Array[3];											//경남 전일대비 확진자 증가치
				gyeongbuk_plus_Cnt  = plus_Array[4];											//경북 전일대비 확진자 증가치
				jeonnam_plus_Cnt    = plus_Array[5];											//전남 전일대비 확진자 증가치
				jeonbuk_plus_Cnt    = plus_Array[6];											//전북 전일대비 확진자 증가치
				chungnam_plus_Cnt   = plus_Array[7];											//충남 전일대비 확진자 증가치
				chungbuk_plus_Cnt   = plus_Array[8];											//충북 전일대비 확진자 증가치
				gangwon_plus_Cnt    = plus_Array[9];											//강원도 전일대비 확진자 증가치
				gyeonggi_plus_Cnt   = plus_Array[10];											//경기도 전일대비 확진자 증가치
				sejong_plus_Cnt     = plus_Array[11];											//세종시 전일대비 확진자 증가치
				ulsan_plus_Cnt      = plus_Array[12];											//울산 전일대비 확진자 증가치
				daejeon_plus_Cnt    = plus_Array[13];											//대전 전일대비 확진자 증가치
				gwangju_plus_Cnt    = plus_Array[14];											//광주 전일대비 확진자 증가치
				incheon_plus_Cnt    = plus_Array[15];											//인천 전일대비 확진자 증가치
				daegu_plus_Cnt      = plus_Array[16];											//대구 전일대비 확진자 증가치
				busan_plus_Cnt      = plus_Array[17];											//부산 전일대비 확진자 증가치
				seoul_plus_Cnt      = plus_Array[18];											//서울 전일대비 확진자 증가치
				total_plus_Cnt      = plus_Array[19];											//총 전일대비 확진자 증가치
				
				lazaretto_plus_Cntnum  = parseInt(lazaretto_plus_Cnt,10);						//지역별 총 추가확진자 정수형으로 변환
				jeju_total_plus_Cntnum = parseInt(jeju_total_plus_Cnt,10);						
				gyeongnam_plus_Cntnum  = parseInt(gyeongnam_plus_Cnt,10);
				gyeongbuk_plus_Cntnum  = parseInt(gyeongbuk_plus_Cnt,10);
				jeonnam_plus_Cntnum    = parseInt(jeonnam_plus_Cnt,10);
				jeonbuk_plus_Cntnum    = parseInt(jeonbuk_plus_Cnt,10);
				chungnam_plus_Cntnum   = parseInt(chungnam_plus_Cnt,10);
				chungbuk_plus_Cntnum   = parseInt(chungbuk_plus_Cnt,10);
				gangwon_plus_Cntnum    = parseInt(gangwon_plus_Cnt,10);
				gyeonggi_plus_Cntnum   = parseInt(gyeonggi_plus_Cnt,10);
				sejong_plus_Cntnum     = parseInt(sejong_plus_Cnt,10);
				ulsan_plus_Cntnum      = parseInt(ulsan_plus_Cnt,10);
				daejeon_plus_Cntnum    = parseInt(daejeon_plus_Cnt,10);
				gwangju_plus_Cntnum    = parseInt(gwangju_plus_Cnt,10);
				incheon_plus_Cntnum    = parseInt(incheon_plus_Cnt,10);
				daegu_plus_Cntnum 	   = parseInt(daegu_plus_Cnt,10);
				busan_plus_Cntnum 	   = parseInt(busan_plus_Cnt,10);
				seoul_plus_Cntnum 	   = parseInt(seoul_plus_Cnt,10);
				total_plus_Cntnum 	   = parseInt(total_plus_Cnt,10);
				
				lazaretto_over_Cnt = over_Array[1]											    //검역중인  확진자 수 
				jeju_over_Cnt 	   =  over_Array[2];											//제주도 총  확진자 수
				gyeongnam_over_Cnt = over_Array[3];												//경남 총  확진자 수
				gyeongbuk_over_Cnt = over_Array[4];												//경북 총  확진자 수
				jeonnam_over_Cnt   = over_Array[5];												//전남 총  확진자 수
				jeonbuk_over_Cnt   = over_Array[6];												//전북 총  확진자 수
				chungnam_over_Cnt  = over_Array[7];												//충남 총  확진자 수
				chungbuk_over_Cnt  = over_Array[8];												//충북 총  확진자 수
				gangwon_over_Cnt   = over_Array[9];												//강원도 총  확진자 수
				gyeonggi_over_Cnt  = over_Array[10];											//경기도 총  확진자 수
				sejong_over_Cnt    = over_Array[11];											//세종시 총  확진자 수
				ulsan_over_Cnt     = over_Array[12];											//울산 총  확진자 수
				daejeon_over_Cnt   = over_Array[13];											//대전 총  확진자 수
				gwangju_over_Cnt   = over_Array[14];											//광주 총  확진자 수
				incheon_over_Cnt   = over_Array[15];											//인천 총  확진자 수
				daegu_over_Cnt     = over_Array[16];											//대구 총  확진자 수
				busan_over_Cnt     = over_Array[17];											//부산 총  확진자 수
				seoul_over_Cnt     = over_Array[18];											//서울 총  확진자 수
				over_Cnt           = over_Array[19];											//총  확진자 수
				
				lazaretto_over_Cntnum = parseInt(lazaretto_over_Cnt,10);						//지역별 총 추가확진자 정수형으로 변환
				jeju_over_Cntnum  	  = parseInt(jeju_over_Cnt,10);								
				gyeongnam_over_Cntnum = parseInt(gyeongnam_over_Cnt,10);
				gyeongbuk_over_Cntnum = parseInt(gyeongbuk_over_Cnt,10);
				jeonnam_over_Cntnum   = parseInt(jeonnam_over_Cnt,10);
				jeonbuk_over_Cntnum   = parseInt(jeonbuk_over_Cnt,10);
				chungnam_over_Cntnum  = parseInt(chungnam_over_Cnt,10);
				chungbuk_over_Cntnum  = parseInt(chungbuk_over_Cnt,10);
				gangwon_over_Cntnum   = parseInt(gangwon_over_Cnt,10);
				gyeonggi_over_Cntnum  = parseInt(gyeonggi_over_Cnt,10);
				sejong_over_Cntnum    = parseInt(sejong_over_Cnt,10);
				ulsan_over_Cntnum     = parseInt(ulsan_over_Cnt,10);
				daejeon_over_Cntnum   = parseInt(daejeon_over_Cnt,10);
				gwangju_over_Cntnum   = parseInt(gwangju_over_Cnt,10);
				incheon_over_Cntnum   = parseInt(incheon_over_Cnt,10);
				daegu_over_Cntnum     = parseInt(daegu_over_Cnt,10);
				busan_over_Cntnum     = parseInt(busan_over_Cnt,10);
				seoul_over_Cntnum     = parseInt(seoul_over_Cnt,10);
				over_Cntnum 		  = parseInt(over_Cnt,10);
				
				colazaret_Cntnum   = lazaretto_plus_Cntnum  - lazaretto_over_Cntnum;			//국내 발생 확진자 증가치 = 확진자 증가치 - 해외발생 확진자
				cojeju_Cntnum 	   = jeju_total_plus_Cntnum - jeju_over_Cntnum;
				cogyeongnam_Cntnum = gyeongnam_plus_Cntnum  - gyeongnam_over_Cntnum;
				cogyeongbuk_Cntnum = gyeongbuk_plus_Cntnum  - gyeongbuk_over_Cntnum;
				cojeonnam_Cntnum   = jeonnam_plus_Cntnum    - jeonnam_over_Cntnum;
				cojeonbuk_Cntnum   = jeonbuk_plus_Cntnum    - jeonbuk_over_Cntnum;
				cochungnam_Cntnum  = chungnam_plus_Cntnum   - chungnam_over_Cntnum;
				cochungbuk_Cntnum  = chungbuk_plus_Cntnum   - chungbuk_over_Cntnum;
				cogangwon_Cntnum   = gangwon_plus_Cntnum    - gangwon_over_Cntnum;
				cogyeonggi_Cntnum  = gyeonggi_plus_Cntnum   - gyeonggi_over_Cntnum;
				cosejong_Cntnum    = sejong_plus_Cntnum     - sejong_over_Cntnum;
				coulsan_Cntnum     = ulsan_plus_Cntnum      - ulsan_over_Cntnum;
				codaejeon_Cntnum   = daejeon_plus_Cntnum    - daejeon_over_Cntnum;
				cogwangju_Cntnum   = gwangju_plus_Cntnum    - gwangju_over_Cntnum;
				coincheon_Cntnum   = incheon_plus_Cntnum    - incheon_over_Cntnum;
				codaegu_Cntnum     = daegu_plus_Cntnum      - daegu_over_Cntnum;
				cobusan_Cntnum     = busan_plus_Cntnum      - busan_over_Cntnum;
				coseoul_Cntnum     = seoul_plus_Cntnum      - seoul_over_Cntnum;
				co_Cntnum		   = total_plus_Cntnum      - over_Cntnum;
				
				
		//확진자 테이블 컬럼
		html  = "<tr id='trtop'><td id='tdtop' rowspan='2' style='padding:0px;'>시도명</td><td id='tdtop' rowspan='2' style='padding:0px;'>누적 확진환자</td><td id='tdtop2' colspan='3'>전일대비확진자 증감</td></tr>";
		html += "<tr><td id='tdtop' width='60px' style='padding:0px;'>합계</td><td id='tdtop' style='padding:0px;'>국내발생</td><td id='tdtop' style='padding:0px;'>해외유입</td></tr>";
											//누적 확진자						   //전일대비 확진자 증감					  //국내발생 확진자						 //해외유입 확진자
		html += "<tr><td id='tdtop3'style='padding:0px; text-align:center;'>총 확진자</td><td id='tdtop3'>" + total_Cntnum.toLocaleString() +      "</td><td id='tdtop3'>" + total_plus_Cntnum +     "</td><td id='tdtop3'>"  + co_Cntnum +          "</td><td id='tdtop3'>" + over_Cntnum +           "</td></tr>";
		html += "<tr><td  id='tdtop4' style='text-align:center; padding:0px;'>서울</td><td id='tdtop4'>"     + seoul_Cntnum.toLocaleString() +      "</td><td  id='tdtop4'>" + seoul_plus_Cntnum +     "</td><td  id='tdtop4'>"  + coseoul_Cntnum +     "</td><td  id='tdtop4'>" + seoul_over_Cntnum +     "</td></tr>";
		html += "<tr><td id='tdleft'>부산</td><td>"     + busan_Cntnum.toLocaleString() +      "</td><td>" + busan_plus_Cntnum +     "</td><td>"  + cobusan_Cntnum +     "</td><td>" + busan_over_Cntnum +     "</td></tr>";
		html += "<tr><td id='tdleft'>대구</td><td>"     + daegu_Cntnum.toLocaleString() +      "</td><td>" + daegu_plus_Cntnum +     "</td><td>"  + codaegu_Cntnum +     "</td><td>" + daegu_over_Cntnum +     "</td></tr>";
		html += "<tr><td id='tdleft'>인천</td><td>"     + incheon_Cntnum.toLocaleString() +    "</td><td>" + incheon_plus_Cntnum +   "</td><td>"  + coincheon_Cntnum +   "</td><td>" + incheon_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>광주</td><td>"     + gwangju_Cntnum.toLocaleString() +    "</td><td>" + gwangju_plus_Cntnum +   "</td><td>"  + cogwangju_Cntnum +   "</td><td>" + gwangju_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>대전</td><td>"     + daejeon_Cntnum.toLocaleString() +    "</td><td>" + daejeon_plus_Cntnum +   "</td><td>"  + codaejeon_Cntnum +   "</td><td>" + daejeon_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>울산</td><td>"     + ulsan_Cntnum.toLocaleString() +      "</td><td>" + ulsan_plus_Cntnum +     "</td><td>"  + coulsan_Cntnum +     "</td><td>" + ulsan_over_Cntnum +     "</td></tr>";
		html += "<tr><td id='tdleft'>세종</td><td>"     + sejong_Cntnum.toLocaleString() +     "</td><td>" + sejong_plus_Cntnum +    "</td><td>"  + cosejong_Cntnum +    "</td><td>" + sejong_over_Cntnum +    "</td></tr>";
		html += "<tr><td id='tdleft'>경기</td><td>"     + gyeonggi_Cntnum.toLocaleString() +   "</td><td>" + gyeonggi_plus_Cntnum +  "</td><td>"  + cogyeonggi_Cntnum +  "</td><td>" + gyeonggi_over_Cntnum +  "</td></tr>";
		html += "<tr><td id='tdleft'>강원</td><td>"     + gangwon_Cntnum.toLocaleString() +    "</td><td>" + gangwon_plus_Cntnum +   "</td><td>"  + cogangwon_Cntnum +   "</td><td>" + gangwon_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>충북</td><td>"     + chungbuk_Cntnum.toLocaleString() +   "</td><td>" + chungbuk_plus_Cntnum +  "</td><td>"  + cochungbuk_Cntnum +  "</td><td>" + chungbuk_over_Cntnum +  "</td></tr>";
		html += "<tr><td id='tdleft'>충남</td><td>"     + chungnam_Cntnum.toLocaleString() +   "</td><td>" + chungnam_plus_Cntnum +  "</td><td>"  + cochungnam_Cntnum +  "</td><td>" + chungnam_over_Cntnum +  "</td></tr>";
		html += "<tr><td id='tdleft'>전북</td><td>"     + jeonbuk_Cntnum.toLocaleString() +    "</td><td>" + jeonbuk_plus_Cntnum +   "</td><td>"  + cojeonbuk_Cntnum +   "</td><td>" + jeonbuk_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>전남</td><td>"     + jeonnam_Cntnum.toLocaleString() +    "</td><td>" + jeonnam_plus_Cntnum +   "</td><td>"  + cojeonnam_Cntnum +   "</td><td>" + jeonnam_over_Cntnum +   "</td></tr>";
		html += "<tr><td id='tdleft'>경북</td><td>"     + gyeongbuk_Cntnum.toLocaleString() +  "</td><td>" + gyeongbuk_plus_Cntnum +  "</td><td>" + cogyeongbuk_Cntnum + "</td><td>" + gyeongbuk_over_Cntnum + "</td></tr>";
		html += "<tr><td id='tdleft'>경남</td><td>"     + gyeongnam_Cntnum.toLocaleString() +  "</td><td>" + gyeongnam_plus_Cntnum +  "</td><td>" + cogyeongnam_Cntnum + "</td><td>" + gyeongnam_over_Cntnum + "</td></tr>";
		html += "<tr><td id='tdleft'>제주</td><td>"     + jeju_total_Cntnum.toLocaleString() + "</td><td>" + jeju_total_plus_Cntnum + "</td><td>" + cojeju_Cntnum +      "</td><td>" + jeju_over_Cntnum +      "</td></tr>";
		html += "<tr><td id='tdleft'>검역</td><td>"     + lazaretto_Cntnum.toLocaleString() +  "</td><td>" + lazaretto_plus_Cntnum +  "</td><td>" + colazaret_Cntnum +   "</td><td>" + lazaretto_over_Cntnum + "</td></tr>";
		});	
		$("#id").append(html);
		
		//확진자 지도에 그려주는 컬럼
		html = "<br> " + seoul_Cntnum.toLocaleString() +      "<br> (+" + seoul_plus_Cntnum +     ")";     $("#seoul").append(html);
		html = "<br> " + busan_Cntnum.toLocaleString() +      "<br> (+" + busan_plus_Cntnum +     ")";     $("#busan").append(html);
		html = "<br> " + daegu_Cntnum.toLocaleString() +      "<br> (+" + daegu_plus_Cntnum +     ")";     $("#daegu").append(html);
		html = "<br> " + incheon_Cntnum.toLocaleString() +    "<br> (+" + incheon_plus_Cntnum +   ")";   $("#incheon").append(html);
		html = "<br> " + gwangju_Cntnum.toLocaleString() +    "<br> (+" + gwangju_plus_Cntnum +   ")";   $("#gwangju").append(html);
		html = "<br> " + daejeon_Cntnum.toLocaleString() +    "<br> (+" + daejeon_plus_Cntnum +   ")";   $("#daejeon").append(html);
		html = "<br> " + ulsan_Cntnum.toLocaleString() +      "<br> (+" + ulsan_plus_Cntnum +     ")";     $("#ulsan").append(html);
		html = "<br> " + sejong_Cntnum.toLocaleString() +     "<br> (+" + sejong_plus_Cntnum +    ")";    $("#sejong").append(html);
		html = "<br> " + gyeonggi_Cntnum.toLocaleString() +   "<br> (+" + gyeonggi_plus_Cntnum +  ")";  $("#gyeonggi").append(html);
		html = "<br> " + gangwon_Cntnum.toLocaleString() +    "<br> (+" + gangwon_plus_Cntnum +   ")";   $("#gangwon").append(html);
		html = "<br> " + chungbuk_Cntnum.toLocaleString() +   "<br> (+" + chungbuk_plus_Cntnum +  ")";  $("#chungbuk").append(html);
		html = "<br> " + chungnam_Cntnum.toLocaleString() +   "<br> (+" + chungnam_plus_Cntnum +  ")";  $("#chungnam").append(html);
		html = "<br> " + jeonbuk_Cntnum.toLocaleString() +    "<br> (+" + jeonbuk_plus_Cntnum +   ")";   $("#jeonbuk").append(html);
		html = "<br> " + jeonnam_Cntnum.toLocaleString() +    "<br> (+" + jeonnam_plus_Cntnum +   ")";   $("#jeonnam").append(html);
		html = "<br> " + gyeongbuk_Cntnum.toLocaleString() +  "<br> (+" + gyeongbuk_plus_Cntnum + ")"; $("#gyeongbuk").append(html);
		html = "<br> " + gyeongnam_Cntnum.toLocaleString() +  "<br> (+" + gyeongnam_plus_Cntnum + ")"; $("#gyeongnam").append(html);
		html = "<br> " + jeju_total_Cntnum.toLocaleString() + "<br> (+" + jeju_total_plus_Cntnum +")";      $("#jeju").append(html);
		html = "<br> " + lazaretto_Cntnum.toLocaleString() +  "<br> (+" + lazaretto_plus_Cntnum + ")"; $("#lazaretto").append(html);
		}
	});
}

$(document).ready(function(){
	$('#city').children('div').click(function()
	{
		var city2 = $(this).text();
		var city2Arry = $(this).text().split(" ");
		$("#hi").empty();
		$('#city').children('div').css({'background-color' : 'white', 'color' : 'black'});
		$(this).css({'background-color':'black', 'color':'white'});
		$("#hi").append(city2Arry[0] + "<br> 누적 확진자 :" + city2Arry[1] + "<br> 전일대비 증감 :" +city2Arry[2]);
		
	});
	$("#step1").click(function()
	{
		$("#hi").empty();
		$('#city').children('div').css({'background-color':'white', 'color':'black'});
		$("#gwangju").css({'background-color':'black', 'color':'white'});
		$("#jeonnam").css({'background-color':'black', 'color':'white'});
		$("#hi").append("1단계 거리두기<br> 전남, 광주");
	})
	$("#step2").click(function()
	{
		$("#hi").empty();
		$('#city').children('div').css({'background-color':'white', 'color':'black'});
		$("#gangwon").css({'background-color':'black', 'color':'white'});
		$("#chungnam").css({'background-color':'black', 'color':'white'});
		$("#chungbuk").css({'background-color':'black', 'color':'white'});
		$("#sejong").css({'background-color':'black', 'color':'white'});
		$("#daejeon").css({'background-color':'black', 'color':'white'});
		$("#jeonbuk").css({'background-color':'black', 'color':'white'});
		$("#daegu").css({'background-color':'black', 'color':'white'});
		$("#gyeongbuk").css({'background-color':'black', 'color':'white'});
		$("#gyeongnam").css({'background-color':'black', 'color':'white'});
		$("#jeju").css({'background-color':'black', 'color':'white'});
		$("#hi").append("1.5단계 거리두기<br> 강원, 충청, 경상, 대구<br> 전북, 세종, 대전, 제주");
	})
	$("#step3").click(function()
	{
		$("#hi").empty();
		$('#city').children('div').css({'background-color':'white', 'color':'black'});
		$("#seoul").css({'background-color':'black', 'color':'white'});
		$("#incheon").css({'background-color':'black', 'color':'white'});
		$("#gyeonggi").css({'background-color':'black', 'color':'white'});
		$("#ulsan").css({'background-color':'black', 'color':'white'});
		$("#busan").css({'background-color':'black', 'color':'white'});
		$("#hi").append("2단계 거리두기<br> 서울, 경기, 인천<br> 울산, 부산");
	})
});
<%
Date today = new Date();
SimpleDateFormat todayFormat2 = new SimpleDateFormat("YYYY년 MM.dd.");
String date = todayFormat2.format(today);
%>
</script>
<div style="text-align:center; width:100%; height:auto; margin:auto;">
<div class="st_title">
	<div class="fl_l">
			<h3><b>시도별 발생동향</b></h3><br><br><br><br>
            <a href="../Travle/jjmain/main.jsp" style="float:right;">홈페이지 바로가기</a>
        	<a href="CvidTest.jsp">국내 발생 현황 바로가기</a>
        </div>
    </div>
    <div class="timetable">
		<p class="info" style="float:left;"><span><%= date %> 00시</span> 기준</p>
	</div>
	<div id='visualization' Style="display:inline-block; text-align:center; width:100%; height:100%; margin:auto;"></div> 			<!-- geochart가 그려지는 DIV -->
	<div>
		<table id="id" style= "width:80%; text-align:center;margin:auto; margin-bottom:50px; border-collapse : collapse;">		<!-- 시.도별 확진자가 그려지는 테이블 -->
		</table>
	</div>
	<div id="city">
	<!-- geochart 위에 지역확진자를 기입하는 DIV -->
	<div id="seoul"     style="position:absolute; top:440px; left:500px; z-index:0; background:white; text-aligh:center;">서울</div>
	<div id="incheon"   style="position:absolute; top:460px; left:445px; z-index:0; background:white; text-aligh:center;">인천</div>
	<div id="gangwon"   style="position:absolute; top:400px; left:680px; z-index:0; background:white; text-aligh:center;">강원도</div>
	<div id="gyeonggi"  style="position:absolute; top:380px; left:550px; z-index:0; background:white; text-aligh:center;">경기도</div>
	<div id="chungnam"  style="position:absolute; top:580px; left:460px; z-index:0; background:white; text-aligh:center;">충청남도</div>
	<div id="chungbuk"  style="position:absolute; top:530px; left:600px; z-index:0; background:white; text-aligh:center;">충청북도</div>
	<div id="daejeon"   style="position:absolute; top:610px; left:580px; z-index:0; background:white; text-aligh:center;">대전</div>
	<div id="sejong"    style="position:absolute; top:550px; left:540px; z-index:0; background:white; text-aligh:center;">세종</div>
	<div id="gyeongbuk" style="position:absolute; top:570px; left:710px; z-index:0; background:white; text-aligh:center;">경상북도</div>
	<div id="gyeongnam" style="position:absolute; top:750px; left:640px; z-index:0; background:white; text-aligh:center;">경상남도</div>
	<div id="daegu"     style="position:absolute; top:680px; left:680px; z-index:0; background:white; text-aligh:center;">대구</div>
	<div id="jeonbuk"   style="position:absolute; top:680px; left:520px; z-index:0; background:white; text-aligh:center;">전라북도</div>
	<div id="jeonnam"   style="position:absolute; top:810px; left:530px; z-index:0; background:white; text-aligh:center;">전라남도</div>
	<div id="gwangju"   style="position:absolute; top:790px; left:480px; z-index:0; background:white; text-aligh:center;">광주</div>
	<div id="ulsan"     style="position:absolute; top:720px; left:800px; z-index:0; background:white; text-aligh:center;">울산</div>
	<div id="busan"     style="position:absolute; top:790px; left:770px; z-index:0; background:white; text-aligh:center;">부산</div>
	<div id="jeju"      style="position:absolute; top:1050px; left:470px; z-index:0; background:white; text-aligh:center;">제주도</div>
	<div id="lazaretto" style="position:absolute; top:1000px; left:680px; z-index:0; background:white; text-aligh:center;">검역</div>
	</div>
	<div id="hi" style="position:absolute; top:500px; right:350px; text-align:center; border:1px solid black;"></div>
	<div id="hi2" style="position:absolute; top:620px; left:150px; text-align:center;">숫자는 발생한 총 확진자 수<br>()숫자는 전일대비 증감수치</div>
	<div id="step">
	<div id="step1">
		<div style="position:absolute; top:500px; left:150px; z-index:1; float:left;">
			<div style="width:25px; height:25px; background:#D2F0FC; float:left;"></div>
			<div style="float:left;">1단계</div>
		</div>
	</div>
	<div id ="step2">
		<div style="position:absolute; top:540px; left:150px; z-index:1; float:left;">
			<div style="width:25px; height:25px; background:#4089DB; float:left;"></div>
			<div style="float:left;">1.5단계</div>
		</div>
	</div>
	<div id ="step3">
		<div style="position:absolute; top:580px; left:150px; z-index:1; float:left;">
			<div style="width:25px; height:25px; background:#FFB911; float:left;"></div>
			<div style="float:left;">2단계</div>
		</div>
	</div>
</div>
</div>