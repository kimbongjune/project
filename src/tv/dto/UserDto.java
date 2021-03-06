package tv.dto;


import java.util.Random;

import tv.dbms.DBManager;
import tv.vo.*;

public class UserDto extends DBManager 
{
	final static int PER_LIST = 10;
	
	private int    total;
	private UserVo user = null; //회원정보
	public StringBuffer temp = null; //난수
	int seqno = 0;
	
	
	public int getTotal() 		    {	return total;		 }
	public void setTotal(int total) {	this.total = total;  }

	
	//중복검사 처리
	public boolean CheckNickname(UserVo item)
	{
		this.DBOpen();
		String sql = "";
				
		//중복 닉네임 체크
		sql += "select nickname from user ";
		sql += "where nickname= '" + item.getNickname() + "'";
		System.out.println(sql);
		this.OpenQuery(sql);
		if(this.Next() == true)
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	public UserListVo userlist(int pageno)
	{
		int startno = (pageno - 1) * PER_LIST;
		
		UserListVo list = new UserListVo();
		
		this.DBOpen();
		
		String sql = "";
		sql  = "select count(*) as total ";
		sql += "from user";
		
		this.OpenQuery(sql);
		this.Next();
		
		total = this.GetInt("total");
		
		this.CloseQuery();
		
		seqno = total - ((pageno - 1) * PER_LIST);
		
		sql  = "select * from user ";
		sql += "order by type ";
		sql += "limit " + startno + "," + PER_LIST + " ";
		this.OpenQuery(sql);
		
		while(this.Next() == true)
		{
			UserVo item = new UserVo();
			
			item.setNickname(this.GetValue("nickname"));
			item.setName	(this.GetValue("name"));
			item.setMail	(this.GetValue("mail"));
			item.setPassword(this.GetValue("password"));
			item.setType	(this.GetValue("type"));
			
			list.Add(item);
		}	
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	public boolean CheckMail(UserVo item)
	{
		this.DBOpen();
		String sql = "";
				
		//중복 메일 체크
		sql += "select mail from user ";
		sql += "where mail= " + "'" + item.getMail() + "'";
		System.out.println(sql);
		this.OpenQuery(sql);
		if(this.Next() == true)
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("실패");
			return false;
		}
		this.CloseQuery();
		this.DBClose();
		System.out.println("성공");
		return true;
	}
	
	//회원 가입을 처리한다
	public void Join(UserVo item)
	{
		String code = Code();
		this.DBOpen();
		String sql = "";
				
		//중복 아이디 체크
		sql += "select nickname from user ";
		sql += "where nickname = " + item.getNickname();
		this.OpenQuery(sql);
		
		//중복아이디가 없을경우
		if(this.Next() == false)
		{
			sql  = "insert into user ";
			sql += "(nickname,pw,mail,name,birth,gender,phonenumber,type,photo,password) ";
			sql += "values ";
			sql += "('"; 
			sql += _R(item.getNickname()) + "',sha2('";
			sql += _R(item.getPassword()) + code + "',256),'";
			sql += _R(item.getMail()) + "','";
			sql += _R(item.getName()) + "','";
			sql += _R(item.getBirth()) + "','";
			sql += _R(item.getGender()) + "','";
			sql += _R(item.getPhonenumber()) + "','";
			sql += "3','";
			sql += _R(item.getPhoto()) + "','";
			sql += code + "'";
			sql += ")";
			System.out.println(sql);
			this.CloseQuery();
			this.Excute(sql);
			this.DBClose();
			return;
		}
		
		//중복아이디 있을경우
		this.CloseQuery();
		this.Excute(sql);
		this.DBClose();
		return;
	}
	
	public boolean Login(String id, String pw)
	{
		user = new UserVo();
		//해당아이디의 키값을 받아온다
		String key = key(id);
		this.DBOpen();
		
		String sql = "";

		sql  = "select * from user ";
		sql += "where mail='" + _R(id) + "' and pw= sha2('" + _R(pw) + key + "',256)"; 
		this.OpenQuery(sql);
		
		if(this.Next() == true)
		{
			System.out.println("로그인 성공");
			user.setMail       (this.GetValue("mail"));
			user.setNickname   (this.GetValue("nickname"));
			user.setType       (this.GetValue("type"));
			user.setPhoto	   (this.GetValue("photo"));
			user.setName	   (this.GetValue("name"));
			user.setBirth	   (this.GetValue("birth"));
			user.setGender     (this.GetValue("gender"));
			user.setPhonenumber(this.GetValue("phonenumber"));
			user.setSessionid  (this.GetValue("sessionid"));
			user.setIp  	   (this.GetValue("ip"));
		}
		else
		{
			System.out.println(sql);
			System.out.println("로그인 실패");
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	public void Session_Ip_Insert(String sessionid, String ip, String id)
	{
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "sessionid='" + sessionid + "',";
		sql += "ip='" + ip + "' ";
		sql += "where mail='" + id +"'";
		System.out.println(sql);
		this.Excute(sql);
		this.DBClose();
	}
	
	public String Session_Ip_Check(String id) //로그인시 session/ ip 값 확인
	{
		user = new UserVo();
		this.DBOpen();
		String cs = null;
		
		String sql = "";
		sql += "select sessionid from user ";
		sql += "where mail='" + id + "'";
		this.OpenQuery(sql);
		
		if(this.Next() == true)
		{
			user.setSessionid(this.GetValue("sessionid"));
			cs = user.getSessionid();
		}
		this.CloseQuery();
		this.DBClose();
		return cs;
	}
	
	
	public int LoginBlock0(String id) //로그인 실패 몇번했는지 반환해주는 로직
	{
		user = new UserVo();
		this.DBOpen();
		int cs = 0;
		
		String sql = "";
		sql += "select loginblock from user ";
		sql += "where mail='" + id + "'";
		this.OpenQuery(sql);
		
		if(this.Next() == true)
		{
			user.setLoginblock(this.GetInt("loginblock"));
			cs = user.getLoginblock();
		}
		this.CloseQuery();
		this.DBClose();
		return cs;
	}
	public void LoginBlock1(int loginblock, String id) //로그인 실패시 로그인블락을 증가시켜주는 로직
	{
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "loginblock='" + loginblock + "' ";
		sql += "where mail='" + id +"'";
		System.out.println(sql);
		this.Excute(sql);
		this.DBClose();
	}
	
	public void LoginBlock2(String nickname) //admin.java에서 운영자가 로그인 블락을 풀어주는 로직
	{
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "loginblock=0 ";
		sql += "where nickname='" + nickname +"'";
		System.out.println(sql);
		this.Excute(sql);
		this.DBClose();
	}
	
	//회원타입 변경
	public boolean Upgrade(String type, String nickname)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "update user set ";
		sql += "type='" + _R(type) + "' ";
		sql += "where nickname='" + _R(nickname) +"'";
		System.out.println(sql);
		this.Excute(sql);
		this.DBClose();
		return true;
	}
	
	//회원정보 수정
	public UserVo Change(String nickname,String pw, String photo)
	{
		String key = key2(nickname);
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "pw= sha2('" + _R(pw) + key + "',256), ";
		sql += "photo='" + _R(photo) + "' ";
		sql += "where nickname='" + _R(nickname) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//회원정보 업데이트
		sql = "";
		sql += "select * from user ";
		sql += "where nickname='" + _R(nickname) +"'";
		this.OpenQuery(sql);
		System.out.println(sql);
		//업데이트된 정보 셀렉트
		if(this.Next() == true)
		{
			user.setMail	   (this.GetValue("mail"));
			user.setNickname   (this.GetValue("nickname"));
			user.setType	   (this.GetValue("type"));
			user.setPhoto	   (this.GetValue("photo"));
			user.setName	   (this.GetValue("name"));
			user.setBirth	   (this.GetValue("birth"));
			user.setGender	   (this.GetValue("gender"));
			user.setPhonenumber(this.GetValue("phonenumber"));
		}
		this.CloseQuery();
		this.DBClose();
		return user;
	}
	
	public UserVo Change(String nickname,String pw)
	{
		String key = key2(nickname);
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "pw= sha2('" + _R(pw) + key + "',256) ";
		sql += "where nickname='" + _R(nickname) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//회원정보 업데이트
		sql = "";
		sql += "select * from user ";
		sql += "where nickname='" + _R(nickname) +"'";
		this.OpenQuery(sql);
		System.out.println(sql);
		//업데이트된 정보 셀렉트
		if(this.Next() == true)
		{
			user.setMail	   (this.GetValue("mail"));
			user.setNickname   (this.GetValue("nickname"));
			user.setType	   (this.GetValue("type"));
			user.setPhoto	   (this.GetValue("photo"));
			user.setName	   (this.GetValue("name"));
			user.setBirth	   (this.GetValue("birth"));
			user.setGender	   (this.GetValue("gender"));
			user.setPhonenumber(this.GetValue("phonenumber"));
		}
		this.CloseQuery();
		this.DBClose();
		return user;
	}
	
	public UserVo getUser()	{	return user; }
	
	
	
	public void Admin()
	{
		this.DBOpen();
		String sql = "";
				
		sql += "select mail, nickname, type from user ";
		sql += "order by no desc limit 0,9";
		System.out.println(sql);
		this.OpenQuery(sql);
		UserVo uv = new UserVo();
		if(this.Next()==true)
		{
			uv.setMail("mail");
			uv.setNickname("nickname");
			uv.setType("type");
		}
		this.CloseQuery();
		this.DBClose();
	}
	
	public void AdminTypeChange(String type, String nickname)
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "type='" + _R(type) + "'";
		sql += " where nickname='" + _R(nickname) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		this.CloseQuery();
		this.DBClose();
	}

	public void AdminTypeChange2(String type, String id) //로그인 5번 실패시 유저타입을 4번으로 바꿔주는 로직
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "type='" + 4 + "'";
		sql += " where mail='" + _R(id) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		this.CloseQuery();
		this.DBClose();
	}
	
