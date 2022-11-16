package com.zosia.zosia.http.album.response.label;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.http.album.response.album.Album;

import javax.persistence.*;
import java.util.List;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Label
{
	
	@Id
	@Column( nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@JsonIgnore
	private Long id;
	private String catno;
	private String name;
	@ManyToMany(mappedBy = "labels")
	private List<Album> albums;
	
	public List<Album> getAlbums () {
		
		return albums;
	}
	
	public void setAlbums (List<Album> albums) {
		
		this.albums = albums;
	}
	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
	}
	
	
	public String getCatno ()
	{
		return catno;
	}
	
	public void setCatno (String catno)
	{
		this.catno = catno;
	}
	
	public String getName ()
	{
		return name;
	}
	
	public void setName (String name)
	{
		this.name = name;
	}
	

	
}