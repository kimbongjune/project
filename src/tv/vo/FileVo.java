package tv.vo;

//첨부파일을 관리하기위한 클래스
public class FileVo 
{
	private int 	attachno; 		//첨부파일번호(PK)NOT NULL
	private int 	no; 			//게시물번호(PK)(FK)NOT NULL
	private String  attachname;		//첨부파일이름VARCHAR(256)

	public int 	  getAttachno() 	{	return attachno;	}
	public int 	  getNo() 			{	return no;			}
	public String getAttachname() 	{	return attachname;	}

	public void setAttachno	  (int attachno)      {	 this.attachno = attachno;	   }
	public void setNo		  (int no) 			  {	 this.no = no;				   }
	public void setAttachname (String attachname) {	 this.attachname = attachname; }
	
	public void Fakedata()
	{
		attachno   = 1;
		no 		   = 1;
		attachname = "alt.jpg";
	}
	
	public void traceInfo()
	{
		System.out.println("게시물 번호 :" + no);
		System.out.println("첨부파일 번호 :" + attachno);
		System.out.println("첨부파일 이름 :" + attachname);
	}
	
	public static void main(String[] args) 
	{
		FileVo vo = new FileVo();
		vo.Fakedata();
		vo.traceInfo();
	}
}
