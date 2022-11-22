package com.zosia.zosia.playlist;

import com.zosia.zosia.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PlaylistRepository extends JpaRepository<Playlist, Long> {
	
	Page<Playlist> findPlaylistsByUser (User user, Pageable pageable);
}
