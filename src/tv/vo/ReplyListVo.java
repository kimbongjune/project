package tv.vo;

import java.util.ArrayList;
import tv.vo.*;

public class ReplyListVo 
{
	
		private ArrayList<ReplyVo> list;
		
		//������
		public ReplyListVo()	{	list = new ArrayList<ReplyVo>();	}
		
		//��� 1���� �߰��Ѵ�.
		public void Add(ReplyVo replyvo){	list.add(replyvo);	}	
		
		//��� 1���� ��´�.
		public ReplyVo Get(int index){	return list.get(index);	}
		
		//������ �ִ� ��ü ���� ����
		public int Total(){	return list.size();	}
		
	
	
	public static void main(String[] args) {}
}
