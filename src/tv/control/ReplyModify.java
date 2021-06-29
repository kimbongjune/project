package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tv.dto.BoardDto;
import tv.vo.ReplyVo;


@WebServlet("/ReplyModify.do")
public class ReplyModify extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
 
	
    public ReplyModify(){super();} 
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ReplyVo  vo  = new ReplyVo();
		BoardDto dto = new BoardDto();
		
		int    no    = Integer.parseInt(request.getParameter("no"));
		int    comno = Integer.parseInt(request.getParameter("comno"));
		String id    = request.getParameter("nickname");
		String rbody = request.getParameter("combody");
		
		System.out.print(no);
		System.out.print(comno);
		System.out.print(id);
		System.out.print(rbody);
		
		vo.setCombody(rbody);
		vo.setNo(no);
		vo.setNickname(id);
		vo.setComno(comno);
		dto.ModComment(vo);
		response.getWriter().append(rbody).append(request.getContextPath());
	}
}
