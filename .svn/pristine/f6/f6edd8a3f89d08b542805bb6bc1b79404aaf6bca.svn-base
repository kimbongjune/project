package tv.vo;

//게시판을 관리하기 위한 클래스
public class BoardVo  
{
	
	private int    no; 		 	 //게시물번호(PK)
	private int	   hit; 		 //조회수
	private int    good; 		 //좋아요
	private int    hate; 		 //싫어요
	private int    boardtype;    //게시판 타입
	private int    save;    	 //게시판 타입 저장
	private String number; 		 //숙소 연락처
	private String nickname; 	 //닉네임(FK) VARCHAR(14)
	private String title; 		 //제목 VARCHAR(100)
	private String body; 		 //내용 text
	private String removebody;	 //스마트에디터 태그 제거한 내용
	private String date; 		 //작성일 datetime 
	private String address; 	 //숙소 주소VARCHAR(200)
	private String k;		 	 //검색값
	private String page;	 	 //페이지
	private String street;		 //게시물 주소(행정동)
		
	
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
		title = "제목입니다.";
		nickname = "작성자";
		body = "내용입니다.";
		boardtype = 1;
		date = "2021.04.29 10:02:11";
		address = "전주시 덕진구 황천길 15-11";
		number = "010-2320-4630";
		good = 1;
		hate = 99;
	}
	
	public void traceInfo()
	{
		System.out.println("게시물 정보 시작");
		System.out.println("게시물 번호 :" + no);
		System.out.println("게시물 조회수 :" + hit);
		System.out.println("게시물 제목 :" + title);
		System.out.println("게시물 작성자 :" + nickname);
		System.out.println("게시물 내용 :" + body);
		System.out.println("게시물 타입 :" + boardtype);
		System.out.println("게시물 작성일 :" + date);
		System.out.println("게시물 주소 :" + address);
		System.out.println("게시물 전화번호 :" + number);
		System.out.println("게시물 좋아요 :" + good);
		System.out.println("게시물 싫어요 :" + hate);
		System.out.println("게시물 정보 종료");
	}
	
	
	public static void main(String[] args) 
	{
		BoardVo vo = new BoardVo();
		/*
		vo.setNo(1);
		vo.setHit(1);
		vo.setNickname("강우영");
		vo.setNumber("010-2320-4630");
		vo.setGood(0);
		vo.setHate(0);
		vo.setBoardtype(1);
		vo.setTitle("이것은 제목입니다.");
		vo.setBody("이것은 내용입니다.");
		vo.setDate("2021.04.29 10:02:11");
		vo.setAddress("전주시 덕진구 황천길 15-11");
		*/
		vo.Fakedata();
		vo.traceInfo();
	}
}
