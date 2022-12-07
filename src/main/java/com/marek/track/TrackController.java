package com.marek.track;


import com.marek.playlist.Playlist;
import com.marek.playlist.PlaylistRepository;
import com.marek.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class TrackController {
	
	
	private final TrackRepository trackRepository;
	private final PlaylistRepository playlistRepository;
	private final TrackService trackService;
	
	public TrackController (TrackRepository trackRepository, PlaylistRepository playlistRepository,
							TrackService trackService) {
		
		this.trackRepository = trackRepository;
		this.playlistRepository = playlistRepository;
		this.trackService = trackService;
	}
	
	@GetMapping("/songs")
	public String displayAlbums (Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam(defaultValue = "0") int page,
								 @RequestParam(defaultValue = "48") int size,
								 @RequestParam(defaultValue = "id") String field, @RequestParam(defaultValue = "DESC") String direction) {
		
		String drToSend = direction.equals("ASC") ? "DESC" : "ASC";
		PageRequest pr = PageRequest.of(page, size, Sort.by(Sort.Direction.valueOf(direction), field));
		model.addAttribute("direction", drToSend);
		model.addAttribute("songs", trackRepository.findByAlbum_Users(customUser.getUser(), pr));
		model.addAttribute("field", field);
		model.addAttribute("track", new Track());
		model.addAttribute("playlists", playlistRepository.findPlaylistsByUser(customUser.getUser()));
		return "/songs";
	}
	
	@PostMapping("/add_to_playlist")
	public String addTrackToPlaylist (Model model, @AuthenticationPrincipal CurrentUser customUser, @ModelAttribute Track track,
									  @RequestParam Long id,
									  @RequestParam(defaultValue = "") String name) {
		
		model.addAttribute("message", trackService.addTrackToMultiplePlaylists(name, customUser.getUser(), id, track));
		return "info_page";
	}
	
	@GetMapping("/delete_from_playlist")
	public String deleteTrackFromPlaylist (@RequestParam Long playlist_id, @RequestParam Long song_id) {
		
		Playlist playlist = playlistRepository.findById(playlist_id).get();
		playlist.removeTrack(trackRepository.findById(song_id).get());
		playlistRepository.save(playlist);
		return "redirect:/playlist_details?id="+playlist_id;
	}
}

