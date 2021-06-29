package tv.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tv.dto.FestivalDto;
import tv.util.Festival;
import tv.vo.FestivalListVo;
import tv.vo.FestivalVo;
import tv.vo.FileVo;

/**
 * Servlet implementation class testFestivalService
 */
@WebServlet("/FestivalService.do")
public class FestivalService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		
		Calendar cals = new GregorianCalendar(Locale.KOREA);
		cals.add(Calendar.DATE, -30);
		
		Calendar cale = new GregorianCalendar(Locale.KOREA);
		cale.add(Calendar.DATE, +30);
		
		
		SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd");

		String start_str = todayFormat.format(cals.getTime());
		//System.out.println(start_str);
		
		String end_str = todayFormat.format(cale.getTime());
		//System.out.println(end_str);
		
		Festival festival = new Festival();
		String xml = festival.GetData(start_str, end_str);
		//System.out.println(xml);
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(xml);
		
		
		FestivalListVo listvo = new FestivalListVo(); //행사시작일 리스트
		
		//FestivalListVo listKeyword = new FestivalListVo();	//행사제목 리스트
		//FestivalListVo listUrl = new FestivalListVo();		//url 리스트
		FestivalDto dto = new FestivalDto();
		
		String[] dataKeyword2;  // 행사제목 
		String[] datastartday2;	// 행사 시작일
		String[] dataurl2;	// 행사 홈페이지
		
		String[] dataXml = xml.split("<list>");
		for (int i = 1; i < dataXml.length; i++)
		{
			FestivalVo vo = new FestivalVo();
			//System.out.println("------------------------------------------");
			//System.out.println( i +"번째 xml 데이터");
			//System.out.println(dataXml[i]);
			//System.out.println("------------------------------------------");

			// splitword >> xml list 안에 스플릿 시작지점
			String[] splitword = dataXml[i].split("</regDate>");
			String[] datastartday = dataXml[i].split("<startDay>");
			for (int z = 1; z < datastartday.length; z++)
			{	
				
				
				datastartday2 = datastartday[1].split("</startDay>");
				//System.out.println("------------------------------------------");
				//System.out.println( i +"번째 startDay 데이터");
				//System.out.println(datastartday[z]);
				//System.out.println(datastartday2[0]);
				//System.out.println("------------------------------------------");
				vo.setStartday(datastartday2[0]);
				//System.out.println(i + "번째 행사 시작일 : "+vo.getStartday());
				
				
			}	
			
			String[] dataKeyword = dataXml[i].split("<subject>");
			for (int z = 1; z < dataKeyword.length; z++)
			{
				
				dataKeyword2 = dataKeyword[z].split("</subject>");
				//System.out.println("------------------------------------------");
				//System.out.println( i +"번째 subject 데이터");
				//System.out.println(dataKeyword[z]);
				//System.out.println(dataKeyword2[0]);
				//System.out.println("------------------------------------------");
				vo.setKeyword(dataKeyword2[0]);
				//System.out.println(i + "번째 제목 : "+vo.getKeyword());
				
				
			}	
			
			String[] dataurl = dataXml[i].split("<url>");
			for (int z = 1; z < dataurl.length; z++)
			{
				
				dataurl2 = dataurl[z].split("</url>");
				//System.out.println("------------------------------------------");
				//System.out.println( i +"번째 url 데이터");
				//System.out.println(dataurl[z]);
				//System.out.println(dataurl2[0]);
				//System.out.println("------------------------------------------");
				vo.setUrl(dataurl2[0]);
				//System.out.println(i + "번째 홈페이지주소 : "+vo.getUrl());
				
				
			}	
			
			listvo.Add(vo);
			dto.insertXML(vo);
			
		}
		
		
		for(int i = 0 ; i < listvo.Total() ; i++)
		{
			FestivalVo vo = new FestivalVo();
			vo = listvo.Get(i);
			System.out.println((i + 1) +"번째" +vo.getStartday());
			System.out.println((i + 1) +"번째" +vo.getKeyword());
			System.out.println((i + 1) +"번째" +vo.getUrl());
		}
		
//		for(int i = 0 ; i < listKeyword.Total() ; i++)
//		{
//			vo = listKeyword.Get(i);
//			System.out.println((i + 1) +"번째" +vo.getKeyword());			
//		}
//		
//		for(int i = 0 ; i < listUrl.Total() ; i++)
//		{
//			vo = listUrl.Get(i);
//			System.out.println((i + 1) +"번째" +vo.getUrl());			
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
