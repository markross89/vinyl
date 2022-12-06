package com.vinyl.user;

import com.vinyl.role.RoleRepository;
import com.vinyl.token.TokenService;
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
	
	public UserController (UserService userService, UserRepository userRepository, TokenService tokenService, RoleRepository roleRepository) {
		
		this.userService = userService;
		this.userRepository = userRepository;
		this.tokenService = tokenService;
		this.roleRepository = roleRepository;
	}
	
	@GetMapping("/profile")
	public String showProfile (Model model, @AuthenticationPrincipal CurrentUser customUser) {
		
		model.addAttribute("user", customUser.getUser());
		return "/user_data_update";
	}
	
	@PostMapping("/profile")
	public String updateUser (@Valid User user, BindingResult result, Model model) {
		
		if (!result.hasErrors()) {
			model.addAttribute("message", userService.updateUser(user));
			
			return "info_page";
		}
		return "/user_data_update";
	}
	
	@GetMapping("/users_index")
	public String userIndex (Model model) {
		
		model.addAttribute("users", userRepository.findAll());
		return "/users_index";
	}
	
	@GetMapping("/edit_credentials/{id}")
	public String editCredentials (@PathVariable Long id, Model model) {
		
		model.addAttribute("user", userRepository.findById(id).get());
		model.addAttribute("roles", roleRepository.findAll());
		return "/edit_credentials";
	}
	
	@PostMapping("/edit_credentials")
	public String saveCredentials (@Valid User user, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("roles", roleRepository.findAll());
			return "/edit_credentials";
		}
		userRepository.save(user);
		return "redirect:/users_index";
	}
	
	@PostMapping("/change_password")
	public String sendLink (@RequestParam String username, Model model) {
		
		model.addAttribute("message", userService.verifyUserExists(username));
		return "/info_page";
	}
	
	@GetMapping("/password")
	public String passwordForm (@RequestParam String token, Model model) {
		
		if (userService.passwordChangeConfirmation(token).equals(token)) {
			model.addAttribute("user", tokenService.findByToken(token).getUser());
			return "/password_update";
		}
		model.addAttribute("message", userService.passwordChangeConfirmation(token));
		return "/info_page";
	}
	
	@PostMapping("/password")
	public String passwordReset (@Valid User user, BindingResult result, Model model) {
		
		if (!result.hasErrors()) {
			model.addAttribute("message", userService.updateUser(user));
			return "/info_page";
		}
		return "/password_update";
	}
}