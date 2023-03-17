package com.jjh.school.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.config.auth.PrincipalDetailsService;
import com.jjh.school.oauth.PrincipalOauth2UserService;

@Configuration
public class SecurityConfig {
	

	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}

	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeHttpRequests()
			.antMatchers("/admin/**").hasRole("ADMIN")
			.anyRequest().permitAll()
			.and()
			.formLogin()
			.loginPage("/loginForm")
			.loginProcessingUrl("/login")
			
			.defaultSuccessUrl("/")
			//구글 로그인
			.and()
			.oauth2Login()
			.loginPage("/loginForm") //OAUTH2 로그인 폼 지정
			.defaultSuccessUrl("/schoolUpdateForm")
			.userInfoEndpoint()
			.userService(principalOauth2UserService);
			
		
		return http.build();
	}
}
