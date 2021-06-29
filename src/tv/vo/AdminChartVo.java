package tv.vo;

import java.util.ArrayList;

public class AdminChartVo 
{
	// 컬럼명
	//like  검색어 포함값
	private String column;
	private String table;
	private ArrayList<String> list;
	
	//생성자
	public AdminChartVo()	{	list = new ArrayList<String>();	}
	
	//목록 1개를 추가한다.
	public void Add(String item){	list.add(item);	}	
	
	//목록 1개를 얻는다.
	public String Get(int index){	return list.get(index);	}
	
	//가지고 있는 전체 갯수 리턴
	public int Total(){	return list.size();	}
	
	
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}
	
}
