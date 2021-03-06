<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "전주에 빠지다"; %>
<script src="../js/jquery-3.6.0.min.js"></script>
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<%@ include file="../include/header.jsp" %>
<%
ListDto Maindto = new ListDto();
Maindto.setWhere("boardtype='2'");
ListVo Mainlist = Maindto.GetMainList();
BoardDto Mainfdto = new BoardDto();

ListDto Maindto2 = new ListDto();
Maindto.setWhere("boardtype='3'");
ListVo Mainlist2 = Maindto.GetMainList();
BoardDto Mainfdto2 = new BoardDto();
%>
<style>
	#mct 
	{
	 	width: 100%;
    	height: auto;
    	margin: 0 auto;
    	color: #777;
    	border-top: 1px solid #e3e3e3;
	}
	
	*
	{
		margin: auto; 
	}
	
	.mainContainer
	{
		position: relative;
	}
	
	.mainBanner1
	{
		
        background-color: rgba( 0, 0, 0, 0.5 );
		color: white;
		text-align: center;
		font: 나눔고딕;
		font-size: 29px;
		font-width: bold;
		position: absolute;
		top: 35%;	
		left: 35%;
		right: 35%;
		z-index:1;
	}
	
	.mainBanner2
	{
		width: 100%;
		position: relative;
		margin:auto;
		z-index:0;
	}
	
	.bestPlace
	{
		width: 100%;
		text-align: center;
		top: 600px;
	}
	
	.place
	{
		font-size: 30;
		font-width: bold;
		margin-top: 60px;
		margin-bottom: 60px;
	}
	
	.bestInn
	{
		width: 100%;
		text-align: center;
		top: 1300px;
		background-color:#F8F9FA;
		margin-top: 30px;
	}
	
	.inn
	{
		font-size: 30px;
		font-width: bold;
		margin-bottom: 60px;
	}
	
	.content
	{
		height: 500px;
		display: flex;           
   		flex-direction: row;  
   		justify-content: center; 
   		align-items: center;  
	}
	
	.contentBox
	{
		width: 17%;
		height: 85%;
		margin:1%;
		box-shadow: 5px 5px 5px 5px gray;
		position: relative;
		overflow: hidden;
		cursor: pointer;
	}
	
	.contentBox > span > img:hover
	{
		transform: scale(1.1);
		cursor:pointer;
		transition: all 0.3s ease;
	}
	
	.newsTab
	{
		
		width: 100%;
		text-align: center;
		top: 2000px;
	}
	
	.news
	{
		margin-bottom: 60px;
		font-size: 30px;
		font-width: bold;
		
	}
	
	.newsBox
	{
		width: 15%;
		heigh: 10%;
		margin: 25px;
		border: 1px solid black;
		margin-bottom: 150px;
	}
	

	.newsBox:hover
	{
		transform: scale(1.1);
		cursor:pointer;
	}
	
	.ac-sub-go-top
	{
		transition-duration: 3s;
		border-radius: 50px / 50px;
		width: 50px;
		height: 50px;
		bottom:180px;
		position: fixed;
		right: 60px;
		display: inline-block;
		background:#f1f1f1 url(../image/ac-sub-go-top.png) no-repeat 50% 50%;
		text-indent: -9999px;
		border: none;
		background-size: 50%;
		display: none;
		z-index:1;
		cursor: pointer;
	}
	.test > img
	{
		width: 100%;
    	height: 40%;
	}
	
</style>
<script>

$(document).ready(function()					
{
	$(window).scroll(function () 
	{
	     var quickHeight=$(document).scrollTop(); //스크롤 높이가 500 이상이면 나타나기
	     
	     if (150 <= quickHeight )
	     {
	      	$('.ac-sub-go-top').css('display','block');
	     }else 
	     {
	        $('.ac-sub-go-top').css('display','none');
	     }
   	});
	
   $('.ac-sub-go-top').click(function()
   {
		 //위로가기 버튼을 클릭했을때
	     $('html, body').animate
		({
	       scrollTop: '0'
		}, 800);
	});
});
		
$(document).ready(function(){
 	$("#contentBox1").mouseenter(function(){
	    $(".goLook1").css("background-color", "#0069BD"); 
	    $(".goLook1").css("color", "white");
 	});
 	$("#contentBox1").mouseleave(function(){
	    $(".goLook1").css("background-color", "#EFEFEF");
	    $(".goLook1").css("color", "black");
 	});
 	
 	$("#contentBox2").mouseenter(function(){
	    $(".goLook2").css("background-color", "#0069BD"); 
	    $(".goLook2").css("color", "white");
 	});
 	$("#contentBox2").mouseleave(function(){
	    $(".goLook2").css("background-color", "#EFEFEF");
	    $(".goLook2").css("color", "black");
 	});
 	
 	$("#contentBox3").mouseenter(function(){
	    $(".goLook3").css("background-color", "#0069BD"); 
	    $(".goLook3").css("color", "white");
 	});
 	$("#contentBox3").mouseleave(function(){
	    $(".goLook3").css("background-color", "#EFEFEF"); 
	    $(".goLook3").css("color", "black");
 	});
 	
 	$("#contentBox4").mouseenter(function(){
	    $(".goLook4").css("background-color", "#0069BD"); 
	    $(".goLook4").css("color", "white");
 	});
 	$("#contentBox4").mouseleave(function(){
	    $(".goLook4").css("background-color", "#EFEFEF"); 
	    $(".goLook4").css("color", "black");
 	});
 	
	$("#contentBox21").mouseenter(function(){
	    $(".goLook21").css("background-color", "#0069BD"); 
	    $(".goLook21").css("color", "white");
 	});
 	$("#contentBox21").mouseleave(function(){
	    $(".goLook21").css("background-color", "#EFEFEF");
	    $(".goLook21").css("color", "black");
 	});
	$("#contentBox22").mouseenter(function(){
	    $(".goLook22").css("background-color", "#0069BD");
	    $(".goLook22").css("color", "white");
 	});
 	$("#contentBox22").mouseleave(function(){
	    $(".goLook22").css("background-color", "#EFEFEF"); 
	    $(".goLook22").css("color", "black");
 	});
	$("#contentBox23").mouseenter(function(){
	    $(".goLook23").css("background-color", "#0069BD"); 
	    $(".goLook23").css("color", "white");
 	});
 	$("#contentBox23").mouseleave(function(){
	    $(".goLook23").css("background-color", "#EFEFEF");
	    $(".goLook23").css("color", "black");
 	});
	$("#contentBox24").mouseenter(function(){
	    $(".goLook24").css("background-color", "#0069BD"); 
	    $(".goLook24").css("color", "white");
 	});
 	$("#contentBox24").mouseleave(function(){
	    $(".goLook24").css("background-color", "#EFEFEF");
	    $(".goLook24").css("color", "black");
 	});
});

