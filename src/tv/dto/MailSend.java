package tv.dto;

import java.util.Properties;
import java.util.Random;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSend 
{
	public StringBuffer temp = null;
	
	public boolean send(String mail)
	{
		temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i <= 5; i++) 
		{
		    int rIndex = rnd.nextInt(2);
		    System.out.println("rIndex:" + rIndex);
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
		temp.toString();
		System.out.println(temp);
		
		
		String host 	 	  = "smtp.naver.com"; 	   //smtp �ּ�
		final String user 	  = "nocdu112@naver.com";  // ���̹��� ��� ���̹� ����, gmail��� gmail ����
		final String password = "bj9502!@#%";		   // �н�����
	
		// SMTP ���� ������ �����Ѵ�.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
	
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(user, password);
			}
		});
	
		try 
		{
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// ������ �����ּ�
	
			 // ���� ����
			 message.setSubject("���ֿ��� ������? ȸ������ ���������Դϴ�."); 
	
			// ���� ���� 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "ȸ�������� ȯ���մϴ�.<br><br>";
			 html += "������ȣ�� <font color='red'> " + temp.toString() + " </font> �Դϴ�.<br>";
			 html += "ȸ������ ���������� ������ȣ�� �Է����ּ���.<br><br>";
			 
			 message.setContent(html, "text/html; charset=utf-8");
			
			// send the message 
			Transport.send(message);
		} 
		catch (MessagingException e)
		{
			e.printStackTrace(); 
			return false;
		}	
		return true;
	}
	
	
	public boolean FindID(String mail, String email)
	{
		String host           = "smtp.naver.com"; 	   //smtp �ּ�
		final String user     = "nocdu112@naver.com";  // ���̹��� ��� ���̹� ����, gmail��� gmail ����
		final String password = "bj9502!@#%";		   // �н�����
	
		// SMTP ���� ������ �����Ѵ�.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
	
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(user, password);
			}
		});
	
		try 
		{
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// ������ �����ּ�
	
			 // ���� ����
			 message.setSubject("���ֿ��� ������? - �̸��� �ּҸ� Ȯ���� �ּ���."); 
	
			// ���� ���� 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "�ȳ��Ͻʴϱ� ���ֿ��� ������? �Դϴ�.<br><br>";
			 html += "��û�Ͻ� �̸��� ������  <font color=\"red\">"+ email + " </font> �Դϴ�.<br>";
			 html += "�ش� �̸��Ϸ� �α��� ���ּ���.<br><br>";
			 
			 message.setContent(html, "text/html; charset=utf-8");
			
			// send the message 
			Transport.send(message);
	
		} 
		catch (MessagingException e)
		{
			e.printStackTrace(); 
			return false;
		}	
		return true;
	}
	
	
	//��й�ȣã��
	public boolean FindPW(String mail,String code)
	{
		
		String host 		  = "smtp.naver.com"; 		//smtp �ּ�
		final String user     = "nocdu112@naver.com";   // ���̹��� ��� ���̹� ����, gmail��� gmail ����
		final String password = "bj9502!@#%";		    // �н�����
	
		// SMTP ���� ������ �����Ѵ�.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
	
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(user, password);
			}
		});
	
		try 
		{
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// ������ �����ּ�
	
			 // ���� ����
			 message.setSubject("���ֿ��� ������? - ��й�ȣ�� ����Ǿ����ϴ�."); 
	
			// ���� ���� 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "�ȳ��ϼ��� ���ֿ��� ������? �Դϴ�..<br><br>";
			 html += "��й�ȣ�� <font color='red'> " + code + " </font> �� ����Ǿ����ϴ�..<br>";
			 html += "�ݵ�� �α��� �ؼ� ��й�ȣ�� ���� ���ֽñ� �ٶ��ϴ�.<br><br>";
			 
			 message.setContent(html, "text/html; charset=utf-8");
			
		 
			
			// send the message 
			Transport.send(message);
	
		} 
		catch (MessagingException e)
		{
			e.printStackTrace(); 
			return false;
		}	
		return true;
	}
	
	
	//������ ����
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

	public static void main(String[] args) {}
}