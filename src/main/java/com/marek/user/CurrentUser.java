package com.marek.user;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;


public class CurrentUser extends User {
	
	private final com.marek.user.User user;
	
	public CurrentUser (String username, String password,
						Collection<? extends GrantedAuthority> authorities,
						com.marek.user.User user) {
		
		super(username, password, authorities);
		this.user = user;
	}
	
	public com.marek.user.User getUser () {
		
		return user;
	}
}