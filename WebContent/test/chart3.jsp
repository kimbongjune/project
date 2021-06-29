<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tv.dto.*" %>
<%@ page import="tv.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
AdminChartVo vo = new AdminChartVo();
AdminChart chart = new AdminChart();
ArrayList<String[]> arrayTotal1 = chart.hotPlace();
%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', '게시글 수', { role: "annotation" }],
          <%
          for(int i = 0 ; i < arrayTotal1.size(); i++)
  		 {
  			String[] array1 = arrayTotal1.get(i);
  			out.print("['" + array1[0] + "',");
  			out.println(array1[1] + ", '" + array1[0] + "'],");
  		 }
         %>
        ]);
        
        var options = {
        		title: "게시글",
                width: 1920,
                height: 400,
                bar: {groupWidth: "35%"},
                legend: { position: "none" },
                hAxis: {textStyle : {fontSize: 10},
                		title: '행정동' },
                vAxis: {title: '게시글 수(개)'},
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart" style="width: 900px; height: 500px;"></div>
  </body>
</html>