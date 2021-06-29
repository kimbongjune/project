package tv.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tv.dto.*;


@WebServlet("/SendMail.do")
public class SendMail extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
  
    public SendMail(){super();} 
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		UserDto dto = new UserDto();
		
		try
		{
			String mail = request.getParameter("email");
			System.out.println(mail);
			System.out.println("mail�� : " + mail);
			
			
			MailSend ma = new MailSend();
			if(dto.mailcheck(mail) && ma.send(mail) == true)
			{
				//out.print("������ �߼��Ͽ����ϴ�. ������ȣ�� �Է��ϼ���.");
				//out.print("OK");
				String key = ma.temp.toString();
				response.getWriter().append(key);
				writer.close();
			}
			else
			{
				//�ߺ��̸����ϰ��
				if(dto.mailcheck(mail) == false)
				{
					response.getWriter().append("ERROR2");
					writer.close();
				}else
				{
					//out.print("������ �߼����� ���Ͽ����ϴ�. �ùٸ� �����ּҸ� �Է����ּ���.");
					response.getWriter().append("ERROR");
					writer.close();
				}
			}
		}catch(Exception e){}
	}
}
