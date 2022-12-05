package com.zosia.zosia.album;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.box.BoxRepository;
import com.zosia.zosia.user.CurrentUser;
import com.zosia.zosia.user.UserRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class AlbumController {
	
	private final AlbumService albumService;
	private final AlbumRepository albumRepository;
	private final UserRepository userRepository;
	private final BoxRepository boxRepository;
	
	
	public AlbumController (AlbumService albumService, AlbumRepository albumRepository, UserRepository userRepository,
							BoxRepository boxRepository) {
		
		this.albumService = albumService;
		this.albumRepository = albumRepository;
		this.userRepository = userRepository;
		this.boxRepository = boxRepository;
	}
	
	@GetMapping("/details/{id}")
	public String albumDetails (@PathVariable long id, Model model) throws JsonProcessingException {
		
		model.addAttribute("album", albumService.requestAlbumBuilder(Album.class, id));
		return "/details";
	}
	
	@GetMapping("/save/{id}")
	public String saveAlbum (Model model, @PathVariable long id, @AuthenticationPrincipal CurrentUser customUser) throws JsonProcessingException {
		
		model.addAttribute("message", albumService.saveAlbum(id, userRepository.findById(customUser.getUser().getId()).get()));
		return "info_page";
	}
	
	@GetMapping("/delete")
	public String deleteAlbum (@RequestParam long id, @AuthenticationPrincipal CurrentUser customUser) {
		
		albumService.deleteAlbum(id, userRepository.findById(customUser.getUser().getId()).get());
		return "redirect:/albums";
	}
	
	@GetMapping("/albums")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser,
								 @RequestParam(defaultValue = "0") int page,
								 @RequestParam(defaultValue = "48") int size) {
		
		model.addAttribute("albums", albumRepository.findAlbumsByUsers(customUser.getUser(), PageRequest.of(page, size)));
		model.addAttribute("album", new Album());
		model.addAttribute("boxes", boxRepository.findBoxesByUser(customUser.getUser()));
		return "/albums";
	}
	
	@PostMapping("/add_to_box")
	public String addAlbumToBox (Model model, @AuthenticationPrincipal CurrentUser customUser, @ModelAttribute Album album, @RequestParam long id,
								 @RequestParam(defaultValue = "") String name) {
		
		model.addAttribute("message", albumService.addAlbumToMultipleBoxes(name, customUser.getUser(), id, album));
		return "info_page";
	}
	
	@GetMapping("/delete_from_box")
	public String deleteAlbumsFromBoxes (@RequestParam Long box_id, @RequestParam Long album_id) {
		
		albumService.deleteAlbumFromBox(box_id, album_id);
		return "redirect:box_details?id="+box_id;
	}
}

