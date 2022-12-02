package com.zosia.zosia.track;

import com.zosia.zosia.MessageService;
import com.zosia.zosia.playlist.Playlist;
import com.zosia.zosia.playlist.PlaylistRepository;
import com.zosia.zosia.playlist.PlaylistService;
import com.zosia.zosia.user.User;
import org.springframework.stereotype.Service;


@Service
public class TrackService {
	
	private final PlaylistRepository playlistRepository;
	private final TrackRepository trackRepository;
	private final PlaylistService playlistService;
	private final MessageService messageService;
	
	public TrackService (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService,
						 MessageService messageService) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
		this.messageService = messageService;
	}
	
	public String addTrackToMultiplePlaylists (String name, User user, long id, Track track) {
		
		Playlist p = playlistRepository.findByName(name);
		if (p != null) {
			return messageService.getMessage("exist.message");
		}
		Track t = trackRepository.findById(id).get();
		t.replacePlaylists(track.getPlaylists());
		if (!name.equals("")) {
			playlistService.addPlaylist(name, user);
			t.addPlaylist(p);
		}
		trackRepository.save(t);
		return messageService.getMessage("element.added.to")+" "+t.printPlaylists();
		
	}
}
