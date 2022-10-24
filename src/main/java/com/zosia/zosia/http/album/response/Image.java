package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Image {
	
	private String resource_url;
	
	private String width;
	
	private String type;
	
	private String uri150;
	
	private String height;
	
	public String getResource_url () {
		
		return resource_url;
	}
	
	public void setResource_url (String resource_url) {
		
		this.resource_url = resource_url;
	}
	
	public String getWidth () {
		
		return width;
	}
	
	public void setWidth (String width) {
		
		this.width = width;
	}
	
	public String getType () {
		
		return type;
	}
	
	public void setType (String type) {
		
		this.type = type;
	}
	
	
	public String getUri150 () {
		
		return uri150;
	}
	
	public void setUri150 (String uri150) {
		
		this.uri150 = uri150;
	}
	
	public String getHeight () {
		
		return height;
	}
	
	public void setHeight (String height) {
		
		this.height = height;
	}
	
}