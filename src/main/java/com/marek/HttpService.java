package com.marek;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Service
public class HttpService {
	
	public  <T> T mapRequestData (String requestAddress, Class<T> type) throws JsonProcessingException {
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(requestAddress))
				.build();
		
		HttpResponse<String> response = client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).join();
		String json = response.body();
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.readValue(json, type);
	}

}
