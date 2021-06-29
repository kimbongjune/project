<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<style>
.com_head
{
    text-align: center;
    width: 100%;
    height: auto;
    min-height: 120px;
    margin-bottom: 20px;
    padding-top: 13px;
    padding-bottom: 13px;
    background-position: center;
    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.7em;
    display: inline-block;
    background-color: #F0F0F0;
}


com_body 
{
    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.3em;
}

.com_box 
{
	width: 100%;
    float: left;
    width: 27%;
    border: 1px solid #ddd;
    padding: 2%;
    margin: 0 1% 2% 1%;
    height: auto;
}

hr
{
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 1px; 
  color: black;
}

.com_date
{
	list-style-type:none;
	background-color:#F9F9F9; 
	border: silver 1px solid;
}

.bottomHr
{
 	float: left;
    width: 50%;
    height: 50px;
	background-color:white; 
	margin-left:25%;
}


.com_page1
{
	float: left;
	margin-left:35%;
}

.com_page2
{
	list-style-type:none;
}

.com_page2 li
{
    width: 35px;
    height: 35px;
    font-size: 13px;
    text-color: black;
    text-align: center;
    line-height: 35px;
    color: #999;
    border: 1px solid #ddd;
    cursor: pointer;
    float: left;
    margin: 0 2px;
}
.com_page2 li:hover
{
	background-color:red;
}

a
{	
	color:black;
	text-color:black;
	text-decoration:none;
}

.ab 
{
    border-top: #dbdada solid 1px;
    border-left: #dbdada solid 1px;
    border-bottom: #dbdada solid 1px;
    border-right: #dbdada solid 1px;
    background-color: #fcfcfc;
    padding: 8px 16px;
    box-shadow: inset -1px -1px 1px #fff;
    margin-left: 10px;
    float: right;
    margin-right:25%;
    margin-top:100px;
    margin-bottom: 50px;
}

.ab:hover
{
	cursor:pointer;
}
</style>
</head>
<com_body>
<div class="com_head">
		<h3>자유게시판</h3>
		<h4>말하고, 나누고, 쓰고 싶은 생각을 자유롭게 말해보아요~~~</h4>
		<h5>유저들의 즐겁고, 매너있는 자유게시판을 만들어보아요~~~</h5>
</div>
<div  style="height:50px; width:50%; background-color:white;  margin-left:25%;">
<hr>
</div>
<% 
for(int i=0; i<9; i++){%>
<div style="width:50%; margin-left:25%;">
	<div class="com_box">
		<div class="com_title" style="text-align:center"><a href="">제목입니당</a></div><br>
		<div class="com_text">불측의 바이러스(?) 공격으로인하여 1학기 내내 집에서 온라인 수업만 받아&nbsp;아이들이 좀 쑤시던 참에...</div>
		<div><ul class="com_date"><li>작성자 :  안국성  </li><li>등록일 : 2020-09-02</li><li>조회 :  134  </li></ul></div>
	</div>
</div>
<%}%>

<div class="bottomHr">
<hr>	
</div>
<div class="com_page1">
<ul class="com_page2">
<%for(int i=1; i<=10; i++){%>
<li><a><%=i%></a></li>
<%}%>
</ul>
<br>
<br>
<br>
</div>
<input type="button" class="ab" value="새글쓰기">
<div style="float:left; margin:0px; width:100%; height:20px;"><%@ include file="footer.jsp" %></div>
</com_body>
<%@ include file="footer.jsp" %>