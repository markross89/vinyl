package com.zosia.zosia.album;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.zosia.zosia.MessageService;


import com.zosia.zosia.artist.ArtistRepository;
import com.zosia.zosia.image.ImageRepository;
import com.zosia.zosia.label.LabelRepository;
import com.zosia.zosia.track.Track;
import com.zosia.zosia.track.TrackRepository;
import com.zosia.zosia.HttpService;
import com.zosia.zosia.user.User;
import com.zosia.zosia.user.UserRepository;
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
}