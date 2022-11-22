package com.zosia.zosia.box;

import com.zosia.zosia.album.AlbumRepository;
import com.zosia.zosia.user.CurrentUser;
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
	
	public BoxController (BoxRepository boxRepository, AlbumRepository albumRepository, BoxService boxService) {
		
		this.boxRepository = boxRepository;
		this.albumRepository = albumRepository;
		this.boxService = boxService;
	}
	
	
	@GetMapping("/box_details/{id}")
	public String boxDetails (@PathVariable long id, Model model, @RequestParam(defaultValue = "0") int page,
							  @RequestParam(defaultValue = "48") int size) {
		
		model.addAttribute("albums", albumRepository.findAlbumsByBoxes(boxRepository.findById(id).get(), PageRequest.of(page, size)));
		return "/albums";
	}
	
		@GetMapping("/box_save")
	public String saveBox ( @AuthenticationPrincipal CurrentUser customUser, @RequestParam String name) {

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
