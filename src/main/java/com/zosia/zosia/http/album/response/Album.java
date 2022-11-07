package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	
	private String year;
	
	private String artists_sort;
	
	private String title;
	
	private Artist[] artists;
	
	private String[] genres;
	
	private String id;
	
	private Track[] tracklist;
	
	private Image[] images;
	
	private String uri;
	
	private Label[] labels;
	private String thumb;
	
	
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