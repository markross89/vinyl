package com.zosia.zosia.playlist;

import com.zosia.zosia.track.TrackRepository;
import com.zosia.zosia.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PlaylistController {
	
	private final PlaylistRepository playlistRepository;
	private final TrackRepository trackRepository;
	private final PlaylistService playlistService;
	
	public PlaylistController (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
	}

	@GetMapping("/playlist_details/{id}")
	public String playlistDetails (@PathVariable long id, Model model, @RequestParam(defaultValue = "0") int page,
							  @RequestParam(defaultValue = "48") int size) {

		model.addAttribute("songs", trackRepository.findTracksByPlaylists(playlistRepository.findById(id).get(), PageRequest.of(page, size)));
		return "/songs";
	}

	@GetMapping("/playlist_save")
	public String savePlaylist (@AuthenticationPrincipal CurrentUser customUser, @RequestParam String name) {

		playlistService.addPlaylist(name, customUser.getUser());
		return "redirect:/playlists";
	}

	@GetMapping("/playlist_delete/{id}")
	public String deletePlaylist (@PathVariable Long id) {

		playlistRepository.deleteById(id);
		return "redirect:/playlists";
	}

	@GetMapping("/playlists")
	public String displayPlaylists (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") int page,
								@RequestParam(defaultValue = "48") int size) {

		model.addAttribute("playlists", playlistRepository.findPlaylistsByUser(customUser.getUser(), PageRequest.of(page, size)));
		return "/playlists";
	}

}
