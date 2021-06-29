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


@WebServlet("/Modify.do")
public class Modify extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
   
    public Modify(){super();}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		HttpSession session = request.getSession(true);
				
		int    no 		 = Integer.parseInt(request.getParameter("no"));
		String pages 	 = request.getParameter("page");
		String k 		 = request.getParameter("k");
		String boardtype = request.getParameter("boardtype");
		
		//보내주기
		String param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;   
		System.out.println(param);
		
		//사용준비
		BoardVo  bvo = new BoardVo();
		BoardDto dto = new BoardDto();
		
		//첨부파일 리스트 사용준비
		FileListDto fdto = new FileListDto();
		
		//첨부파일 리스트를 넣어주자
		FileListVo flist = fdto.GetList(no);
		//갈곳 찾는 변수
		String go = "";
		
		
		//게시판에 맞게 bvo 세팅하기
		if(boardtype.equals("1"))
		{
			bvo = dto.NewsView(no);
			go = "/Travle/jjnotice/notice_modify.jsp";
		}
		if(boardtype.equals("2"))
		{
			bvo = dto.EnjoyView(no);
			go = "/Travle/jjplay/jj_modify.jsp";
		}
		if(boardtype.equals("3"))
		{
			bvo = dto.RoomView(no);
			go = "/Travle/jjinn/hotel_modify.jsp";
		}
		if(boardtype.equals("4"))
		{
			bvo = dto.ComView(no);
			go = "/Travle/jjfree/com_modify.jsp";
		}
		
		session.setAttribute("view", bvo);
		session.setAttribute("flist", flist);
		System.out.println("모디파이 페이지 세팅 완료");
		response.sendRedirect(go + param);
	}
}
