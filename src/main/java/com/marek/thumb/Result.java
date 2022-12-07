package com.marek.thumb;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {
	
	private String resource_url;
	private String title;
	private String uri;
	private String[] genre;
	private String id;
	private String cover_image;
	
}

