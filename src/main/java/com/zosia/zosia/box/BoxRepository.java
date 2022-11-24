package com.zosia.zosia.box;



import com.zosia.zosia.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;




@Repository
public interface BoxRepository extends JpaRepository<Box, Long> {
	
	Page<Box> findBoxesByUser(User user, Pageable pageable);
	
	boolean existsByName(String name);
}
