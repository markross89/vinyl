package com.zosia.zosia.http.album.response.album;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class AlbumController {
	
	private final AlbumService albumService;
	
	
	public AlbumController (AlbumService albumService) {
		
		this.albumService = albumService;
		
	}
	
	@GetMapping("/details/{id}")
	public String albumDetails (@PathVariable String id, Model model) throws JsonProcessingException {
		
		model.addAttribute("album", albumService.requestAlbumBuilder(Album.class, id));
		return "/details";
	}
	
	@GetMapping("/save/{id}")
	public String saveAlbum (@PathVariable String id, Model model) throws JsonProcessingException {
		
		albumService.saveAlbum(id);
		model.addAttribute("album", albumService.requestAlbumBuilder(Album.class, id));
		return "/details";
	}
}

