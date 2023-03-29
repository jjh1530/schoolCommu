package com.jjh.school.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjh.school.config.auth.PrincipalDetails;
import com.jjh.school.model.Board;
import com.jjh.school.model.User;
import com.jjh.school.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/elementaryBoardWriteForm")
	public String elementaryBoardWriteForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		if (principalDetails != null) {
			model.addAttribute("user", principalDetails.getUser());
		}
		return "/board/elementaryBoardWriteForm";
	}
	
	@GetMapping("/middleBoardWriteForm")
	public String middleBoardWriteForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		if (principalDetails != null) {
			model.addAttribute("user", principalDetails.getUser());
		}
		return "/board/middleBoardWriteForm";
	}
	
	@GetMapping("/highBoardWriteForm")
	public String highBoardWriteForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		if (principalDetails != null) {
			model.addAttribute("user", principalDetails.getUser());
		}
		return "/board/highBoardWriteForm";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(Board vo,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		boardService.boardWrite(vo,principalDetails.getUser());
		
		return "redirect:/";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(int id, Model model) {
		model.addAttribute("vo", boardService.boardDetail(id));
		return "/board/boardDetail";
	}
}
