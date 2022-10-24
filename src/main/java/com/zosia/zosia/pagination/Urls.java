package com.zosia.zosia.pagination;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Urls {
	
	private String next;
	
	private String last;
	
	public String getNext () {
		
		return next;
	}
	
	public void setNext (String next) {
		
		this.next = next;
	}
	
	public String getLast () {
		
		return last;
	}
	
	public void setLast (String last) {
		
		this.last = last;
	}
	
}


