package com.vinyl.track;

import com.vinyl.MessageService;
import com.vinyl.box.Box;
import com.vinyl.box.BoxRepository;
import com.vinyl.box.BoxService;
import com.vinyl.playlist.Playlist;
import com.vinyl.playlist.PlaylistRepository;
import com.vinyl.playlist.PlaylistService;
import com.vinyl.user.User;
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
			t.addPlaylist(playlistRepository.findByName(name));
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
