package email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.sql.DataSource;

import member.db.MemberBean;


public class SMTPAuthenticatior extends Authenticator {

	
	protected PasswordAuthentication getPasswordAuthentication() {
        
		return new PasswordAuthentication("rewardu4@gmail.com","!admin12");
	}
	
	
	
	public int sendEmail(String to, String authNum) {
		
		String from = "rewardu4@gmail.com";
		String subject = "리듀  RewardU 회원가입 이메일 인증번호 입니다.";
		String content = "<div width='200' height='300px' align='center' style='background-color: #aaa;'>";
		   content += "<h2>&nbsp;&nbsp;</h2>";
		   content += "<span style='background-color:white; color:#b44af7; font-size: 30px; font-weight: bold;'>"; 
		   content += "&nbsp; 리듀 <i>RewardU</i> &nbsp; </span>"; 
		   content += "<br><br>";
		   content += "<font size='3' color='white'>회원님의 인증번호는";
		   content += "<font size='4' color='white'> <b>"+ authNum +" </b></font>";
		   content += " 입니다.<br></font>";
		   content += "<h2>&nbsp;&nbsp;</h2>";
		   content += " </div>";
		
		Properties p = new Properties(); // 정보를 담을 객체
		 
		p.put("mail.smtp.host","smtp.gmail.com"); // Google SMTP
		 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		 
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		    
		    return 1;
		    
		} catch(Exception e){
		    e.printStackTrace();
		    System.out.println(e);
		    // 오류 발생시 뒤로 돌아가도록
		    return 0; 
		}
		
	}//sendEmail
	
	public int testsending(String user_id, String user_name, String welcomeMSG) {
		
		String from = "rewardu4@gmail.com";
		String subject = "리듀  RewardU 회원님, 환영합니다!";
		String content = welcomeMSG;
		
		Properties p = new Properties(); // 정보를 담을 객체
		 
		p.put("mail.smtp.host","smtp.gmail.com"); // Google SMTP
		 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		 
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(user_id);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		    
		    return 1;
		    
		} catch(Exception e){
		    e.printStackTrace();
		    System.out.println(e);
		    // 오류 발생시 뒤로 돌아가도록
		    return 0; 
		}
		
	}//testsending
	
	public int sendPw(String user_id, String user_pw) {
		
		String from = "rewardu4@gmail.com";
		String subject = "리듀  RewardU 회원 비밀번호 입니다.";
		String content = "<div width='200' height='300px' align='center' style='background-color: #aaa;'>";
			   content += "<h2>&nbsp;&nbsp;</h2>";
			   content += "<span style='background-color:white; color:#b44af7; font-size: 30px; font-weight: bold;'>"; 
			   content += "&nbsp; 리듀 <i>RewardU</i> &nbsp; </span>"; 
			   content += "<br><br>";
			   content += "<font size='3' color='white'>회원님의 비밀번호는 <b>"+ user_pw + " </b>입니다.<br>";
			   content += " 비밀번호를 마이페이지에서 재설정 해주시길 권장합니다.</font>";
			   content += "<h2>&nbsp;&nbsp;</h2>";
			   content += " </div>";
		
		Properties p = new Properties(); // 정보를 담을 객체
		 
		p.put("mail.smtp.host","smtp.gmail.com"); // Google SMTP
		 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		 
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(user_id);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		    
		    return 1;
		    
		} catch(Exception e){
		    e.printStackTrace();
		    System.out.println(e);
		    // 오류 발생시 뒤로 돌아가도록
		    return 0; 
		}
		
	}//testsending
	
	
	public int sendMyinfo(String to, String content){
		
		String from = "rewardu4@gmail.com";
		String subject = "리듀  RewardU의 회원이 되신 것을 축하합니다.";
		
		Properties p = new Properties(); // 정보를 담을 객체
		 
		p.put("mail.smtp.host","smtp.gmail.com"); // Google SMTP
		 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		
		try {
			Authenticator auth = new SMTPAuthenticatior();
			
			Session ses = Session.getInstance(p, auth);
			
			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject(subject); // 제목
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr); // 보내는 사람
			     
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			content = "";
			
			msg.setContent(to + content, "text/html;charset=UTF-8");
			
			BodyPart messageBodyPart = new MimeBodyPart();

	        //messageBodyPart.setText(body);
			
	        Transport.send(msg);
	        
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}//sendMyinfo
	
	
	/**
	 * Utility method to send image in email body
	 * @param session
	 * @param toEmail
	 * @param subject
	 * @param body
	 */
	public static void sendImageEmail(Session session, String toEmail, String subject, String body){
		
		try{
	         MimeMessage msg = new MimeMessage(session);
	         msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
		     msg.addHeader("format", "flowed");
		     msg.addHeader("Content-Transfer-Encoding", "8bit");
		      
		     msg.setFrom(new InternetAddress("no_reply@example.com", "NoReply-JD"));

		     msg.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

		     msg.setSubject(subject, "UTF-8");

		     msg.setSentDate(new Date());

		     msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		      
	         // Create the message body part
	         BodyPart messageBodyPart = new MimeBodyPart();

	         messageBodyPart.setText(body);
	         
	         // Create a multipart message for attachment
	         Multipart multipart = new MimeMultipart();

	         // Set text message part
	         multipart.addBodyPart(messageBodyPart);

	         // Second part is image attachment
	         messageBodyPart = new MimeBodyPart();
	         String filename = "image.png";
	         
	         DataSource source = (DataSource) new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler((javax.activation.DataSource) source));
	         messageBodyPart.setFileName(filename);
	         //Trick is to add the content-id header here
	         messageBodyPart.setHeader("Content-ID", "image_id");
	         multipart.addBodyPart(messageBodyPart);

	         //third part for displaying image in the email body
	         messageBodyPart = new MimeBodyPart();
	         messageBodyPart.setContent("<h1>Attached Image</h1>" +
	        		     "<img src='cid:image_id'>", "text/html");
	         multipart.addBodyPart(messageBodyPart);
	         
	         //Set the multipart message to the email message
	         msg.setContent(multipart);

	         // Send message
	         Transport.send(msg);
	         System.out.println("EMail Sent Successfully with image!!");
	      }catch (MessagingException e) {
	         e.printStackTrace();
	      } catch (UnsupportedEncodingException e) {
			 e.printStackTrace();
		}
	}
}