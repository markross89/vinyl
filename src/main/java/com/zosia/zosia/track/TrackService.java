package com.zosia.zosia.track;

import com.zosia.zosia.playlist.PlaylistRepository;
import org.springframework.stereotype.Service;


@Service
public class TrackService {
	
	private final PlaylistRepository playlistRepository;
	private final TrackRepository trackRepository;
	
	public TrackService (PlaylistRepository playlistRepository, TrackRepository trackRepository) {
		
		this.playlistRepository = playlistRepository;
		this.trackRepository = trackRepository;
	}
	
	
	public void addTrackToPlaylist(long[] playlists){
		
		for (long id:playlists) {
			playlistRepository.findById(id).get().addTrack(trackRepository.findById(id).get());
		}
	}
}
