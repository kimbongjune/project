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



@WebServlet("/Admin.do")
public class Admin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
	
    public Admin(){super();}  
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		UserDto	udto 		   = 	new UserDto();
		
		String  Ad 			   = 	request.getParameter("Ad");
		String  no 			   = 	request.getParameter("no");
		String  AchangeType	   = 	request.getParameter("AchangeType");
		String  boardtype 	   = 	request.getParameter("boardtype");
		String  nickname 	   = 	request.getParameter("nickname");
		String  admin_listtype = 	request.getParameter("admin_listtype");
		String  pages 		   = 	request.getParameter("page");
		String  k 			   = 	request.getParameter("k");
		String  ordertype      =    request.getParameter("oredertype");
		String  orderby 	   =    request.getParameter("orderby");
		
		if(k == null)				{ k = "";              }
		if(admin_listtype == null)	{ admin_listtype = ""; }
		if(pages == null)			{ pages = "1";         }
		if(ordertype == null)		{ ordertype = "0"; 	   }
		
		String adminAddr = "../Travle/jjadmin/admin.jsp?admin_listtype=";
		String adminAddr2 = "../Travle/jjadmin/admin2.jsp?admin_listtype=";

		if(Ad.equals("0")) //게시물복원
		{
			System.out.println("Ad= " + Ad + "no= " + no + "boardtype= " + boardtype + "ordertype=" + ordertype + "orderby=" + orderby);
			udto.AdminDel2(no);
			response.sendRedirect(adminAddr + admin_listtype + "&k=" + k + "&page=" + pages  + "ordertype=" + ordertype + "orderby=" + orderby);
		}
		if(Ad.equals("1")) //게시물삭제
		{
			System.out.println("Ad= " + Ad + "no= " + no + "boardtype= " + boardtype +"page="+ pages  + "ordertype=" + ordertype + "orderby=" + orderby);
			udto.AdminDel(no);
			response.sendRedirect(adminAddr + admin_listtype + "&k=" + k + "&page=" + pages  + "ordertype=" + ordertype + "orderby=" + orderby);
		}
		
		if(Ad.equals("2")) //유저관리
		{
			System.out.println("nickname = " + nickname + "type= " + AchangeType + "Ad= " + Ad  + "ordertype=" + ordertype + "orderby=" + orderby);
			if(!AchangeType.equals("4"))
			{
				udto.LoginBlock2(nickname);
			}
			udto.AdminTypeChange(AchangeType, nickname);
			response.sendRedirect(adminAddr2 + admin_listtype + "&k=" + k + "&page=" + pages);
		}
		
	}
}