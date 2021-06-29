package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

public class FileListDto extends DBManager 
{
	
	//게시물 번호에 있는 첨부파일 갯수를 구해주자!
	public FileListVo GetList(int no)
	{
		//첨부파일을 어레이로 관리하기 위한 클래스
		FileListVo list = new FileListVo();
		
		this.DBOpen();
		
		String sql = "";
		
		sql += "select * from attach ";
		sql += "where no = " + no;
		
		System.out.println(sql);
		this.OpenQuery(sql);
		
		//셀렉해서 없을때까지 반복하자!
		while(this.Next())
		{
			//하나씩 구해서 FlieVo에 Set해주자
			FileVo vo = new FileVo();
			vo.setAttachname(this.GetValue("attachname"));
			vo.setAttachno(this.GetInt("attachno"));
			//열심히 Set한 attachname을 어레이로 넣어주자
			list.Add(vo);
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	public static void main(String[] args) 
	{
		//일단 사용하려면 생성부터
		FileListDto dto = new FileListDto();
		//no번 게시물에 대한 첨부파일을 다 가져오자
		FileListVo list = dto.GetList(42);
		
		
		//for문 돌면서 가지오잇던 정보 뱉어내자
		for(int i = 0 ; i < list.Total() ; i++)
		{
			FileVo vo = list.Get(i);
			System.out.println(vo.getAttachname());
		}
	}
}
