package com.marek.track;

import com.marek.playlist.Playlist;
import com.marek.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TrackRepository extends JpaRepository<Track, Long> {
	
	Page<Track> findByAlbum_Users (User user, Pageable pageable);
	
	Page<Track> findTracksByPlaylists (Playlist playlist, Pageable pageable);

}
