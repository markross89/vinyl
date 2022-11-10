package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;


@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Label
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column( nullable = false)
	private Long id;
	
	private String catno;
	
	private String name;
	
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