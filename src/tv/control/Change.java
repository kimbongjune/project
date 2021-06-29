package tv.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tv.dto.UserDto;
import tv.util.Config;
import tv.vo.UserVo;

@WebServlet("/Change.do")
public class Change extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
 
    public Change(){super();}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		UserDto dto = new UserDto();
		UserVo  vo 	= new UserVo();
		
		try
		{
			//baseProjectPath �� ���÷� �����ؾ���!! xml�� ó���ؾ��Ѵٰ� ��!
			
			String uploadPath = Config.getUploadPath();
			

			//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�. 1024 * 1024 == 1�ް�����Ʈ
			int size = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());

			//���ε�� ���ϸ��� ��´�.
			Enumeration files = multi.getFileNames();
			String fileid = (String)files.nextElement();
			String filename = (String)multi.getFilesystemName(fileid);
			
			System.out.println("���ϳ��� : " + filename);
			
			//���Ͼ��ε�� request�� �ȹ޾��� >>> multi.getParameter ���
			
			String nickname 	= multi.getParameter("nickname");
			String password 	= multi.getParameter("password");
			String photo 		= "";
			
			if(filename != null)
			{
				photo = filename;
				dto.Change(nickname, password, photo);
				vo = dto.getUser();		
			}else
			{
				dto.Change(nickname, password);
				vo = dto.getUser();
			}
			
			
			
			HttpSession session = request.getSession(true);
			session.setAttribute("login", vo); 
			
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('ȸ������ ������ �Ϸ� �Ǿ����ϴ�.'); location.href='../../Travle/jjuserinfo/change.jsp';</script>");
			writer.close();
			
		}catch (Exception e) 
		{
			System.out.println("error");
			response.sendRedirect("../../Travle/jjmain/main.jsp");
		}
		
	}

}