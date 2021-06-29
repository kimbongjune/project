package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

public class ReplyListDto extends DBManager 
{
	private int	   total;     		 //�Խù� ��ü ����
	private String where = ""; 		 //�˻�����
	
	public int 	   getTotal() 		      {	return total;       }
	public String  getWhere() 			  {	return where;       }
	public void    setWhere(String where) {	this.where = where; }
	public void    setTotal(int total)    {	this.total = total; }
	
	public ReplyListVo GetList(int no)
	{
		ReplyListVo list = new ReplyListVo();
		
		this.DBOpen();
		
		String sql = "";
		//�Խù� ��ü ������ ��´�.
		sql = "select count(*) as total ";
		sql += "from comment ";
		System.out.println(sql);
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		this.CloseQuery();
		
		sql  = "select * ";
		sql += "from comment where no=" + no + " ";
		sql += "order by comdate desc ";
		System.out.print(sql);
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			ReplyVo replyvo = new ReplyVo();
			
			replyvo.setCombody (this.GetValue("combody"));
			replyvo.setComno   (Integer.parseInt(this.GetValue("no")));
			replyvo.setComdate (this.GetValue("comdate"));
			replyvo.setNickname(this.GetValue("nickname"));
			replyvo.setComno   (Integer.parseInt(this.GetValue("comno")));
			list.Add(replyvo);
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	public String Getimg(String nickname)
	{
		this.DBOpen();
		String sql = "";
		String photo = "";
		
		sql = "select photo from user where nickname = '" + nickname + "'";
		this.OpenQuery(sql);
		this.Next();
		photo = this.GetValue("photo");
		
		this.CloseQuery();
		this.DBClose();
		return photo;
		
	}
	
	public static void main(String[] args) 
	{
		/*
		 * ReplyListDto dto = new ReplyListDto(); ReplyListVo list;
		 * 
		 * //dto.setWhere("title like '%%'");
		 * 
		 * list = dto.GetList(1); System.out.println("��ü�Խù��� :" + dto.getTotal());
		 * for(int i = 0 ; i < list.Total() ; i++) { ReplyVo item = list.Get(i);
		 * item.traceInfo(); }
		 */
	}
}
