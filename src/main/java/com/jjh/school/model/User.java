package com.jjh.school.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 100, unique = true)
	private String username;
	
	@Column(length = 100)
	private String password;
	
	@Column(nullable = false, length = 50)
	private String name;
	
	private String elementarySchool;
	
	private String middleSchool;
	
	private String highSchool;
	
	private String oauth; // kakao
	
	@Enumerated(EnumType.STRING)
	private Role role;

	@Builder
	public User(int id, String username, String password, String name, String elementarySchool, String middleSchool,
			String highSchool, String oauth, Role role) {
		super();
		this.id = id;
		this.username = username;
		this.password = new BCryptPasswordEncoder().encode(password);
		this.name = name;
		this.elementarySchool = elementarySchool;
		this.middleSchool = middleSchool;
		this.highSchool = highSchool;
		this.oauth = oauth;
		this.role = role;
	}

	
	
	
}
