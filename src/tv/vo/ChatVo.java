package tv.vo;

//ä�� �α׸� �����ϱ� ���� Ŭ����
public class ChatVo 
{	
	private int 	chatno; 	//ä�ù�ȣ(PK) INTEGER NOT NULL
	private int 	chattype;   //ä�ù� Ÿ��
	private String  chattime;   //ä�ýð� datetime
	private String  nickname;	// �г���(FK) VARCHAR(14)
	private String  chatbody;   // ä�ó��� VARCHAR(150)
	
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
		nickname = "�۸���";
		chatbody = "�̰Ž� ä�� ����.";
	}
	
	public void traceInfo()
	{
		System.out.println("ä�� ��ȣ :" + chatno);
		System.out.println("ä�� Ÿ�� :" + chattype);
		System.out.println("ä�� Ÿ�� :" + chattime);
		System.out.println("ä�� �г��� :" + nickname);
		System.out.println("ä�� ���� :" + chatbody);
	}
	
	public static void main(String[] args) 
	{
		ChatVo vo = new ChatVo();
		vo.FakeData();
		vo.traceInfo();
	}
}
