package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

public class AdminListDto extends DBManager
{
	
	
	final static int PER_LIST = 10;
	
	
	private int    total;     		//게시물 전체 갯수
	private String search = "" ;	//검색조건
	private String type   = "0";	//검색조건
	private String order  = "0";	//검색조건
	private String formal = "0";
	
	
	public String getType()           	    {  return type;	  	     }
	public void   setType(String type) 	    {  this.type = type; 	 }
		
	public String getSearch() 			    {  return search;		 }
	public void   setSearch(String search)  {  this.search = search; }

	public int 	  getTotal() 			    {  return total;		 }
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	public String getFormal() {
		return formal;
	}
	public void setFormal(String formal) {
		this.formal = formal;
	}
	//데이터베이스에서 게시물 목록을 얻는다.
	public ListVo GetList(int pageno)
	{
		int seqno   = 0;
		int startno = (pageno - 1) * PER_LIST;
		
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		
		//게시물 전체 갯수를 얻는다.
		sql = "select count(*) as total ";
		sql += "from board ";
		
		if(type != null)
		{
			if(type.equals("1"))
			{
				sql += "where (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "where (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "where (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "where (nickname like '%" + search + "%') ";
			}
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		System.out.println("전체게시물:" + total);
		
		//게시물 조회 순서를 계산한다.
		seqno = total - ((pageno - 1) * PER_LIST);
		
		//게시물 목록을 조회한다.
		sql  = "select * ";
		sql += "from board ";
		
		if(type != null)
		{
			if(type.equals("1"))
			{
				sql += "where (title like '%" + search + "%' or body like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "where (title like '%" + search + "%') ";
			}
			if(type.equals("3"))
			{
				sql += "where (body like '%" + search + "%') ";
			}
			if(type.equals("4"))
			{
				sql += "where (nickname like '%" + search + "%') ";
			}
		}
		if(formal.equals("no"))
		{
			sql += "order by no desc ";
		}else if(formal.equals("no1"))
		{
			sql += "order by no asc ";
		}else if(formal.equals("title"))
		{
			sql += "order by title desc ";
		}else if(formal.equals("title1"))
		{
			sql += "order by title asc ";
		}else if(formal.equals("write"))
		{
			sql += "order by nickname desc ";
		}else if(formal.equals("write1"))
		{
			sql += "order by nickname asc ";
		}else if(formal.equals("date"))
		{
			sql += "order by date desc ";
		}else if(formal.equals("date1"))
		{
			sql += "order by date asc ";
		}else if(formal.equals("hit"))
		{
			sql += "order by hit desc ";
		}else if(formal.equals("hit1"))
		{
			sql += "order by hit asc ";
		}else
		{
			if(order.equals("0"))
			{
				sql += "order by date desc ";
			}
			if(order.equals("1"))
			{
				sql += "order by field(boardtype, 1,2,3,4,5)";
			}
			if(order.equals("2"))
			{
				sql += "order by field(boardtype, 2,3,4,5,1)";
			}
			if(order.equals("3"))
			{
				sql += "order by field(boardtype, 3,4,5,1,2)";
			}
			if(order.equals("4"))
			{
				sql += "order by field(boardtype, 4,5,1,2,3)";
			}
			if(order.equals("5"))
			{
				sql += "order by field(boardtype, 5,1,2,3,4)";
			}
			if(order.equals("-1"))
			{
				sql += "order by date desc";
			}
		}
		sql += "limit " + startno + "," + PER_LIST + " ";
		
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setSeqno	 (Integer.toString(seqno));
			item.setNo	 	 (this.GetValue("no"));
			item.setNickname (this.GetValue("nickname"));
			item.setTitle	 (this.GetValue("title"));
			item.setDate	 (this.GetValue("date"));
			item.setHit	 	 (this.GetValue("hit"));
			item.setBody	 (this.GetValue("body"));
			item.setAddress	 (this.GetValue("address"));
			item.setNumber	 (this.GetValue("number"));
			item.setBoardtype(this.GetInt("boardtype"));
			list.Add(item);
			seqno--;	
		}
		
		this.CloseQuery();
		this.DBClose();
		
		return list;
	}
	
	
	
	//데이터베이스에서 유저아이디 목록을 얻는다.
	public ListVo GetList2(int pageno)
	{
		int seqno = 0;
		int startno = (pageno - 1) * PER_LIST;
		
		ListVo list = new ListVo();
		
		this.DBOpen();
		
		String sql = "";
		//게시물 전체 갯수를 얻는다.
		sql = "select count(*) as total ";
		sql += "from user ";
		
		
		if(type != null)
		{
			if(type.equals("1"))
			{
				sql += "where (mail like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "where (nickname like '%" + search + "%') ";
			}
		}
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		System.out.println("전체게시물:" + total);
		
		//게시물 조회 순서를 계산한다.
		seqno = total - ((pageno - 1) * PER_LIST);
		
		//게시물 목록을 조회한다.
		sql  = "select * ";
		sql += "from user ";
	
		if(type != null)
		{
			if(type.equals("1"))
			{
				sql += "where (mail like '%" + search + "%') ";
			}
			if(type.equals("2"))
			{
				sql += "where (nickname like '%" + search + "%') ";
			}
		}
		if(order.equals("0"))
		{
			sql += "order by type desc ";
		}
		if(order.equals("1"))
		{
			sql += "order by field(type, 1,2,3,4,5)";
		}
		if(order.equals("2"))
		{
			sql += "order by field(type, 2,3,4,5,1)";
		}
		if(order.equals("3"))
		{
			sql += "order by field(type, 3,4,5,1,2)";
		}
		if(order.equals("4"))
		{
			sql += "order by field(type, 4,5,1,2,3)";
		}
		if(order.equals("5"))
		{
			sql += "order by field(type, 5,1,2,3,4)";
		}
		if(order.equals("-1"))
		{
			sql += "order by date desc";
		}
		sql += "limit " + startno + "," + PER_LIST + " ";
		System.out.println(sql);
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ItemVo item = new ItemVo();
			
			item.setSeqno	(Integer.toString(seqno));
			item.setMail	(this.GetValue("mail"));
			item.setType	(this.GetValue("type"));
			item.setNickname(this.GetValue("nickname"));
			list.Add(item);
			seqno--;	
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
		//		System.out.println("전체게시물수 :" + dto.getTotal());
		//		for(int i = 0 ; i < list.Total() ; i++)
		//		{
		//			ItemVo item = list.Get(i);
		//			item.traceInfo();
		//		}
	}
}