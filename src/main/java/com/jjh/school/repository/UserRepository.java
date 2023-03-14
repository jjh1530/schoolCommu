package com.jjh.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjh.school.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	public User findByUsername(String username);
}
