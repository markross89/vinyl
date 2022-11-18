package com.zosia.zosia.http.album.response.album;

import com.zosia.zosia.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;


@Repository
public interface AlbumRepository extends JpaRepository<Album, Long> {
	
	Set<Album> findAlbumsByUsers(User users);
	
	Page<Album> findAlbumsByUsers(User user, Pageable pageable);

}
