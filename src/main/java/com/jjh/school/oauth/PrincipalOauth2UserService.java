package com.jjh.school.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.model.Role;
import com.jjh.school.model.User;
import com.jjh.school.repository.UserRepository;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

	@Autowired
	private UserRepository userRepository;

	

	// 구글로 부터 받은 userRequest 데이터에 대한 후 처리되는 함수
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2User oAuth2User = super.loadUser(userRequest);
		// 구글로그인 버튼 클릭 -> 구글로그인창 -> 로그인 완료 -> code 리턴(OAuth-Client 라이브러리) -> AccessToken
		// 요청
		// userRequest정보 -> loadUser 함수 호출 -> 회원프로필 받기
		System.out.println("getAttributes : " + oAuth2User.getAttributes());

		// 회원가입 진행
		String provider = userRequest.getClientRegistration().getRegistrationId(); // google
		String providerId = oAuth2User.getAttribute("sub");
		String username = provider + "_" + providerId;
		String name = oAuth2User.getAttribute("name");
		
		User userEntity = userRepository.findByUsername(username);
		if (userEntity == null) { // 회원가입
			userEntity = User.builder()
			.username(username)
			.oauth(provider)
			.password("password")
			.name(name)
			.role(Role.USER)
			.build();
			System.out.println(userEntity+"@@@@@@@@@@@@@");
			userRepository.save(userEntity);
			
		}
		return new PrincipalDetails(userEntity, oAuth2User.getAttributes());
	}

}
