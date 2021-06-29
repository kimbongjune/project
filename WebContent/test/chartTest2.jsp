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
//���� �ð�ȭ API�� �ε��ϴ� �޼ҵ�
google.charts.load('current', {packages: ['corechart']});

 

// ���� �ð�ȭ API�� �ε��� �Ϸ�Ǹ�,

// ���ڷ� ���޵� �ݹ��Լ��� ���������� ȣ���Ͽ� ��Ʈ�� �׸��� �޼ҵ�

// ���� ���� ������ ��Ʈ 1
function columnChart1(arrayList) 
{
	// �� �����͸� ���� ���������̺� ��ü�� ��ȯ�ϴ� �޼ҵ�
	
	var dataTable = google.visualization.arrayToDataTable(arrayList);	
	// �ɼǰ�ü �غ�
	var options = {
	        		title: "�Խñ�",
	                width: 1920,
	                height: 400,
	                bar: {groupWidth: "35%"},
	                legend: { position: "none" },
	                hAxis: {textStyle : {fontSize: 10},
	                		title: '������' },
	                vAxis: {textStyle : {fontSize: 10},
	                		title: '�Խñ� ��(��)'},
	        };
	// ��Ʈ�� �׸� ������ div ��ü�� ������
	var objDiv = document.getElementById('column_chart_div1');
	
	// ���ڷ� ������ div ��ü�� ������ �÷���Ʈ�� �׸��� �ִ� ��Ʈ��ü�� ��ȯ	
	var chart = new google.visualization.ColumnChart(objDiv);
	
	// ��Ʈ��ü�� ���������̺�� �ɼ� ��ü�� ���ڷ� �����Ͽ� ��Ʈ �׸��� �޼ҵ�	
	chart.draw(dataTable, options);

} // drawColumnChart1()�� ��

 

// ��ư ����

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
<input type="button" id="btn" name="btn" value="�Խñ�">
<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
</body>
</html>