package com.zosia.zosia.playlist;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PlaylistRepository extends JpaRepository<Playlist, Long> {

}
