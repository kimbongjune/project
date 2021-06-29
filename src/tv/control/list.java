package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tv.dto.BoardDto;
import tv.vo.BoardVo;
import tv.vo.ReplyVo;
import tv.dto.ListDto;


@WebServlet("/list.do")
public class list extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
    public list(){super();}  
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BoardVo boardvo = new BoardVo();
		
		try
		{
			boardvo.setBoardtype(Integer.parseInt(request.getParameter("boardtype")));
			
			if(boardvo.getBoardtype() == 1) { response.sendRedirect("../Travle/jjnotice/notice_list.jsp?boardtype=1"); }
			if(boardvo.getBoardtype() == 2) { response.sendRedirect("../Travle/jjplay/jj_list.jsp?boardtype=2");	   }
			if(boardvo.getBoardtype() == 3) { response.sendRedirect("../Travle/jjinn/hotel_list.jsp?boardtype=3");	   }
			if(boardvo.getBoardtype() == 4) { response.sendRedirect("../Travle/jjfree/com_list.jsp?boardtype=4");	   }
		}
		catch (Exception e) 
		{
			System.out.println("error");
			response.sendRedirect("error.jsp");
		}

	}
}