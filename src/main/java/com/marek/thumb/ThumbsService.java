package com.marek.thumb;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.marek.HttpService;
import com.marek.MessageService;
import org.springframework.stereotype.Service;


@Service
public class ThumbsService {
	
	private final HttpService httpService;
	private final MessageService messageService;
	
	public ThumbsService (HttpService httpService, MessageService messageService) {
		
		this.httpService = httpService;
		this.messageService = messageService;
	}
	
	public <T> T requestThumbBuilder (Class<T> type, String search, String page, String size) throws JsonProcessingException {
		
		return httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.new.release"), search.replaceAll(" ", "+"),
				"&",
				messageService.getMessage("api.link.discogs.key.secret"), "&page="+page+"&per_page="+size), type);
		
	}
	
}
