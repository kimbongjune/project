package tv.control;

import java.io.IOException;
import java.net.InetAddress;  //������ �ּҸ� �������µ� ���� Ŭ����

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tv.vo.*;
import tv.dto.*;

@WebServlet("/Login.do")
public class Login extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
    public Login(){super();}  
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		UserVo  vo  = null;
		UserDto dto = new UserDto();
		
		HttpSession session = request.getSession(true);

		if(id == null)
		{
			System.out.println("���̵� ����");
			response.getWriter().write("<script>alert('���̵� / ��й�ȣ�� Ȯ���� �ּ���. 5�� �̻� �α��� ���н� �ش� ���̵�δ� �α����� �Ұ����մϴ�.');history.back();</script>");
			response.getWriter().flush();
			return;
		}
		if(pw == null)
		{
			System.out.println("��й�ȣ ����");
			response.getWriter().write("<script>alert('���̵� / ��й�ȣ�� Ȯ���� �ּ���. 5�� �̻� �α��� ���н� �ش� ���̵�δ� �α����� �Ұ����մϴ�.');history.back();</script>");
			response.getWriter().flush();
			return;
		}
		
		
		dto.Login(id,pw);
		vo = dto.getUser();
		
		if(dto.Login(id, pw))
		{
			System.out.println("id" + id);
			System.out.println("pw" + pw);
			
			//�α��� ����
			if(!(vo.getType().equals("5") || (vo.getType().equals("4"))))
			{
				vo = dto.getUser();
				session.setAttribute("login", vo);
				
				
				if((dto.LoginBlock0(id) >= 5))
				{
					dto.AdminTypeChange2("4", id);
					response.getWriter().write("<script>alert('5�� �̻� �α��� ���з� �ش���̵� ����� �� �����ϴ�. ������� ���ǹٶ��ϴ�.');history.back();</script>");
					response.getWriter().flush();
					session.removeAttribute("login");
					System.out.println("�α��� ����");
					return;
					
				}
				else 
				{
					dto.LoginBlock1(0, id); //�α��� ������ �α��� ���� �ʱ�ȭ��Ŵ
					
					//����ID�� �����´�
					String sID = session.getId();
					//InetAddress Ʋ������ �ν��Ͻ� �� ����
					InetAddress myIP = InetAddress.getLocalHost();
					// getHostAddress() ������� PC�� IP�ּҸ� ���´�.
					String strIPAddress = myIP.getHostAddress();
		
					dto.Session_Ip_Insert(sID, strIPAddress, id);
					
					
					response.getWriter().write("<script>location.href = '/Travle/jjmain/main.jsp'</script>");
					response.getWriter().flush();
					
					System.out.println("���缼�Ǿ��̵�" + sID);
					System.out.println("�������ּ�" + strIPAddress);
					System.out.println("�α��� ����");
					return;
				}
				
			
			}
			if((dto.LoginBlock0(id) >= 5))
			{
				response.getWriter().write("<script>alert('5�� �̻� �α��� ���з� �ش���̵� ����� �� �����ϴ�. ������� ���ǹٶ��ϴ�.');history.back();</script>");
				response.getWriter().flush();
				return;
			}
			else
			{
				//Ż��ȸ������ �α��� �� ��
				response.getWriter().write("<script>alert('����Ҽ� ���� ȸ���Դϴ�');history.back();</script>");
				response.getWriter().flush();
				System.out.println("Ż��ȸ��");
				return;
			}
		}
		else //�α��� ����
		{
			if(dto.LoginBlock0(id) >= 5) //5�� �̻� �α��� �õ� ���н� ����ó��
			{
				dto.AdminTypeChange2("4", id);
				response.getWriter().write("<script>alert('5�� �̻� �α��� ���з� �ش���̵� ����� �� �����ϴ�. ������� ���ǹٶ��ϴ�.');history.back();</script>");
				response.getWriter().flush();
			}
			else 
			{
				dto.LoginBlock1(dto.LoginBlock0(id)+1, id);
				response.getWriter().write("<script>alert('���̵� / ��й�ȣ�� Ȯ���� �ּ���. 5�� �̻� �α��� ���н� �ش� ���̵�δ� �α����� �Ұ����մϴ�.');history.back();</script>");
				response.getWriter().flush();
				System.out.println("�α��� ����");
			}
			return;
		}
	}

}