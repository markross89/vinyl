package com.zosia.zosia.track;


import com.zosia.zosia.playlist.Playlist;
import com.zosia.zosia.playlist.PlaylistRepository;
import com.zosia.zosia.playlist.PlaylistService;
import com.zosia.zosia.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class TrackController {
	
	
	private final TrackRepository trackRepository;
	private final PlaylistRepository playlistRepository;
	private final PlaylistService playlistService;
	private final TrackService trackService;
	
	public TrackController (TrackRepository trackRepository, PlaylistRepository playlistRepository, PlaylistService playlistService,
							TrackService trackService) {
		
		this.trackRepository = trackRepository;
		this.playlistRepository = playlistRepository;
		this.playlistService = playlistService;
		this.trackService = trackService;
	}
	
	@GetMapping("/songs")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") int page,
								 @RequestParam(defaultValue = "48") int size,
								 @RequestParam(defaultValue = "id") String field, @RequestParam(defaultValue = "DESC") String direction) {
		
		String drToSend = direction.equals("DESC") ? "ASC" : "DESC";
		PageRequest pr = PageRequest.of(page, size, Sort.by(Sort.Direction.valueOf(direction), field));
		model.addAttribute("direction", drToSend);
		model.addAttribute("songs", trackRepository.findByAlbum_Users(customUser.getUser(), pr));
		model.addAttribute("track", new Track());
		return "/songs";
	}
	
	@ModelAttribute("playlists")
	public List<Playlist> playlists (@AuthenticationPrincipal CurrentUser customUser) {
		
		return playlistRepository.findPlaylistsByUser(customUser.getUser());
	}
	
	@PostMapping("/add_to_playlist")
	public String addTrackToPlaylist (@AuthenticationPrincipal CurrentUser customUser, @ModelAttribute Track track, @RequestParam Long id,
									  @RequestParam(defaultValue = "") String name) {
		
		trackService.addTrackToMultiplePlaylists(name, customUser.getUser(), id, track);
		
		return "redirect:/songs";
	}
}

