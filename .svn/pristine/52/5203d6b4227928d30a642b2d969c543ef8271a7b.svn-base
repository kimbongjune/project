<%@page import="tv.util.TextIndex"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tv.vo.*" %>
<% String t_name = "통합검색"; %>
<%@ include file="header.jsp" %>
<% 
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8"); 
%>
<style>
.sub_wrap 
{
    width: 1200px;
    margin: 0 auto;
}
.s_title 
{
    padding: 20px 0 10px;
    margin: 0 0 50px;
    border-bottom: 1px solid #e2e2e2;
}
.s_title h2 
{
    padding: 0 0 10px;
    font-size: 2rem;
    color: #003466;
    font-weight: 500;
}
.sub_search 
{
    padding: 30px 0 40px 0;
    position: relative;
    text-align: center;
    overflow: hidden;
}
.sch_bar 
{
    border: 5px solid #3A3E56;
    display: inline-block;
    padding: 5px 0 5px 12px;
    height: 30px;
    width: 450px;
}
.sch_sel 
{
    border: 1px solid #fff;
    width: 100px;
    margin-top: 7px;
}
.sch_txt 
{
    border: 1px solid #fff;
    font-size: 16px;
    width: 300px;
    height:31px;
}
.sc_btn 
{
    background: #3A3E56;
    color: #fff;
    cursor: pointer;
    width: 20%;
    height: 50px;
    font-size: 16px;
    text-align: center;
}
legend
{
    display: none;
    margin: 0;
    padding: 0;
}
fieldset 
{
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
    border-width: 2px;
    border-style: groove;
    border-color: threedface;
    border-image: initial;
    border: none;
    margin: 0 0 20px 0;
    padding: 0;
}
.sch_more 
{
    padding: 20px;
}
.sch_more 
{
    background: #f4f6fb;
    padding: 10px;
    margin: auto;
    width: 100%;
    text-align: center;
}
.sch_more label 
{
    margin: 0 10px 0 3px;
}
.sch_tab 
{
    margin: auto;
}
.basic_tab02 
{
    overflow: hidden;
    width: 100%;
    text-align: center;
}
.basic_tab li, .basic_tab02 li 
{
    width: 20%;
}
.basic_tab02 li:before 
{
    background: url(/images/01_portal/common/icon_bullet.png) no-repeat 4px -116px #cbcbcb;
    width: 18px;
    height: 18px;
    position: absolute;
    top: 14px;
    right: 20px;
    display: inline-block;
    border-radius: 50%;
    content: "";
}
.basic_tab02 li span
{
	cursor:pointer;
    display: block;
    padding: 10px 30px 8px 10px;
    box-sizing: border-box;
    height: 45px;
    font-size: 1.1333rem;
    background: url(/images/01_portal/common/tab02.png) no-repeat right center;
    border-bottom: solid 1px #cbcbcb;
}
.basic_tab02 li 
{
    float: left;
    box-sizing: border-box;
    padding: 4px 10px 0 0;
    position: relative;
}
.basic_tab02 li:hover:before, .basic_tab02 li.on:before 
{
    background-color: #ecaaa7;
}
a, button, submit 
{
    transition: .2s ease-in-out;
}
a
{
	text-decoration: none;
    color: #000;
    border: none;
    margin: 0;
    padding: 0;
}
.sch_con 
{
    overflow: hidden;
}
.sch_result 
{
    padding: 20px;
    margin: 30px 0 20px;
    text-align: center;
    position: relative;
    font-size: 20px;
    font-weight: 500;
}
.sch_result:before 
{
    content: "\00ab";
    padding-right: 20px;
    color: #223e99;
    font-size: 30px;
    vertical-align: middle;
}
.sch_result span 
{
    margin: 0 20px 0 0;
    padding: 0 20px 0 0;
    border-bottom: 0;
    border-right: 1px solid #cdcdcd;
    display: inline-block;
    vertical-align: middle;
}
.sch_result p 
{
	vertical-align: middle;
    display: inline-block;
}
.sch_result:after 
{
    content: "\00bb";
    padding-left: 20px;
    color: #223e99;
    font-size: 30px;
    vertical-align: middle;
}
::selection 
{
    background: #4a5273;
    color: #fff;
    text-shadow: none;
}
.sch_left .sch_col .tit 
{
    padding: 20px;
    margin: 40px 0 20px 0;
    background: #f4f6fb;
}
.sch_left .sch_col .more 
{
    text-align: right;
    margin: 20px 0 50px 0;
}
.sch_conlist li
{
    border-bottom: 1px dotted #dedede;
    padding: 0 0 20px 0;
    margin: 0 0 20px 0;
    font-size: 14px;
    line-height: 1.5em;
}
.sub_wrap a:hover 
{
    text-decoration:underline;
}
.sch_left .sch_col .more a:after 
{
    content: "\2192";
}
.sch_left .sch_col .tit .num strong 
{
    color: #e21207;
    vertical-align: baseline;
}
.fc_red 
{
    color: #d7182a !important;
    vertical-align: baseline;
}
.sc_point 
{
    background: #FFFF33;
    font-style: normal;
    vertical-align: top;
}
.highlight
{
	background: #FFFF33;
    font-style: normal;
}
.highlight2
{
	font-style: normal;
}
li strong, li input[type="checkbox"], li label
{
	vertical-align: middle;
}
</style>
<%
TotalSearchDto total_dto = new TotalSearchDto();
TotalSearchDto notice_dto = new TotalSearchDto();
TotalSearchDto play_dto = new TotalSearchDto();
TotalSearchDto hotel_dto = new TotalSearchDto();
TotalSearchDto com_dto = new TotalSearchDto();
String total = request.getParameter("total");
String searchtype = request.getParameter("t");
String boardtype = request.getParameter("boardtype");
if(searchtype == null)
{
	searchtype = "1";
}
if(boardtype == null)
{
	boardtype = "0";
}
if(type == null)
{
	type = "0";
}
ListVo total_list = null;
ListVo notice_list = null;
ListVo play_list = null;;
ListVo hotel_list = null;
ListVo com_list = null;
TextIndex index = new TextIndex();
index.setK(k);

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
%>

