package tv.vo;
import java.util.ArrayList;
import tv.vo.*;

public class SearchVo 
{
	private ArrayList<ListVo> list;
	
	//������
	public SearchVo()	{	list = new ArrayList<ListVo>();	}
	
	//��� 1���� �߰��Ѵ�.
	public void Add(ListVo item){	list.add(item);	}	
	
	//��� 1���� ��´�.
	public ListVo Get(int index){	return list.get(index);	}
	
	//������ �ִ� ��ü ���� ����
	public int Total(){	return list.size();	}
}