package tv.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tv.dto.*;

@WebServlet("/Del.do")
public class Del extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
       
   
    public Del(){super();} 
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int    no       = Integer.parseInt(request.getParameter("no"));
		String nickname = request.getParameter("nickname");
		
		BoardDto dto = new BoardDto();
		CheckDto ch  = new CheckDto();
		
		//받은 파라메터의 no와 닉네임을 검사해서 삭제함
		if(ch.ViewCheck(no, nickname))
		{
			if(dto.Del(no)) //삭제 완료시
			{
				response.sendRedirect("/Travle/jjmain/main.jsp");
			}
			else 			//삭제 실패시
			{
				response.getWriter().write("<script>alert('정상적인 경로를 이용해주세요');history.back();</script>");	//스크립트 histoty.back() 이전페이지로 돌아가게함
				response.getWriter().flush();																	//write 사용후 flush사용 >>>버퍼 되어 아직 기록되지 않은 데이터를 출력 스트림에 모두 출력한다.							
			}
		}
		else 				//정삭정인 경로아닐 경우
		{
			response.getWriter().write("<script>alert('정상적인 경로를 이용해주세요');history.back();</script>");		//스크립트 histoty.back() 이전페이지로 돌아가게함
			response.getWriter().flush();																		//write 사용후 flush사용 >>>버퍼 되어 아직 기록되지 않은 데이터를 출력 스트림에 모두 출력한다.		
		}
	}
}
