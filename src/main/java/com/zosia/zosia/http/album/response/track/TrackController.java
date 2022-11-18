package com.zosia.zosia.http.album.response.track;


import com.zosia.zosia.http.album.response.album.AlbumRepository;
import com.zosia.zosia.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class TrackController {
	
	private final AlbumRepository albumRepository;
	private final TrackRepository trackRepository;
	
	public TrackController (AlbumRepository albumRepository, TrackRepository trackRepository) {
		
		this.albumRepository = albumRepository;
		this.trackRepository = trackRepository;
	}
	
	
	@GetMapping("/songs")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") String page,
								 @RequestParam(defaultValue = "48") String size) {
		
		PageRequest pr = PageRequest.of(Integer.parseInt(page), Integer.parseInt(size));
		model.addAttribute("songs", trackRepository.findByAlbum_Users(customUser.getUser(), pr));
		return "/songs";
		

	}
	
}

