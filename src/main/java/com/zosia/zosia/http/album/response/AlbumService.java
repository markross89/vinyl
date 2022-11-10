package com.zosia.zosia.http.album.response;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;
import com.zosia.zosia.http.service.HttpService;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;



@Service
public class AlbumService {
	
	private final HttpService httpService;
	private final MessageService messageService;
	
	public AlbumService (HttpService httpService, MessageService messageService) {
		
		this.httpService = httpService;
		this.messageService = messageService;
	}
	
	public <T>T requestAlbumBuilder(Class<T> type, String id) throws JsonProcessingException {
		
		return httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.album"), id.replaceAll(" ", "+"), "?",
				messageService.getMessage("api.link.discogs.key.secret")),type);
		
	}
	
}