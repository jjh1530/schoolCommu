package com.jjh.school.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jjh.school.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

	public Page<Board> findBySchoolName(String schoolName, Pageable pageable);

	// 제목 또는 내용에 키워드를 포함하는 게시글 검색
	Page<Board> findBySchoolNameAndTitleContainingOrSchoolNameAndContentContaining(String schoolName, String title,
			String schoolName2, String content, Pageable pageable);

	// 학교이름이 들어가고 AND title이 검색에 포함 또는 학교이름이 들어가고 content가 검색에 포함
	Page<Board> findBySchoolNameInAndTitleContainingOrSchoolNameInAndContentContaining(List<String> schoolNames,
			String title, List<String> otherSchoolNames, String content, Pageable pageable);

}