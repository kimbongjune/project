package tv.dto;


import java.util.Random;

import tv.dbms.DBManager;
import tv.vo.*;

public class UserDto2 extends DBManager 
{
	
	private UserVo user = null; //ȸ������
	public StringBuffer temp = null; //����

	public UserVo getUser()	{	return user; }
	
	//ȸ�� ������ ó���Ѵ�
	public void Join(UserVo item)
	{
		String code = Code();
		this.DBOpen();
		String sql = "";
				
		//�ߺ� ���̵� üũ
		sql += "select nickname from user ";
		sql += "where nickname = " + item.getNickname();
		this.OpenQuery(sql);
		
		//�ߺ����̵� �������
		if(this.Next() == false)
		{
			sql  = "insert into user ";
			sql += "(nickname,pw,mail,name,birth,gender,phonenumber,type,photo,password) ";
			sql += "values ";
			sql += "('"; 
			sql += _R(item.getNickname()) + "',md5('";
			sql += _R(item.getPassword()) + code + "'),'";
			sql += _R(item.getMail()) + "','";
			sql += _R(item.getName()) + "','";
			sql += _R(item.getBirth()) + "','";
			sql += _R(item.getGender()) + "','";
			sql += _R(item.getPhonenumber()) + "','";
			sql += "3','";
			sql += _R(item.getPhoto()) + "',";
			sql += "md5('" + code + "')";
			sql += ")";
			System.out.println(sql);
			this.CloseQuery();
			this.Excute(sql);
			this.DBClose();
			return;
		}
		
		//�ߺ����̵� �������
		this.CloseQuery();
		this.Excute(sql);
		this.DBClose();
		return;
	}
	
	public boolean Login(String id, String pw)
	{
		user = new UserVo();
		this.DBOpen();
		
		String sql = "";
		
		//�ش���̵��� Ű���� �޾ƿ´�
		String key = key(id);
		
		sql  = "select * from user ";
		sql += "where mail='" + _R(id) + "' and pw= md5('" + _R(pw+key) + "')"; 
		this.OpenQuery(sql);
		
		if(this.Next() == true)
		{
			System.out.println("�α��� ����");
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
			System.out.println("�α��� ����");
			this.CloseQuery();
			this.DBClose();
			return false;
		}
		
		this.CloseQuery();
		this.DBClose();
		return true;
	}
	
	//ȸ������ ����
	public UserVo Change(String nickname,String password, String photo)
	{
		user = new UserVo();
		this.DBOpen();
		String sql = "";
		sql += "update user set ";
		sql += "pw= md5('" + _R(password) + "'), ";
		sql += "photo='" + _R(photo) + "' ";
		sql += "where nickname='" + _R(nickname) +"'";
		System.out.println(sql);
		this.Excute(sql);
		//ȸ������ ������Ʈ
		sql = "";
		sql += "select * from user ";
		sql += "where nickname='" + _R(nickname) +"'";
		this.OpenQuery(sql);
		System.out.println(sql);
		//������Ʈ�� ���� ����Ʈ
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
	
	//PWã��
	public UserVo ChangePW(String code, String mail)
	{
		//�����޾Ƽ� ��й�ȣ�� ����
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
			sql += "pw= md5('" + _R(code) + "')";
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
			System.out.println("��ϵ� �̸��� ����");
			return vo;
		}
	}
	
	//��������
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
	
	//sql += "(nickname,pw,mail,name,birth,gender,phonenumber,type,photo,password) ";
	public static void main(String[] args)
	{
		UserDto2 dto = new UserDto2();
		/*
		 * dto.user = new UserVo(); dto.user.setNickname("����뵥����2");
		 * dto.user.setPassword("1"); dto.user.setMail("fake2");
		 * dto.user.setName("fake2"); dto.user.setBirth("930630");
		 * dto.user.setGender("����"); dto.user.setPhonenumber("01023204630");
		 * dto.user.setType("1"); dto.user.setPhoto("alt.png"); dto.Join(dto.getUser());
		 */
		
		System.out.println(dto.Login("fake2", "1"));
		
	}
}