package tv.vo;

import java.util.ArrayList;
import tv.vo.*;

//�Խù� ��� ������������ �� ���� Ŭ����
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
	
	//������
	public ListVo()	{	list = new ArrayList<ItemVo>();	}
	
	//��� 1���� �߰��Ѵ�.
	public void Add(ItemVo item){	list.add(item);	}	
	
	//��� 1���� ��´�.
	public ItemVo Get(int index){	return list.get(index);	}
	
	//������ �ִ� ��ü ���� ����
	public int Total(){	return list.size();	}
	
	public static void main(String[] args){}

}
