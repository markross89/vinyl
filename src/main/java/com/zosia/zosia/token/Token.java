package com.zosia.zosia.token;

import com.zosia.zosia.user.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import javax.persistence.*;
import java.time.LocalDateTime;


@NoArgsConstructor
@Getter
@Setter
@Entity
public class Token {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String token;
	private LocalDateTime expireTime;
	@ManyToOne(cascade = {CascadeType.ALL})
	private User user;
	
	
	public Token (String token, User user) {
		
		this.token = token;
		this.user = user;
	}
}
