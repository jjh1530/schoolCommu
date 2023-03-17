package com.jjh.school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.model.Board;
import com.jjh.school.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/elementaryBoardWriteForm")
	public String boardWriteForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		if (principalDetails != null) {
			model.addAttribute("user", principalDetails.getUser());
		}
		return "/board/elementaryBoardWriteForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(Board vo) {
		boardService.boardWrite(vo);
		return "redirect:/";
	}
}
