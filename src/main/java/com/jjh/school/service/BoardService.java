package com.jjh.school.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjh.school.model.Board;
import com.jjh.school.model.User;
import com.jjh.school.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	BoardRepository boardRepository;

	@Transactional
	public void boardWrite(Board board, User user) {
		board.setUser(user);
		boardRepository.save(board);
	}

	public Page<Board> boardList(String schoolName, Pageable pageable) {
		return boardRepository.findBySchoolName(schoolName, pageable);
	}

	public Page<Board> searchBoard(String keyword, String schoolName, int page) {
		PageRequest pageRequest = PageRequest.of(page, 10);
		return boardRepository.findBySchoolNameAndTitleContainingOrSchoolNameAndContentContaining(schoolName, keyword,
				schoolName, keyword, pageRequest);
	}

	public Page<Board> schoolBoard(String keyword, List<String> schoolNames, int page) {
	    PageRequest pageRequest = PageRequest.of(page - 1, 10);
	    return boardRepository.findBySchoolNameInAndTitleContainingOrSchoolNameInAndContentContaining(schoolNames, keyword, schoolNames, keyword, pageRequest);
	}
	
	public Board boardDetail(int id) {
		Optional<Board> vo = boardRepository.findById(id);
		return vo.get();
	}

}
