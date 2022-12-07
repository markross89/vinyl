package com.marek.playlist;

import com.marek.MessageService;
import com.marek.track.TrackRepository;
import com.marek.track.TrackService;
import com.marek.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
	private final TrackService trackService;
	
	public PlaylistController (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService,
							   MessageService messageService, TrackService trackService) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
		this.messageService = messageService;
		this.trackService = trackService;
	}
	
	@GetMapping("/playlist_details")
	public String playlistDetails (@RequestParam long id, Model model, @RequestParam(defaultValue = "0") int page,
								   @RequestParam(defaultValue = "id") String field,
								   @RequestParam(defaultValue = "48") int size, @RequestParam(defaultValue = "DESC") String direction) {
		
		Playlist playlist = playlistRepository.findById(id).get();
		String drToSend = direction.equals("DESC") ? "ASC" : "DESC";
		PageRequest pr = PageRequest.of(page, size, Sort.by(Sort.Direction.valueOf(direction), field));
		model.addAttribute("direction", drToSend);
		model.addAttribute("songs", trackRepository.findTracksByPlaylists(playlist, pr));
		model.addAttribute("playlist", playlist);
		model.addAttribute("field", field);
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
	
	@GetMapping("/playlist_to_box")
	public String createBoxFromPlaylist (Model model, @RequestParam long id, @AuthenticationPrincipal CurrentUser customUser, @RequestParam String name) {
		
		model.addAttribute("message", trackService.getAlbumsBySongs(id, name, customUser.getUser()));
		return "info_page";
	}
}
