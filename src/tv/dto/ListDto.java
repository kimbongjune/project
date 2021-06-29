package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

public class ListDto extends DBManager
{
	
	final static int PER_LIST = 9;
	
	private int    total;     		//�Խù� ��ü ����
	private String where  = "";  	//�˻�����
	private String search = "";		//�˻�����
	private String type   = "";	//�˻�����
	private String order  = "1";	//�˻�����
	
	
	public String getType() 			   { return type;	  	   }
	public void   setType(String type)     { this.type = type; 	   }
	
	
	public String getSearch()			   { return search;		   }
	public void   setSearch(String search) { this.search = search; }

	
	public String getWhere() 			   { return where;		   }
	public void   setWhere(String where)   { this.where = where;   }
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int 	  getTotal() 			   { return total;	       }

	
	//�����ͺ��̽����� �Խù� ����� ��´�.
	public ListVo GetList(int pageno)
	{
		int seqno = 0;
		int startno = (pageno - 1) * PER_LIST;
		
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from board ";
		
		if(!where.equals(""))
		{
			sql += "where " + where;
		}
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + search + "%') ";
			}
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		System.out.println("��ü�Խù�:" + total);
		
		//�Խù� ��ȸ ������ ����Ѵ�.
		seqno = total - ((pageno - 1) * PER_LIST);
		
		//�Խù� ����� ��ȸ�Ѵ�.
		sql  = "select * ";
		sql += "from board ";
		if(!where.equals(""))
		{
			sql += "where " + where + " ";
		}
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + search + "%') ";
			}
		}
		if(order.equals("1"))
		{
			sql += "order by date desc ";
		}
		if(order.equals("11"))
		{
			sql += "order by date ";
		}
		if(order.equals("2"))
		{
			sql += "order by hit desc ";
		}
		if(order.equals("22"))
		{
			sql += "order by hit  ";
		}
		if(order.equals("3"))
		{
			sql += "order by title desc ";
		}
		if(order.equals("33"))
		{
			sql += "order by title  ";
		}
		
		sql += "limit " + startno + "," + PER_LIST + " ";
		//System.out.println(type);
		System.out.println("1");
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setSeqno	(Integer.toString(seqno));
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
			seqno--;	
		}
		this.CloseQuery();
		this.DBClose();
		return list;	
	}
	
	public ListVo GetUserWriteList(int pageno, String nickname)
	{
		int seqno = 0;
		int startno = (pageno - 1) * PER_LIST;
		
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from board where nickname='" + nickname +"'";
		
		
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + search + "%') ";
			}
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		System.out.println("��ü�Խù�:" + total);
		
		//�Խù� ��ȸ ������ ����Ѵ�.
		seqno = total - ((pageno - 1) * PER_LIST);
		
		//�Խù� ����� ��ȸ�Ѵ�.
		sql  = "select * ";
		sql += "from board where nickname='" + nickname +"'";
		
		if(!type.equals(null))
		{
			if(type.equals("1"))
			{
				sql += "and (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "and (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "and (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "and (nickname like '%" + search + "%') ";
			}
		}
		if(order.equals("1"))
		{
			sql += "order by date desc ";
		}
		if(order.equals("2"))
		{
			sql += "order by title desc ";
		}
		if(order.equals("3"))
		{
			sql += "order by hit desc ";
		}
		
		sql += "limit " + startno + "," + PER_LIST + " ";
		//System.out.println(type);
		System.out.println("1");
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setSeqno	(Integer.toString(seqno));
			item.setNo		(this.GetValue("no"));
			item.setBoardtype		(this.GetInt("boardtype"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);
			seqno--;	
		}
		this.CloseQuery();
		this.DBClose();
		return list;
		
		
	}
	
	public ListVo GetMainList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from board ";
		
		if(!where.equals(""))
		{
			sql += "where " + where;
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		sql  = "select * ";
		sql += "from board ";
		if(!where.equals(""))
		{
			sql += "where " + where + " ";
		}
		sql += "order by good desc ";
		sql += "limit 0, 4 ";
		//System.out.println(type);
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody(this.GetValue("Replacebody"));
			item.setAddress	(this.GetValue("address"));
			item.setNumber	(this.GetValue("number"));
			list.Add(item);	
		}
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	public ListVo GetPlayList()
	{
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from board ";
		
		if(!where.equals(""))
		{
			sql += "where " + where;
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		sql  = "select * ";
		sql += "from board ";
		if(!where.equals(""))
		{
			sql += "where " + where + " ";
		}
		sql += "order by good desc ";
		sql += "limit 0, 3 ";
		//System.out.println(type);
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody(this.GetValue("Replacebody"));
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
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from board ";
		
		if(!where.equals(""))
		{
			sql += "where " + where;
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		sql  = "select * ";
		sql += "from board ";
		if(!where.equals(""))
		{
			sql += "where " + where + " ";
		}
		sql += "order by good desc ";
		sql += "limit 0, 3 ";
		//System.out.println(type);
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setNo		(this.GetValue("no"));
			item.setNickname(this.GetValue("nickname"));
			item.setTitle	(this.GetValue("title"));
			item.setDate	(this.GetValue("date"));
			item.setHit		(this.GetValue("hit"));
			item.setBody	(this.GetValue("body"));
			item.setReplacebody(this.GetValue("Replacebody"));
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
		//		ListDto dto = new ListDto();
		//		ListVo list;
		//
		//		//dto.setWhere("title like '%%'");
		//			
		//		list = dto.GetList(1);
		//		System.out.println("��ü�Խù��� :" + dto.getTotal());
		//		for(int i = 0 ; i < list.Total() ; i++)
		//		{
		//			ItemVo item = list.Get(i);
		//			item.traceInfo();
		//		}
	}

}