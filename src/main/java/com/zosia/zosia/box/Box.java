package com.zosia.zosia.box;

import com.zosia.zosia.album.Album;
import com.zosia.zosia.user.User;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Box {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private Date date;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "albums_boxes", joinColumns = @JoinColumn(name = "box_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "album_id", referencedColumnName = "id"))
	private Set<Album> albums = new HashSet<>();
	
	@ManyToOne
	private User user;
	
	public void removeAlbum (Album album) {
		
		this.albums.remove(album);
		
	}
	
	public void addAlbum(Album album){
		this.albums.add(album);
		album.getBoxes().add(this);
	}
}

