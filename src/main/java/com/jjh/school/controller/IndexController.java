package com.jjh.school.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
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
import com.jjh.school.model.School;
import com.jjh.school.repository.BoardRepository;
import com.jjh.school.service.BoardService;
import com.jjh.school.service.SchoolService;

@Controller
public class IndexController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private SchoolService schoolService;

	@GetMapping("/")
	public String index(@AuthenticationPrincipal PrincipalDetails principalDetails,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") int page, Model model) {

		List<String> schoolNames = new ArrayList<String>();
		if (principalDetails != null) {
			String elementarySchool = principalDetails.getUser().getElementarySchool();
			String middleSchool = principalDetails.getUser().getMiddleSchool();
			String highSchool = principalDetails.getUser().getHighSchool();
			if (elementarySchool != null)
				schoolNames.add(elementarySchool);
			if (middleSchool != null)
				schoolNames.add(middleSchool);
			if (highSchool != null)
				schoolNames.add(highSchool);

			Page<Board> elementaryList = boardService.schoolBoard(keyword, schoolNames, page);
			// System.out.println(elementaryList.getContent());

			model.addAttribute("elementaryList", elementaryList.getContent());
			model.addAttribute("keyword", keyword);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", elementaryList.getTotalPages());

		} else {
			model.addAttribute("elementaryList", Collections.emptyList());
			return "/index";
		}

		return "/index";
	}

	@GetMapping("/admin")
    public String adminTest(Model model, @RequestParam(defaultValue = "") String keyword,
                            @RequestParam(defaultValue = "0") int page) {
        PageRequest pageable = PageRequest.of(page, 20, Sort.by("schoolName").ascending());
        Page<School> school = schoolService.schoolList(keyword, pageable);
        model.addAttribute("school", school.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalPages", school.getTotalPages());
        model.addAttribute("totalElements", school.getTotalElements());
        return "/admin/main";
    }

	@GetMapping("/test")
	@ResponseBody
	public String adminsTest() {
		return "test";
	}

}
