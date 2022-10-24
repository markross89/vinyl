package com.zosia.zosia.token;

import com.zosia.zosia.email.EmailServiceImpl;
import com.zosia.zosia.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.transaction.Transactional;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.UUID;


@Service
public class TokenService {
	
	private final TokenRepository tokenRepository;
	private final EmailServiceImpl emailService;
	
	@Autowired
	public TokenService (TokenRepository tokenRepository, EmailServiceImpl emailService) {
		
		this.tokenRepository = tokenRepository;
		this.emailService = emailService;
	}
	
	@Transactional
	public Token findByToken (String token) {
		
		return tokenRepository.findByToken(token);
	}
	
	@Transactional
	public void saveToken (String token, User user) {
		
		Token activationToken = new Token(token, user);
		activationToken.setExpireTime(calculateExpiryTime());
		tokenRepository.save(activationToken);
	}
	
	private LocalDateTime calculateExpiryTime () {
		
		return LocalDateTime.now().plus(Duration.of(20, ChronoUnit.MINUTES));
	}
	
	public void createAndSendToken (User user, String message, String link, String subject) {
		
		try {
			String token = UUID.randomUUID().toString();
			saveToken(token, user);
			String body = message+link+token;
			emailService.sendEmail(user.getUsername(), subject, body);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
