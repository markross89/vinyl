package com.zosia.zosia.http.album.response;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column( nullable = false)
	private Long id;
	
	private String name;
	
	public Long getId () {
		
		return id;
	}
	
	public void setId (Long id) {
		
		this.id = id;
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
