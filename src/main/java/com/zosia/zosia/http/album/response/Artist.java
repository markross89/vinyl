package com.zosia.zosia.http.album.response;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	

	
	private String artistName;
	


	
	public String getArtistName ()
	{
		return artistName;
	}
	
	public void setArtistName (String artistName)
	{
		this.artistName = artistName;
	}
	
}
