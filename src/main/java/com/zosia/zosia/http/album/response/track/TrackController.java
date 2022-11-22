package com.zosia.zosia.http.album.response.track;


import com.zosia.zosia.http.album.response.album.AlbumRepository;
import com.zosia.zosia.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class TrackController {
	
	
	private final TrackRepository trackRepository;
	
	public TrackController (TrackRepository trackRepository) {
		
		this.trackRepository = trackRepository;
	}
	
	@GetMapping("/songs")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") String page,
								 @RequestParam(defaultValue = "48") String size,
								 @RequestParam(defaultValue = "id") String field, @RequestParam(defaultValue = "DESC") String direction) {
		
		
		String drToSend = direction.equals("DESC") ? "ASC" : "DESC";
		PageRequest pr = PageRequest.of(Integer.parseInt(page), Integer.parseInt(size), Sort.by(Sort.Direction.valueOf(direction), field));
		model.addAttribute("songs", trackRepository.findByAlbum_Users(customUser.getUser(), pr));
		model.addAttribute("direction", drToSend);
		return "/songs";
		
	}
}

