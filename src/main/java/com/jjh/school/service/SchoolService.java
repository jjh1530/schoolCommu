package com.jjh.school.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjh.school.model.School;
import com.jjh.school.repository.SchoolRepository;
import com.jjh.school.repository.UserRepository;

@Service
public class SchoolService {
	
	@Autowired
	SchoolRepository schoolRepository;
	
	public List<School> selectSchool(String schoolName) {
		List<School> schools = schoolRepository.findBySchoolNameContaining(schoolName);
		return schools;
		 
	}
	

}
