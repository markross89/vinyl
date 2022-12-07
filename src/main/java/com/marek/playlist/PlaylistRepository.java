package com.marek.playlist;

import com.marek.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PlaylistRepository extends JpaRepository<Playlist, Long> {
	
	Page<Playlist> findPlaylistsByUser (User user, Pageable pageable);
	
	List<Playlist> findPlaylistsByUser (User user);
	
	boolean existsByName (String name);
	
	Playlist findByNameAndUser (String name, User user);
	
}
