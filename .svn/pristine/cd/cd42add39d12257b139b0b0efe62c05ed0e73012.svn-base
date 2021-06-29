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

@WebServlet("/FindID.do")
public class FindID extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       

    public FindID(){super();}  
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		UserDto dto = new UserDto();
		UserVo  vo;
		
		String name = request.getParameter("name");
		String phonenumber = request.getParameter("phonenumber");
		
		
		//받아온 이름,폰번호로 dto 메소드 실행 > select해서 vo에 저장
		vo = dto.FindID(name, phonenumber);
		if(vo.getName() != null && vo.getPhonenumber() != null )
		{
			try
			{
				String mail = request.getParameter("mail");
				System.out.println(mail);
				System.out.println("mail 발송 전");
				
				SendExample sms = new SendExample();
				
				if(vo.getName().equals(name) && vo.getPhonenumber().equals(phonenumber))
				{
					sms.SendSMS(phonenumber, vo.getMail());
					//System.out.print("메일을 발송하였습니다. 인증번호를 입력하세요.");
					//System.out.print("OK");
					
				}
				else
				{
					//System.out.print("메일을 발송하지 못하였습니다. 올바른 메일주소를 입력해주세요.");
					writer.println("ERROR");					
					writer.close();
				}	
			}catch(Exception e){}
		}
		else
		{
			writer.println("ERROR");					
			writer.close();
		}
	}
}
