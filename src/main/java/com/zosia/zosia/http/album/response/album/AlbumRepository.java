package com.zosia.zosia.http.album.response.album;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AlbumRepository extends JpaRepository<Album, Long> {

}
