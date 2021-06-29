package tv.vo;

//댓글 정보를 관리 하기위한 클래스
public class ReplyVo 
{
	private int    comno; 		//댓글번호(PK) NOT NULL
	private int	   no;  		//게시물번호(PK)(FK) NOT NULL
	private String nickname; 	//닉네임(FK)VARCHAR(14)
	private String combody; 	//댓글내용text
	private String comdate;		//댓글일자datetime
	private String photo;
	
	
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int    getComno() 	{	return comno;	  }
	public int    getNo() 		{	return no;	      }
	public String getNickname() {	return nickname;  }
	public String getCombody()  {	return combody;	  }
	public String getComdate()  {	return comdate;	  }

	public void setComno	(int comno) 	  {	this.comno = comno;		  }
	public void setNo		(int no) 		  {	this.no = no;			  }
	public void setNickname (String nickname) {	this.nickname = nickname; }
	public void setCombody	(String combody)  {	this.combody = combody;	  }
	public void setComdate	(String comdate)  {	this.comdate = comdate;	  }
	
	public void Fakedata()
	{
		comno = 1;
		no = 27;
		nickname = "강우영짱";
		combody = "강우영짱이에요";
		comdate = "2021.04.29 10:44:01";
	}
	
	public void traceInfo()
	{
		System.out.println("게시물 번호 :" + no);
		System.out.println("댓글 번호 :" + comno);
		System.out.println("댓글 닉네임 :" + nickname);
		System.out.println("댓글 내용 :" + combody);
		System.out.println("댓글 타임 :" + comdate);
	}
	
	public static void main(String[] args) 
	{
		ReplyVo vo = new ReplyVo();
		vo.Fakedata();
		vo.traceInfo();
	}
}
