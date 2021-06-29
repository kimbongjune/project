package tv.vo;

//���� ������ �����ϱ� ���� Ŭ����
public class UserVo
{
	private String type; 		//ȸ���з�
	private String birth; 		//�������
	private String phonenumber; //�ڵ�����ȣ VARCHAR(11)
	private String password;    //��й�ȣ VARCHAR(12)
	private String photo;		//�����ʻ��� VARCHAR(256)	
	private String name;	    //�̸� VARCHAR(20)
	private String nickname;	//�г���(PK) VARCHAR(14)
	private String mail;		//�̸��� VARCHAR(20) NOT NULL
	private String gender;		//���� VARCHAR(20)
	private String sessionid;	//���Ǿ��̵� text
	private String ip;
	private int    loginblock;  //���� ���̵�� 5���̻� �α��� ���н� �α��� �ȵǰ� ����
	

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
		name = "���쿵";
		nickname = "���쿵¯";
		mail = "abc@abc.com";
		gender = "�︮����";
	}
	
	public void traceInfo()
	{
		System.out.println("ȸ�� ���� ����");
		System.out.println("ȸ�� Ÿ�� :" + type);
		System.out.println("ȸ�� ���� :" + birth);
		System.out.println("ȸ�� ��ȭ��ȣ :" + phonenumber);
		System.out.println("ȸ�� ��й�ȣ :" + password);
		System.out.println("ȸ�� �����ʻ��� :" + photo);
		System.out.println("ȸ�� �г��� :" + nickname);
		System.out.println("ȸ�� �̸� :" + name);
		System.out.println("ȸ�� ���� :" + gender);
		System.out.println("ȸ�� ���� ����");
	}
	
	public static void main(String[] args)
	{
		UserVo vo = new UserVo();
		vo.FakeData();
		vo.traceInfo();
	}
}
