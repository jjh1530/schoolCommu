package com.jjh.school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjh.school.model.User;
import com.jjh.school.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/user/joinForm";
	}
	
	@PostMapping("/join")
	public String join(User user) {
		userService.join(user);
		return "redirect:/";
	}
}
