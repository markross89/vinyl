package com.zosia.zosia;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zosia.zosia.http.thumbs.response.Result;
import com.zosia.zosia.http.thumbs.response.Thumbs;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Arrays;


public class Test {
	
	public static Thumbs mapRequestData (String requestAddress) throws JsonProcessingException {
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(requestAddress))
				.build();
		
		HttpResponse<String> response = client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).join();
		String json = response.body();
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.readValue(json, Thumbs.class);
	}
	
	
	public static void main (String[] args) throws JsonProcessingException {
		
		Thumbs marek = mapRequestData("https://api.discogs.com/database/search?type=release&q=02-10-22&key=RqgTChKtuwVLyeWqVgFL&secret=sTkBKTNnXoSjWCnVRIOabYoBZUsDgzmY");
		Result[] results = marek.getResults();
		System.out.println(results[1].getTitle());
	}
}

