package com.marek.registration;

import com.marek.MessageService;
import com.marek.token.Token;
import com.marek.token.TokenService;
import com.marek.user.User;
import com.marek.user.UserRepository;
import com.marek.user.UserService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;


@Service
public class RegistrationService {
	
	private final UserRepository userRepository;
	private final UserService userService;
	private final TokenService tokenService;
	private final MessageService messageService;
	
	public RegistrationService (UserRepository userRepository, UserService userService, TokenService tokenService, MessageService messageService) {
		
		this.userRepository = userRepository;
		this.userService = userService;
		this.tokenService = tokenService;
		this.messageService = messageService;
	}
	
	public String registerUser (User user) {
		
		for (User u : userRepository.findAll()) {
			if (u.getUsername().equals(user.getUsername())) {
				return messageService.getMessage("message.email.exist");
			}
		}
		if (user.getPassword().equals(user.getPasswordRepeat())) {
			userService.saveUser(user, false);
			return messageService.getMessage("message.successful.registration");
		}
		return messageService.getMessage("message.wrong");
	}
	
	public String emailConfirmation (String token) {
		
		Token newToken = tokenService.findByToken(token);
		if (newToken == null) {
			return messageService.getMessage("message.token.broken");
		}
		else {
			LocalDateTime time = LocalDateTime.now();
			LocalDateTime expirationTime = newToken.getExpireTime();
			if (expirationTime.isBefore(time)) {
				return messageService.getMessage("message.token.expired");
			}
			else {
				User user = tokenService.findByToken(token).getUser();
				if (user.getEnabled() == 0) {
					user.setEnabled(1);
					userRepository.save(user);
					return messageService.getMessage("message.verification.successful");
				}
				else {
					return messageService.getMessage("message.already.done");
				}
			}
		}
	}
}
