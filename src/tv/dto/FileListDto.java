package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

public class FileListDto extends DBManager 
{
	
	//�Խù� ��ȣ�� �ִ� ÷������ ������ ��������!
	public FileListVo GetList(int no)
	{
		//÷�������� ��̷� �����ϱ� ���� Ŭ����
		FileListVo list = new FileListVo();
		
		this.DBOpen();
		
		String sql = "";
		
		sql += "select * from attach ";
		sql += "where no = " + no;
		
		System.out.println(sql);
		this.OpenQuery(sql);
		
		//�����ؼ� ���������� �ݺ�����!
		while(this.Next())
		{
			//�ϳ��� ���ؼ� FlieVo�� Set������
			FileVo vo = new FileVo();
			vo.setAttachname(this.GetValue("attachname"));
			vo.setAttachno(this.GetInt("attachno"));
			//������ Set�� attachname�� ��̷� �־�����
			list.Add(vo);
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	public static void main(String[] args) 
	{
		//�ϴ� ����Ϸ��� ��������
		FileListDto dto = new FileListDto();
		//no�� �Խù��� ���� ÷�������� �� ��������
		FileListVo list = dto.GetList(42);
		
		
		//for�� ���鼭 �������մ� ���� ����
		for(int i = 0 ; i < list.Total() ; i++)
		{
			FileVo vo = list.Get(i);
			System.out.println(vo.getAttachname());
		}
	}
}
