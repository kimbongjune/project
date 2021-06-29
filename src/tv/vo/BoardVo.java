package tv.vo;

//�Խ����� �����ϱ� ���� Ŭ����
public class BoardVo  
{
	
	private int    no; 		 	 //�Խù���ȣ(PK)
	private int	   hit; 		 //��ȸ��
	private int    good; 		 //���ƿ�
	private int    hate; 		 //�Ⱦ��
	private int    boardtype;    //�Խ��� Ÿ��
	private int    save;    	 //�Խ��� Ÿ�� ����
	private String number; 		 //���� ����ó
	private String nickname; 	 //�г���(FK) VARCHAR(14)
	private String title; 		 //���� VARCHAR(100)
	private String body; 		 //���� text
	private String removebody;	 //����Ʈ������ �±� ������ ����
	private String date; 		 //�ۼ��� datetime 
	private String address; 	 //���� �ּ�VARCHAR(200)
	private String k;		 	 //�˻���
	private String page;	 	 //������
	private String street;		 //�Խù� �ּ�(������)
		
	
	public int 	  getNo() 		 {	return no;	       }
	public int 	  getHit() 		 {	return hit;	       }	
	public int    getGood() 	 {	return good;	   }
	public int    getHate() 	 {	return hate;	   }
	public int    getBoardtype() {	return boardtype;  }
	public int    getSave() 	 {	return save;  	   }
	public String getNumber() 	 {	return number;	   }
	public String getNickname()  {	return nickname;   }
	public String getTitle() 	 {	return title;	   }
	public String getBody() 	 {	return body;	   }
	public String getRemovebody(){	return removebody; }
	public String getDate() 	 {	return date;	   }
	public String getAddress()   {	return address;	   }
	public String getK() 		 {	return k;		   }
	public String getPage() 	 {	return page;       }
	public String getStreet() 	 {	return street;	   }
	
	
	public void setNo		 (int no) 			{	this.no = no;				}
	public void setHit		 (int hit) 			{	this.hit = hit;				}
	public void setGood		 (int good) 		{	this.good = good;			}
	public void setHate	     (int hate) 		{	this.hate = hate;			}
	public void setNumber	 (String number) 	{	this.number = number;		}
	public void setBoardtype (int boardtype) 	{	this.boardtype = boardtype;	}
	public void setSave 	 (int save) 		{	this.save = save;	        }
	public void setNickname  (String nickname)  {	this.nickname = nickname;	}
	public void setTitle     (String title) 	{	this.title = title;			}
	public void setBody	     (String body) 		{	this.body = body;			}
	public void setRemovebody(String removebody){	this.removebody = removebody;}
	public void setDate	     (String date)	 	{	this.date = date;			}
	public void setAddress   (String address) 	{	this.address = address;		}
	public void setK		 (String k) 		{	this.k = k;					}
	public void setPage		 (String page) 		{	this.page = page;			}
	public void setStreet(String street)		{	this.street = street;		}
	
	
	public void Fakedata()
	{
		no = 1;
		hit = 1;
		title = "�����Դϴ�.";
		nickname = "�ۼ���";
		body = "�����Դϴ�.";
		boardtype = 1;
		date = "2021.04.29 10:02:11";
		address = "���ֽ� ������ Ȳõ�� 15-11";
		number = "010-2320-4630";
		good = 1;
		hate = 99;
	}
	
	public void traceInfo()
	{
		System.out.println("�Խù� ���� ����");
		System.out.println("�Խù� ��ȣ :" + no);
		System.out.println("�Խù� ��ȸ�� :" + hit);
		System.out.println("�Խù� ���� :" + title);
		System.out.println("�Խù� �ۼ��� :" + nickname);
		System.out.println("�Խù� ���� :" + body);
		System.out.println("�Խù� Ÿ�� :" + boardtype);
		System.out.println("�Խù� �ۼ��� :" + date);
		System.out.println("�Խù� �ּ� :" + address);
		System.out.println("�Խù� ��ȭ��ȣ :" + number);
		System.out.println("�Խù� ���ƿ� :" + good);
		System.out.println("�Խù� �Ⱦ�� :" + hate);
		System.out.println("�Խù� ���� ����");
	}
	
	
	public static void main(String[] args) 
	{
		BoardVo vo = new BoardVo();
		/*
		vo.setNo(1);
		vo.setHit(1);
		vo.setNickname("���쿵");
		vo.setNumber("010-2320-4630");
		vo.setGood(0);
		vo.setHate(0);
		vo.setBoardtype(1);
		vo.setTitle("�̰��� �����Դϴ�.");
		vo.setBody("�̰��� �����Դϴ�.");
		vo.setDate("2021.04.29 10:02:11");
		vo.setAddress("���ֽ� ������ Ȳõ�� 15-11");
		*/
		vo.Fakedata();
		vo.traceInfo();
	}
}
