<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tv.dto.*" %>
<%@ page import="tv.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
AdminChart chart = new AdminChart();
ArrayList<Integer> age = chart.agechart();
/* ArrayList<Integer> dbo = chart.chart2(chartvo); */

int gutar = 0;
String charttype = "piechart_3d";
int agearray[] = {0,0,0,0,0,0,0,0,0,0};
for(int i = 0 ; i < age.size() ; i++)
{

	if(age.get(i) >= 90 && age.get(i) <= 99)
	{
		agearray[9]++;
	}
	if(age.get(i) >= 80 && age.get(i) <= 89)
	{
		agearray[8]++;
	}
	if(age.get(i) >= 70 && age.get(i) <= 79)
	{
		agearray[7]++;
	}
	if(age.get(i) >= 60 && age.get(i) <= 69)
	{
		agearray[6]++;
	}
	if(age.get(i) >= 50 && age.get(i) <= 59)
	{
		agearray[5]++;
	}
	if(age.get(i) >= 40 && age.get(i) <= 49)
	{
		agearray[4]++;
	}
	if(age.get(i) >= 30 && age.get(i) <= 39)
	{
		agearray[3]++;
	}
	if(age.get(i) >= 20 && age.get(i) <= 29)
	{
		agearray[2]++;
	}
	if(age.get(i) >= 10 && age.get(i) <= 19)
	{
		agearray[1]++;
	}
	if(age.get(i) >= 0 && age.get(i) <= 9)
	{
		agearray[0]++;
	}

}
%>	
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() 
	{
		var data = google.visualization.arrayToDataTable
		([
			['물음1', 		 '물음2'],
			['90년대생', 		 <%= agearray[9] %>],
			['80년대생', 		 <%= agearray[8] %>],
			['70년대생', 		 <%= agearray[7] %>],
			['60년대생', 		 <%= agearray[6] %>],
			['50년대생', 		 <%= agearray[5] %>],
			['40년대생', 		 <%= agearray[4] %>],
			['30년대생', 		 <%= agearray[3] %>],
			['20년대생', 		 <%= agearray[2] %>],
			['10년대생', 		 <%= agearray[1] %>],
			['00년대생', 		 <%= agearray[0] %>]
		]);
	
		var options = 
		{
			title: 'age',
			is3D: false,
		};
		
		var chart = new google.visualization.PieChart(document.getElementById('<%= charttype %>'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
</body>
</html>