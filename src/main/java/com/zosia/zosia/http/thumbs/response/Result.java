package com.zosia.zosia.http.thumbs.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;




@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {
	
	private String resource_url;
	
	private String title;
	
	private String uri;
	
	private String[] genre;
	
	private String id;
	
	private String cover_image;
	
	
	public String getResource_url () {
		
		return resource_url;
	}
	
	public void setResource_url (String resource_url) {
		
		this.resource_url = resource_url;
	}
	
	
	public String getTitle () {
		
		return title;
	}
	
	public void setTitle (String title) {
		
		this.title = title;
	}
	
	
	public String getUri () {
		
		return uri;
	}
	
	public void setUri (String uri) {
		
		this.uri = uri;
	}
	
	
	public String[] getGenre () {
		
		return genre;
	}
	
	public void setGenre (String[] genre) {
		
		this.genre = genre;
	}
	
	
	public String getId () {
		
		return id;
	}
	
	public void setId (String id) {
		
		this.id = id;
	}
	
	public String getCover_image () {
		
		return cover_image;
	}
	
	public void setCover_image (String cover_image) {
		
		this.cover_image = cover_image;
	}
	
}

