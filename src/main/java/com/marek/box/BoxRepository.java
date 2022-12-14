package com.marek.box;



import com.marek.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BoxRepository extends JpaRepository<Box, Long> {
	
	Page<Box> findBoxesByUser(User user, Pageable pageable);
	
	List<Box> findBoxesByUser(User user);
	
	boolean existsByName(String name);
	
	Box findByNameAndUser(String name, User user);
}
