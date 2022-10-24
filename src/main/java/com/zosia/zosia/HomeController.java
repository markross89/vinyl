package com.zosia.zosia;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
	@GetMapping("/")
	public String mainPage(){
		return "home";
	}
	
}
