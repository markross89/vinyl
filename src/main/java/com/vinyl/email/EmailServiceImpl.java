package com.vinyl.email;


import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;



@Service
public class EmailServiceImpl implements EmailService {
	
	private final JavaMailSender emailSender;
	
	public EmailServiceImpl (JavaMailSender emailSender) {
		
		this.emailSender = emailSender;
	}
	
	@Override
	public void sendEmail (String to, String subject, String text) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("charityapp2000@gmail.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		emailSender.send(message);
	}
}