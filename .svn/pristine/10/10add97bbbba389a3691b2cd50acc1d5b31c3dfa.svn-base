package tv.vo;

//채팅 로그를 관리하기 위한 클래스
public class ChatVo 
{	
	private int 	chatno; 	//채팅번호(PK) INTEGER NOT NULL
	private int 	chattype;   //채팅방 타입
	private String  chattime;   //채팅시간 datetime
	private String  nickname;	// 닉네임(FK) VARCHAR(14)
	private String  chatbody;   // 채팅내용 VARCHAR(150)
	
	public int 	  getChatno()   {	return chatno;		}
	public int	  getChattype() {	return chattype;	}
	public String getChattime() {	return chattime;	}
	public String getNickname() {	return nickname;	}
	public String getChatbody() {	return chatbody;	}

	public void setChatno   (int chatno) 		{	this.chatno = chatno;		}
	public void setChattype (int chattype) 		{	this.chattype = chattype;	}
	public void setChattime (String chattime) 	{	this.chattime = chattime;	}
	public void setNickname (String nickname) 	{	this.nickname = nickname;	}
	public void setChatbody (String chatbody) 	{	this.chatbody = chatbody;	}
	
	public void FakeData()
	{
		chatno = 1;
		chattype = 1;
		chattime = "2021.04.29 10:44:01";
		nickname = "멍멍이";
		chatbody = "이거슨 채팅 내용.";
	}
	
	public void traceInfo()
	{
		System.out.println("채팅 번호 :" + chatno);
		System.out.println("채팅 타입 :" + chattype);
		System.out.println("채팅 타임 :" + chattime);
		System.out.println("채팅 닉네임 :" + nickname);
		System.out.println("채팅 내용 :" + chatbody);
	}
	
	public static void main(String[] args) 
	{
		ChatVo vo = new ChatVo();
		vo.FakeData();
		vo.traceInfo();
	}
}
