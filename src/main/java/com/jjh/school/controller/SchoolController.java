package com.jjh.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjh.school.model.School;
import com.jjh.school.service.SchoolService;

@Controller
public class SchoolController {

	@Autowired
	private SchoolService schoolService;
	
	@PostMapping("/schoolSelect")
	@ResponseBody
	public List<School> scholSelect(String schoolName) {
		List<School> list = schoolService.selectSchool(schoolName);
		System.out.println(list);
		if (list!= null) {
			return list;
		}
		return null;
	}

	
}
