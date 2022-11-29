package com.zosia.zosia.album;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;


import com.zosia.zosia.artist.ArtistRepository;
import com.zosia.zosia.box.Box;
import com.zosia.zosia.box.BoxRepository;
import com.zosia.zosia.box.BoxService;
import com.zosia.zosia.label.LabelRepository;
import com.zosia.zosia.track.Track;
import com.zosia.zosia.HttpService;
import com.zosia.zosia.user.User;
import org.springframework.stereotype.Service;

import java.util.HashSet;


@Service
public class AlbumService {
	
	private final HttpService httpService;
	private final MessageService messageService;
	private final BoxService boxService;
	private final LabelRepository labelRepository;
	private final BoxRepository boxRepository;
	private final ArtistRepository artistRepository;
	private final AlbumRepository albumRepository;

	
	public AlbumService (HttpService httpService, MessageService messageService, LabelRepository labelRepository,
						 ArtistRepository artistRepository, AlbumRepository albumRepository,
						 BoxService boxService, BoxRepository boxRepository) {
		
		this.httpService = httpService;
		this.messageService = messageService;
		this.boxService = boxService;
		this.labelRepository = labelRepository;
		this.artistRepository = artistRepository;
		this.albumRepository = albumRepository;
		this.boxRepository = boxRepository;
	}
	
	public <T> T requestAlbumBuilder (Class<T> type, long id) throws JsonProcessingException {
		
		return httpService.mapRequestData(String.join("", messageService.getMessage("api.link.discogs.album"), String.valueOf(id).replaceAll(" ",
						"+"), "?",
				messageService.getMessage("api.link.discogs.key.secret")), type);
		
	}
	
	public void saveAlbum (long id, User user) throws JsonProcessingException {
		
		
		if (albumRepository.findById(id).isEmpty()) {
			Album album = requestAlbumBuilder(Album.class, id);
			album.saveImage();
			album.saveTrack();
			album.addUser(user);
			album.setBoxes(new HashSet<>());
			albumRepository.save(album);
		}
		else {
			Album a = albumRepository.findById(id).get();
			a.addUser(user);
			albumRepository.save(a);
		}
	}
	
	public void deleteAlbum (long id, User user) {
		
		Album album = albumRepository.findById(id).get();
		album.removeUser(user);
		album.removeBox();
		album.getTracklist().forEach(Track::removeTracksFromPlaylists);
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
	public void addAlbumToMultipleBoxes (String name, User user, Long id, Album album) {

		Album a = albumRepository.findById(id).get();
		if (!name.equals("")) {
			boxService.addBox(name, user);
			Box newBox = boxRepository.findByName(name);
			a.addBox(newBox);
		}
		album.getBoxes().forEach(a::addBox);
		albumRepository.save(a);
	}
}