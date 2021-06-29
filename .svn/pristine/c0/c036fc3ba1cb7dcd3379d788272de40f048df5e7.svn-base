<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ColumnChart1</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
//구글 시각화 API를 로딩하는 메소드
google.charts.load('current', {packages: ['corechart']});

 

// 구글 시각화 API가 로딩이 완료되면,

// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드

// 묶은 세로 막대형 차트 1
function columnChart1(arrayList) 
{
	// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
	
	var dataTable = google.visualization.arrayToDataTable(arrayList);	
	// 옵션객체 준비
	var options = {
	        		title: "게시글",
	                width: 1920,
	                height: 400,
	                bar: {groupWidth: "35%"},
	                legend: { position: "none" },
	                hAxis: {textStyle : {fontSize: 10},
	                		title: '행정동' },
	                vAxis: {textStyle : {fontSize: 10},
	                		title: '게시글 수(개)'},
	        };
	// 차트를 그릴 영역인 div 객체를 가져옴
	var objDiv = document.getElementById('column_chart_div1');
	
	// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환	
	var chart = new google.visualization.ColumnChart(objDiv);
	
	// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드	
	chart.draw(dataTable, options);

} // drawColumnChart1()의 끝

 

// 버튼 동작

$(document).ready(function()
		{
	$('#btn').on('click', function(){
	
		$.ajax({
		url:'chartTest.jsp',
		success:function(result)
		{
			columnChart1(result);
		}
	
		});
	
	});

});

</script>
</head>
<body>
<input type="button" id="btn" name="btn" value="게시글">
<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
</body>
</html>