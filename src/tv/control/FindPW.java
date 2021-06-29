package tv.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tv.vo.*;
import tv.dto.*;
import tv.control.*;


@WebServlet("/FindPW.do")
public class FindPW extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
 
    public FindPW(){super();}  

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		
		UserVo   vo  = new UserVo();
		UserDto  dto = new UserDto();
		MailSend ma  = new MailSend();
		vo.setMail(mail);
		vo.setName(name);
		
		vo = dto.ChangePW1(name,mail);
		System.out.println(vo.getMail());
		System.out.println(vo.getName());

		try
		{
			if((vo.getMail().equals(mail) == true && vo.getName().equals(name) == true) || (vo.getName() != null && vo.getMail() != null))
			{
				//난수 생성
				String code = ma.Code();
				System.out.println(code);
				
				//난수로 비밀번호 변경
				dto.ChangePW(code, mail);
				ma.FindPW(mail, code);
			}else
			{
				writer.println("ERROR");					
				writer.close();
			}
		}catch(Exception e)
		{
			writer.println("ERROR");					
			writer.close();
		}
	}
}
