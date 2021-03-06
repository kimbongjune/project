<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<% String t_name = "게시글관리 페이지"; %>
<script src="../js/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<link type="text/css" rel="stylesheet" href="../css/list.css"></link>
<link type="text/css" rel="stylesheet" href="../css/sub.css"></link>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	try
	{
		user = (UserVo)session.getAttribute("login");
		utype = user.getType();
		if(!utype.equals("1"))
		{	
			%>
			<script>
				//alert("로그인을 해주세요!");
				//location.href="../jjmain/main.jsp";
			</script>
			<%
		}
	}catch(Exception e)
	{
		%>
		<script>
			//alert("로그인을 해주세요!");
			//location.href="../jjmain/main.jsp";
		</script>
		<%
	}
%>
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
	
	var dataTable1 = google.visualization.arrayToDataTable(arrayList);

	// 옵션객체 준비
	var options1 = {
	        		title: "게시글",
	                width: '100%',
	                height: 400,
	                bar: {groupWidth: "35%"},
	                legend: { position: "none" },
	               
	                hAxis: {textStyle : {fontSize: 10},
	                		title: '행정동',
	                		minValue: 0,
	                		0:{ ticks: [20, 40, 60, 80,100, 120, 140] },														
	 						1:{ ticks: [20, 40, 60, 80,100, 120, 140] }
	                },
	                		
	                vAxis: {textStyle : {fontSize: 10},
	                		title: '게시글 수(개)',
	                		minValue: 0 },
               		animation: { startup: true,duration:1000, easing: 'linear-' },		
               		legend: { position: 'top' },

                    series: {
                    	0: {type: 'bar', targetAxisIndex:0},
                    	1: {type: 'bar', targetAxisIndex:0},
                    	2: {type: 'line',targetAxisIndex:1}
                   		
                    },
                    
                    isStacked: true
	                		
	        };
	// 차트를 그릴 영역인 div 객체를 가져옴
	var objDiv1 = document.getElementById('column_chart_div1');
	
	// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환	
	var chart1 = new google.visualization.ColumnChart(objDiv1);
	
	// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드	
	chart1.draw(dataTable1, options1);
	
	//클릭이벤트
	/* google.visualization.events.addListener(chart1, 'click', function(e) {
		var match = e.targetID.match(/hAxis#(\d+)#label#(\d+)/);
		if ((match !== null) && (match.length > 0)) {
		     alert('x-axis label -->'+ e.targetID);

		    } else {
		    	alert('not x-axis label -->'+ e.targetID);
		    	alert($("e.targetID").val());
		    }
	}); */
	google.visualization.events.addListener(chart1, 'select', selectHandler);
	function selectHandler() {
		
		var selection = chart1.getSelection();
		var message = '';
		
		for (var i = 0; i < selection.length; i++) 
		{
			var item = selection[i];
			if (item.row != null && item.column != null) 
			{
				var str = dataTable1.getFormattedValue(item.row, item.column);
				var category = dataTable1.getValue(chart1.getSelection()[0].row, 0)
				var type
				
				if (item.column == 1) 
				{
					type = "2";
				} else if(item.column == 2)
				{
					type = "3";
				}else{
					type = "조회수";
				}
				
				message += '{row:' + item.row + ',column:' + item.column;
				message += '} = ' + str + '  The Category is:' + category;
				message += ' it belongs to : ' + type + '\n';
				
			} else if (item.row != null) 
			{
				var str = dataTable1.getFormattedValue(item.row, 0);
				message += '{1row:' + item.row;
				message += ', column:none}; value (col 0) = ' + str;
				message += '  The Category is:' + category + '\n';
				
			} else if (item.column != null)
			{
				var str = dataTable1.getFormattedValue(0, item.column);
				message += '{row:none, column:' + item.column;
				message +=  '}; value (row 0) = ' + str;
				message +=  '  The Category is:' + category + '\n';
			}
		}
			if (message == '') 
			{
				message = 'nothing';
				//alert(message);
				$("#table").empty();
				
			}else
			{
				//alert(message);
				if(type == 2 || type == 3)
				{
					if(type == 2)
					{
						CreateTable(2,category);
					}
					if(type == 3)
					{
						CreateTable(3,category);
					}
				}
				
			}
			
			/* alert('You selected ' + message);
			
			alert(category); */
			//alert(category);
			
		}

} // drawColumnChart1()의 끝


