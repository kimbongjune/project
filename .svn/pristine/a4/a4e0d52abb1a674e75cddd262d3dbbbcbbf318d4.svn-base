<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "여행 게시판"; %> 
<%@ page import="tv.vo.*" %>
<%@ page import="tv.dto.*" %>
<%@ page import="java.util.regex.Matcher.*" %>
<%@ page import="java.util.regex.Pattern.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	ListDto Playdto = new ListDto();
	ListVo Playlist;
	Playdto.setWhere("boardtype='2'");
	Playlist = Playdto.GetPlayList();
	BoardDto playfdto = new BoardDto();
%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../js/javascript.jsp" %>
<%
String total = request.getParameter("total");
TotalSearchDto total_dto = new TotalSearchDto();
TotalSearchDto notice_dto = new TotalSearchDto();
TotalSearchDto play_dto = new TotalSearchDto();
TotalSearchDto hotel_dto = new TotalSearchDto();
TotalSearchDto com_dto = new TotalSearchDto();

ListVo total_list = null;
ListVo notice_list = null;
ListVo play_list = null;;
ListVo hotel_list = null;
ListVo com_list = null;

total_list = (ListVo)session.getAttribute("total");
notice_list = (ListVo)session.getAttribute("notice");
play_list = (ListVo)session.getAttribute("play");
hotel_list = (ListVo)session.getAttribute("hotel");
com_list = (ListVo)session.getAttribute("com");
try
{
	
}catch(Exception e)
{
	System.out.print("에러");
}
if(total_list == null || notice_list == null || play_list == null || hotel_list == null || hotel_list ==null)
{ 
	total_list = total_dto.GettotalList();
	notice_list = notice_dto.GetnoticeList();
	play_list = play_dto.GetplayList();
	hotel_list = hotel_dto.GethotelList();
	com_list = com_dto.GetcomList();
	total = Integer.toString(total_list.getMax());
}
try
{
	view_no = Integer.parseInt(request.getParameter("no"));
}catch(Exception e)
{
	view_no = 0;
}
%>
<%@ include file="../param/viewparam.jsp" %>
<link type="text/css" rel="stylesheet" href="../css/list.css"></link>
<style>

* 
{
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: top;
}

div 
{
    display: block;
}

p 
{
    display: block;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}


h3 
{
    padding: 0;
    font-size: 20px;
    color: #111;
    line-height: 1.3em;
}

    
h2
{
	padding-top : 10px;
}

li 
{
    display: list-item;
    text-align: -webkit-match-parent;
}

ul, ol, dl 
{
    list-style: none;
}
ul {
    list-style-type: disc;
}

a:-webkit-any-link 
{
    color: -webkit-link;
    cursor: pointer;
}

a 
{
    text-decoration: none;
    color: #777;
}
a:link, a:visited 
{
    color: #555;
}
.integration_txt2 
{
    overflow: hidden;
    font-size: 14px;
    background-color: #fff;
    padding: 5px 0 5px 40px;
}
.integration_box 
{
    margin-top: 10px;
    padding: 8px;
    border: 1px solid #e2e2e2;
}
.integration_txt2 li 
{
    display: list-item;
    list-style-type: disc;
    float: left;
    line-height: 26px;
    width: 33%;
}
.result_on 
{
    font-weight: bold;
    color: #da2737;
    font-size: 16px;
}
.Cmenu_Title 
{
    color: #333;
    font-weight: bold;
    padding-bottom: 10px;
    margin-top: 60px;
}
.Cmenu_Title li 
{
    display: inline;
    font-size: 22px;
}
.Cmenu_Title li:nth-child(2) 
{
    font-size: 18px;
    margin-left: 5px;
}
</style>
<script>
	function sub() 
	{
		$("#travelSearchForm").submit();
	}
</script>
<play_body>
<form id="wrdfrm" name="wrfrm" method="post" action="jj_write.jsp">
	<input type="hidden" id="k" name="k" value="<%= k %>">
	<input type="hidden" id="page" name="page" value="<%= pages %>">
	<input type="hidden" id="boardtype" name="boardtype" value="2">
