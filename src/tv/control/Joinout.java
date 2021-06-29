package tv.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tv.dto.*;

@WebServlet("/Joinout.do")
public class Joinout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
    public Joinout(){super();}  
 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String nickname = request.getParameter("nickname"); 
		
		UserDto dto = new UserDto();
		
		dto.Upgrade("5", nickname);
		
		
		writer.println("<script>alert('회원탈퇴가 완료되었습니다. 메인 페이지로 이동합니다.'); location.href='../../Travle/jjmain/main.jsp';</script>");
		writer.close();
		HttpSession session = request.getSession();
		session.invalidate();  //탈퇴후 세션종료
	}

}
