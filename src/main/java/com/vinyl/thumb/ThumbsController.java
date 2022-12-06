package com.vinyl.thumb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ThumbsController {
	
	
	private final ThumbsService thumbsService;
	
	public ThumbsController (ThumbsService thumbsService) {
		
		this.thumbsService = thumbsService;
	}
	
	@GetMapping("/")
	public String displaySearchThumbs (Model model, @RequestParam(defaultValue = "1") String page, @RequestParam(defaultValue = "48") String size,
									   @RequestParam(defaultValue = "#{T(java.time.LocalDate).now()}") String search) throws JsonProcessingException {
		
		model.addAttribute("thumbs", thumbsService.requestThumbBuilder(Thumbs.class, search, page, size));
		model.addAttribute("search", search);
		return "home";
	}
}
