package com.zosia.zosia.track;


import com.zosia.zosia.playlist.Playlist;
import com.zosia.zosia.playlist.PlaylistRepository;
import com.zosia.zosia.user.CurrentUser;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


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
		model.addAttribute("track", new Track());
		return "/songs";
	}
	
	@ModelAttribute("playlists")
	public List<Playlist> playlists (@AuthenticationPrincipal CurrentUser customUser) {
		
		return playlistRepository.findPlaylistsByUser(customUser.getUser());
	}
	
	@PostMapping("/add_to_playlist/{id}")
	public String addAlbumToPlaylist (@ModelAttribute Track track, @PathVariable long id) {
		
		track.getPlaylists().forEach(playlist -> playlist.addTrack(trackRepository.findById(id).get()));
		trackRepository.save(track);
		
		return "redirect:/songs";
	}
}

