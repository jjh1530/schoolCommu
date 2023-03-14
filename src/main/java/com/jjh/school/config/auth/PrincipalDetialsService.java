package com.jjh.school.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jjh.school.model.User;
import com.jjh.school.repository.UserRepository;

//시큐리티 설정에서 loginProcessingUrl("/login")
//login 요청이 오면 자동으로 UserDetailsService 타입으로 IoC 되어있는 loadUserByUserName 함수가 실행
@Service
public class PrincipalDetialsService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;

	
	//username은 loginForm에 있는 username이 넘어옴
	//시큐리티 session(내부Authentication(내부 UserDetails)) 
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User userEntity = userRepository.findByUsername(username);
		if (userEntity != null) {
			return new PrincipalDetails(userEntity);
		}
		return null;
	}
	

}
