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
		
		
		//�޾ƿ� �̸�,����ȣ�� dto �޼ҵ� ���� > select�ؼ� vo�� ����
		vo = dto.FindID(name, phonenumber);
		if(vo.getName() != null && vo.getPhonenumber() != null )
		{
			try
			{
				String mail = request.getParameter("mail");
				System.out.println(mail);
				System.out.println("mail �߼� ��");
				
				SendExample sms = new SendExample();
				
				if(vo.getName().equals(name) && vo.getPhonenumber().equals(phonenumber))
				{
					sms.SendSMS(phonenumber, vo.getMail());
					//System.out.print("������ �߼��Ͽ����ϴ�. ������ȣ�� �Է��ϼ���.");
					//System.out.print("OK");
					
				}
				else
				{
					//System.out.print("������ �߼����� ���Ͽ����ϴ�. �ùٸ� �����ּҸ� �Է����ּ���.");
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
