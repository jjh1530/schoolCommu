package com.jjh.school.controller;

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
import com.jjh.school.service.BoardService;
import com.jjh.school.service.SchoolService;

@Controller
public class IndexController {

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private BoardService boardService;

	@SuppressWarnings("null")
	@GetMapping("/")
	public String index(@AuthenticationPrincipal PrincipalDetails principalDetails,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") int page, Model model) {
		if (principalDetails != null) {
			String elementarySchool = principalDetails.getUser().getElementarySchool();
			String middleSchool = principalDetails.getUser().getMiddleSchool();
			String highSchool = principalDetails.getUser().getHighSchool();
			
			// keyword가 없을 경우 전체 게시물을 가져옵니다.
			if (elementarySchool != null || elementarySchool.equals("")) {
				 PageRequest pageRequest = PageRequest.of(page, 10);
		            Page<Board> elementaryList = boardService.boardList(elementarySchool, pageRequest);
		            //model.addAttribute("elementaryList", elementaryList.getContent());
		            model.addAttribute("elementary", schoolService.selectSchool(elementarySchool));
		            model.addAttribute("currentPage", page);
		            model.addAttribute("totalPages", elementaryList.getTotalPages());
			}
			if (middleSchool != null || middleSchool.equals("")) {
				model.addAttribute("middle", schoolService.selectSchool(middleSchool));
			}
			if (highSchool != null|| highSchool.equals("")) {
			model.addAttribute("high",schoolService.selectSchool(highSchool));
			}
	        	
			model.addAttribute("user", principalDetails.getUser());

		}
		   // keyword가 있을 경우 검색 결과를 가져옵니다.
    	Page<Board> searchResult = boardService.searchBoard(keyword,"해남동초등학교", page);
        model.addAttribute("elementaryList", searchResult.getContent());
        model.addAttribute("keyword", keyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResult.getTotalPages());
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
