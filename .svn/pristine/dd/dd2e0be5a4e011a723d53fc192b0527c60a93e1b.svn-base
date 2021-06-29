package tv.dto;

import tv.dbms.DBManager;

public class CheckDto extends DBManager 
{
	public boolean ViewCheck(int no, String nickname)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql += "select * from board ";
		sql += "where no = " + no; 
		sql += " and nickname = '" + nickname + "'";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return true;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
	}
}
