package com.zosia.zosia.track;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.album.Album;
import com.zosia.zosia.playlist.Playlist;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Track {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private Long id;
	private String duration;
	private String position;
	private String title;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Album album;
	
	@ManyToMany(mappedBy = "tracks")
	private Set<Playlist> playlists = new HashSet<>();
	
	public void removeTracksFromPlaylists () {
		
		this.playlists.forEach(playlist -> playlist.getTracks().removeIf(track -> track == this));
		this.playlists.clear();
	}
	
	public void addTracksToPlaylists (Playlist playlist) {
		
		playlist.getTracks().add(this);
		this.playlists.add(playlist);
	}
	
	
}