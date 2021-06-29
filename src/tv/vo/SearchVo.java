package tv.vo;
import java.util.ArrayList;
import tv.vo.*;

public class SearchVo 
{
	private ArrayList<ListVo> list;
	
	//생성자
	public SearchVo()	{	list = new ArrayList<ListVo>();	}
	
	//목록 1개를 추가한다.
	public void Add(ListVo item){	list.add(item);	}	
	
	//목록 1개를 얻는다.
	public ListVo Get(int index){	return list.get(index);	}
	
	//가지고 있는 전체 갯수 리턴
	public int Total(){	return list.size();	}
}