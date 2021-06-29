package tv.vo;

import java.util.ArrayList;
import tv.vo.*;

//게시물 목록 정보를관리하 기 위한 클래스
public class ListVo 
{
	private int max;
	
	public int getMax() 
	{
		return max;
	}

	public void setMax(int max) 
	{
		this.max = max;
	}

	private ArrayList<ItemVo> list;
	
	//생성자
	public ListVo()	{	list = new ArrayList<ItemVo>();	}
	
	//목록 1개를 추가한다.
	public void Add(ItemVo item){	list.add(item);	}	
	
	//목록 1개를 얻는다.
	public ItemVo Get(int index){	return list.get(index);	}
	
	//가지고 있는 전체 갯수 리턴
	public int Total(){	return list.size();	}
	
	public static void main(String[] args){}

}
