package com.zosia.zosia.track;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.album.Album;
import com.zosia.zosia.box.Box;
import com.zosia.zosia.playlist.Playlist;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
	
	public void addPlaylist(Playlist playlist){
		this.playlists.add(playlist);
		playlist.getTracks().add(this);
		
	}
	
	public void replacePlaylists(Set<Playlist> playlists){
		this.playlists.forEach(playlist -> playlist.getTracks().remove(this));
		this.playlists.clear();
		playlists.forEach(this::addPlaylist);
	}
	
	public String printPlaylists(){
		List<String> names = new ArrayList<>();
		this.getPlaylists().forEach(playlist -> names.add(playlist.getName()));
		return String.join(", ",names);
	}
}