<%@page import="tv.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% String t_name = "행사 정보"; %>
<%@ include file="../include/header.jsp" %>
<!-- 스타일 적용시켜주기 -->
<style type="text/css">
/* 기본스타일  */	
	table{ background-color: #fff; margin-top: 20px; margin-bottom: 20px;}
	
	tr{height: 140px; border-bottom: 0.5px solid gray;}
	td{width: 100px; text-align: right; font-size: 9pt; font-family: D2coding; vertical-align:middle; border-bottom: 0.5px solid gray;}
/* 타이틀 스타일 */
	th#title {font-size: 20pt; font-weight: bold; color: #FFA013; font-family: D2coding; vertical-align:middle;  }
	th#monthBtn { vertical-align:middle; }
	.monthBtn {width:100px; background-color: #F1592A; border: none; color:#fff; padding: 15px 0; text-align: center;
			  text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer; border-radius: 10px; }
	th {border-bottom: 0.5px solid gray;}
	
/* 요일 스타일 */
	td.sunday{ text-align: center; font-weight: bold; color: red; font-family: D2coding; }
	td.saturday{ text-align: center; font-weight: bold; color: blue; font-family: D2coding; }
	td.etcday{ text-align: center; font-weight: bold; color: black; font-family: D2coding; }

/* 날짜 스타일 */
	td.sun{ text-align: right; font-size: 9pt; color: red; font-family: D2coding; vertical-align: top;}
	td.sat{ text-align: right; font-size: 9pt; color: blue; font-family: D2coding; vertical-align: top;}
	td.etc{ text-align: right; font-size: 9pt; color: black; font-family: D2coding; vertical-align: top;}
	
	td.redbefore{ text-align: right; font-size: 12pt; color: red; font-family: D2coding; vertical-align: top;}
	td.before{ text-align: right; font-size: 12pt; color: gray; font-family: D2coding; vertical-align: top;}
	

	.con_area {
	    width: 1120px;
	    margin: 0 auto;
	    padding: 0;
	}
	#mct
	{
	 	width: 100%;
	   	height: auto;
	   	margin: 0 auto;
	   	color: #777;
	   	border-top: 1px solid #e3e3e3;
	}
	
	.etc a:hover, .sun a:hover, .sat a:hover { background-color: #c7c7c7; }
	.newicon { width:12px; height: 12px; }
</style>
<script>
	$(document).ready(function()					
	{
		$.ajax
		({
			type : "post",
			url: "../FestivalService.do",
			dataType: "HTML",
			success : function(data) 
			{	
				
			}
		});		
	})
			
</script>

<%
// 컴퓨터 시스템의 년, 월 받아오기
	Date date = new Date();
	int year = date.getYear() +1900;
	int month = date.getMonth() +1;

	//	오류사항 걸러주기	
	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		
		if(month>=13){
			year++;
			month =1;
		}else if(month <=0){
			year--;
			month =12;
		}
	}catch(Exception e){
		
	}

%>
<!-- 메인 컨테이너 -->
<div id="mct">
	<!-- 여백용 -->
	<div class="con_area">
		<!-- 달력 만들기 -->
		<table width ="100%" align ="center" border ="1" cellpadding="5" cellspacing="20">
			<tr>
		<!-- 이전달 버튼 만들기 -->
				<th id="monthBtn" >
				<%-- <a href ="?year=<%=year%>&month=<%month-1%>">이전 달</a> --%>
				<input type="button" class="monthBtn" value="이전 달" onclick="location.href='?year=<%=year%>&month=<%=month-1%>'">
				</th>
				
		<!-- 제목 만들기 -->
				<th id = "title" colspan = "5">
				<%=year%>년  <%=month%>월
				</th>
				
		<!-- 다음달 버튼 만들기 -->
				<th id="monthBtn" >
				<%-- <a href ="?year=<%=year%>&month=<%month+1%>">다음 달</a> --%>
				<input type="button" class="monthBtn" value="다음 달" onclick="location.href='?year=<%=year%>&month=<%=month+1%>'">
				
				</th>
			</tr>
		<!-- 요일 표시칸 만들어주기(단, 토,일요일은 색을 다르게 하기위해 구분해주기) -->
			<tr>
				<td class = "sunday">일</td>
				<td class = "etcday">월</td>
				<td class = "etcday">화</td>
				<td class = "etcday">수</td>
				<td class = "etcday">목</td>
				<td class = "etcday">금</td>
				<td class = "saturday">토</td>
			</tr>
			
		<!-- 날짜 집어 넣기 -->
			<tr>
			<%
		//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
				int first = Calendar.weekDay(year, month, 1);
			
		//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
				int start = 0 ;
				start = month ==1? Calendar.lastDay(year-1, 12)- first : Calendar.lastDay(year, month-1)- first;
		
		//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
				for(int i= 1; i<= first; i++){
					if(i==1){
		/* 일요일(빨간색)과 다른날들의 색을 구별주기  */
						out.println("<td class = 'redbefore'>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
					}else{
						out.println("<td class = 'before'>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
						
					}
				}
		
				/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
				for(int i = 1; i <= Calendar.lastDay(year, month); i++)
				{
					String currentdate = "";
					currentdate = String.format("%04d-%02d-%02d", year,month,i);
					
					FestivalListVo festivallist = new FestivalListVo();
					FestivalDto festivalDto = new FestivalDto();
					
					festivallist = festivalDto.selectXml(currentdate);
					/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
					switch(Calendar.weekDay(year, month, i))
					{
						case 0 :
							out.println("<td class ='sun'>" + i +"<br><br>");
							for(int z = 0 ; z < festivallist.Total() ; z ++)
							{
								
								FestivalVo festivalvo = festivallist.Get(z);
								if(!festivalvo.getUrl().equals(" ") )
								{
									out.println("<a href='http://" + festivalvo.getUrl() + "' target='_blank'>");
									out.println("※ <font color='red'>" + festivalvo.getKeyword() + "</font> <img src='../image/newicon.png' class='newicon' /><br><br>");
									out.println("</a>");
								}else
								{
									out.println("※ " + festivalvo.getKeyword() + "<br><br>");
								}
								//out.println(festivalvo.getStartday());
							}
							out.println("</td>");
							break;
						case 6 :
							out.println("<td class ='sat'>" +i +"<br><br>");
							for(int z = 0 ; z < festivallist.Total() ; z ++)
							{
								FestivalVo festivalvo = festivallist.Get(z);
								if(!festivalvo.getUrl().equals(" "))
								{
									out.println("<a href='http://" + festivalvo.getUrl() + "' target='_blank'>");
									out.println("※ <font color='blue'>" + festivalvo.getKeyword() + "</font> <img src='../image/newicon.png' class='newicon' /><br><br>");
									out.println("</a>");
								}else
								{
									out.println("※ " + festivalvo.getKeyword() + "<br><br>");
								}
							}
							out.println("</td>");
							break;
						default :
							out.println("<td class ='etc'>" +i +"<br><br>");
							for(int z = 0 ; z < festivallist.Total() ; z ++)
							{
								FestivalVo festivalvo = festivallist.Get(z);
								if(!festivalvo.getUrl().equals(" "))
								{
									out.println("<a href='http://" + festivalvo.getUrl() + "' target='_blank'>");
									out.println("※ " + festivalvo.getKeyword() + "<img src='../image/newicon.png' class='newicon' /><br><br>");
									out.println("</a>");
								}else
								{
									out.println("※ " + festivalvo.getKeyword() + "<br><br>");
								}
							}
							out.println("</td>");							
							break;
					}
					
					
					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if(Calendar.weekDay(year, month, i) == 6 && i != Calendar.lastDay(year, month))
					{
						out.println("</tr><tr>");			
					}
				}
		
				if(Calendar.weekDay(year, month, Calendar.lastDay(year, month)) !=6)
				{
					for(int i = Calendar.weekDay(year, month, Calendar.lastDay(year, month))+1; i < 7; i++)
					{
						out.println("<td></td>");	
					}
				}
		
			%>
			</tr>
			
		</table>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>