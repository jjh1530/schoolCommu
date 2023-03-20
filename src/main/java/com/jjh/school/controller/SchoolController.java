package com.jjh.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.model.Board;
import com.jjh.school.model.School;
import com.jjh.school.service.BoardService;
import com.jjh.school.service.SchoolService;

@Controller
public class SchoolController {

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/schoolSelect")
	@ResponseBody
	public List<School> scholSelect(String schoolName) {
		List<School> list = schoolService.selectSchoolList(schoolName);
		System.out.println(list);
		if (list!= null) {
			return list;
		}
		return null;
	}

	@GetMapping("/elementaryBoard")
	public String elementaryBoard(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model
			,@RequestParam(defaultValue = "") String keyword
			,@RequestParam(defaultValue = "0") int page) {
		String elementarySchool = principalDetails.getUser().getElementarySchool();
		Page<Board> elementaryList = boardService.searchBoard(keyword, elementarySchool,page);
		model.addAttribute("user", principalDetails.getUser());
		model.addAttribute("elementary", schoolService.selectSchool(elementarySchool));
		model.addAttribute("elementaryList", elementaryList.getContent());
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", elementaryList.getTotalPages());
		return "/board/elementaryBoard";
	}
	
	
	@GetMapping("/middleBoard")
	public String middleBoard(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model
			,@RequestParam(defaultValue = "") String keyword
			,@RequestParam(defaultValue = "0") int page) {
		String middleSchool = principalDetails.getUser().getMiddleSchool();
		Page<Board> middleList = boardService.searchBoard(keyword,middleSchool, page);
		model.addAttribute("user", principalDetails.getUser());
		model.addAttribute("middle", schoolService.selectSchool(middleSchool));
		model.addAttribute("middleList", middleList.getContent());
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", middleList.getTotalPages());
		return "/board/middleBoard";
	}
	
	@GetMapping("/highBoard")
	public String highBoard(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model
			,@RequestParam(defaultValue = "") String keyword
			,@RequestParam(defaultValue = "0") int page) {
		String highSchool = principalDetails.getUser().getHighSchool();
		Page<Board> highList = boardService.searchBoard(keyword,highSchool, page);
		model.addAttribute("user", principalDetails.getUser());
		model.addAttribute("high", schoolService.selectSchool(highSchool));
		model.addAttribute("highList", highList.getContent());
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", highList.getTotalPages());
		return "/board/highBoard";
	}
}
