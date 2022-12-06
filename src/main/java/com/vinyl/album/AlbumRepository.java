package com.vinyl.album;

import com.vinyl.box.Box;
import com.vinyl.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AlbumRepository extends JpaRepository<Album, Long> {
	
	Page<Album> findAlbumsByUsers (User user, Pageable pageable);
	
	Page<Album> findAlbumsByBoxes (Box box, Pageable pageable);
	
}
