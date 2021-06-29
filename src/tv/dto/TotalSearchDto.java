package tv.dto;

import tv.dbms.DBManager;
import tv.vo.ItemVo;
import tv.vo.ListVo;

public class TotalSearchDto extends DBManager
{

	private int total;
	private int noticetotal;
	private int playtotal;
	private int hoteltotal;
	private int comtotal;
	private String search = "";
	private String boardtype = "";
	private String type = "";
	
	public String getSearch() 
	{
		return search;
	}

	public void setSearch(String search) 
	{
		this.search = search;
	}

	public String getBoardtype() 
	{
		return boardtype;
	}

	public void setBoardtype(String boardtype) 
	{
		this.boardtype = boardtype;
	}

	public String getType() 
	{
		return type;
	}

	public void setType(String type) 
	{
		this.type = type;
	}

	public int getTotal() 
	{
		return total;
	}
	public int getNoticetotal() {
		return noticetotal;
	}

	public int getPlaytotal() {
		return playtotal;
	}

	public int getHoteltotal() {
		return hoteltotal;
	}

	public int getComtotal() {
		return comtotal;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}

	public void setNoticetotal(int noticetotal) {
		this.noticetotal = noticetotal;
	}

	public void setPlaytotal(int playtotal) {
		this.playtotal = playtotal;
	}

	public void setHoteltotal(int hoteltotal) {
		this.hoteltotal = hoteltotal;
	}

	public void setComtotal(int comtotal) {
		this.comtotal = comtotal;
	}

	public ListVo GettotalList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql = "select count(*) as total ";
		sql += "from board where boardtype != 5 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		System.out.println("테스트"+sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		System.out.println(total);
		this.CloseQuery();
		
		sql = "select * ";
		sql += "from board where boardtype != 5 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		sql += "order by date desc ";
		sql += "limit 0,3";
		System.out.println("테스트"+sql);
		this.OpenQuery(sql);
		list.setMax(total);
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody	(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
		}
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}
	
	public ListVo GetnoticeList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql = "select count(*) as total ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=1 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		System.out.println("테스트"+sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		noticetotal = this.GetInt("total");
		System.out.println(noticetotal);
		this.CloseQuery();
		
		sql = "select * ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=1 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		sql += "order by date desc ";
		sql += "limit 0,3";
		System.out.println("테스트"+sql);
		this.OpenQuery(sql);
		list.setMax(noticetotal);
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody	(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
		}
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}
	public ListVo GetplayList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql = "select count(*) as total ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=2 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		System.out.println("테스트"+sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		playtotal = this.GetInt("total");
		System.out.println(playtotal);
		this.CloseQuery();
		
		sql = "select * ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=2 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		sql += "order by date desc ";
		sql += "limit 0,3";
		System.out.println("테스트"+sql);
		this.OpenQuery(sql);
		list.setMax(playtotal);
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody	(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
		}
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}
	public ListVo GethotelList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql = "select count(*) as total ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=3 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		System.out.println("테스트"+sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		hoteltotal = this.GetInt("total");
		System.out.println(hoteltotal);
		this.CloseQuery();
		
		sql = "select * ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=3 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		sql += "order by date desc ";
		sql += "limit 0,3";
		System.out.println("테스트"+sql);
		this.OpenQuery(sql);
		list.setMax(hoteltotal);
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody	(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
		}
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}
	public ListVo GetcomList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql = "select count(*) as total ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=4 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		System.out.println("테스트"+sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		comtotal = this.GetInt("total");
		System.out.println(comtotal);
		this.CloseQuery();
		
		sql = "select * ";
		sql += "from board where boardtype != 5 ";
		sql += "and boardtype=4 ";
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + _R(search) + "%' or replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + _R(search) + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (replacebody like '%" + _R(search) + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + _R(search) + "%') ";
			}
		}
		sql += "order by date desc ";
		sql += "limit 0,3";
		System.out.println("테스트"+sql);
		this.OpenQuery(sql);
		
		list.setMax(comtotal);
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody	(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
		}
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}

	public static void main(String[] args) 
	{
		
	}
}