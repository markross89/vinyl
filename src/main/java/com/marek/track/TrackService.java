package com.marek.track;

import com.marek.MessageService;
import com.marek.box.Box;
import com.marek.box.BoxRepository;
import com.marek.box.BoxService;
import com.marek.playlist.Playlist;
import com.marek.playlist.PlaylistRepository;
import com.marek.playlist.PlaylistService;
import com.marek.user.User;
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
		
		Playlist p = playlistRepository.findByNameAndUser(name, user);
		if (p != null) {
			return messageService.getMessage("exist.message");
		}
		
		Track t = trackRepository.findById(id).get();
		t.replacePlaylists(track.getPlaylists());
		if (!name.equals("")) {
			playlistService.addPlaylist(name, user);
			t.addPlaylist(playlistRepository.findByNameAndUser(name, user));
		}
		trackRepository.save(t);
		return messageService.getMessage("element.added.to")+" "+t.printPlaylists();
	}
	
	public String getAlbumsBySongs (long id, String name, User user) {
		
		Set<Track> tracks = playlistRepository.findById(id).get().getTracks();
		if (boxRepository.findByNameAndUser(name,user) != null) {
			return messageService.getMessage("exist.message");
		}
		boxService.addBox(name, user);
		Box box = boxRepository.findByNameAndUser(name,user);
		tracks.forEach(track -> box.addAlbum(track.getAlbum()));
		boxRepository.save(box);
		
		return name+" "+messageService.getMessage("playlist.to.box");
	}
}