</form>
	
		<!-- 리스트페이지 감싸는 글나오는곳을 감싸는 div -->
		<div id="list_bg" class="info_list_bg">
				<!-- 검색 -->
				<div class="mainWrap">
					<form name="travelSearchForm" id="travelSearchForm" action="../Search.do<%= param %>" method="get">
						<div class="cultureSearch">
							<select id="t" name="t" class="selectBox">
								<option value="1" <% if(t.equals("1")) out.print("selected");%>>제목+내용</option>
								<option value="2" <% if(t.equals("2")) out.print("selected");%>>제목만</option>
								<option value="3" <% if(t.equals("3")) out.print("selected");%>>내용만</option>
								<option value="4" <% if(t.equals("4")) out.print("selected");%>>작성자</option>
							</select>
							<input type="hidden" name="boardtype" id="boardtype" value="2">
							<input type="text" class="cultureBox" name="k" value="<%= k %>" placeholder="찾으시는 음식점이 있습니까?" autofocus>
							<div class="cultureBtn" name="cultureBtn" onclick="sub()" style="border:0;">
							</div>
						</div>
					</form>
				</div>
				<!-- 검색 끝 -->
			</div>
		<div class="con_area"> 
			<div id="#content01">
			<!-- 탑3 를 감싸는 div -->
			<div style="float:right;">
				<%
				if(wrt)
				{
					if(utype.equals("1") || utype.equals("2"))
					{
				%>
						<input type="button" value="글쓰기" onclick="gowrite()" id="btn" class="leftmenu2">
				<%
					}
				}
				if(wrt == false || !(utype.equals("1") || utype.equals("2")))
				{
				%>
					<input type="button" value="글쓰기" onclick="notok()" id="btn" class="leftmenu2">
				<%	
				}
				%>	
			</div>
			<div class="month_best">
				<hr id="jj_listhr1">
				<h3>이달의 <span class="red">추천</span> 업소</h3>
				<h4>전북의 먹거리를 매달 추천해드립니다. 먹거리가 좋으면 여행이 더 즐거워집니다!</h4>
			
				<!-- 탑3 -->
				<div class="month_list">
					<%
					for(int i = 0 ; i < Playlist.Total() ; i++)
					{
						ItemVo item = Playlist.Get(i);
					%>
					<div class="monthWrap">
						<a href="../jjplay/jj_view.jsp?boardtype=2&page=<%= curpage %>&t=<%=t %>&no=<%= item.getNo() %>"><!-- 링크 넣을곳  -->
						<% String body = item.getBody().replace("\""," ' ");
						if (body.indexOf("<img") != -1) 
						{
							String temp = body.substring(body.indexOf("<img"));
						%>
							<!-- 이미지 넣을곳 -->
							<span class="photo_img"><%= temp.substring(temp.indexOf("<img"), (temp.indexOf(">")+1)) %></span>
						<%	
						}
						else
						{
						%>
							<!-- 이미지 넣을곳 -->
							<img src="../image/s.png" class="photo_img">
						<%
						}
						%>
						</a>
						<p><br><!-- 동넣을곳 --><span class="stay_cate"><%= item.getNickname() %></span><!-- 숙박인지 먹는곳인지 -->
							<a href="jj_view.jsp?boardtype=2&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>"><%= item.getTitle() %></a><!-- 제목 -->
							<br>
							<%= item.getReplacebody() %><!-- 좋아요 넣으면 될듯  -->
						</p>
					</div>		
					<%
					}
					%>									
				</div>
				<!-- 탑3끝 -->
			</div>
			<!-- 탑3 감싸는 div끝 -->
			<p class="line"></p><!-- 선긋는 p -->
			
			<!-- 검색값뿌려주는 div -->
			<div class="serchResult" id="serchResult">
				<ul class="result">
					<li>검색결과</li>
					<li>|</li>
					<li>총<span class="result_on"><%= maxrecord %></span>건</li>
					<li class="result_my">					
					</li>
				</ul>
			<ul class="order">
				<%if(order.equals("1")){ %><li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=11" <% if(order.equals("1")){ out.print("class='on'"); }%>>날짜순</a></li><% }else{%>
					<li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=1" <% if(order.equals("11")){ out.print("class='on2'"); }%>>날짜순</a></li><%}%>
				<%if(order.equals("2")){ %><li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=22" <% if(order.equals("2")){ out.print("class='on'"); }%>>인기순</a></li><% }else{%>
					<li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=2" <% if(order.equals("22")){ out.print("class='on2'"); }%>>인기순</a></li><%}%>
				<%if(order.equals("3")){ %><li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=33" <% if(order.equals("3")){ out.print("class='on'"); }%>>가나다순</a></li><% }else{%>
					<li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&order=3" <% if(order.equals("33")){ out.print("class='on2'"); }%>>가나다순</a></li><%}%>
			</ul>
			</div>
			<%if(maxrecord == 0)
				{%>
					<ul class="Cmenu_Title">
						<li>통합검색 결과</li>
						<li>총(<%= total %>)건</li>
					</ul>
					<div class="C_Cts">
						<ul>
							<li class="txt2">
								ㆍ검색결과가 없습니다.<br>
								ㆍ검색어를 다시 한번 확인해주세요.<br>
								ㆍ검색어의 단어 수를 줄이거나, 다른 검색어로 검색해주세요.<br>
							</li>
						</ul>
					</div>
					<div class="integration_box">
						<div class="integration_txt2">
						<ul>							
							<li><a href="../jjsearch/search.jsp?k=<%= k %>">통합검색 결과 <span class="result_on"><%= total %></span> 건</a></li>
							
							<li>
								<a href="../jjnotice/notice_list.jsp?k=<%= k %>">
									공지사항검색 결과 <span class="result_on"><%= notice_list.getMax() %></span> 건
								</a>
							</li>
							
							<li>
								<a href="../jjplay/jj_list.jsp?k=<%= k %>">
									여행정보검색 결과 <span class="result_on"><%= play_list.getMax() %></span> 건
								</a>
							</li>
							
							<li>
								<a href="../jjinn/hotel_list.jsp?k=<%= k %>">
									숙소정보검색 결과 <span class="result_on"><%= hotel_list.getMax() %></span> 건
								</a>
							</li>
							
							<li>
								<a href="../jjfree/com_list.jsp?k=<%= k %>">
									자유게시판검색 결과 <span class="result_on"><%= com_list.getMax() %></span> 건
								</a>
							</li>
						</ul>
						</div><!--integration_txt2-->
					</div>
				<%}%>
			<!-- 검색값뿌려주는 div 끝 -->
			
			<!-- 글리스트 보여주는곳  -->
			<div class="serchList">
				<%
				for(int i = 0 ; i < list.Total() ; i++)
				{
					ItemVo item = list.Get(i);
				%>
				<div class="photoWrap">
					<a href="jj_view.jsp?boardtype=2&t=<%=t %>&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>">
						<% String body = item.getBody().replace("\""," ' ");
						if (body.indexOf("<img") != -1) 
						{
							String temp = body.substring(body.indexOf("<img"));
						%>
							<!-- 이미지 넣을곳 -->
							<span class="photo_img"><%= temp.substring(temp.indexOf("<img"), (temp.indexOf(">")+1)) %></span>
						<%	
						}
						else
						{
						%>
							<!-- 이미지 넣을곳 -->
							<img src="../image/s.png" class="photo_img">
						<%
						}
						%>
					</a>
					<h3>
						<a href="jj_view.jsp?boardtype=2&k=<%= k %>&no=<%= item.getNo() %>&page=<%= curpage %>">
							<span class="jb_area"><%= item.getNickname() %></span>	<!-- 위치 -->
							<%= item.getTitle() %>	<!-- 제목 -->
						</a>
					</h3>
					<ul class="stay_infobox">
						<li><%= item.getReplacebody() %></li><!-- 주소 -->
					</ul>
				</div>
				<%
				}
				%>
			</div>
			<!-- 글리스트 보여주는곳 끝 -->
			
			<!-- 페이징  -->
			<div id="count">
				<ul>
					<li><a href="jj_list.jsp?page=<%=1 %>&t=<%= t %>&k=<%= k %>">&lt;&lt;</a></li><!-- 첫페이지가기 -->
					<%
					if( curpage > 1)
					{
					%>
						<li><a href="jj_list.jsp?type=<%= type %>&page=<%= curpage - 1%>&k=<%= k %>&t=<%= t %>">&lt;</a></li><!-- 앞페이지가기 -->		
					<%
					}else
					{
					
					%>
						<li><a href="javascript:alert('첫 페이지입니다.');">&lt;</a></li><!-- 앞페이지가기 -->
					<%
					}
					for(int i = startpageno; i <= endpageno; i++) 
					{
						if(i == curpage)
						{
						//현재 페이지 빨간색으로 강조할부분
							%>
								<li class="page"><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= i %>"><strong><%= i %></strong></a></li>
							<%
							continue;
						}
					%>
						<li class="page"><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= i %>"><%= i %></a></li>
					<%
					}
					if( curpage < maxpage)
					{
						%><li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= curpage + 1 %>">&gt;</a></li><%
					}else
					{
						//최대페이지를 초과하면 자바스크립트 실행
						%>
						<li><a href="javascript:alert('마지막 페이지입니다.');">&gt;</a></li>
						<%
					}
					%> 	
					<li><a href="jj_list.jsp?t=<%= t %>&k=<%= k %>&page=<%= maxpage%>">&gt;&gt;</a></li>
				</ul>
			</div>
			<!-- 페이징 끝 -->
		</div>
		<!-- 글리스트 감싸는 div 끝  -->
	</div>
	<!-- 전체 div 끝  -->
</play_body>
<%@ include file="../include/footer.jsp" %>