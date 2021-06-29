package tv.vo;

public class ItemVo 
{

	private String seqno;   	//출력순서
	private String no;      	//게시물 번호
	private String nickname;  	//사용자 아이디
	private String title;   	//제목
	private String date;   	 	//작성일
	private String hit;     	//조회수	
	private String body;		//내용
	private String Replacebody;	//스마트에디터 태그 제거
	private String address; 	//숙소 주소
	private String number;		//숙소 연락처
	private String mail;    	//이메일
	private String type;    	//유저타입
	private int    boardtype;   //게시물타입
	private String street;		//게시물 주소(행정동)
	
	
	
	
	
	
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
		title  = "이것은 제목입니다.";
		date  = "2021-04-19 12:00:00";
		hit    = "0";
		mail  ="1";
		type = "1";
	}	
	
	public void traceInfo()
	{
		System.out.println("[게시물 목록 정보 시작]===============");
		//System.out.println("출력순서:" + seqno);
		System.out.println("no:" + no);
		System.out.println("nickname:" + nickname);
		System.out.println("title:" + title);
		System.out.println("date:" + date);
		System.out.println("hit:" + hit);
		System.out.println("mail:" + mail);
		System.out.println("type:" + type);
		System.out.println("[게시물 목록 정보 종료]===============");		
	}	
	
	public static void main(String[] args)
	{
		ItemVo i = new ItemVo();
		i.traceInfo();
	}
}