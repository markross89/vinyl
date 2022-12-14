package com.marek.album;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.marek.artist.Artist;
import com.marek.box.Box;
import com.marek.image.Image;
import com.marek.label.Label;
import com.marek.track.Track;
import com.marek.user.User;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	@Id
	@Column(nullable = false)
	private Long id;
	private String year;
	private String artists_sort;
	private String title;
	private String uri;
	
	
	@ElementCollection
	@JoinTable(name = "albums_genres", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"))
	private List<String> genres;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "albums_artists", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "artist_id", referencedColumnName = "id"))
	private Set<Artist> artists = new HashSet<>();
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "albums_labels", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "label_id", referencedColumnName = "id"))
	private Set<Label> labels = new HashSet<>();
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "albums_users", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
	@JsonIgnore
	private Set<User> users = new HashSet<>();
	
	@OneToMany(mappedBy = "album", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Track> tracklist;
	
	@OneToMany(mappedBy = "album", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Image> images = new ArrayList<>();
	
	@ManyToMany(mappedBy = "albums")
	private Set<Box> boxes;
	
	
	public void addArtist (Artist artist) {
		
		artist.addAlbum(this);
		this.artists.add(artist);
	}
	
	public void removeArtist () {
		
		this.artists.forEach(artist -> artist.getAlbums().remove(this));
		this.artists.clear();
	}
	
	public void addUser (User user) {
		
		this.users.add(user);
	}
	
	public void removeUser (User user) {
		
		this.users.remove(user);
	}
	
	public void addLabel (Label label) {
		
		label.addAlbum(this);
		this.labels.add(label);
	}
	
	public void removeLabel () {
		
		this.labels.forEach(label -> label.getAlbums().remove(this));
		this.labels.clear();
	}
	public void removeBox () {
		
		this.boxes.forEach(box -> box.getAlbums().remove(this));
		this.boxes.clear();
	}
	
	public void addBox(Box box){
		this.boxes.add(box);
		box.getAlbums().add(this);
		
	}
	
	public void saveImage () {
		
		this.images.forEach(image -> image.setAlbum(this));
	}
	
	public void saveTrack () {
		
		this.tracklist.forEach(track -> track.setAlbum(this));
	}
	
	public String printBoxes(){
		List<String> names = new ArrayList<>();
		this.getBoxes().forEach(box -> names.add(box.getName()));
		return String.join(", ",names);
	}
	
	public void replaceBoxes(Set<Box> boxes){
		this.removeBox();
		boxes.forEach(this::addBox);
	}
	
}