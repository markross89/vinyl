package com.marek.thumb;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.marek.MessageService;
import com.marek.email.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ThumbsController {
	
	
	private final ThumbsService thumbsService;
	private final EmailService emailService;
	private final MessageService messageService;
	
	public ThumbsController (ThumbsService thumbsService, EmailService emailService, MessageService messageService) {
		
		this.thumbsService = thumbsService;
		this.emailService = emailService;
		this.messageService = messageService;
	}
	
	@GetMapping("/")
	public String home (Model model, @RequestParam(defaultValue = "1") String page, @RequestParam(defaultValue = "48") String size,
						@RequestParam(defaultValue = "#{T(java.time.LocalDate).now()}") String search) throws JsonProcessingException {
		
		model.addAttribute("thumbs", thumbsService.requestThumbBuilder(Thumbs.class, search, page, size));
		return "home";
	}
	@GetMapping("/thumbs")
	public String displaySearchThumbs (Model model, @RequestParam(defaultValue = "1") String page, @RequestParam(defaultValue = "48") String size,
									   @RequestParam(defaultValue = "#{T(java.time.LocalDate).now()}") String search) throws JsonProcessingException {
		
		model.addAttribute("thumbs", thumbsService.requestThumbBuilder(Thumbs.class, search, page, size));
		model.addAttribute("search", search);
		return "thumbs";
	}
	@GetMapping("/send_email")
	public String sendEmail (@RequestParam String name, @RequestParam String surname, @RequestParam String message, Model model) {
		
		emailService.sendEmail("vinylcollection89@gmail.com", name+" "+surname, message);
		model.addAttribute("message", messageService.getMessage("message.send"));
		return "info_page";
	}
}
