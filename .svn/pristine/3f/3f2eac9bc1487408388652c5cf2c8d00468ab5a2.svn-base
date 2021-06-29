package tv.dto;

import tv.dbms.DBManager;
import tv.vo.FestivalListVo;
import tv.vo.FestivalVo;

public class FestivalDto extends DBManager 
{
	String sql = "";
	
	public void insertXML(FestivalVo vo)
	{
		this.DBOpen();
		sql = "select keyword, startday from festival where keyword='"+ vo.getKeyword() +"' and startday='" + vo.getStartday() + "' order by startday asc";
		this.OpenQuery(sql);
		while(this.Next() == true)
		{
			this.CloseQuery();
			this.DBClose();
			return;
		}
		sql  = "insert into festival ";
		sql += "(startday, keyword, url) ";
		sql += "values ";
		sql += "(";
		sql += "'" + vo.getStartday() + "',";
		sql += "'" + vo.getKeyword() + "',";
		sql += "'" + _Rhttp(vo.getUrl()) + "'";
		sql += ")";
		this.Excute(sql);
		this.CloseQuery();
		this.DBClose();
	}
	
	public FestivalListVo selectXml(String currentdate)
	{
		FestivalListVo list = new FestivalListVo();
		this.DBOpen();
		
		sql = "select keyword, startday, url from festival where startday='" + currentdate + "' order by startday asc";
		this.OpenQuery(sql);
		while(this.Next() == true)
		{
			FestivalVo vo = new FestivalVo();
			vo.setKeyword(this.GetValue("keyword"));
			vo.setStartday(this.GetValue("startday"));
			vo.setUrl(this.GetValue("url"));
			list.Add(vo);
		}	
		return list;
	}
}
