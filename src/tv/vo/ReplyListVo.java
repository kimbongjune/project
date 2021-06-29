package tv.vo;

import java.util.ArrayList;
import tv.vo.*;

public class ReplyListVo 
{
	
		private ArrayList<ReplyVo> list;
		
		//생성자
		public ReplyListVo()	{	list = new ArrayList<ReplyVo>();	}
		
		//목록 1개를 추가한다.
		public void Add(ReplyVo replyvo){	list.add(replyvo);	}	
		
		//목록 1개를 얻는다.
		public ReplyVo Get(int index){	return list.get(index);	}
		
		//가지고 있는 전체 갯수 리턴
		public int Total(){	return list.size();	}
		
	
	
	public static void main(String[] args) {}
}
