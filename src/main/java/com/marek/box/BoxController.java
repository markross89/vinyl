package com.marek.box;

import com.marek.MessageService;
import com.marek.album.AlbumRepository;
import com.marek.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoxController {
	
	private final BoxRepository boxRepository;
	private final AlbumRepository albumRepository;
	private final BoxService boxService;
	private final MessageService messageService;
	
	public BoxController (BoxRepository boxRepository, AlbumRepository albumRepository, BoxService boxService, MessageService messageService) {
		
		this.boxRepository = boxRepository;
		this.albumRepository = albumRepository;
		this.boxService = boxService;
		this.messageService = messageService;
	}
	
	
	@GetMapping("/box_details")
	public String boxDetails ( @RequestParam long id, Model model,
							  @RequestParam(defaultValue = "0") int page,
							  @RequestParam(defaultValue = "48") int size) {
		Box box = boxRepository.findById(id).get();
		model.addAttribute("albums", albumRepository.findAlbumsByBoxes(box, PageRequest.of(page, size)));
		model.addAttribute("box", box);
		return "box_details";
	}
	
	@GetMapping("/box_save")
	public String saveBox (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam String name) {
		
		if (boxRepository.existsByName(name)) {
			model.addAttribute("message", messageService.getMessage("name.in.use.error"));
			return "info_page";
		}
		boxService.addBox(name, customUser.getUser());
		return "redirect:/boxes";
	}
	
	@GetMapping("/box_delete/{id}")
	public String deleteBox (@PathVariable Long id) {
		
		boxRepository.deleteById(id);
		return "redirect:/boxes";
	}
	
	@GetMapping("/boxes")
	public String displayBoxes (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") int page,
								@RequestParam(defaultValue = "48") int size) {
		
		model.addAttribute("boxes", boxRepository.findBoxesByUser(customUser.getUser(), PageRequest.of(page, size)));
		return "/boxes";
	}
	
}
