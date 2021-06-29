<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String t_name = "사이트 맵"; %>
<%@ include file="header.jsp" %>

<style>
#main_bg {
    text-align: center;
    width: 100%;
    height: auto;
    min-height: 120px;
    margin-bottom: 20px;
    padding-top: 30px;
    padding-bottom: 13px;
    background-position: center;
    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.7em;
    display: inline-block;
    background-color: #f0f0f0;
}
.guide_main_bg h3 {
    font-weight: bold;
    font-size: 300%;
    color: #454545;
    text-align: center;
    padding: 35px 0 0 0;
    margin: 0px;
}
#content01 {
    width: 100%;
    height: auto;
    margin: 0 auto;
    color: #777;
    border-top: 1px solid #e3e3e3;
}
.con_area {
    width: 1120px;
    margin: 0 auto;
    padding: 0;
}
.sitemap {
    display: inline-block;
    width: 100%;
    margin: 0 auto;
    padding-top: 20px;
}
.sitemap .siteBox {
    width: 30.2%;
    float: left;
    padding: 0 10px;
}
.sitemap .siteBox h4 {
    width: 100%;
    margin: 0 0 10px 0;
    padding: 20px 0 20px 0;
    font-size: 18px;
    text-align: center;
}
.sitemap .siteBox ul {
    width: 100%;
    padding: 0 0 0;
}
.sitemap .siteBox ul .site_t_02 {
    display: block;
    margin-bottom: 5px;
    border: 1px solid #dbdbdb;
    color: #777;
    background: #fff;
}
.sitemap .siteBox ul li ul {
    float: none;
    padding: 10px 0;
}
.sitemap .siteBox ul li ul .site_t_03 {
    width: 85%;
    margin: 0;
    padding: 0 0 5px 25px;
    border: 0;
    font-weight: normal;
    background: url("/images/icon.png") no-repeat 0 0px;
}
.sitemap .siteBox ul ul .site_t_03 {
    width: 85%;
    margin: 0;
    padding: 0 0 5px 25px;
    border: 0;
    font-weight: normal;
    background: url("/images/icon.png") no-repeat 0 0px;
}

.sitemap .siteBox ul li a {
    display: block;
    padding: 12px 0 12px 18px;
    font-size: 15px;
}
.sitemap .siteBox ul li a:link, .sitemap .siteBox ul li a:visited {
    color: #777;
    background: #fff;
}
.jb_1 {
    background: #2b6f82;
    color: #fff;
    padding: 0 3px 0 3px;
}
.jb_2 {
    background: #d45a77;
    color: #fff;
    padding: 0 3px 0 3px;
}
.jb_3 {
    background: #ed8116;
    color: #fff;
    padding: 0 3px 0 3px;
}
a:focus, .sitemap .siteBox ul li a:hover {
    color: #fff;
    background: #6e7781;
}
.sitemap .siteBox ul .site_t_02 {
    display: block;
    margin-bottom: 5px;
    border: 1px solid #dbdbdb;
    color: #777;
    background: #fff;
}
.site_t_02 {
    display: block;
    margin-bottom: 5px;
    border: 1px solid #dbdbdb;
    color: #777;
    background: #fff;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

</style>
<div id="main_bg" class="guide_main_bg">
	<h3>사이트맵</h3>
</div>
<div id="content01">
    <div class="con_area">
        <div class="sitemap">
            <div class="siteBox">
		        <h4 class="site_tit_1 jb_1">여행플러스</h4>
				<ul class="sitemap_list">
					<li class="site_t_02">
						<a href="../jjnotice/notice_list.jsp">여행플러스</a>
					<ul>
						<li class="site_t_03">
							<a href="../jjnotice/notice_list.jsp">공지사항</a>
						</li>
					</ul>
					</li>
					<li class="site_t_02">
						<a href="#">전주소식</a>
					<ul>
						<li class="site_t_03">
							<a href="../jjnotice/Festival.jsp">전주행사정보</a>
						</li>
						<li class="site_t_03">
							<a href="../CvidTest.jsp">전주 코로나 소식</a>
						</li>
					</ul>
					</li>
				</ul>
			</div>
			<div class="siteBox">
		        <h4 class="site_tit_1 jb_2">여행정보</h4>
	            <ul class="sitemap_list">
	            	<li class="site_t_02">
	                	<a href="../jjplay/jj_list.jsp">음식</a>
		                <ul>
		                    <li class="site_t_03">
		                        <a href="../jjplay/jj_list.jsp">음식점</a>
		                    </li>
		                </ul>
	                </li>
	                <li class="site_t_02">
	                	<a href="../jjinn/hotel_list.jsp">숙소</a>
	                    <ul>
	                    	<li class="site_t_03">
	                       		<a href="../jjinn/hotel_list.jsp">숙소정보</a>
	                       	</li>
	                  	</ul>
	               	</li>
	           </ul>
	        </div>
			<div class="siteBox">
				<h4 class="site_tit_1 jb_3">자유게시판</h4>
				<ul class="sitemap_list">
					<li class="site_t_02">
						<a href="../jjfree/com_list.jsp">자유게시판</a>
						<ul>
							<li class="site_t_03">
								<a href="../jjfree/com_list.jsp">자유게시판</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>