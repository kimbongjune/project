<div class="content">
	<% for(int i = 0; i < mainlist.Total(); i++)
	{
		ItemVo item = Mainlist.Get(i); %>
	}
	
	<div class="contentBox" id="contentBox1">
		<a href="../jjplay/jj_view.jsp?boardtype=2&no=<%= item.getNo() %>">
		<% if (Mainfdto.ViewAttach(item.getNo()) != null) 
		{
		%>
		<img src="../include/ViewImage.jsp?f=<%= Mainfdto.ViewAttach(item.getNo()) %>" style="width:100%; height:40%">
		<%
		}else
		{
		%>	
		<img src="../image/mainbanner.jpg" class="test" style="width:100%; height:40%;">
		<%
		}
		%>
		</a>

		<div style="width:100%; height:40%;">

			<br><div><h2><%= item.getTitle() %></h2></div><br>

			<div>

				<%= item.getBody() %>

			</div>

			<span class="goLook1" style="background-color:#EFEFEF; border-radius:20px;">&nbsp;&nbsp;&nbsp;게시글보러가기&nbsp;&nbsp;&nbsp;</span>

		</div>

	</div>

</div>