package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tv.dbms.DBManager;
import tv.dto.BoardDto;
import tv.dto.ReplyListDto;
import tv.vo.BoardVo;
import tv.vo.ReplyVo;


@WebServlet("/ReplyWrite.do")
public class ReplyWrite extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
 
    public ReplyWrite(){super();}  
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ReplyVo  vo  = new ReplyVo();
		BoardDto dto = new BoardDto();
		DBManager db = new DBManager();
		
		String sql = "";
		
		int    no    = Integer.parseInt(request.getParameter("no"));
		String id    = request.getParameter("nickname");
		String rbody = request.getParameter("combody");
		
		db.DBOpen();
		sql += "select photo from user where nickname ='" + id + "'";
		db.OpenQuery(sql);
		db.Next();
		
		String photo = db.GetValue("photo");
		System.out.println(photo);
		
		db.CloseQuery();
		db.DBClose();
		
		
		vo.setCombody(rbody);
		vo.setNo(no);
		vo.setNickname(id);
		vo.setPhoto(photo);
		dto.Comment(vo);
	}
}