function columnChart2(arrayList) 
{
	// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
	
	var dataTable2 = google.visualization.arrayToDataTable(arrayList);	
	// 옵션객체 준비
	var options2 = {
	        		title: "연령별 통계",
	                width: '100%',
	                height: 400,
	                bar: {groupWidth: "35%"},
	                legend: { position: "none" },
	                hAxis: {textStyle : {fontSize: 10},
	                		animation: { startup: true,
			            	duration:1000,
			            	easing: 'linear-' },
	                		title: '00년생' },
	                vAxis: {textStyle : {fontSize: 10},
	                		title: '사용자(명)'},
               		legend: { position: 'top' },
               		isStacked: true
	        };
	// 차트를 그릴 영역인 div 객체를 가져옴
	var objDiv2 = document.getElementById('column_chart_div2');
	
	// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환	
	var chart2 = new google.visualization.ColumnChart(objDiv2);
	
	// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드	
	chart2.draw(dataTable2, options2);

} 

//차트가 잘작동되는지 확인하는 변수	
var check1 = false;
var check2 = false;

$(document).ready(function(){
	/*0.5초마다 refresh 함수 실행*/
	var refreshIntervalId = setInterval(refresh, 500);
	$( window ).resize(function() {
		//창크기 변화 감지
		check1 = false;
		check2 = false;
		/*0.5초마다 refresh 함수 실행*/
		refreshIntervalId = setInterval(refresh, 500);
		   
		});
	function refresh() 
	{

		if(check1 == false){ReceiveChart1();}
		if(check2 == false){ReceiveChart2();}
		if(check1 == true && check2 == true)
		{
			/*refresh 함수 종료*/
			clearInterval(refreshIntervalId);
		}	
	}
	
	function ReceiveChart1() {
		$.ajax({
			type : "get",
			url:'chartTest.jsp',
			data:'checktype=1',
			dataType: "json",
			success:function(result){
				columnChart1(result);
				check1 = true;
			},
			error:function(request,status,error){
				check1 = false;
			}
		});
	}

	function ReceiveChart2() {
		$.ajax({
			type : "get",
			url:'chartTest.jsp',
			data:'checktype=2',
			dataType: "json",
			success:function(result){
				columnChart2(result);
				check2 = true;
			},
			error:function(request,status,error){
				check2 = false;
			}
		});
	}

});
function CreateTable(str,category)
{
	$.ajax({
		type :"get",
		url:"chartTest3.jsp?str=" + str + "&category=" + category,
		dataType: "html",
		success:function(result){
			//alert("hi");
			$("#table").html(result);
		}
	});
}
</script>
<style>


#mct 
{
 	width: 100%;
   	height: auto;
   	margin: 0 auto;
   	color: #777;
   	border-top: 1px solid #e3e3e3;
}
.con_area 
{
    width: 60%;
    margin: 0 auto;
    padding: 0;
}
.adminbutton
{
    border: solid 0.5px black;
    width: 150px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
.adminsel
{
    border: solid 0.5px black;
    width:90px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
.adminbtn
{
    border: solid 0.5px black;
    width:30px;
    height: 21px;
    background-color: #EFEFEF;
    font-weight: bold;
    color: black;
    margin: 0;
    border-radius: 4px;
    padding-bottom: 2px;
    cursor: pointer;
}
table
{
	vertical-align: middle;
}
tr
{
	vertical-align: middle;
}
th
{
	vertical-align: middle;
}
</style>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
		<!-- 보안 : 클래스 이름,자바스크립트 이름으로 Control 로 임시로 붙였는데 마지막에는 수정해주셈 -->
		<div class="whatMenu">
			사이트 통계
		</div>
		<div class="vertical1">
			<div>
				<!-- 전체게시물 뿌려주는거 확인용 -->
				<%-- <input type="text" value="<%= admin_maxrecord %>" class="button1" id="adminbtn" style="align:center"> --%>
				<input type="button" value="게시글관리" class="button1" id="adminbtn" onClick="location.href='admin.jsp'">
				<input type="button" value="회원관리" class="button2" id="adminbtn" onClick="location.href='admin2.jsp'">
				<input type="button" value="사이트 통계" class="button3" id="adminbtn" onClick="location.href='adminChart.jsp'">	
			</div>
		</div>	
		<div class="vertical2">
		</div>
		</div>
		<div style="width:100%; height:auto">
			<div id="column_chart_div1" style="width:100%; height:auto"></div>
			
			<div id="table" style="width:80%; margin:10%; height:auto;"></div>
			
			<div id="column_chart_div4" style="width:100%; height:auto"></div>
			
			<div id="column_chart_div2" style="width:100%; height:auto"></div>
			<div id="column_chart_div3" style="width:100%; height:auto"></div>	
		</div>
</div>