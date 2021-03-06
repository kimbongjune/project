package tv.control;

import java.io.IOException;
import java.net.InetAddress;  //아이피 주소를 가져오는데 쓰는 클래스

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
			System.out.println("아이디 없음");
			response.getWriter().write("<script>alert('아이디 / 비밀번호를 확인해 주세요. 5번 이상 로그인 실패시 해당 아이디로는 로그인이 불가능합니다.');history.back();</script>");
			response.getWriter().flush();
			return;
		}
		if(pw == null)
		{
			System.out.println("비밀번호 없음");
			response.getWriter().write("<script>alert('아이디 / 비밀번호를 확인해 주세요. 5번 이상 로그인 실패시 해당 아이디로는 로그인이 불가능합니다.');history.back();</script>");
			response.getWriter().flush();
			return;
		}
		
		
		dto.Login(id,pw);
		vo = dto.getUser();
		
		if(dto.Login(id, pw))
		{
			System.out.println("id" + id);
			System.out.println("pw" + pw);
			
			//로그인 성공
			if(!(vo.getType().equals("5") || (vo.getType().equals("4"))))
			{
				vo = dto.getUser();
				session.setAttribute("login", vo);
				
				
				if((dto.LoginBlock0(id) >= 5))
				{
					dto.AdminTypeChange2("4", id);
					response.getWriter().write("<script>alert('5번 이상 로그인 실패로 해당아이디를 사용할 수 없습니다. 운영진에게 문의바랍니다.');history.back();</script>");
					response.getWriter().flush();
					session.removeAttribute("login");
					System.out.println("로그인 실패");
					return;
					
				}
				else 
				{
					dto.LoginBlock1(0, id); //로그인 성공시 로그인 블락 초기화시킴
					
					//세션ID를 가져온다
					String sID = session.getId();
					//InetAddress 틀래스의 인스턴스 를 생성
					InetAddress myIP = InetAddress.getLocalHost();
					// getHostAddress() 사용중인 PC의 IP주소를 얻어온다.
					String strIPAddress = myIP.getHostAddress();
		
					dto.Session_Ip_Insert(sID, strIPAddress, id);
					
					
					response.getWriter().write("<script>location.href = '/Travle/jjmain/main.jsp'</script>");
					response.getWriter().flush();
					
					System.out.println("현재세션아이디" + sID);
					System.out.println("아이피주소" + strIPAddress);
					System.out.println("로그인 성공");
					return;
				}
				
			
			}
			if((dto.LoginBlock0(id) >= 5))
			{
				response.getWriter().write("<script>alert('5번 이상 로그인 실패로 해당아이디를 사용할 수 없습니다. 운영진에게 문의바랍니다.');history.back();</script>");
				response.getWriter().flush();
				return;
			}
			else
			{
				//탈퇴회원으로 로그인 할 시
				response.getWriter().write("<script>alert('사용할수 없는 회원입니다');history.back();</script>");
				response.getWriter().flush();
				System.out.println("탈퇴회원");
				return;
			}
		}
		else //로그인 실패
		{
			if(dto.LoginBlock0(id) >= 5) //5번 이상 로그인 시도 실패시 블락처리
			{
				dto.AdminTypeChange2("4", id);
				response.getWriter().write("<script>alert('5번 이상 로그인 실패로 해당아이디를 사용할 수 없습니다. 운영진에게 문의바랍니다.');history.back();</script>");
				response.getWriter().flush();
			}
			else 
			{
				dto.LoginBlock1(dto.LoginBlock0(id)+1, id);
				response.getWriter().write("<script>alert('아이디 / 비밀번호를 확인해 주세요. 5번 이상 로그인 실패시 해당 아이디로는 로그인이 불가능합니다.');history.back();</script>");
				response.getWriter().flush();
				System.out.println("로그인 실패");
			}
			return;
		}
	}

}