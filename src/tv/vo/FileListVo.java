package tv.vo;

import java.util.ArrayList;
import tv.vo.*;

public class FileListVo 
{
	private ArrayList<FileVo> list;
	
	//������
	public FileListVo()	{	list = new ArrayList<FileVo>();	}
	
	//��� 1���� �߰��Ѵ�.
	public void Add(FileVo item){	list.add(item);	}	
	
	//��� 1���� ��´�.
	public FileVo Get(int index){	return list.get(index);	}
	
	//������ �ִ� ��ü ���� ����
	public int Total(){	return list.size();	}
}