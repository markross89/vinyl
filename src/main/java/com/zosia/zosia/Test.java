package com.zosia.zosia;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zosia.zosia.http.album.response.album.Album;
import com.zosia.zosia.http.album.response.album.AlbumService;
import com.zosia.zosia.http.service.HttpService;
import com.zosia.zosia.http.thumbs.response.Thumbs;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;


import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


public class Test {
	

	
	public static <T> T mapRequestData (String requestAddress, Class<T> type) throws JsonProcessingException {
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(requestAddress))
				.build();
		
		HttpResponse<String> response = client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).join();
		String json = response.body();
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.readValue(json, type);
	}
	
	
	public static void main (String[] args) throws JsonProcessingException {
		
	
		
	
	}
}

