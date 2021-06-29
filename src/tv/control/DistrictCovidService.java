package tv.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tv.util.DistrictCovidData;

/**
 * Servlet implementation class DistrictCovidService
 */
@WebServlet("/DistrictCovidService.do")
public class DistrictCovidService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DistrictCovidService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		Date today = new Date();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DATE, -5);
		
		
		SimpleDateFormat todayFormat = new SimpleDateFormat("yyyyMMdd");
		
		String yesterday_str = todayFormat.format(cal.getTime());
		
		String today_str = todayFormat.format(today);
		
		DistrictCovidData covid = new DistrictCovidData();
		String xml = covid.GetData(yesterday_str, today_str);
		response.getWriter().append(xml);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
