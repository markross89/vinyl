package com.vinyl.album;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.vinyl.HttpService;
import com.vinyl.artist.ArtistRepository;
import com.vinyl.label.LabelRepository;
import com.vinyl.MessageService;


import com.vinyl.box.Box;
import com.vinyl.box.BoxRepository;
import com.vinyl.box.BoxService;
import com.vinyl.track.Track;
import com.vinyl.user.User;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;


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
	
	public String saveAlbum (long id, User user) throws JsonProcessingException {
		
		Optional<Album> album = albumRepository.findById(id);
		if (album.isEmpty()) {
			Album newAlbum = requestAlbumBuilder(Album.class, id);
			newAlbum.saveImage();
			newAlbum.saveTrack();
			newAlbum.addUser(user);
			newAlbum.setBoxes(new HashSet<>());
			albumRepository.save(newAlbum);
		}
		else if (album.get().getUsers().contains(user)) {
			
			return messageService.getMessage("exist.message");
		}
		else {
			album.get().addUser(user);
			albumRepository.save(album.get());
		}
		return messageService.getMessage("added.successfully");
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
			albumRepository.delete(album);
			
			artistRepository.findAll().forEach(artist -> {
				if (artist.getAlbums().isEmpty()) {artistRepository.delete(artist);}
			});
			labelRepository.findAll().forEach(label -> {
				if (label.getAlbums().isEmpty()) {labelRepository.delete(label);}
			});
		}
		messageService.getMessage("deleted.successfully");
	}
	
	public String addAlbumToMultipleBoxes (String name, User user, Long id, Album album) {
		Box b = boxRepository.findByName(name);
		if (b != null) {
			return messageService.getMessage("exist.message");
		}
		Album a = albumRepository.findById(id).get();
		a.replaceBoxes(album.getBoxes());
		if (!name.equals("")) {
			boxService.addBox(name, user);
			a.addBox(boxRepository.findByName(name));
		}
		albumRepository.save(a);
		return messageService.getMessage("element.added.to")+" "+a.printBoxes();
	}
	
	public void deleteAlbumFromBox(long box_id, long album_id) {
		
		Box box = boxRepository.findById(box_id).get();
		box.removeAlbum(albumRepository.findById(album_id).get());
		boxRepository.save(box);
	}
}