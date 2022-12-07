package com.marek.playlist;


import com.marek.user.User;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;


@Service
public class PlaylistService {
	
	private final PlaylistRepository playlistRepository;
	
	public PlaylistService (PlaylistRepository playlistRepository) {
		
		this.playlistRepository = playlistRepository;
	}
	
	public void addPlaylist (String name, User user) {
		
		Playlist playlist = Playlist.builder()
				.name(name)
				.date(Date.valueOf(LocalDate.now()))
				.user(user)
				.tracks(new HashSet<>())
				.build();
		playlistRepository.save(playlist);
	}
}
