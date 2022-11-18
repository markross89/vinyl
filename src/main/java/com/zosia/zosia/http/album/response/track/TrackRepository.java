package com.zosia.zosia.http.album.response.track;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;




@Repository
public interface TrackRepository extends JpaRepository<Track, Long> {
	
	
	@Query(value = "select * from track t join albums_users u on t.album_id=u.album_id  where "+
			"u.user_id=?1", nativeQuery = true)
	Page<Track> findTracksByUser(Long id, Pageable pageable);
}
