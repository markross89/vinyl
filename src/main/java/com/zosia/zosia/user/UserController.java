package com.zosia.zosia.user;

import com.zosia.zosia.role.RoleRepository;
import com.zosia.zosia.token.TokenService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.validation.Valid;


@Controller

public class UserController {
	
	private final UserService userService;
	private final UserRepository userRepository;
	private final TokenService tokenService;
	private final RoleRepository roleRepository;
	
	public UserController (UserService userService, UserRepository userRepository,
						   TokenService tokenService, RoleRepository roleRepository) {
		
		this.userService = userService;
		this.userRepository = userRepository;
		this.tokenService = tokenService;
		this.roleRepository = roleRepository;
	}
	
	@GetMapping("/profile")
	public String showProfile (Model model, @AuthenticationPrincipal CurrentUser customUser) {
		
		model.addAttribute("user", customUser.getUser());
		return "/login/userDataUpdate";
	}
	
	@PostMapping("/profile")
	public String updateUser (@Valid User user, BindingResult result, Model model) {
		
		if (!result.hasErrors()) {
			model.addAttribute("message", userService.updateUser(user));
			return "login/messageRegistration";
		}
		return "/login/userDataUpdate";
	}
	
	@GetMapping("/admin")
	public String userIndex (Model model, @AuthenticationPrincipal CurrentUser customUser) {
		
		model.addAttribute("user", customUser.getUser());
		model.addAttribute("users", userRepository.findAll());
		return "/user/admin";
	}
	
	@GetMapping("/editCredentials/{id}")
	public String editCredentials (@PathVariable Long id, Model model) {
		
		model.addAttribute("user", userRepository.findById(id).get());
		model.addAttribute("roles", roleRepository.findAll());
		return "/user/editCredentials";
	}
	
	@PostMapping("/editCredentials")
	public String saveCredentials (@Valid User user, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("roles", roleRepository.findAll());
			return "/user/editCredentials";
		}
		return userService.updateUserCredentials(user);
	}
	
	@PostMapping("/changePassword")
	public String sendLink (@RequestParam String username, Model model) {
		
		model.addAttribute("message", userService.verifyUserExists(username));
		return "login/messageRegistration";
	}
	
	@GetMapping("/password")
	public String passwordForm (@RequestParam String token, Model model) {
		
		if (userService.passwordChangeConfirmation(token).equals(token)) {
			model.addAttribute("user", tokenService.findByToken(token).getUser());
			return "/login/passwordUpdate";
		}
		model.addAttribute("message", userService.passwordChangeConfirmation(token));
		return "login/messageRegistration";
	}
	
	@PostMapping("/password")
	public String passwordReset (@Valid User user, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("message", userService.updateUserPassword(user));
			return "login/messageRegistration";
		}
		return "/login/passwordUpdate";
	}
}