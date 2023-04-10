package com.jjh.school.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;


import lombok.Data;

@Data
@Entity
public class BoardReply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long rno;

	private Long boardIdx;

	@Column(nullable = false, length = 2000)
	private String content;
	
	private String writer;
	
	@CreationTimestamp
	private Timestamp indate;
}
