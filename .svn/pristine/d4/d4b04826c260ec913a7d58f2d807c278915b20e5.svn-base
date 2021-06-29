package tv.dto;

import tv.dbms.DBManager;

public class ChatDto extends DBManager 
{
	public boolean ChatAdd(String nickname, String chatbody) 
	{
		this.DBOpen();

		String sql = "";
		sql += "insert into chat ";
		sql += "(chattime, nickname, chatbody) ";
		sql += "values ";
		sql += "( now() ,";
		sql += "'" + _R(nickname) + "',";
		sql += "'" + _R(chatbody) + "'";
		sql += ")";

		this.Excute(sql);
		this.DBClose();
		return true;
	}

	public String ChatGet(String chatno, String nickname) 
	{
		String chat = "";
		String split = ":";
		String photo = "";
		this.DBOpen();

		String sql = "";

		sql = "select chatno ";
		sql += "from chat ";
		sql += "order by chatno desc limit 0,1 ";

		this.OpenQuery(sql);

		if (this.Next() == false || chatno.equals("0")) 
		{
			chat = this.GetValue("chatno") + split;
			chat += nickname + "님" + split;
			chat += "환영합니다." + split;
			
			this.CloseQuery();
			this.DBClose();
			return chat;
		}
		else
		{
			this.CloseQuery();

			sql = "select chatno,nickname,chatbody ";
			sql += "from chat ";
			sql += "where chatno > " + chatno + " ";
			sql += "order by chatno desc limit 0,1 ";

			this.OpenQuery(sql);

			if (this.Next()) 
			{
				if(nickname.equals(this.GetValue("nickname")))
				{
					chat  = this.GetValue("chatno") + split;
					chat += this.GetValue("chatbody") + split;
					chat += this.GetValue("nickname") + split;
					chat += "내가쓴글" + split;
				}
				else
				{
					chat  = this.GetValue("chatno") + split;
					chat += this.GetValue("chatbody") + split;
					chat += this.GetValue("nickname") + split;
					chat += "남이쓴글" + split;
				}
				photo = Photo(this.GetValue("nickname"));
				chat += photo;
			}
			
			this.CloseQuery();
			this.DBClose();
			return chat;
		}
	}
	
	public String Photo(String nickname)
	{
		String photo = "";
		String sql = "";
		
		this.DBOpen();
		
		sql += "select photo from user ";
		sql += "where nickname = '" + nickname + "'";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			photo += this.GetValue("photo");
		}
		else
		{
			photo += "profile.png";
		}
		
		this.CloseQuery();
		this.DBClose();
		return photo;
	}

	public static void main(String[] args) 
	{		
		 ChatDto dto = new ChatDto();
		 String ct = dto.ChatGet("53", "꼬북");
		 System.out.println(ct);
	}
}
