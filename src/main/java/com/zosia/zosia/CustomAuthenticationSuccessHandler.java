package com.zosia.zosia;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;


public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	SimpleUrlAuthenticationSuccessHandler userSuccessHandler =
			new SimpleUrlAuthenticationSuccessHandler("/");
	SimpleUrlAuthenticationSuccessHandler adminSuccessHandler =
			new SimpleUrlAuthenticationSuccessHandler("/admin");
	
	@Override
	public void onAuthenticationSuccess (HttpServletRequest request, HttpServletResponse response,
										 Authentication authentication) throws IOException, ServletException {
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (final GrantedAuthority grantedAuthority : authorities) {
			String authorityName = grantedAuthority.getAuthority();
			if (authorityName.equals("ROLE_ADMIN")) {
				
				this.adminSuccessHandler.onAuthenticationSuccess(request, response, authentication);
				return;
			}
		}
		
		this.userSuccessHandler.onAuthenticationSuccess(request, response, authentication);
	}
}