package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Track {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	private Long id;
	
	private String duration;
	
	private String position;
	
	private String title;
	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
	}
	
	
	public String getDuration () {
		
		return duration;
	}
	
	public void setDuration (String duration) {
		
		this.duration = duration;
	}
	
	public String getPosition () {
		
		return position;
	}
	
	public void setPosition (String position) {
		
		this.position = position;
	}
	
	public String getTitle () {
		
		return title;
	}
	
	public void setTitle (String title) {
		
		this.title = title;
	}
	
	
}