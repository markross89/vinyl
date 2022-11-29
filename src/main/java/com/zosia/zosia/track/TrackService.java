package com.zosia.zosia.track;

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
	
	public TrackService (PlaylistRepository playlistRepository, TrackRepository trackRepository, PlaylistService playlistService) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
		this.playlistService = playlistService;
	}
	
	public void addTrackToMultiplePlaylists (String name, User user, long id, Track track) {
		
		Track song = trackRepository.findById(id).get();
		if (!name.equals("")) {
			playlistService.addPlaylist(name, user);
			Playlist newPlaylist = playlistRepository.findByName(name);
			newPlaylist.addTrack(song);
		}
		track.getPlaylists().forEach(song::addTracksToPlaylists);
		trackRepository.save(song);
	}
}
