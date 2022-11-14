package com.zosia.zosia.http.album.response.artist;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.http.album.response.album.Album;


import javax.persistence.*;
import java.util.List;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private Long id;
	private String name;
	@ManyToMany(mappedBy = "artists")
	private List<Album> album;
	
	public List<Album> getAlbum () {
		
		return album;
	}
	
	public void setAlbum (List<Album> album) {
		
		this.album = album;
	}
	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
	}
	
	
	public String getName () {
		
		return name;
	}
	
	public void setName (String name) {
		
		this.name = name;
	}
	
}
