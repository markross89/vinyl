package com.zosia.zosia.http.album.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Label
{

	

	
	private String catno;
	
	private String labelName;
	
	

	
	public String getCatno ()
	{
		return catno;
	}
	
	public void setCatno (String catno)
	{
		this.catno = catno;
	}
	
	public String getLabelName ()
	{
		return labelName;
	}
	
	public void setLabelName (String labelName)
	{
		this.labelName = labelName;
	}
	

	
}