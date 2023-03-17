package com.jjh.school.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjh.school.config.auth.PrincipalDetails;
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

	@GetMapping("/schoolUpdateForm")
	public String userUpdateForm(@AuthenticationPrincipal PrincipalDetails principalDetails
				,Model model) {
		model.addAttribute("user", principalDetails.getUser());
		if (principalDetails.getUser().getElementarySchool() == null ||principalDetails.getUser().getElementarySchool().equals("") ) {
			return "/user/schoolUpdateForm";
			} else {
				return "redirect:/";
			}
	}
	
	@GetMapping("/schoolUpdateFormLogin")
	public String schoolUpdateFormLogin(@AuthenticationPrincipal PrincipalDetails principalDetails
				,Model model) {
		model.addAttribute("user", principalDetails.getUser());
		return "/user/schoolUpdateForm";
	}
	
	@PostMapping("/schoolUpdate")
	public String schoolUpdate(User user,  HttpSession session) {
		userService.schoolUpdate(user);
		
		
		return "redirect:/";
	}

}