<form id="searchfrm" name="searchfrm" method="post" action="../Search.do">
	<div class="sub_wrap">
		<div class="s_title">
			<h2>통합검색</h2>
		</div>
		<article id="content">
			<div class="sub_search">
				<fieldset>
					<legend>통합검색</legend>
						<span class="sch_bar"> 
							<select class="sch_sel" title="검색항목" id="boardtype" name="boardtype">
								<option value="0" <% if(boardtype.equals("0")) out.print("selected");%>>통합검색</option>
								<option value="1" <% if(boardtype.equals("1")) out.print("selected");%>>공지사항</option>
								<option value="2" <% if(boardtype.equals("2")) out.print("selected");%>>여행</option>
								<option value="3" <% if(boardtype.equals("3")) out.print("selected");%>>숙소</option>
								<option value="4" <% if(boardtype.equals("4")) out.print("selected");%>>자유게시판</option>
							</select>
			 				<input type="text" class="sch_txt" title="검색어" id="k" name="k" autocomplete="off" value=<%=k %>> <!-- 자동검색 -->
						</span> 
						<input type="submit" value="검색" class="sc_btn">
				</fieldset>
				<div class="sch_more">
					<ul>
						<li><strong>검색범위</strong> 
							<input type="checkbox" name="t" id="t1" value="1" class="t" <% if(searchtype.equals("1")) out.print("checked");%>> <label for="sch_sco1">전체</label> 
							<input type="checkbox" name="t" id="t2" value="2" class="t" <% if(searchtype.equals("2")) out.print("checked");%>> <label for="sch_sco2">제목</label>
							<input type="checkbox" name="t" id="t3" value="3" class="t" <% if(searchtype.equals("3")) out.print("checked");%>> <label for="sch_sco3">본문</label> 
							<input type="checkbox" name="t" id="t4" value="4" class="t" <% if(searchtype.equals("4")) out.print("checked");%>> <label for="sch_sco4">작성자</label>
						</li>
					</ul>
				</div>
			</div>
			<div class="basic_tab02 sch_tab">
				<ul>
					<li class="on" id="ttype1"><span>통합검색</span></li>
					<li id="ttype2"><span>공지사항</span></li>
					<li id="ttype3"><span>여행</span></li>
					<li id="ttype4"><span>숙소</span></li>
					<li id="ttype5"><span>자유게시판</span></li>
				</ul>
			</div>
			<div class="sch_con">
				<div class="sch_result">
					<span><% if(boardtype.equals("0")){out.print("통합검색");}
							else if(boardtype.equals("1")){out.print("공지사항 검색");}
							else if(boardtype.equals("2")){out.print("여행 검색");}
							else if(boardtype.equals("3")){out.print("숙소 검색");}
							else if(boardtype.equals("4")){out.print("자유게시판 검색");} %> 결과
					</span>
					<p>
						검색어 <strong class="sc_point"><%= k %></strong>에 대한 총 <strong class="fc_red"><%= total_list.getMax() %>건</strong>의 검색결과를 찾았습니다.
					</p>
				</div>
			<div class="sch_left">
	<%	if(!boardtype.equals("0"))
		{%><%
			if(boardtype.equals("1"))
			{ %>
				<div class="sch_col">
					<div class="tit">
						<h4>공지사항</h4>
						<p class="num">
							검색결과 총 <strong><%= notice_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < notice_list.Total(); i++) 
					{ ItemVo item = notice_list.Get(i);%>
						<li>
							<p>
								<a class="highlight2" href="../jjnotice/notice_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a>
							</p><br>
							<p class="highlight2"><%= index._index(item.getReplacebody()) %></p>
						</li>
						<%} %>
					</ul>
				<p class="more">
					<a href="../jjnotice/notice_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
				</p>
			</div>
			<%} %>
			<% if(boardtype.equals("2"))
			{%>
				<div class="sch_col">
					<div class="tit">
						<h4>여행</h4>
						<p class="num">
							검색결과 총 <strong><%= play_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < play_list.Total(); i++) 
					{ ItemVo item = play_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjplay/jj_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<br><span class="highlight2"><%= index._index(item.getReplacebody()) %></span>
						</li>
						<%} %>
					</ul>
					<p class="more">
						<a href="../jjplay/jj_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
			<%} %>
			<% if(boardtype.equals("3"))
			{%>
				<div class="sch_col">
					<div class="tit">
						<h4>숙소</h4>
						<p class="num">
							검색결과 총 <strong><%= hotel_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < hotel_list.Total(); i++) 
					{ ItemVo item = hotel_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjinn/hotel_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<br><span class="highlight2"><%= index._index(item.getReplacebody()) %></span>
						</li>
					<%} %>
					</ul>
					<p class="more">
						<a href="../jjinn/hotel_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
			<%} %>
			<% if(boardtype.equals("4"))
			{%>
				<div class="sch_col">
					<div class="tit">
						<h4>자유게시판</h4>
						<p class="num">
							검색결과 총 <strong><%= com_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i <com_list.Total(); i++) 
					{ ItemVo item = com_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjfree/com_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<br><span class="highlight2"><%= index._index(item.getReplacebody()) %></span>
						</li>
					<%} %>
					</ul>
					<p class="more">
						<a href="../jjfree/com_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
			<%} %>
		<%}else
			{ %>
				<div class="sch_col">
					<div class="tit">
						<h4>공지사항</h4>
						<p class="num">
							검색결과 총 <strong><%= notice_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < notice_list.Total(); i++) 
					{ ItemVo item = notice_list.Get(i);%>
						<li>
							<p>
								<a class="highlight2" href="../jjnotice/notice_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a>
							</p><br>
							<p class="highlight2"><%= index._index(item.getReplacebody()) %></p>
						</li>
						<%} %>
					</ul>
				<p class="more">
					<a href="../jjnotice/notice_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
				</p>
				</div>
				<div class="sch_col">
					<div class="tit">
						<h4>여행</h4>
						<p class="num">
							검색결과 총 <strong><%= play_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < play_list.Total(); i++) 
					{ ItemVo item = play_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjplay/jj_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<br><span class="highlight2"><%= index._index(item.getReplacebody()) %></span>
						</li>
						<%} %>
					</ul>
					<p class="more">
						<a href="../jjplay/jj_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
				<div class="sch_col">
					<div class="tit">
						<h4>숙소</h4>
						<p class="num">
							검색결과 총 <strong><%= hotel_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i < hotel_list.Total(); i++) 
					{ ItemVo item = hotel_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjinn/hotel_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<br><span class="highlight2"><%= index._index(item.getReplacebody()) %></span>
						</li>
					<%} %>
					</ul>
					<p class="more">
						<a href="../jjinn/hotel_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
				<div class="sch_col">
					<div class="tit">
						<h4>자유게시판</h4>
						<p class="num">
							검색결과 총 <strong><%= com_list.getMax() %></strong>건
						</p>
					</div>
					<ul class="sch_conlist">
					<%for(int i = 0; i <com_list.Total(); i++) 
					{ ItemVo item = com_list.Get(i);%>
						<li><strong><a class="highlight2" href="../jjfree/com_view.jsp?no=<%= item.getNo() %>"><%= item.getTitle() %></a></strong>
							<div class="highlight2"><%= index._index(item.getReplacebody()) %></div>
						</li>
					<%} %>
					</ul>
					<p class="more">
						<a href="../jjfree/com_list.jsp?k=<%= k %>&listtype=<%= searchtype %>">콘텐츠 결과 더보기</a>
					</p>
				</div>
			<%} %>
			</div>
		</div>
	</article>
