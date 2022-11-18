package com.zosia.zosia.http.album.response.album;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;


import com.zosia.zosia.http.album.response.artist.ArtistRepository;
import com.zosia.zosia.http.album.response.image.ImageRepository;
import com.zosia.zosia.http.album.response.label.LabelRepository;
import com.zosia.zosia.http.album.response.track.TrackRepository;
import com.zosia.zosia.http.service.HttpService;
import com.zosia.zosia.user.User;
import com.zosia.zosia.user.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Set;


@Service
public class AlbumService {
	
	private final HttpService httpService;
	private final MessageService messageService;
	private final ImageRepository imageRepository;
	private final LabelRepository labelRepository;
	private final TrackRepository trackRepository;
	private final ArtistRepository artistRepository;
	private final AlbumRepository albumRepository;
	private final UserRepository userRepository;
	
	public AlbumService (HttpService httpService, MessageService messageService, ImageRepository imageRepository, LabelRepository labelRepository,
						 TrackRepository trackRepository, ArtistRepository artistRepository, AlbumRepository albumRepository,
						 UserRepository userRepository) {
		
		this.httpService = httpService;
		this.messageService = messageService;
		this.imageRepository = imageRepository;
		this.labelRepository = labelRepository;
		this.trackRepository = trackRepository;
		
		this.artistRepository = artistRepository;
		this.albumRepository = albumRepository;
		this.userRepository = userRepository;
	}
	
	public <T> T requestAlbumBuilder (Class<T> type, String id) throws JsonProcessingException {
		
		return httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.album"), id.replaceAll(" ", "+"), "?",
				messageService.getMessage("api.link.discogs.key.secret")), type);
		
	}
	
	public void saveAlbum (String id, User user) throws JsonProcessingException {
		
		
		if (albumRepository.findById(Long.parseLong(id)).isEmpty()) {
			Album album = requestAlbumBuilder(Album.class, id);
			album.addUser(user);
			albumRepository.save(album);
		}
		else {
			Album a = albumRepository.findById(Long.parseLong(id)).get();
			a.addUser(user);
			albumRepository.save(a);
		}
	}
	
	public void deleteAlbum (String id, User user) throws JsonProcessingException {
		
		Album album = albumRepository.findById(Long.parseLong(id)).get();
		album.removeUser(userRepository.findById(user.getId()).get());
		albumRepository.save(album);
		
		if (album.getUsers().isEmpty()) {
			album.removeArtist();
			album.removeLabel();
			albumRepository.save(album);
			albumRepository.delete(album);
			
			artistRepository.findAll().forEach(artist -> {
				if (artist.getAlbums().isEmpty()) {artistRepository.delete(artist);}
			});
			labelRepository.findAll().forEach(label -> {
				if (label.getAlbums().isEmpty()) {labelRepository.delete(label);}
			});
		}
	}
	
	public void displayAlbum(String id, User user, String option) throws JsonProcessingException {
		
		if(option.equals("delete")){
			deleteAlbum(id, user);
		}else if(option.equals("save")){
			saveAlbum(id, user);
		}
		
	}
	
}