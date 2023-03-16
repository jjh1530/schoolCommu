package com.jjh.school.oauth.provider;

public interface OAuth2UserInfo {
	String getProviderId();
	String getProvider();
	String getName();
	String getEmail();
}
