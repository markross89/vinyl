package com.vinyl.thumb;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.vinyl.pagination.Pagination;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Thumbs {
	
	private Pagination pagination;
	private Result[] results;
	
}