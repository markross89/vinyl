package com.zosia.zosia.artist;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.album.Album;
import lombok.*;


import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	
	@Id
	@Column(nullable = false)
	private Long id;
	
	private String name;
	
	@ManyToMany(mappedBy = "artists")
	private List<Album> albums;
	
	public void addAlbum (Album album) {
		
		album.addArtist(this);
		this.albums.add(album);
	}

	
}
