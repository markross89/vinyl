package com.zosia.zosia.http.thumbs.response;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;
import com.zosia.zosia.http.service.HttpService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ThumbsController {
	
	private final HttpService httpService;
	private final MessageService messageService;
	
	public ThumbsController (HttpService httpService, MessageService messageService) {
		
		this.httpService = httpService;
		this.messageService = messageService;
	}
	
	
	@GetMapping("/")
	public String displayThumbs (Model model, @RequestParam(defaultValue = "1") String page, @RequestParam(defaultValue = "48") String size) throws JsonProcessingException {
		
		Thumbs thumbs = httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.new.release"),
				java.time.LocalDate.now().toString(), "&",
				messageService.getMessage("api.link.discogs.key.secret"), "&page="+page+"&per_page="+size), Thumbs.class);
		
		model.addAttribute("thumbs", thumbs);
		
		return "home";
	}
	
	
}
