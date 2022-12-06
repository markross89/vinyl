package com.vinyl.registration;

import com.vinyl.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.validation.Valid;


@Controller
public class RegistrationController {
	
	private final RegistrationService registrationService;
	
	public RegistrationController (RegistrationService registrationService) {
		
		this.registrationService = registrationService;
	}
	
	@GetMapping("/register")
	public String showRegistrationForm (Model model) {
		
		model.addAttribute("user", new User());
		return "/register";
	}
	
	@PostMapping("/register")
	public String processRegistrationForm (@Valid User user, BindingResult result, Model model) {
		
		if (!result.hasErrors()) {
			model.addAttribute("message", registrationService.registerUser(user));
			return "/info_page";
		}
		return "/register";
	}
	
	@GetMapping("/confirm")
	public String emailConfirmation (@RequestParam String token, Model model) {
		
		model.addAttribute("message", registrationService.emailConfirmation(token));
		return "/info_page";
	}
	
}
