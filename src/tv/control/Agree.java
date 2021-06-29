package tv.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tv.dto.*;
import tv.vo.*;

@WebServlet("/Agree.do")
public class Agree extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
    public Agree(){super();} 
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		
		int    no 		= Integer.parseInt(request.getParameter("no")); 	//�۹�ȣ
		String nickname = request.getParameter("nick");						//�г���
		String selcet   = request.getParameter("select"); 					//���ƿ�,�Ⱦ��
		
		BoardDto boarddto = new BoardDto();
		System.out.println(nickname + "����");
		System.out.println(no + "����2");
		System.out.println(selcet + "����3");
		if(!nickname.equals("null"))
		{
			if(selcet.equals("good")) { boarddto.good(no, nickname); }  //���ƿ�

			if(selcet.equals("hate")) { boarddto.hate(no, nickname); }  //�Ⱦ��
		}
		else
		{
			response.getWriter().write("ERROR");
			response.getWriter().flush();
			response.getWriter().close();
		}
	}
}
