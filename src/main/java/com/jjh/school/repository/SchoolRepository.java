package com.jjh.school.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jjh.school.model.School;

public interface SchoolRepository extends JpaRepository<School, String>{
	
	List<School> findBySchoolNameContaining(String schoolName);
	
	School findBySchoolName(String schoolName);
	
	Page<School> findBySchoolNameContaining(String schoolName, Pageable pageable);
}
