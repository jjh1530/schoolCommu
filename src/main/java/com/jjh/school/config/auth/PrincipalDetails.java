package com.jjh.school.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.jjh.school.model.User;

import lombok.Data;


@Data
public class PrincipalDetails implements UserDetails, OAuth2User{
	
	private User user;
	private Map<String, Object> attributes;
	
	//일반 로그인 생성자
	public PrincipalDetails(User user) {
		this.user = user;
	}

	//OAuth 로그인 생성자
	public PrincipalDetails(User user,Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		collect.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return user.getRole().toString();
			}
		});
		return collect;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	// OAuth2를 implement 할 때 오버라이딩
	@Override
	public Map<String, Object> getAttributes() {
		//Map 타입으로 구글 정보를 가져옴
		return attributes;
	}

	@Override
	public String getName() {
		return null;
	}

	
	
}
