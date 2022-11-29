package com.zosia.zosia.playlist;

import com.zosia.zosia.MessageService;
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
	
	private final MessageService messageService;
	
	public PlaylistController (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService,
							   MessageService messageService) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
		this.messageService = messageService;
	}
	
	@GetMapping("/playlist_details")
	public String playlistDetails (@RequestParam long id, Model model, @RequestParam(defaultValue = "0") int page,
								   @RequestParam(defaultValue = "48") int size) {
		Playlist playlist = playlistRepository.findById(id).get();
		model.addAttribute("songs", trackRepository.findTracksByPlaylists(playlistRepository.findById(id).get(), PageRequest.of(page, size)));
		model.addAttribute("playlist", playlist);
		return "/playlist_details";
	}
	
	@GetMapping("/playlist_save")
	public String savePlaylist (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam String name) {
		
		if (playlistRepository.existsByName(name)) {
			model.addAttribute("message", messageService.getMessage("name.in.use.error"));
			return "info_page";
		}
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
