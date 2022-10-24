package com.zosia.zosia.http.thumbs.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.pagination.Pagination;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Thumbs {
	
	private Pagination pagination;
	
	private Result[] results;
	
	public Pagination getPagination () {
		
		return pagination;
	}
	
	public void setPagination (Pagination pagination) {
		
		this.pagination = pagination;
	}
	
	public Result[] getResults () {
		
		return results;
	}
	
	public void setResults (Result[] results) {
		
		this.results = results;
	}
	
}