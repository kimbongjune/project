package tv.vo;

public class ItemVo 
{

	private String seqno;   	//��¼���
	private String no;      	//�Խù� ��ȣ
	private String nickname;  	//����� ���̵�
	private String title;   	//����
	private String date;   	 	//�ۼ���
	private String hit;     	//��ȸ��	
	private String body;		//����
	private String Replacebody;	//����Ʈ������ �±� ����
	private String address; 	//���� �ּ�
	private String number;		//���� ����ó
	private String mail;    	//�̸���
	private String type;    	//����Ÿ��
	private int    boardtype;   //�Խù�Ÿ��
	private String street;		//�Խù� �ּ�(������)
	
	
	
	
	
	
	public String getSeqno() 	 {	return seqno;	  }
	public String getNo() 		 {	return no;		  }
	public String getNickname()  {	return nickname;  }
	public String getTitle() 	 {	return title;	  }
	public String getDate() 	 {	return date;	  }
	public String getHit() 		 {	return hit;	      }
	public String getBody() 	 {	return body;	  }
	public String getReplacebody() {return Replacebody;}
	public String getAddress() 	 {	return address;	  }
	public String getNumber()    {	return number;	  }
	public String getMail() 	 {	return mail;	  }
	public String getType() 	 {	return type;      }
	public int 	  getBoardtype() {	return boardtype; }
	public String getStreet() 	 {	return street;	  }
	
	
	
	public void setSeqno    (String seqno)    {	this.seqno = seqno;		  }
	public void setNo		(String no) 	  {	this.no = no;			  }
	public void setNickname (String nickname) {	this.nickname = nickname; }
	public void setTitle	 (String title)   { this.title = title;		    }
	public void setDate		 (String date) 	  {	this.date = date;		    }
	public void setHit		 (String hit) 	  {	this.hit = hit;			    }
	public void setBody		 (String body) 	  {	this.body = body;		    }
	public void setReplacebody(String replacebody) {Replacebody = replacebody;}
	public void setAddress	 (String address) {	this.address = address;     }
	public void setNumber	 (String number)  {	this.number = number;       }
	public void setMail		 (String mail)    { this.mail = mail;           }
	public void setType		 (String type) 	  { this.type = type;		    }
	public void setBoardtype (int boardtype)  { this.boardtype = boardtype; }
	public void setStreet(String street) 	  { this.street = street;		}
	
	public void FakeData()
	{
		seqno  = "0";
		no     = "1";
		nickname = "test";
		title  = "�̰��� �����Դϴ�.";
		date  = "2021-04-19 12:00:00";
		hit    = "0";
		mail  ="1";
		type = "1";
	}	
	
	public void traceInfo()
	{
		System.out.println("[�Խù� ��� ���� ����]===============");
		//System.out.println("��¼���:" + seqno);
		System.out.println("no:" + no);
		System.out.println("nickname:" + nickname);
		System.out.println("title:" + title);
		System.out.println("date:" + date);
		System.out.println("hit:" + hit);
		System.out.println("mail:" + mail);
		System.out.println("type:" + type);
		System.out.println("[�Խù� ��� ���� ����]===============");		
	}	
	
	public static void main(String[] args)
	{
		ItemVo i = new ItemVo();
		i.traceInfo();
	}
}