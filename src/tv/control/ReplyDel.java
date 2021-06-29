package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tv.dto.BoardDto;


@WebServlet("/ReplyDel.do")
public class ReplyDel extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
  
    public ReplyDel(){super();} 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int    no 	 = Integer.parseInt(request.getParameter("no"));
		int	   comno = Integer.parseInt(request.getParameter("comno"));
		
		
		//페이지 null일시 1값으로 초기화
		String page  = request.getParameter("pages");
		if(page == null) {page = "1";}
		
		//내용이 null일시 공백으로 초기화
		String k = request.getParameter("k");
		if(k == null)    { k = ""; }
		
		
		String boardtype = request.getParameter("boardtype");
		BoardDto dto = new BoardDto();
		dto.DelComment(no, comno);
		
		response.sendRedirect("/Travle/jjfree/com_view.jsp?no=" +no +"&k="+k+"&page="+page+"&boardtype="+boardtype);
	}
}