	public void AdminDel(String no) //게시물삭제
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update board set ";
		sql += "boardtype='5' ";
		sql += "where no='" + _R(no) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		this.CloseQuery();
		this.DBClose();
	}
	
	public void AdminDel2(String no) //게시물복원
	{
		user = new UserVo();
		this.DBOpen();
		
		String sql = "";
		
		//이전 게시물 타입 검색
		sql  = "select save from board where no='" + _R(no) + "'";
		this.OpenQuery(sql);
		this.Next();
		
		//이전 게시물 타입 저장		
		String save = this.GetValue("save");
		this.CloseQuery();
		
		//이전 게시물로 복원
		sql  = "update board set ";
		sql += "boardtype='" + _R(save) + "' ";
		sql += "where no='" + _R(no) +"'";
		
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		
		this.DBClose();
	}
	
	//ID 찾기
	public UserVo FindID(String name, String phonenumber)
	{
		UserVo vo = new UserVo();
		this.DBOpen();
		String sql = "";

		sql += "select * from user ";
		sql += "where name= '" + _R(name) + "' and ";
		sql += "phonenumber= '" + _R(phonenumber) + "' ";
		this.OpenQuery(sql);
		System.out.println(sql);
		if(this.Next() == true)
		{
			//입력받은 이름, 폰번호로 사용자 정보 select 후 vo에 저장
			vo.setName(this.GetValue("name"));
			vo.setPhonenumber(this.GetValue("phonenumber"));
			vo.setMail(this.GetValue("mail"));
			this.CloseQuery();
			this.DBClose();
			return vo;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("데이터 없음");
		}
		this.CloseQuery();
		this.DBClose();
		return vo;
	}
	
	//PW찾기
	public UserVo ChangePW(String code, String mail)
	{
		//난수받아서 비밀번호로 변경
		UserVo vo = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "select mail from user ";
		sql += "where mail= '" + _R(mail) + "'";
		this.OpenQuery(sql);
		System.out.println(sql);
		
		if(this.Next() == true)
		{
			sql = "";
			sql += "update user set ";
			sql += "pw= sha2('" + _R(code) + "',256)";
			sql += " where mail='" + _R(mail) +"'";
			System.out.println(sql);
			vo.setMail(this.GetValue("mail"));
			this.Excute(sql);
			this.CloseQuery();
			this.DBClose();
			return vo;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("등록된 이메일 없음");
			return vo;
		}
	}
	//비밀번호 찾기시 필요한 메일값 리턴(vo)
	public UserVo ChangePW1(String name, String mail)
	{
		//난수받아서 비밀번호로 변경
		UserVo vo = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "select mail,name from user ";
		sql += "where mail= '" + _R(mail) + "' and ";
		sql += "name= '" + _R(name) + "' ";
		this.OpenQuery(sql);
		System.out.println(sql);
		
		if(this.Next() == true)
		{
			System.out.println(sql);
			vo.setMail(this.GetValue("mail"));
			vo.setName(this.GetValue("name"));
			//System.out.println(name);
			//System.out.println(mail);
			this.CloseQuery();
			this.DBClose();
			return vo;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("등록된 이메일 없음");
			return vo;
		}
	}
	
	public void ChatTrue(String nickname) //채팅유저입
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "chattrue='1' ";
		sql += "where nickname='" + nickname +"'";
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		this.CloseQuery();
		this.DBClose();
	}
	
	public void ChatFalse(String nickname) //채팅유저나감
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "chattrue='0' ";
		sql += "where nickname='" + nickname +"'";
		System.out.println(sql);
		this.Excute(sql);
		//업데이트된 정보 셀렉트
		this.CloseQuery();
		this.DBClose();
	}
	
	public boolean nickcheck(String nickname)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "select nickname from user  ";
		sql += "where nickname='" + nickname + "'";
		
		this.OpenQuery(sql);
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	public boolean mailcheck(String mail)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "select mail from user  ";
		sql += "where mail='" + _R(mail) + "'";
		
		System.out.println(sql);
		this.OpenQuery(sql);
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	public boolean pwcheck(String nickname, String pw)
	{
		String key = key2(nickname);
		
		this.DBOpen();
		String sql = "";
		sql += "select mail from user ";
		sql += "where nickname='" + nickname + "' and pw=sha2('"+ _R(pw) + key +"',256)";
		System.out.println(sql);
		this.OpenQuery(sql);
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return true;
		}else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
	}
	//난수생성
	public String Code()
	{
		temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i <= 5; i++) 
		{
		    int rIndex = rnd.nextInt(2);
		   // System.out.println("rIndex:" + rIndex);
		    switch (rIndex) 
		    {
			    case 0:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 1:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
		    }
		}
		return temp.toString();
	}
	//난수가져오기
	public String key(String id)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "select password from user ";
		sql += "where mail='" + id + "'";
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		String key = this.GetValue("password");
		System.out.println(key);
		
		this.CloseQuery();
		this.DBClose();
		return key;
	}
	
	public String key2(String id)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "select password from user ";
		sql += "where nickname='" + id + "'";
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.Next();
		
		String key = this.GetValue("password");
		System.out.println(key);
		
		this.CloseQuery();
		this.DBClose();
		return key;
	}
	public static void main(String[] args){}
}