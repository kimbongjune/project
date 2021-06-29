package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import java.util.*; 
import java.io.*;
import java.net.URLEncoder;
import com.oreilly.servlet.MultipartRequest; 
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy; 
import tv.vo.*;
import tv.dto.*;
import tv.util.*;


@WebServlet("/Write.do")
public class Write extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
     
	
    public Write(){super();}  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		BoardVo  vo   = new BoardVo();
		BoardDto dto  = new BoardDto();
		
		
		//업로드를 위한 로컬 디렉토리명을 얻는다.
		
		String uploadPath = Config.getUploadPath();

		//업로드가 가능한 최대 파일 크기를 지정한다. 1024 * 1024 == 1메가바이트

	
		
		//파일업로드는 request가 안받아짐 >>> multi.getParameter 사용

		String title 	 = request.getParameter("title");
		String body 	 = request.getParameter("body");
		String nickname  = request.getParameter("nickname");
		String addr 	 = request.getParameter("addres");
		String number    = request.getParameter("number");
		String boardtype = request.getParameter("boardtype");
		String pages 	 = request.getParameter("page");
		String k 		 = request.getParameter("k");
		String param;
		
		if(k        == null) 	 { k     = ""; 				 }
		if(pages    == null)	 { pages = ""; 				 }
		if(title    != null)	 { vo.setTitle(title); 		 }
		if(body     != null)	 { vo.setBody(body); 		 }
		if(nickname != null)     { vo.setNickname(nickname); }
		if(addr     != null) 	 { vo.setAddress(addr); 	 }
		if(number   != null)     { vo.setNumber(number); 	 }
		
		
		
		//1.전주소식 2.뭐하지 3.숙소정보 4.자유게시판 5.삭제된글
		
		if(boardtype.equals("1"))
		{
			dto.NewsWrite(vo);	
			int no = dto.getNo();
			param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
			response.sendRedirect("/Travle/jjnotice/notice_view.jsp" + param);
		}
		
		if(boardtype.equals("2"))
		{
			dto.EnjoyWrite(vo);
			int no = dto.getNo();
			param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
			response.sendRedirect("/Travle/jjplay/jj_view.jsp" + param);
		}
		
		if(boardtype.equals("3"))
		{
			dto.RoomWrite(vo);
			int no = dto.getNo();
			param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
			response.sendRedirect("/Travle/jjinn/hotel_view.jsp" + param);
		}
		
		if(boardtype.equals("4"))
		{
			dto.ComWrite(vo);
			int no = dto.getNo();
			param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
			response.sendRedirect("/Travle/jjfree/com_view.jsp" + param);
		}
	}
}
