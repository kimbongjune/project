<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tv.dto.*" %>
<%@ page import="tv.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
AdminChart chart = new AdminChart();
AdminChartVo chartvo = new AdminChartVo();

chartvo.setColumn("gender");
chartvo.setTable("user");
chartvo.Add("남");
chartvo.Add("여");
/* chartvo.setColumn("title");
chartvo.setTable("board");
chartvo.Add("123");
chartvo.Add("테스트"); */

ArrayList<Integer> dbo = chart.chart(chartvo);
/* ArrayList<Integer> dbo = chart.chart2(chartvo); */

int gutar = 0;
String charttype = "piechart_3d";
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
			<%
			if(dbo.size() != 0)
			{
				out.print("['물음1', 		 '물음2'],");			
				for(int i = 0 ; i < dbo.size(); i++)
				{
					
					if(i == dbo.size()-1)
					{
						out.print("['기타'" + "," + dbo.get(i) + "]");
					}else
					{
						out.print("['" + chartvo.Get(i) + "'," + dbo.get(i) + "],");
					}
				}
			}else
			{
				out.print("['물음1', 		 '물음2']");	
			}
			%>
		]);
	
		var options = 
		{
			title: '<%= chartvo.getColumn() %>',
			is3D: true,
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