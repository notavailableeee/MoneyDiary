package codingTest;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class sendEmail {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String host = "smtp.naver.com";
		final String user = "chlwjddms0226"; //발신자의 이메일 아이디를 입력 
		final String password = "tkfkdtmfjsdhd2"; //발신자 이메일의 패스워드를 입력
		String from = "smart_98@naver.com";
		String fromName = "사거리";

		String body = String.join(
				
				System.getProperty("line.separator"),
				"<h1>새 비밀번호</h1>",
		        "<p>asl;dkhsgdfhjnk</p>."
				);
		
		Properties props = new Properties(); 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");

		Session emailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
						protected PasswordAuthentication getPasswordAuthentication() { 
						return new PasswordAuthentication(user, password); } 
						});

		try { 
			MimeMessage message = new MimeMessage(emailSession); 
			message.setFrom(new InternetAddress(user)); 
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@ktko.com")); 
			// 메일 제목 
			message.setSubject("4Way 새 비밀번호"); 
			// 메일 내용 
			message.setContent(body, "text/html;charset=UTF-8"); 
			// send the message 
			Transport.send(message); 
			System.out.println("Success Message Send"); 
			
		} catch (MessagingException e) { 
				e.printStackTrace(); 
		}
	}

}