</script>
<div id="mct">
	<div class="mainContainer">
		
		<div class="mainBanner2">
			<img src="../image/mainbanner.jpg" style="width:100%;" />
			<div class="mainBanner1">
				<h4 style="line-height: 1.5em;">전통과 문화가 살아 숨쉬는 전주를<br>소개하는 사이트에 오신 것을 환영합니다!</h4>
			</div>
		</div>
		</div>
		<div class="bestPlace">
			<div class="place">이달의 <font color="#0060BD"><strong>추천장소</strong></font></div>
			<div class="content">
				<% for(int i = 0; i < Mainlist.Total(); i++)
				{
					ItemVo item = Mainlist.Get(i); %>		
				<div class="contentBox" id="contentBox<%= i+1 %>" onclick="location.href='../jjplay/jj_view.jsp?boardtype=2&no=<%= item.getNo() %>'">					
					<% String body = item.getBody().replace("\""," ' ");
						if (body.indexOf("<img") != -1) 
						{
							String temp = body.substring(body.indexOf("<img"));
						%>
							<!-- 이미지 넣을곳 -->
							<span class="test"><%= temp.substring(temp.indexOf("<img"), temp.indexOf(">")) %></span>
						<%	
						}
						else
						{
						%>
							<!-- 이미지 넣을곳 -->
							<img src="../image/s.png" class="test" style="width:100%; height:40%;">
						<%
						}
						%>
					<div style="width:100%; height:50%;" >	
						<br><div><h2><%= item.getTitle() %></h2></div><br>			
						<div>			
							<%= item.getReplacebody() %>			
						</div>			
					</div>		
					<div style="width:100%; height: 100%;">			
						<span id="viewBtn" class="goLook<%= i+1 %>" style="background-color:#EFEFEF; border-radius:20px;">&nbsp;&nbsp;&nbsp;게시글보러가기&nbsp;&nbsp;&nbsp;</span>
					</div>	
				</div>
				<%
				}
				%>
			</div>				
		<div class="bestInn">
			<br><br>
			<div class="inn">이달의 <font color="#FFA628"><strong>추천숙소</strong></font></div>
			<div class="content">
				<% for(int i = 0; i < Mainlist2.Total(); i++)
				{
					ItemVo item = Mainlist2.Get(i); %>			
				<div class="contentBox" id="contentBox2<%= i+1 %>" onclick="location.href='../jjinn/hotel_view.jsp?boardtype=3&no=<%= item.getNo() %>'">	
					<% String body = item.getBody().replace("\""," ' ");
						if (body.indexOf("<img") != -1) 
						{
							String temp = body.substring(body.indexOf("<img"));
						%>
							<!-- 이미지 넣을곳 -->
							<span class="test"><%= temp.substring(temp.indexOf("<img"), temp.indexOf(">")) %></span>
						<%	
						}
						else
						{
						%>
							<!-- 이미지 넣을곳 -->
							<img src="../image/s.png" class="test" style="width:100%; height:40%;">
						<%
						}
						%>
					<div style="width:100%; height: 50%;" >			
						<br><div><h2><%= item.getTitle() %></h2></div><br>			
						<div>			
							<%= item.getReplacebody() %>			
						</div>	
					</div>
					<div style="width:100%; height: 100%;">		
						<span id="viewBtn" class="goLook2<%= i+1 %>" style="background-color:#EFEFEF; border-radius:20px;">&nbsp;&nbsp;&nbsp;게시글보러가기&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<br><br><br><br>	
		</div>
		<div class="newsTab">
			<br><br><br><br><br><br><br><br><br>
			<div class="news"><font color="#EC5124"><strong>전주소식</strong></font></div>
			<div class="newscontent">
				<span><img src="../image/코로나정보.jpg" class="newsBox" onclick="window.location='../CvidTest.jsp'"></span>
				<span><img src="../image/행사정보.jpg" class="newsBox" onclick="window.location='../jjnotice/Festival.jsp'"></span>
				<span><img src="../image/공지사항.jpg" class="newsBox" onclick="window.location='../jjnotice/notice_list.jsp'"></span>
			</div>
			<br><br><br><br><br>	
		</div>
	</div>
</div>
<input type="button" name="button" class="ac-sub-go-top">
<%@ include file="../include/footer.jsp" %>