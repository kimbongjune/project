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
		
		
		String host 	 	  = "smtp.naver.com"; 	   //smtp 주소
		final String user 	  = "nocdu112@naver.com";  // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String password = "bj9502!@#%";		   // 패스워드
	
		// SMTP 서버 정보를 설정한다.
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// 수신자 메일주소
	
			 // 메일 제목
			 message.setSubject("전주에서 뭐하지? 회원가입 인증메일입니다."); 
	
			// 메일 내용 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "회원가입을 환영합니다.<br><br>";
			 html += "인증번호는 <font color='red'> " + temp.toString() + " </font> 입니다.<br>";
			 html += "회원가입 페이지에서 인증번호를 입력해주세요.<br><br>";
			 
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
		String host           = "smtp.naver.com"; 	   //smtp 주소
		final String user     = "nocdu112@naver.com";  // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String password = "bj9502!@#%";		   // 패스워드
	
		// SMTP 서버 정보를 설정한다.
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// 수신자 메일주소
	
			 // 메일 제목
			 message.setSubject("전주에서 뭐하지? - 이메일 주소를 확인해 주세요."); 
	
			// 메일 내용 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "안녕하십니까 전주에서 뭐하지? 입니다.<br><br>";
			 html += "요청하신 이메일 정보는  <font color=\"red\">"+ email + " </font> 입니다.<br>";
			 html += "해당 이메일로 로그인 해주세요.<br><br>";
			 
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
	
	
	//비밀번호찾기
	public boolean FindPW(String mail,String code)
	{
		
		String host 		  = "smtp.naver.com"; 		//smtp 주소
		final String user     = "nocdu112@naver.com";   // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String password = "bj9502!@#%";		    // 패스워드
	
		// SMTP 서버 정보를 설정한다.
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));// 수신자 메일주소
	
			 // 메일 제목
			 message.setSubject("전주에서 뭐하지? - 비밀번호가 변경되었습니다."); 
	
			// 메일 내용 
			//message.setText("<a href ='http://localhost:8080/Food/Board/main.jsp'>" + temp.toString() + "</a>");
		
			 String html = "";
			 html  = "안녕하세요 전주에서 뭐하지? 입니다..<br><br>";
			 html += "비밀번호가 <font color='red'> " + code + " </font> 로 변경되었습니다..<br>";
			 html += "반드시 로그인 해서 비밀번호를 변경 해주시기 바랍니다.<br><br>";
			 
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
	
	
	//난수만 생성
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