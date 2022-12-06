package com.vinyl.box;

import com.vinyl.user.User;
import com.vinyl.album.Album;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
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
		album.getBoxes().remove(this);
	}
	public void addAlbum (Album album) {
		
		this.albums.add(album);
		album.getBoxes().add(this);
	}
	
	@Override
	public String toString () {
		
		return name;
	}
}

