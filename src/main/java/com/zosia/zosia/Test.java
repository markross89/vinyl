package com.zosia.zosia;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zosia.zosia.http.album.response.Album;


import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Arrays;


public class Test {
	
	public static Album mapRequestData (String requestAddress) throws JsonProcessingException {
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(requestAddress))
			
				.build();
		
		HttpResponse<String> response = client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).join();
		String json = response.body();
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.readValue(json, Album.class);
	}
	
	
	public static void main (String[] args) throws JsonProcessingException {
		
		Album mietek = mapRequestData("https://api.discogs.com/releases/8605979?key=RqgTChKtuwVLyeWqVgFL&secret=sTkBKTNnXoSjWCnVRIOabYoBZUsDgzmY");
		System.out.println(Arrays.stream(mietek.getLabels()).findFirst().get().getName());
		

	}
}

