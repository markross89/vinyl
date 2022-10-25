package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Label
{

	

	
	private String catno;
	
	private String name;
	
	

	
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