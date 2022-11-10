package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	private Long album_id;
	
	private String year;
	
	private String artists_sort;
	
	private String title;
	@ManyToOne
	private Artist[] artists;
	@ManyToOne
	private String[] genres;
	
	private String id;
	@ManyToOne
	private Track[] tracklist;
	@ManyToOne
	private Image[] images;
	
	private String uri;
	@ManyToOne
	private Label[] labels;
	private String thumb;
	
	public Long getAlbum_id () {
		
		return album_id;
	}
	
	public void setAlbum_id (Long album_id) {
		
		this.album_id = album_id;
	}
	
	
	public String getThumb () {
		
		return thumb;
	}
	
	public void setThumb (String thumb) {
		
		this.thumb = thumb;
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
	
	
	public Artist[] getArtists () {
		
		return artists;
	}
	
	public void setArtists (Artist[] artists) {
		
		this.artists = artists;
	}
	
	public String[] getGenres () {
		
		return genres;
	}
	
	public void setGenres (String[] genres) {
		
		this.genres = genres;
	}
	
	
	public String getId () {
		
		return id;
	}
	
	public void setId (String id) {
		
		this.id = id;
	}
	
	
	public Track[] getTracklist () {
		
		return tracklist;
	}
	
	public void setTracklist (Track[] tracklist) {
		
		this.tracklist = tracklist;
	}
	
	public Image[] getImages () {
		
		return images;
	}
	
	public void setImages (Image[] images) {
		
		this.images = images;
	}
	
	public String getUri () {
		
		return uri;
	}
	
	public void setUri (String uri) {
		
		this.uri = uri;
	}
	
	public Label[] getLabels () {
		
		return labels;
	}
	
	public void setLabels (Label[] labels) {
		
		this.labels = labels;
	}
	public String getArtists_sort () {
		
		return artists_sort;
	}
	
	public void setArtists_sort (String artists_sort) {
		
		this.artists_sort = artists_sort;
	}
	
	
}