package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tv.vo.*;
import tv.dto.*;


@WebServlet("/View.do")
public class view extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
   
	
    public view(){super();} 
  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		
		BoardVo  boardvo = new BoardVo();
		BoardDto dto     = new BoardDto();
		
		String boardtype = request.getParameter("boardtype");
		int    no        = Integer.parseInt(request.getParameter("no"));
		
		boardvo.setK(request.getParameter("k"));
		boardvo.setPage(request.getParameter("page"));
		
		if(boardtype.equals("1")) { boardvo = dto.NewsView(no); }
		if(boardtype.equals("2")) { boardvo = dto.EnjoyView(no); }
		if(boardtype.equals("3")) { boardvo = dto.RoomView(no); }
		if(boardtype.equals("4")) { boardvo = dto.ComView(no);
									session.setAttribute("board", boardvo);
									response.sendRedirect("../Travle/jjfree/com_view.jsp");	
								  }
	}
}
