package com.zosia.zosia.track;

import com.zosia.zosia.playlist.Playlist;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;

import java.util.Set;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TrackWrapper {
	
	Set<Playlist> playlists = new HashSet<>();
	
	
	public void addPlaylist (Playlist playlist) {
		
		this.playlists.add(playlist);
	}
}