</div>
</form>
<script>
var search = "<%=k%>";
var boardtype = "<%=boardtype%>";
window.onload = function() 
	{
	    $(".highlight2:contains('"+search+"')").each(function () {
	        var regex = new RegExp(search,'gi');
	        $(this).html( $(this).text().replace(regex, "<span class='highlight'>"+search+"</span>") );
	    });
	    if(boardtype == "0")
   		{
   			$("#ttype1").addClass('on');
   			$("#ttype1").siblings().removeClass("on");
   		}
	    if(boardtype == "1")
   		{
   			$("#ttype2").addClass('on');
   			$("#ttype2").siblings().removeClass("on");
   		}
	    if(boardtype == "2")
   		{
   			$("#ttype3").addClass('on');
   			$("#ttype3").siblings().removeClass("on");
   		}
	    if(boardtype == "3")
   		{
   			$("#ttype4").addClass('on');
   			$("#ttype4").siblings().removeClass("on");
   		}
	    if(boardtype == "4")
   		{
   			$("#ttype5").addClass('on');
   			$("#ttype5").siblings().removeClass("on");
   		}
	}
$(document).ready(function() 
	{
		$("#t1,#t2,#t3,#t4").on("change",function(){
			var currentID = $(this).attr("id");
			if(currentID == "t1")
			{
				if($(this).is(':checked'))
				{ 
					$('#t2').prop('checked',false);
					$('#t3').prop('checked',false);
					$('#t4').prop('checked',false);
				}else
				{
					$('#t1').prop('checked',true);
				}
			}else
			{
				$('#t1').prop('checked',false);
			}
			if(!$("#t1, #t2, #t3, #t4").is(':checked'))
			{
				$('#t1').prop('checked',true);
			}
		});
		$("#ttype1,#ttype2,#ttype3,#ttype4,#ttype5").on("click",function(){
			var typeID = $(this).attr("id");
			var kvalue = $(".sch_txt").val();
			var boardtypevalue = $("#boardtype").val();
			var tvalue = "";
			$(".t").each(function(){
				if($(this).is(":checked")){
					tvalue += $(this).val() + "_";
				}
			});
			var tvalue = tvalue.split("_");
			/* alert(kvalue);
			alert(boardtypevalue);*/
			//alert(tvalue); 
			if(typeID == "ttype1")
			{
				$(this).attr('class', 'on');
				$(this).siblings().removeClass("on");
				var newForm = $('<form></form>');
				newForm.attr("name","searchfrm");
				newForm.attr("method","post");
				newForm.attr("action","../Search.do");
				newForm.append($('<input/>', {type: 'hidden', name: 'k', value: kvalue }));
				newForm.append($('<input/>', {type: 'hidden', name: 'boardtype', value: '0' }));
				newForm.append($('<input/>', {type: 'hidden', name: 't', value: tvalue[0] }));
				newForm.appendTo('body');
				newForm.submit();
			}
			if(typeID == "ttype2")
			{
				$(this).attr('class', 'on');
				$(this).siblings().removeClass("on");
				var newForm = $('<form></form>');
				newForm.attr("name","searchfrm");
				newForm.attr("method","post");
				newForm.attr("action","../Search.do");
				newForm.append($('<input/>', {type: 'hidden', name: 'k', value: kvalue }));
				newForm.append($('<input/>', {type: 'hidden', name: 'boardtype', value: '1' }));
				newForm.append($('<input/>', {type: 'hidden', name: 't', value: tvalue[0] }));
				newForm.appendTo('body');
				newForm.submit();
			}
			if(typeID == "ttype3")
			{
				$(this).attr('class', 'on');
				$(this).siblings().removeClass("on");
				var newForm = $('<form></form>');
				newForm.attr("name","searchfrm");
				newForm.attr("method","post");
				newForm.attr("action","../Search.do");
				newForm.append($('<input/>', {type: 'hidden', name: 'k', value: kvalue }));
				newForm.append($('<input/>', {type: 'hidden', name: 'boardtype', value: '2' }));
				newForm.append($('<input/>', {type: 'hidden', name: 't', value: tvalue[0] }));
				newForm.appendTo('body');
				newForm.submit();
			}
			if(typeID == "ttype4")
			{
				$(this).attr('class', 'on');
				$(this).siblings().removeClass("on");
				var newForm = $('<form></form>');
				newForm.attr("name","searchfrm");
				newForm.attr("method","post");
				newForm.attr("action","../Search.do");
				newForm.append($('<input/>', {type: 'hidden', name: 'k', value: kvalue }));
				newForm.append($('<input/>', {type: 'hidden', name: 'boardtype', value: '3' }));
				newForm.append($('<input/>', {type: 'hidden', name: 't', value: tvalue[0] }));
				newForm.appendTo('body');
				newForm.submit();
			}
			if(typeID == "ttype5")
			{
				$(this).attr('class', 'on');
				$(this).siblings().removeClass("on");
				var newForm = $('<form></form>');
				newForm.attr("name","searchfrm");
				newForm.attr("method","post");
				newForm.attr("action","../Search.do");
				newForm.append($('<input/>', {type: 'hidden', name: 'k', value: kvalue }));
				newForm.append($('<input/>', {type: 'hidden', name: 'boardtype', value: '4' }));
				newForm.append($('<input/>', {type: 'hidden', name: 't', value: tvalue[0] }));
				newForm.appendTo('body');
				newForm.submit();
			}
		});
});
</script>
	<%@ include file="footer.jsp" %>