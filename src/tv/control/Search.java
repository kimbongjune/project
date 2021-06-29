package tv.control;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tv.dto.TotalSearchDto;
import tv.vo.ListVo;


/**
 * Servlet implementation class Search
 */
@WebServlet("/Search.do")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		TotalSearchDto total_dto = new TotalSearchDto();
		TotalSearchDto notice_dto = new TotalSearchDto();
		TotalSearchDto play_dto = new TotalSearchDto();
		TotalSearchDto hotel_dto = new TotalSearchDto();
		TotalSearchDto com_dto = new TotalSearchDto();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String boardtype = request.getParameter("boardtype");
		String k = request.getParameter("k");
		String t = request.getParameter("t");
		int searchvalue = 0;
		if(request.getParameter("searchvalue") != null)
		{
			searchvalue = Integer.parseInt(request.getParameter("searchvalue"));
		}
		searchvalue++;
		System.out.println("�÷��״�" + searchvalue);
		if(t == null)
		{
			t = "1";
		}
		
		total_dto.setBoardtype(boardtype);
		total_dto.setSearch(k);
		total_dto.setType(t);
		
		notice_dto.setBoardtype(boardtype);
		notice_dto.setSearch(k);
		notice_dto.setType(t);
		
		play_dto.setBoardtype(boardtype);
		play_dto.setSearch(k);
		play_dto.setType(t);
		
		hotel_dto.setBoardtype(boardtype);
		hotel_dto.setSearch(k);
		hotel_dto.setType(t);
		
		com_dto.setBoardtype(boardtype);
		com_dto.setSearch(k);
		com_dto.setType(t);
		
		total_dto.GettotalList();
		notice_dto.GetnoticeList();
		play_dto.GetplayList();
		hotel_dto.GethotelList();
		com_dto.GetcomList();
		
		ListVo total_list = total_dto.GettotalList();
		ListVo notice_list = notice_dto.GetnoticeList();
		ListVo play_list = play_dto.GetplayList();
		ListVo hotel_list = hotel_dto.GethotelList();
		ListVo com_list = com_dto.GetcomList();
		
		System.out.println(boardtype);
		System.out.println(k);
		System.out.println(t);
		System.out.println(total_dto.getTotal());
		System.out.println("��Ƽ�� ="+notice_dto.getNoticetotal());
		System.out.println("�÷��� ="+play_dto.getPlaytotal());
		System.out.println("ȣ�� ="+hotel_dto.getHoteltotal());
		System.out.println("���� ="+com_dto.getComtotal());
		
		HttpSession session = request.getSession(true);
		session.setAttribute("total", total_list);
		session.setAttribute("notice", notice_list);
		session.setAttribute("play", play_list);
		session.setAttribute("hotel", hotel_list);
		session.setAttribute("com", com_list);
		
		/*
		 * response.getWriter().
		 * write("<script>alert('����Ҽ� ���� ȸ���Դϴ�');history.back();</script>");
		 * response.getWriter().flush();
		 */
		if(boardtype.equals("0"))
		{
			String kUtf8 = URLEncoder.encode(k, "UTF-8");
			response.sendRedirect("/Travle/jjsearch/search.jsp?total="+total_dto.getTotal()+"&k="+kUtf8 +"&boardtype=" +boardtype +"&t=" + t + "&searchvalue=" + searchvalue);
		}
		if(boardtype.equals("4"))
		{
			String kUtf8 = URLEncoder.encode(k, "UTF-8");
			response.sendRedirect("/Travle/jjfree/com_list.jsp?total="+total_dto.getTotal()+"&k="+kUtf8 +"&boardtype=" +boardtype +"&t=" + t + "&searchvalue=" + searchvalue);
		}
		if(boardtype.equals("3"))
		{
			String kUtf8 = URLEncoder.encode(k, "UTF-8");
			response.sendRedirect("/Travle/jjinn/hotel_list.jsp?total="+total_dto.getTotal()+"&k="+kUtf8 +"&boardtype=" +boardtype +"&t=" + t + "&searchvalue=" + searchvalue);
		}
		if(boardtype.equals("2"))
		{
			String kUtf8 = URLEncoder.encode(k, "UTF-8");
			response.sendRedirect("/Travle/jjplay/jj_list.jsp?total="+total_dto.getTotal()+"&k="+kUtf8 +"&boardtype=" +boardtype +"&t=" + t + "&searchvalue=" + searchvalue);
		}
		if(boardtype.equals("1"))
		{
			String kUtf8 = URLEncoder.encode(k, "UTF-8");
			response.sendRedirect("/Travle/jjnotice/notice_list.jsp?total="+total_dto.getTotal()+"&k="+kUtf8 +"&boardtype=" +boardtype +"&t=" + t + "&searchvalue=" + searchvalue);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}
