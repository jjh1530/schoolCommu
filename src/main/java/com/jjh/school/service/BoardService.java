package com.jjh.school.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjh.school.model.Board;
import com.jjh.school.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	public void boardWrite(Board board) {
		boardRepository.save(board);
	}
	
	

}
