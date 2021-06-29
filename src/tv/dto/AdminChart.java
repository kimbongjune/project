package tv.dto;

import java.util.ArrayList;

import org.json.simple.JSONArray;

import tv.dbms.DBManager;
import tv.vo.*;

public class AdminChart extends DBManager 
{
	public JSONArray getAddress() 
	{
		AdminChart a = new AdminChart();
		AdminChart b = new AdminChart();
		a.DBOpen();
		b.DBOpen();
		this.DBOpen();
		String sql0 = "";
		String sql1 = "";
		String sql2 = "";

		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray();

		colNameArray.add("주소");
		colNameArray.add("음식");
		colNameArray.add("숙소");
		colNameArray.add("조회수");
		
		
		jsonArray.add(colNameArray);
		//group by street\
		sql0 = "select street from board where boardtype=2 or boardtype=3 group by street";
		this.OpenQuery(sql0);
		while(this.Next())
		{
			String street = this.GetValue("street");
			sql1 = "select count(*),hit from board where boardtype=2 and street ='" + street + "' group by street";
			sql2 = "select count(*),hit from board where boardtype=3 and street ='" + street + "' group by street";
			//System.out.println(sql1);
			//System.out.println(sql2);
			a.OpenQuery(sql1);
			b.OpenQuery(sql2);
			a.Next();
			b.Next();
	
			JSONArray rowArray = new JSONArray();
			rowArray.add(street);
			rowArray.add(a.GetInt("count(*)"));
			rowArray.add(b.GetInt("count(*)"));
			rowArray.add(a.GetInt("hit") + b.GetInt("hit"));
			jsonArray.add(rowArray);
			
			b.CloseQuery();
			a.CloseQuery();
			
			
		}
		a.DBClose();
		b.DBClose();
		this.CloseQuery();
		this.DBClose();
		return jsonArray;

	}
	
	/*
	 * public JSONArray getInn() { this.DBOpen(); String sql = "";
	 * 
	 * JSONArray jsonArray = new JSONArray();
	 * 
	 * JSONArray colNameArray = new JSONArray();
	 * 
	 * colNameArray.add("주소"); colNameArray.add("숙소"); colNameArray.add("조회수");
	 * 
	 * 
	 * jsonArray.add(colNameArray); //group by street sql =
	 * "select street,count(*),hit from board where boardtype=3 group by street order by hit desc"
	 * ; System.out.println(sql); this.OpenQuery(sql); while(this.Next()) {
	 * JSONArray rowArray = new JSONArray(); rowArray.add(this.GetValue("street"));
	 * rowArray.add(this.GetInt("count(*)")); rowArray.add(this.GetInt("hit"));
	 * jsonArray.add(rowArray); }
	 * 
	 * this.CloseQuery(); this.DBClose(); return jsonArray;
	 * 
	 * }
	 */

	//select birth from user where char_length(birth) >= 2  group by birth
	
	public JSONArray getAge() 
	{
		AdminChart a = new AdminChart();
		AdminChart b = new AdminChart();
		AdminChart c = new AdminChart();
		a.DBOpen();
		b.DBOpen();
		c.DBOpen();
		this.DBOpen();
		
		String sql0 = "";
		String sql1 = "";
		String sql2 = "";
		String sql3 = "";

		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray();

		colNameArray.add("연령대");

		colNameArray.add("남자");
		
		colNameArray.add("여자");
		
		colNameArray.add("기타");

		jsonArray.add(colNameArray);
		
		/*
		 * sql = "select left(birth,1) as birth, "; sql += "count(*) as total "; sql +=
		 * "from user "; sql += "group by left(birth,1) "; sql += "having birth >= 2 ";
		 * sql += "order by total desc";
		 */
		sql0 += "select left(birth,1) as birth from user where char_length(birth) >= 2  group by left(birth,1) order by birth";
		System.out.println(sql0);
		this.OpenQuery(sql0);

			while(this.Next())
			{
				String birth = this.GetValue("birth");
				sql1 = "select count(*) from user where gender like '%남%' and left(birth,1) = " + this.GetValue("birth") + " group by birth  order by birth";
				System.out.println(sql1);
				sql2 = "select count(*) from user where gender like '%여%' and left(birth,1) = " + this.GetValue("birth") + " group by birth  order by birth";
				System.out.println(sql2);
				sql3 = "select count(*) from user where gender not like '%여%' and gender not like '%남%' and left(birth,1) = " + this.GetValue("birth") + " group by birth  order by birth";
				System.out.println(sql3);
				a.OpenQuery(sql1);
				b.OpenQuery(sql2);
				c.OpenQuery(sql3);
				a.Next();
				b.Next();
				c.Next();
				
				JSONArray rowArray = new JSONArray();
				rowArray.add(this.GetValue("birth") + "0년생" );
				//rowArray.add(this.GetInt("total"));
				rowArray.add(a.GetInt("count(*)"));
				rowArray.add(b.GetInt("count(*)"));
				rowArray.add(c.GetInt("count(*)"));

				jsonArray.add(rowArray);
				
				b.CloseQuery();
				a.CloseQuery();
				c.CloseQuery();
	
			}

		a.DBClose();
		b.DBClose();
		c.DBClose();
		this.CloseQuery();
		this.DBClose();
		return jsonArray;

	}
	
