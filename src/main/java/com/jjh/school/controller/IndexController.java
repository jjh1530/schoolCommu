package com.jjh.school.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.model.Board;
import com.jjh.school.repository.BoardRepository;
import com.jjh.school.service.BoardService;
import com.jjh.school.service.SchoolService;

@Controller
public class IndexController {

	@Autowired
	private SchoolService schoolService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardRepository boardRepository;
	
	@GetMapping("/")
	public String index(@AuthenticationPrincipal PrincipalDetails principalDetails,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "0") int page, Model model) {

		String elementarySchool = null;
		String middleSchool = null;
		String highSchool = null;
		if (principalDetails != null) {
			elementarySchool =principalDetails.getUser().getElementarySchool();
			middleSchool =principalDetails.getUser().getMiddleSchool();
			highSchool =principalDetails.getUser().getHighSchool();
			List<String> schoolName = Arrays.asList(elementarySchool, middleSchool, highSchool);
			Page<Board> elementaryList = boardService.searchBoard(keyword, elementarySchool,page);
			System.out.println(elementaryList.getContent());
			System.out.println("로그인" + elementarySchool);
			model.addAttribute("elementaryList", elementaryList.getContent());
		}else {
			
			
			elementarySchool ="해남동초등학교";
			Page<Board> elementaryList = boardService.searchBoard(keyword, elementarySchool,page);
			System.out.println("비로그인" + elementarySchool);
			model.addAttribute("elementaryList", elementaryList.getContent());
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
