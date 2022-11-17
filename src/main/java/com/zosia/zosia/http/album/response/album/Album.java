package com.zosia.zosia.http.album.response.album;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.http.album.response.artist.Artist;
import com.zosia.zosia.http.album.response.image.Image;
import com.zosia.zosia.http.album.response.label.Label;
import com.zosia.zosia.http.album.response.track.Track;
import com.zosia.zosia.user.User;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
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
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinTable(name = "albums_tracks", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "track_id", referencedColumnName = "id"))
	private List<Track> tracklist;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinTable(name = "albums_images", joinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "image_id", referencedColumnName = "id"))
	private List<Image> images;
	
	
	public Set<User> getUsers () {
		
		return users;
	}
	
	public void setUsers (Set<User> users) {
		
		this.users = users;
	}
	
	public String getYear () {
		
		return year;
	}
	
	public void setYear (String year) {
		
		this.year = year;
	}
	
	
	public String getTitle () {
		
		return title;
	}
	
	public void setTitle (String title) {
		
		this.title = title;
	}
	
	
	public Set<Artist> getArtists () {
		
		return artists;
	}
	
	public void setArtists (Set<Artist> artists) {
		
		this.artists = artists;
	}
	
	public void addArtist (Artist artist) {
		
		artist.addAlbum(this);
		this.artists.add(artist);
	}
	
	public void removeArtist () {
		
		this.artists.forEach(artist -> artist.getAlbums().removeIf(album -> album == this));
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
		
		this.labels.forEach(label -> label.getAlbums().removeIf(album -> album == this));
		this.labels.clear();
	}
	
	public List<String> getGenres () {
		
		return genres;
	}
	
	public void setGenres (List<String> genres) {
		
		this.genres = genres;
	}
	
	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
	}
	
	
	public List<Track> getTracklist () {
		
		return tracklist;
	}
	
	public void setTracklist (List<Track> tracklist) {
		
		this.tracklist = tracklist;
	}
	
	public List<Image> getImages () {
		
		return images;
	}
	
	public void setImages (List<Image> images) {
		
		this.images = images;
	}
	
	public String getUri () {
		
		return uri;
	}
	
	public void setUri (String uri) {
		
		this.uri = uri;
	}
	
	public Set<Label> getLabels () {
		
		return labels;
	}
	
	public void setLabels (Set<Label> labels) {
		
		this.labels = labels;
	}
	
	public String getArtists_sort () {
		
		return artists_sort;
	}
	
	public void setArtists_sort (String artists_sort) {
		
		this.artists_sort = artists_sort;
	}
	
	
}