	/*
	 * public JSONArray getGender() { this.DBOpen(); String sql = "";
	 * 
	 * JSONArray jsonArray = new JSONArray();
	 * 
	 * JSONArray colNameArray = new JSONArray();
	 * 
	 * colNameArray.add("성별");
	 * 
	 * colNameArray.add("");
	 * 
	 * jsonArray.add(colNameArray);
	 * 
	 * sql = "select gender, "; sql += "count(*) as total "; sql += "from user ";
	 * sql += "group by gender "; sql += "having gender like '%남%' "; sql +=
	 * "order by total desc"; System.out.println(sql); this.OpenQuery(sql);
	 * 
	 * while(this.Next()) {
	 * 
	 * JSONArray rowArray = new JSONArray(); rowArray.add(this.GetValue("gender"));
	 * rowArray.add(this.GetInt("total"));
	 * 
	 * jsonArray.add(rowArray);
	 * 
	 * }
	 * 
	 * this.CloseQuery();
	 * 
	 * sql = "select gender, "; sql += "count(*) as total "; sql += "from user ";
	 * sql += "group by gender "; sql += "having gender like '%여%' "; sql +=
	 * "order by total desc"; System.out.println(sql); this.OpenQuery(sql);
	 * 
	 * while(this.Next()) {
	 * 
	 * JSONArray rowArray = new JSONArray(); rowArray.add(this.GetValue("gender"));
	 * rowArray.add(this.GetInt("total"));
	 * 
	 * jsonArray.add(rowArray);
	 * 
	 * }
	 * 
	 * sql = "select gender, "; sql += "count(*) as total "; sql += "from user ";
	 * sql += "group by gender "; sql += "having gender not like '%여%' "; sql +=
	 * "and gender not like '%남%' "; sql += "order by total desc";
	 * System.out.println(sql); this.OpenQuery(sql);
	 * 
	 * this.Next(); JSONArray rowArray = new JSONArray(); rowArray.add("기타");
	 * rowArray.add(this.GetInt("total"));
	 * 
	 * jsonArray.add(rowArray);
	 * 
	 * this.CloseQuery(); this.DBClose(); return jsonArray;
	 * 
	 * }
	 */
	
	public String getBoardTable(String boardtype, String category) 
	{
		if(boardtype == null || category == null)
		{
			return null;
		}
		this.DBOpen();
		String sql = "";
		
		String id = "";
		if(boardtype.equals("2"))
		{
			id = "tab2";
		}
		if(boardtype.equals("3"))
		{
			id = "tab2";
		}

		
		String link = "";
		String table = "";
		table += "<table style='border-bottom:1px solid black;' id='" + id + "' class='admin_listTable'>";
		table += "<tr class='adminTh'>";
		table += "<th style='width:80px'>번호</th>";
		table += "<th style='algin:left'>제목</th>";
		table += "<th style='width:80px'>분류</th>";
		table += "<th style='width:80px'>조회수</th>";
		table += "<th style='width:160px'>닉네임</th>";
		table += "</tr>";
		
		sql  = "select * from board where boardtype = " + boardtype + " and street = '" + category + "' order by hit desc limit 0,10";
		
		int check = 0;
		System.out.println(sql);
		this.OpenQuery(sql);

			while(this.Next())
			{
				if(boardtype.equals("2"))
				{
					link = "window.location='../jjplay/jj_view.jsp?boardtype=2&no="+this.GetValue("no")+"'";
				}
				if(boardtype.equals("3"))
				{
					link = "window.location='../jjinn/hotel_view.jsp?boardtype=3&no="+this.GetValue("no")+"'";
				}
				table += "<tr onclick=" + link +" class='adminTd'>";
				table += "<th>" + this.GetValue("no") + "</th>";
				table += "<th>" + this.GetValue("title") + "</th>";
				if(boardtype.equals("2"))
				{
					table += "<th>음식</th>";
				}
				if(boardtype.equals("3"))
				{
					table += "<th>숙소</th>";
				}
				table += "<th>" + this.GetValue("hit") + "</th>";
				table += "<th>" + this.GetValue("nickname") + "</th>";
				table += "</tr>";
				check++;
			}
			
		table += "</table>";
		
		if(check == 0)
		{
			this.CloseQuery();
			this.DBClose();
			return "";
		}
		this.CloseQuery();
		this.DBClose();
		return table;

	}
	
	
	
	public static void main(String[] args) 
	{
	}
}
