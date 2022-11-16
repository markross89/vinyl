package com.zosia.zosia.http.album.response.image;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.http.album.response.album.Album;

import javax.persistence.*;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Image {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column( nullable = false)
	@JsonIgnore
	private Long id;
	private String resource_url;
	private String width;
	private String type;
	private String uri150;
	private String height;

	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
	}
	
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