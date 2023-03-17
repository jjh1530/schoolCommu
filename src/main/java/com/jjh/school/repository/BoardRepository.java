package com.jjh.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjh.school.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{
	
}
