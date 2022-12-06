package com.vinyl.playlist;


import com.vinyl.user.User;
import com.vinyl.track.Track;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;

import java.util.HashSet;
import java.util.Set;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Playlist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private Date date;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "playlists_tracks", joinColumns = @JoinColumn(name = "playlist_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "track_id", referencedColumnName = "id"))
	private Set<Track> tracks = new HashSet<>();
	
	@ManyToOne
	private User user;
	
	public void addTrack (Track track) {
		
		this.tracks.add(track);
		track.getPlaylists().add(this);
	}
	
	public void removeTrack (Track track) {
		
		this.tracks.remove(track);
		track.getPlaylists().remove(this);
	}
	
	@Override
	public String toString () {
		
		return name;
	}
}


