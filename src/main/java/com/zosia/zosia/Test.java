package com.zosia.zosia;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zosia.zosia.http.album.response.Album;
import com.zosia.zosia.http.thumbs.response.Thumbs;


import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Arrays;


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
		
		Thumbs mietek = mapRequestData("https://api.discogs.com/database/search?type=release&q=tiesto&key=RqgTChKtuwVLyeWqVgFL&secret" +
				"=sTkBKTNnXoSjWCnVRIOabYoBZUsDgzmY&page=2&per_page=12", Thumbs.class);
		System.out.println(mietek.getPagination().getUrls().getNext());
		

	}
}

