package com.zosia.zosia.pagination;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Pagination {
	
	private String per_page;
	
	private Urls urls;
	
	private String pages;
	
	private String page;
	
	private String items;
	
	public String getPer_page () {
		
		return per_page;
	}
	
	public void setPer_page (String per_page) {
		
		this.per_page = per_page;
	}
	
	public Urls getUrls () {
		
		return urls;
	}
	
	public void setUrls (Urls urls) {
		
		this.urls = urls;
	}
	
	public String getPages () {
		
		return pages;
	}
	
	public void setPages (String pages) {
		
		this.pages = pages;
	}
	
	public String getPage () {
		
		return page;
	}
	
	public void setPage (String page) {
		
		this.page = page;
	}
	
	public String getItems () {
		
		return items;
	}
	
	public void setItems (String items) {
		
		this.items = items;
	}
	
}