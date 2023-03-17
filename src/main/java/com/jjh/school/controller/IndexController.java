package com.jjh.school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.service.SchoolService;

@Controller
public class IndexController {

	@Autowired
	private SchoolService schoolService;

	@GetMapping("/")
	public String index(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		if (principalDetails != null) {
			if (principalDetails.getUser().getElementarySchool() != null
					|| principalDetails.getUser().getElementarySchool().equals("")) {
				model.addAttribute("elementary",
						schoolService.selectSchool(principalDetails.getUser().getElementarySchool()));
			}
			if (principalDetails.getUser().getMiddleSchool() != null
					|| principalDetails.getUser().getMiddleSchool().equals("")) {
				model.addAttribute("middle", schoolService.selectSchool(principalDetails.getUser().getMiddleSchool()));
			}
			if (principalDetails.getUser().getHighSchool() != null
					|| principalDetails.getUser().getHighSchool().equals("")) {
			model.addAttribute("high",schoolService.selectSchool(principalDetails.getUser().getHighSchool()));
			}
			model.addAttribute("user", principalDetails.getUser());

		}
		return "/index";

	}

	@GetMapping("/admin/test")
	@ResponseBody
	public String adminTest() {
		return "test";
	}

	@GetMapping("/test")
	@ResponseBody
	public String adminsTest() {
		return "test";
	}

}
