package com.zosia.zosia.http.album.response.album;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;


import com.zosia.zosia.http.album.response.artist.ArtistRepository;
import com.zosia.zosia.http.album.response.image.ImageRepository;
import com.zosia.zosia.http.album.response.label.LabelRepository;
import com.zosia.zosia.http.album.response.track.TrackRepository;
import com.zosia.zosia.http.service.HttpService;
import org.springframework.stereotype.Service;




@Service
public class AlbumService {
	
	private final HttpService httpService;
	private final MessageService messageService;
	private final ImageRepository imageRepository;
	private final LabelRepository labelRepository;
	private final TrackRepository trackRepository;
	private final ArtistRepository artistRepository;
	private final AlbumRepository albumRepository;
	
	public AlbumService (HttpService httpService, MessageService messageService, ImageRepository imageRepository, LabelRepository labelRepository,
						 TrackRepository trackRepository, ArtistRepository artistRepository, AlbumRepository albumRepository) {
		
		this.httpService = httpService;
		this.messageService = messageService;
		this.imageRepository = imageRepository;
		this.labelRepository = labelRepository;
		this.trackRepository = trackRepository;
		
		this.artistRepository = artistRepository;
		this.albumRepository = albumRepository;
	}
	
	public <T> T requestAlbumBuilder (Class<T> type, String id) throws JsonProcessingException {
		
		return httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.album"), id.replaceAll(" ", "+"), "?",
				messageService.getMessage("api.link.discogs.key.secret")), type);
		
	}
	
	public void saveAlbum (String id) throws JsonProcessingException {
		
		Album album = requestAlbumBuilder(Album.class, id);
		
	
		albumRepository.delete(album);
		
		
	}
	
}