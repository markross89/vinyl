package com.zosia.zosia.http.album.response.album;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.http.album.response.artist.Artist;
import com.zosia.zosia.http.album.response.image.Image;
import com.zosia.zosia.http.album.response.label.Label;
import com.zosia.zosia.http.album.response.track.Track;

import javax.persistence.*;
import java.util.List;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long album_id;
	@Column(name = "discogs_id")
	private String id;
	private String year;
	private String artists_sort;
	private String title;
	private String uri;
	@ElementCollection
	private List<String> genres;
	@ManyToMany
	@JoinTable(
			name = "album_artist",
			joinColumns = @JoinColumn(name = "album_id"),
			inverseJoinColumns = @JoinColumn(name = "artist_id"))
	private List<Artist> artists;
	@OneToMany
	private List<Track> tracklist;
	@OneToMany
	private List<Image> images;
	@ManyToMany
	private List<Label> labels;
	
	
	public Long getAlbum_id () {
		
		return album_id;
	}
	
	public void setAlbum_id (Long album_id) {
		
		this.album_id = album_id;
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
	
	
	public List<Artist> getArtists () {
		
		return artists;
	}
	
	public void setArtists (List<Artist> artists) {
		
		this.artists = artists;
	}
	
	public List<String> getGenres () {
		
		return genres;
	}
	
	public void setGenres (List<String> genres) {
		
		this.genres = genres;
	}
	
	
	public String getId () {
		
		return id;
	}
	
	public void setId (String id) {
		
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
	
	public List<Label> getLabels () {
		
		return labels;
	}
	
	public void setLabels (List<Label> labels) {
		
		this.labels = labels;
	}
	public String getArtists_sort () {
		
		return artists_sort;
	}
	
	public void setArtists_sort (String artists_sort) {
		
		this.artists_sort = artists_sort;
	}
	
	
}