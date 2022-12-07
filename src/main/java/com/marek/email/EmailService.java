package com.marek.email;

public interface EmailService {
	
	void sendEmail (String to, String subject, String message);
	
}
