package com.jjh.school.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjh.school.model.Role;
import com.jjh.school.model.User;
import com.jjh.school.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public void join(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(Role.ROLE_USER);
		userRepository.save(user);
	}
	
	@Transactional
	public void schoolUpdate(User user) {
		User updateUser = userRepository.findById(user.getId()).orElse(null);
		if (updateUser == null) {
            throw new RuntimeException("User not found");
        }

        updateUser.setElementarySchool(user.getElementarySchool());
        updateUser.setMiddleSchool(user.getMiddleSchool());
        updateUser.setHighSchool(user.getHighSchool());

        userRepository.save(updateUser);
	}

}
