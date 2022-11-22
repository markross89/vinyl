package com.zosia.zosia.playlist;

import com.zosia.zosia.track.Track;
import com.zosia.zosia.user.User;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Playlist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private Date date;
	
	@ManyToMany
	private List<Track> tracks;
	
	@ManyToOne
	private User user;
}
