package tv.vo;

import java.util.ArrayList;

public class UserListVo 
{

	private ArrayList<UserVo> list;
	
	//������
	public UserListVo()	{	list = new ArrayList<UserVo>();	}
	
	//��� 1���� �߰��Ѵ�.
	public void Add(UserVo item){	list.add(item);	}	
	
	//��� 1���� ��´�.
	public UserVo Get(int index){	return list.get(index);	}
	
	//������ �ִ� ��ü ���� ����
	public int Total(){	return list.size();	}
	
	
	public static void main(String[] args) {}
}