package tv.dto;

import tv.dbms.DBManager;
import tv.vo.*;

//데이터 베이스와 게시판을 관리하기 위한 클래스
public class BoardDto  extends DBManager
{
	
	private int no;  //추가된 게시물의 번호
	
	
	public int getNo() { return no; }
	
	String sql = "";
	
	//정보 게시판 게시글 작성을 위한 메소드
	public boolean NewsWrite(BoardVo item) 
	{
		this.DBOpen();
		
		sql  = "insert into board ";
		sql += "(title,body,replacebody,nickname,boardtype,save) ";
		sql += "values ";
		sql += "(";
		sql += "'" + _R(item.getTitle()) + "',";
		sql += "'" + item.getBody() + "',";
		sql += "'" + _R(_Rbody(item.getBody())) + "',";
		sql += "'" + _R(item.getNickname()) + "',";
		sql += "1,";
		sql += "1";
		sql += ")";
		
		this.Excute(sql);
		
		//추가된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.no = this.GetInt("no");
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		
		return true;
	}
	
	
	//뭐하지 게시판 게시글 작성을 위한 메소드
	public boolean EnjoyWrite(BoardVo item) 
	{
		this.DBOpen();
		
		sql  = "insert into board ";
		sql += "(title,body,replacebody,nickname,address,street,number,boardtype,save) ";
		sql += "values ";
		sql += "(";
		sql += "'" + _R(item.getTitle()) + "',";
		sql += "'" + item.getBody() + "',";
		sql += "'" + _R(_Rbody(item.getBody())) + "',";
		sql += "'" + _R(item.getNickname()) + "',";
		sql += "'" + _R(item.getAddress()) + "',";
		sql += "'" + _R(_Raddress((item.getAddress()))) + "',";
		sql += "'" + _R(item.getNumber()) + "',";
		sql += "2,";
		sql += "2";
		sql += ")";
		
		this.Excute(sql);
		
		//추가된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.no = this.GetInt("no");
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	
	//숙소정보 게시판 게시글 작성을 위한 메소드
	public boolean RoomWrite(BoardVo item) 
	{
		this.DBOpen();
		
		sql  = "insert into board ";
		sql += "(title,body,replacebody,nickname,address,street,number,boardtype,save) ";
		sql += "values ";
		sql += "(";
		sql += "'" + _R(item.getTitle()) + "',";
		sql += "'" + item.getBody() + "',";
		sql += "'" + _R(_Rbody(item.getBody())) + "',";
		sql += "'" + _R(item.getNickname()) + "',";
		sql += "'" + _R(item.getAddress()) + "',";
		sql += "'" + _R(_Raddress((item.getAddress()))) + "',";
		sql += "'" + _R(item.getNumber()) + "',";
		sql += "3,";
		sql += "3";
		sql += ")";
		
		this.Excute(sql);
		
		//추가된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.no = this.GetInt("no");
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	
	//숙소정보 게시판 게시글 작성을 위한 메소드
	public boolean ComWrite(BoardVo item) 
	{
		this.DBOpen();
		
		sql  = "insert into board ";
		sql += "(title,body,replacebody,nickname,boardtype,save) ";
		sql += "values ";
		sql += "(";
		sql += "'" + _R(item.getTitle()) + "',";
		sql += "'" + item.getBody() + "',";
		sql += "'" + _R(_Rbody(item.getBody())) + "',";
		sql += "'" + _R(item.getNickname()) + "',";
		sql += "4,";
		sql += "4";
		sql += ")";
		
		this.Excute(sql);
		
		//추가된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.no = this.GetInt("no");
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	
	//소식게시판 뷰페이지를 위한 클래스
	public BoardVo NewsView(int no)
	{
		BoardVo vo = new BoardVo();
		
		this.DBOpen();
		
		sql  = "select no,title,nickname,hit,body,replacebody,date ";
		sql += "from board ";
		sql += "where boardtype=1 and no = " + no;
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			vo.setNo	  (this.GetInt("no"));
			vo.setHit	  (this.GetInt("hit"));
			vo.setTitle	  (this.GetValue("title"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setBody	  (this.GetValue("body"));
			vo.setRemovebody(this.GetValue("Replacebody"));
			vo.setDate	  (this.GetValue("Date"));
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("실패함");
		}
		
		this.CloseQuery();
		
		//조회수를 증가시킨다.
		sql  = "update board set hit = hit + 1 ";
		sql += "where boardtype=1 and no = " + no;
		this.Excute(sql);
		
		this.DBClose();
		
		return vo;
	}
	
	
	//뭐하지게시판 뷰페이지를 위한 클래스
	public BoardVo EnjoyView(int no)
	{
		BoardVo vo = new BoardVo();
		
		this.DBOpen();
		
		sql  = "select no,title,nickname,hit,body,replacebody,good,hate,date,address,number ";
		sql += "from board ";
		sql += "where no = " + no;
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			vo.setNo	  (this.GetInt("no"));
			vo.setHit	  (this.GetInt("hit"));
			vo.setTitle	  (this.GetValue("title"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setBody	  (this.GetValue("body"));
			vo.setRemovebody(this.GetValue("Replacebody"));
			vo.setGood	  (this.GetInt("good"));
			vo.setHate	  (this.GetInt("hate"));
			vo.setDate	  (this.GetValue("Date"));
			vo.setAddress (this.GetValue("address"));
			vo.setNumber  (this.GetValue("number"));
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("실패함");
		}
		
		this.CloseQuery();
		
		//조회수를 증가시킨다.
		sql  = "update board set hit = hit + 1 ";
		sql += "where no = " + no;
		this.Excute(sql);
		
		this.DBClose();
		
		return vo;
	}
	
	
	//숙소정보게시판 뷰페이지를 위한 클래스
	public BoardVo RoomView(int no)
	{
		BoardVo vo = new BoardVo();
		
		this.DBOpen();
		
		sql  = "select no,title,nickname,hit,body,replacebody,good,hate,address,number,date ";
		sql += "from board ";
		sql += "where no = " + no;

		this.OpenQuery(sql);
		
		if(this.Next())
		{
			vo.setNo	  (this.GetInt("no"));
			vo.setHit	  (this.GetInt("hit"));
			vo.setTitle	  (this.GetValue("title"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setBody	  (this.GetValue("body"));
			vo.setRemovebody(this.GetValue("Replacebody"));
			vo.setGood	  (this.GetInt("good"));
			vo.setHate	  (this.GetInt("hate"));
			vo.setAddress (this.GetValue("address"));
			vo.setNumber  (this.GetValue("number"));
			vo.setDate    (this.GetValue("Date"));
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("실패함");
		}
		
		this.CloseQuery();
		
		//조회수를 증가시킨다.
		sql = "update board set hit = hit + 1 ";
		sql += "where no = " + no;
		
		this.Excute(sql);
		
		this.DBClose();
		
		return vo;
	}
	
	
	public BoardVo ComView(int no)
	{
		BoardVo vo = new BoardVo();
		
		this.DBOpen();
		
		sql  = "select * ";
		sql += "from board ";
		sql += "where no = " + no;
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			vo.setNo	  (this.GetInt("no"));
			vo.setHit	  (this.GetInt("hit"));
			vo.setTitle	  (this.GetValue("title"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setBody	  (this.GetValue("body"));
			vo.setRemovebody(this.GetValue("Replacebody"));
			vo.setDate	  (this.GetValue("date"));
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("실패함");
		}
		
		this.CloseQuery();
		
		//조회수를 증가시킨다.
		sql  = "update board set hit = hit + 1 ";
		sql += "where no = " + no;
		
		this.Excute(sql);
		
		this.DBClose();
		
		return vo;
	}
	
	
	public boolean NewsUpdate(BoardVo item)
	{
		this.DBOpen();
		
		sql  = "update board set ";
		sql += "title = '" + _R(item.getTitle()) + "',";
		sql += "body = '" + item.getBody() + "',";
		sql += "replacebody = '" + _R(_Rbody(item.getBody())) + "'" +" ";
		sql += "where no = " + item.getNo();
		System.out.println(sql);
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public boolean EnjoyUpdate(BoardVo item)
	{
		this.DBOpen();
		
		sql  = "update board set ";
		sql += "title = '" + _R(item.getTitle()) + "',";
		sql += "body = '" + item.getBody() + "',";
		sql += "replacebody = '" + _R(_Rbody(item.getBody())) + "'" +", ";
		sql += "street = '" + _R(_Raddress((item.getAddress()))) + "' ";
		sql += "where no = " + item.getNo();

		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public boolean RoomUpdate(BoardVo item)
	{
		this.DBOpen();
		
		sql  = "update board set ";
		sql += "title = '" + _R(item.getTitle()) + "',";
		sql += "body = '" + item.getBody() + "',";
		sql += "replacebody = '" + _R(_Rbody(item.getBody())) + "', ";
		sql += "address = '" + _R(item.getAddress()) + "',";
		sql += "number = '" + _R(item.getNumber()) + "', ";
		sql += "street = '" + _R(_Raddress((item.getAddress()))) + "' ";
		sql += "where no = " + item.getNo();

		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public boolean ComUpdate(BoardVo item)
	{
		this.DBOpen();
		
		sql  = "update board set ";
		sql += "title = '" + _R(item.getTitle()) + "',";
		sql += "body = '" + item.getBody() + "',";
		sql += "replacebody = '" + _R(_Rbody(item.getBody())) + "'" +" ";
		sql += "where no = " + item.getNo();
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public boolean Del(int no)
	{
		this.DBOpen();
		
		sql  = "update board set ";
		sql += "boardtype = 5 ";
		sql += "where no=" + no;

		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	//좋아요,싫어요 셀렉트.
	public boolean good(int no, String nickname)
	{
		this.DBOpen();
		
		sql  = "select no, nickname, liketype ";
		sql += "from agree ";
		sql += "where no=" + no +" and nickname='" + nickname +"' ";

		this.OpenQuery(sql);
		
		if( this.Next() == false )
		{
			//안눌렀을시 클릭한 값 업데이트
			sql  =  "";
			sql += "insert into agree (no, nickname, liketype) ";
			// liketype--- 0 >>> 안누름   1 >>>>> 누름
			sql += "values (" + no + ", '" + nickname + "', 1) ";
			
			this.Excute(sql);

			sql  = "";
			sql += "update board set ";
			sql += "good = good + 1" + " ";  
			sql += " where no=" + no +"" ;
			
			this.Excute(sql);
		}
		else
		{
			//이미 누른사람의 liketype을 1로 만듦 (3번이상 눌렀을시)
			if(this.GetInt("liketype") == 0)
			{
				sql  = "";
				sql += "update agree set ";
				sql += "liketype = 1 ";
				sql += "where no='" + no +"' and nickname='" + nickname +"' ";
				
				this.Excute(sql);

				sql  = "";
				sql += "update board set ";
				sql += "good = good + 1" + " ";
				sql += " where no=" + no +"" ;
				
				this.Excute(sql);
				this.DBClose();
				return true;
			}
			//이미 눌렀을시 좋아요 타입을 0으로 업데이트 (2번째 눌렀을시)
			sql  = "";
			sql += "update agree set ";
			sql += "liketype = 0 ";
			sql += "where no=" + no +" and nickname='" + nickname +"' ";
			
			this.Excute(sql);

			sql  = "";
			sql += "update board set ";
			sql += "good = good - 1" + " ";
			sql += " where no=" + no +"" ;
			
			this.Excute(sql);
		}
		this.DBClose();
		
		return true;
	}
	
	
	public boolean hate(int no, String nickname)
	{
		this.DBOpen();
		
		sql  = "select no, nickname, hatetype ";
		sql += "from agree ";
		sql += "where no=" + no +" and nickname='" + nickname +"'";
		
		this.OpenQuery(sql);
		
		if( this.Next() == false )
		{
			//안눌렀을시 클릭한 값 업데이트
			sql =  "";
			sql += "insert into agree (no, nickname, hatetype) ";
			// hatetype--- 0 >>> 안누름   1 >>>>> 누름
			sql += "values (" + no + ", '" + nickname + "', 1) ";
			
			this.Excute(sql);

			sql  = "";
			sql += "update board set ";
			sql += "hate = hate + 1" + " ";
			sql += " where no=" + no +"" ;
			
			this.Excute(sql);
			
		}
		else
		{
			//이미 누른사람의 hatetype을 1로 만듦 (3번이상 눌렀을시)
			if(this.GetInt("hatetype") == 0)
			{
				sql  = "";
				sql += "update agree set ";
				sql += "hatetype = 1 ";
				sql += "where no='" + no +"' and nickname='" + nickname +"' ";
				
				this.Excute(sql);

				sql  = "";
				sql += "update board set ";
				sql += "hate = hate + 1" + " "; 
				sql += " where no=" + no +"" ;
				
				this.Excute(sql);
				this.DBClose();
				return true;
			}
			//이미 눌렀을시 좋아요 타입을 0으로 업데이트 (2번째 눌렀을시)
			sql  = "";
			sql += "update agree set ";
			sql += "hatetype = 0 ";
			sql += "where no=" + no +" and nickname='" + nickname +"' ";
			
			this.Excute(sql);
			
			sql  = "";
			sql += "update board set ";
			sql += "hate = hate - 1" + " ";  
			sql += " where no=" + no +"" ;
			
			this.Excute(sql);
		}
		this.DBClose();
		
		return true;
	}
	
	
	//첨부파일 삽입을 위한 클래스
	public boolean Attach(int no , String filename)
	{
		this.DBOpen();
		
		sql  = "insert into attach ";
		sql += "(no,attachname) ";
		sql += "values ";
		sql += "(" + no + ",'" + filename + "')";
		System.out.println(sql);
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	//첨부파일 갯수를 가져오기 위한 메소드
	public String Attach(int no)
	{
		this.DBOpen();
		
		sql  = "select count(*) from attach ";
		sql += "where no = " + no;
		
		this.OpenQuery(sql);
		
		this.Next();
		
		String count = this.GetValue("count(*)");
		
		this.CloseQuery();
		this.DBClose();
		
		return count;
	}
	
	
	//첨부파일 를 가져오기 위한 메소드
	public String ViewAttach(String no)
	{
		this.DBOpen();
		
		sql  = "select * from attach ";
		sql += "where no = " + no;
		
		//System.out.println(sql);
		this.OpenQuery(sql);
		
		this.Next();
		
		String fname = this.GetValue("attachname");
		
		this.CloseQuery();
		this.DBClose();
		
		return fname;
	}
	//첨부파일 를 가져오기 위한 메소드
		public String ViewAttach(int no)
		{
			this.DBOpen();
			
			sql  = "select * from attach ";
			sql += "where no = " + no;
			
			//System.out.println(sql);
			this.OpenQuery(sql);
			
			this.Next();
			
			String fname = this.GetValue("attachname");
			
			this.CloseQuery();
			this.DBClose();
			
			return fname;
		}
	

	//첨부파일 수정을 위한 메소드
	public boolean ModAttach(int no, int fno0, String fname)
	{
		this.DBOpen();
		
		sql  = "update attach set ";
		sql += "attachname ='" + fname + "' ";
		sql += "where no=" + no + " and attachno=" + fno0;
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public boolean ModAttach(int no, String fname)
	{
		this.DBOpen();
		
		sql  = "insert into attach ";
		sql += "(no,attachname) ";
		sql += "values ";
		sql += "(" + no + ",'" + fname + "')";
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	//첨부파일 삭제를 위한 메소드
	public boolean DelAttach(int no, int fno)
	{
		this.DBOpen();
		
		sql  = "delete from attach ";
		sql += "where no=" + no + " and attachno=" + fno;
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}

	
	//댓글 삽입을 위한 메소드
	public boolean Comment(ReplyVo item)
	{
		this.DBOpen();
		
		sql  = "insert into comment ";
		sql += "(no,nickname,combody) ";
		sql += "values ";
		sql += "(" + item.getNo() + ",'" + item.getNickname() + "','" + item.getCombody() + "')";
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	//댓글 수정을 위한 메소드
	public boolean ModComment(ReplyVo item)
	{
		this.DBOpen();
		
		sql  = "update comment set ";
		sql += "combody= '" + item.getCombody() + "'";
		sql += "where no=" + item.getNo() + " and comno=" + item.getComno();
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	//댓글을 삭제하기 위한 메소드
	public boolean DelComment(int no, int Comno)
	{
		this.DBOpen();
		
		sql  = "delete from comment ";
		sql += "where no=" + no + " and comno=" + Comno;
		
		this.Excute(sql);
		
		this.DBClose();
		
		return true;
	}
	
	
	public static void main(String[] args) {}
}