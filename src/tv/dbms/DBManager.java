package tv.dbms;
import java.sql.*;

public class DBManager 
{
	public Connection mConnection;
	public ResultSet  mResult;
	public DBManager() {}
	
	
	public void DBOpen()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			String mHost     = "jdbc:mysql://127.0.0.1:3306/board?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
			String mUserId   = "root";
			String mPassword = "ezen";
			mConnection = DriverManager.getConnection(mHost,mUserId,mPassword);
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	
	public void DBOpen(String host,String id,String pw)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			mConnection = DriverManager.getConnection(host,id,pw);
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}	
	
	
	public void DBClose() 
	{
		try
		{
			mConnection.close();	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	
	public void Excute(String sql)
	{
		try
		{
			Statement stmt = null;
			stmt = mConnection.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public boolean OpenQuery(String sql)
	{
		try
		{
			Statement stmt = mConnection.createStatement();
			mResult = stmt.executeQuery(sql);
			return true;
		}catch(Exception e)
		{
			return false;
		}
	}	
	
	
	public boolean Next()
	{
		try
		{
			return mResult.next();
		}catch(Exception e)
		{
			return false;
		}
	}
	
	
	public String GetValue(String name)
	{
		try
		{		
			return mResult.getString(name);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	
	public int GetInt(String name)
	{
		try
		{		
			return mResult.getInt(name);
		}catch(Exception e)
		{
			return 0;
		}
	}	
	
	public void CloseQuery() 
	{
		try
		{		
			mResult.close();
		}catch(Exception e)
		{		
		}			
	}
	
	
	//작은 따옴표를 '' 로 처리
	public String _R(String value)
	{
		if(value == null)
		{
			return null;
		}
		value = value.replace("'","''");
		value = value.replace("<" , "&lt");
		value = value.replace(">" , "&gt");
		value = value.replace("\n" , "<br>");
		value = value.replace("%" , "&#37");
		return  value;
	}
	public String _Rbody(String value)
	{
		if(value == null)
		{
			return null;
		}
		value = value.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		value = value.replace("&nbsp;" ," ");
		value = value.replace("&lt;" ,"");
		value = value.replace("&gt;" ,"");
		return  value;
	}
	
	public String _Rhttp(String value)
	{
		if(value == null)
		{
			return null;
		}
		value = value.replace("http://", "");
		value = value.replace("https://", "");
		return  value;
	}
	
	public String _Raddress(String value)
	{
		value = value.substring(value.indexOf("("));
		value = value.substring(1, value.indexOf("동")+1);
		return value;
	}
	public static void main(String[] args) 
	{
		DBManager db = new DBManager();
		System.out.println(db._Raddress("전북 전주시 덕진구 내동길 6 (장동)"));
	}
}
