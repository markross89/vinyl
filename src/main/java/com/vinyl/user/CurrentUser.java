package com.vinyl.user;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;


public class CurrentUser extends User {
	
	private final com.vinyl.user.User user;
	
	public CurrentUser (String username, String password,
						Collection<? extends GrantedAuthority> authorities,
						com.vinyl.user.User user) {
		
		super(username, password, authorities);
		this.user = user;
	}
	
	public com.vinyl.user.User getUser () {
		
		return user;
	}
}