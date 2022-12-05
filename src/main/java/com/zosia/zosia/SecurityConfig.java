package com.zosia.zosia;


import com.zosia.zosia.user.SpringDataUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;



@EnableGlobalMethodSecurity(securedEnabled = true)
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure (HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/users_index").hasRole("ADMIN")
				.antMatchers("/albums", "/songs", "/boxes", "/playlists").authenticated()
				.antMatchers( "/", "/details/{id}").permitAll()
				.and().formLogin(formLogin -> formLogin.successHandler(new CustomAuthenticationSuccessHandler()))
				.formLogin().loginPage("/login")
				.and().logout().logoutSuccessUrl("/")
				.permitAll()
				.and().exceptionHandling().accessDeniedPage("/403");
		http.csrf().disable();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder () {
		
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SpringDataUserDetailsService customUserDetailsService () {
		
		return new SpringDataUserDetailsService();
	}
}