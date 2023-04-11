package com.jjh.school.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.jjh.school.model.School;
import com.jjh.school.repository.SchoolRepository;
import com.jjh.school.repository.UserRepository;

@Service
public class SchoolService {

	@Autowired
	SchoolRepository schoolRepository;

	public List<School> selectSchoolList(String schoolName) {
		List<School> schools = schoolRepository.findBySchoolNameContaining(schoolName);
		return schools;
	}

	public School selectSchool(String schoolName) {
		return schoolRepository.findBySchoolName(schoolName);
	}

	public List<School> schoolList() {
		List<School> schools = schoolRepository.findAll();
		return schools;
	}

	public Page<School> schoolList(String schoolName, Pageable pageable) {
		return schoolRepository.findBySchoolNameContaining(schoolName, pageable);
	}

}
