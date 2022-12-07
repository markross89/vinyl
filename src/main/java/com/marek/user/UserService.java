package com.marek.user;


import com.marek.MessageService;
import com.marek.role.Role;
import com.marek.role.RoleRepository;
import com.marek.token.Token;
import com.marek.token.TokenService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service
public class UserService {
	
	private final UserRepository userRepository;
	private final RoleRepository roleRepository;
	private final BCryptPasswordEncoder passwordEncoder;
	private final TokenService tokenService;
	private final MessageService messageService;
	
	public UserService (UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder,
						TokenService tokenService, MessageService messageService) {
		
		this.passwordEncoder = passwordEncoder;
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.tokenService = tokenService;
		this.messageService = messageService;
	}
	
	public User findByUsername (String username) {
		
		return userRepository.findByUsername(username);
	}
	
	public void saveUser (User user, boolean enable) {
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setPasswordRepeat(passwordEncoder.encode(user.getPasswordRepeat()));
		enableUser(user, enable);
		Role userRole = roleRepository.findByName("ROLE_USER");
		user.setRoles(new HashSet<>(List.of(userRole)));
		tokenService.createAndSendToken(user, messageService.getMessage("message.registration"),
				messageService.getMessage("message.registration.link"),
				messageService.getMessage("message.registration.subject"));
		userRepository.save(user);
	}
	
	public void enableUser (User user, boolean enable) {
		
		if (enable) {user.setEnabled(1);}
		else {user.setEnabled(0);}
	}

	public String updateUser (User user) {
		
		if (user.getPassword().equals(user.getPasswordRepeat())) {
			user.setRoles(getUserRoles(user));
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			user.setPasswordRepeat(passwordEncoder.encode(user.getPasswordRepeat()));
			userRepository.save(user);
			return messageService.getMessage("message.verification.success");
		}
		return messageService.getMessage("message.verification.failed");
	}
	
	public String verifyUserExists (String username) {
		
		User user = userRepository.findByUsername(username);
		if (user != null) {
			tokenService.createAndSendToken(user, messageService.getMessage("password.message.title"),
					messageService.getMessage("password.link"),
					messageService.getMessage("password.subject"));
			return messageService.getMessage("password.message.success");
		}
		else {
			return messageService.getMessage("password.message.email");
		}
	}
	
	public String passwordChangeConfirmation (String token) {
		
		Token newToken = tokenService.findByToken(token);
		if (newToken == null) {
			return messageService.getMessage("message.token.broken");
		}
		LocalDateTime time = LocalDateTime.now();
		LocalDateTime expirationTime = newToken.getExpireTime();
		if (expirationTime.isBefore(time)) {
			return messageService.getMessage("message.token.expired");
		}
		return token;
	}
	
	public Set<Role> getUserRoles (User user) {
		
		return userRepository.findById(user.getId()).get().getRoles();
	}
}


