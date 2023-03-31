package com.jjh.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jjh.school.model.BoardReply;

public interface BoardReplyRepository extends JpaRepository<BoardReply, Integer>{

	List<BoardReply> findByboardId(int boardId);
}
