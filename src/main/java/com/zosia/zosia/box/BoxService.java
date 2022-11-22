package com.zosia.zosia.box;

import com.zosia.zosia.user.User;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;


@Service
public class BoxService {
	
	private final BoxRepository boxRepository;
	
	public BoxService (BoxRepository boxRepository) {
		
		this.boxRepository = boxRepository;
	}
	
	public void addBox (String name, User user) {
		
		Box box = Box.builder()
				.name(name)
				.date(Date.valueOf(LocalDate.now()))
				.user(user).build();
		boxRepository.save(box);
	}
}