package tv.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tv.dto.BoardDto;
import tv.dto.CheckDto;
import tv.dto.FileListDto;
import tv.util.Config;
import tv.vo.BoardVo;
import tv.vo.FileListVo;
import tv.vo.FileVo;

@WebServlet("/ModifyOk.do")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public ModifyOk(){super();} 

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession(true);
		
		//업로드를 위한 로컬 디렉토리명을 얻는다.
		String uploadPath = Config.getUploadPath();

		//파일업로드는 request가 안받아짐 >>> multi.getParameter 사용

		int no;
		String title	 = request.getParameter("title");
		String body 	 = request.getParameter("body");
		String nickname  = request.getParameter("nickname");
		String addr 	 = request.getParameter("addres");
		String number 	 = request.getParameter("number");
		String boardtype = request.getParameter("boardtype");
		String pages 	 = request.getParameter("page");
		String k 	     = request.getParameter("k");
		if(k == null)	  { k = ""; }
		if(pages == null) { pages = ""; }
		
		int fno0 = 0;
		int fno1 = 0;
		int fno2 = 0;
		
		try
		{
			no = Integer.parseInt(request.getParameter("no"));
		}catch (Exception e) 
		{
			no = 0;
			response.getWriter().write("<script>alert('error');history.back();</script>");	//스크립트 histoty.back() 이전페이지로 돌아가게함
			response.getWriter().flush();	//write 사용후 flush사용 >>>버퍼 되어 아직 기록되지 않은 데이터를 출력 스트림에 모두 출력한다.	
		}
		
		CheckDto ch = new CheckDto();
		
		if(ch.ViewCheck(no,nickname) == false)
		{
			response.getWriter().write("<script>alert('정상적인 경로로 입장해주세요.!');history.back();</script>");	//스크립트 histoty.back() 이전페이지로 돌아가게함
			response.getWriter().flush();	//write 사용후 flush사용 >>>버퍼 되어 아직 기록되지 않은 데이터를 출력 스트림에 모두 출력한다.	
		}
		
		//사용준비
		BoardVo bvo = new BoardVo();
		BoardDto dto = new BoardDto();
		
		//첨부파일 리스트 사용준비
		FileListDto fdto = new FileListDto();
		
		//첨부파일 리스트를 넣어주자
		FileListVo flist = fdto.GetList(no);
		
		//갈곳 찾는 변수
		String go = "";

		//보내주기
		String param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
		
		if(title    != null)	{ bvo.setTitle(title); 		 }
		if(body     != null)	{ bvo.setBody(body);		 }
		if(nickname != null)	{ bvo.setNickname(nickname); }
		if(addr     != null)	{ bvo.setAddress(addr);		 }
		if(number   != null)	{ bvo.setNumber(number);	 }
		if(no       != 0)		{ bvo.setNo(no);			 }
			
		//1.전주소식 2.뭐하지 3.숙소정보 4.자유게시판 5.삭제된글
		
		if(boardtype.equals("1"))
		{
			dto.NewsUpdate(bvo);
			go = "/Travle/jjnotice/notice_view.jsp";
		}
		if(boardtype.equals("2"))
		{
			dto.EnjoyUpdate(bvo);
			go = "/Travle/jjplay/jj_view.jsp";
		}
		if(boardtype.equals("3"))
		{
			dto.RoomUpdate(bvo);
			go = "/Travle/jjinn/hotel_view.jsp";
		}
		if(boardtype.equals("4"))
		{
			dto.ComUpdate(bvo);
			go = "/Travle/jjfree/com_view.jsp";
		}
		
		session.setAttribute("view", bvo);
		session.setAttribute("flist", flist);
		
		response.sendRedirect(go + param);
	}
}
