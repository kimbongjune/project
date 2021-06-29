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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tv.vo.*;
import tv.dto.*;
import tv.util.Config;


@WebServlet("/Join.do")
public class Join extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
    public Join(){super();}  

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		UserVo vo = new UserVo();
		UserDto dto = new UserDto();
		
		try
		{
			//baseProjectPath 는 수시로 변경해야함!! xml로 처리해야한다고 함!
			String uploadPath = Config.getUploadPath();
			System.out.print(uploadPath);

			//업로드가 가능한 최대 파일 크기를 지정한다. 1024 * 1024 == 1메가바이트
			int size = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());

			//업로드된 파일명을 얻는다.
			Enumeration files = multi.getFileNames();
			String fileid = (String)files.nextElement();
			String filename = (String)multi.getFilesystemName(fileid);

			//파일업로드는 request가 안받아짐 >>> multi.getParameter 사용
			vo.setNickname	 (multi.getParameter("nickname"));
			vo.setPassword	 (multi.getParameter("password"));
			vo.setMail		 (multi.getParameter("email"));
			vo.setName		 (multi.getParameter("name"));
			vo.setBirth	     (multi.getParameter("birth"));
			vo.setGender	 (multi.getParameter("gender"));
			vo.setPhonenumber(multi.getParameter("phonenumber"));
			
			if(filename == null) { vo.setPhoto("profile.png"); }		//프로필사진 미등록시 기본 프로필이미지 적용
			else 				 { vo.setPhoto(filename);      }
	
			if(dto.CheckMail(vo) == true && dto.CheckNickname(vo) == true)
			{
				System.out.println("회원가입 진행");
				dto.Join(vo);
				writer.println("<script>alert('회원가입을 축하드립니다! 메인 페이지로 이동합니다.'); location.href='../../Travle/jjmain/main.jsp';</script>");
				writer.close();
			}
			else
			{
				if(dto.CheckMail(vo) == false)
				{
					System.out.println("중복된 이메일 입니다. 회원가입 실패");		
					response.getWriter().write("<script>alert('중복된 이메일 입니다.!');history.back();</script>");
					response.getWriter().flush();
				}
				if(dto.CheckNickname(vo) == false)
				{
					System.out.println("중복된 닉네임 입니다. 회원가입 실패");					
					response.getWriter().write("<script>alert('중복된 닉네임 입니다.!');history.back();</script>");	//스크립트 histoty.back() 이전페이지로 돌아가게함
					response.getWriter().flush();	//write 사용후 flush사용 >>>버퍼 되어 아직 기록되지 않은 데이터를 출력 스트림에 모두 출력한다.								
				}
			}	
		}catch (Exception e) 
		{
			System.out.println("error");
			response.sendRedirect("../../Travle/jjmain/main.jsp");
		}
	}

}