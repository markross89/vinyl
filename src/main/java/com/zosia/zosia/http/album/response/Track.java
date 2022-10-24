package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Track {
	
	private String duration;
	
	private String position;
	
	private String trackTitle;
	
	
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
	
	public String getTrackTitle () {
		
		return trackTitle;
	}
	
	public void setTrackTitle (String trackTitle) {
		
		this.trackTitle = trackTitle;
	}
	
	
}