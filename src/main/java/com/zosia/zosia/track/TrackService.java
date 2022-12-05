package com.zosia.zosia.track;

import com.zosia.zosia.MessageService;
import com.zosia.zosia.box.Box;
import com.zosia.zosia.box.BoxRepository;
import com.zosia.zosia.box.BoxService;
import com.zosia.zosia.playlist.Playlist;
import com.zosia.zosia.playlist.PlaylistRepository;
import com.zosia.zosia.playlist.PlaylistService;
import com.zosia.zosia.user.User;
import org.springframework.stereotype.Service;


import java.util.Set;


@Service
public class TrackService {
	
	private final PlaylistRepository playlistRepository;
	private final TrackRepository trackRepository;
	private final PlaylistService playlistService;
	private final MessageService messageService;
	private final BoxService boxService;
	private final BoxRepository boxRepository;
	
	public TrackService (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService,
						 MessageService messageService, BoxService boxService, BoxRepository boxRepository) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
		this.messageService = messageService;
		this.boxService = boxService;
		this.boxRepository = boxRepository;
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
	
	public String getAlbumsBySongs (long id, String name, User user) {
		
		Set<Track> tracks = playlistRepository.findById(id).get().getTracks();
		if (boxRepository.findByName(name) != null) {
			return messageService.getMessage("exist.message");
		}
		boxService.addBox(name, user);
		Box box = boxRepository.findByName(name);
		tracks.forEach(track -> box.addAlbum(track.getAlbum()));
		boxRepository.save(box);
		
		return messageService.getMessage("element.added.to");
	}
}
