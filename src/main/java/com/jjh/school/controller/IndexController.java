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
	        @RequestParam(defaultValue = "1") int page, Model model) {

		List<String> schoolNames = new ArrayList<String>();
	    if (principalDetails != null) {
	        String elementarySchool = principalDetails.getUser().getElementarySchool();
	        String middleSchool = principalDetails.getUser().getMiddleSchool();
	        String highSchool = principalDetails.getUser().getHighSchool();
	        if (elementarySchool != null) schoolNames.add(elementarySchool);
	        if (middleSchool != null) schoolNames.add(middleSchool);
	        if (highSchool != null) schoolNames.add(highSchool);
	        
	        for(String x : schoolNames) {
	        	System.out.println("학교이름 :" +x);
	        }
	        
	        Page<Board> elementaryList = boardService.schoolBoard(keyword, schoolNames, page);
	        //System.out.println(elementaryList.getContent());
	        
	        model.addAttribute("elementaryList", elementaryList.getContent());
	        model.addAttribute("total", elementaryList.getTotalElements());
	        model.addAttribute("totalPage", elementaryList.getTotalPages());
	        
	    } else {
	        model.addAttribute("elementaryList", Collections.emptyList());
	        return "/index";
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
