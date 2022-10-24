package com.zosia.zosia.user;

import com.zosia.zosia.role.Role;
import com.zosia.zosia.validator.StrongPassword;
import lombok.Getter;
import lombok.Setter;


import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;


@Setter
@Getter
@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(nullable = false, unique = true, length = 60)
	@NotBlank
	@Email
	private String username;
	@Size(min = 2)
	@NotBlank
	private String firstName;
	@Size(min = 2)
	@NotBlank
	private String lastName;
	@StrongPassword
	private String password;
	@Transient
	private String passwordRepeat;
	private int enabled;
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles;
	
	
}
