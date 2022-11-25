package com.zosia.zosia.track;


import com.zosia.zosia.playlist.PlaylistRepository;
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
	private final PlaylistRepository playlistRepository;
	private final TrackService trackService;
	
	public TrackController (TrackRepository trackRepository, PlaylistRepository playlistRepository, TrackService trackService) {
		
		this.trackRepository = trackRepository;
		this.playlistRepository = playlistRepository;
		this.trackService = trackService;
	}
	
	@GetMapping("/songs")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") int page,
								 @RequestParam(defaultValue = "48") int size,
								 @RequestParam(defaultValue = "id") String field, @RequestParam(defaultValue = "DESC") String direction) {
		
		
		String drToSend = direction.equals("DESC") ? "ASC" : "DESC";
		PageRequest pr = PageRequest.of(page, size, Sort.by(Sort.Direction.valueOf(direction), field));
		model.addAttribute("songs", trackRepository.findByAlbum_Users(customUser.getUser(), pr));
		model.addAttribute("songlists", playlistRepository.findPlaylistsByUser(customUser.getUser()));
		model.addAttribute("direction", drToSend);
		return "/songs";
	}
	
	@GetMapping("/add_to_playlist")
	public String addAlbumToPlaylist(@RequestParam("playlist") long[] playlists){
		
		trackService.addTrackToPlaylist(playlists);
		
		return "redirect:/songs" ;
	}
}

