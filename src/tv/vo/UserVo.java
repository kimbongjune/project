package tv.vo;

//유저 정보를 관리하기 위한 클래스
public class UserVo
{
	private String type; 		//회원분류
	private String birth; 		//생년월일
	private String phonenumber; //핸드폰번호 VARCHAR(11)
	private String password;    //비밀번호 VARCHAR(12)
	private String photo;		//프로필사진 VARCHAR(256)	
	private String name;	    //이름 VARCHAR(20)
	private String nickname;	//닉네임(PK) VARCHAR(14)
	private String mail;		//이메일 VARCHAR(20) NOT NULL
	private String gender;		//성별 VARCHAR(20)
	private String sessionid;	//세션아이디 text
	private String ip;
	private int    loginblock;  //같은 아이디로 5번이상 로그인 실패시 로그인 안되게 막기
	

	public String getType() 	   {	return type;		}
	public String getBirth() 	   {	return birth;		}
	public String getPhonenumber() {	return phonenumber;	}
	public String getPassword()    {	return password;	}
	public String getPhoto() 	   {	return photo;		}
	public String getName() 	   {	return name;		}
	public String getNickname()    {	return nickname;	}
	public String getMail() 	   {	return mail;		}
	public String getGender() 	   {	return gender;		}
	public String getSessionid()   {    return sessionid;	}
	public String getIp() 		   {	return ip;			}
	public int    getLoginblock()  {    return loginblock;  }
	
	
	
	public void setType		   (String type) 		{	this.type = type;	            }
	public void setBirth       (String birth) 		{	this.birth = birth;				}
	public void setPhonenumber (String phonenumber) {	this.phonenumber = phonenumber;	}
	public void setPassword	   (String password) 	{	this.password = password;		}
	public void setPhoto       (String photo) 		{	this.photo = photo;				}
	public void setName		   (String name) 		{	this.name = name;				}
	public void setNickname	   (String nickname) 	{	this.nickname = nickname;		}
	public void setMail		   (String mail) 		{	this.mail = mail;				}
	public void setGender	   (String gender) 		{	this.gender = gender;			}
	public void setSessionid   (String sessionid)   {	this.sessionid = sessionid;		}
	public void setIp		   (String ip) 			{	this.ip = ip;					}
	public void setLoginblock  (int loginblock)     {   this.loginblock = loginblock;   }
	
	public void FakeData()
	{
		type = "1";
		birth = "930630";
		phonenumber = "010-2320-4630";
		password = "1234";
		photo = "alt.jpg";	
		name = "강우영";
		nickname = "강우영짱";
		mail = "abc@abc.com";
		gender = "헬리콥터";
	}
	
	public void traceInfo()
	{
		System.out.println("회원 정보 시작");
		System.out.println("회원 타입 :" + type);
		System.out.println("회원 생일 :" + birth);
		System.out.println("회원 전화번호 :" + phonenumber);
		System.out.println("회원 비밀번호 :" + password);
		System.out.println("회원 프로필사진 :" + photo);
		System.out.println("회원 닉네임 :" + nickname);
		System.out.println("회원 이름 :" + name);
		System.out.println("회원 성별 :" + gender);
		System.out.println("회원 정보 종료");
	}
	
	public static void main(String[] args)
	{
		UserVo vo = new UserVo();
		vo.FakeData();
		vo.traceInfo();
	}
}
