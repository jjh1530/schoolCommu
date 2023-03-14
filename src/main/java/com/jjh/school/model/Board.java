package com.jjh.school.model;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Entity
public class Board {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 100)
	private String title;

	@Column(nullable = false, length = 9999)
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)	//board가 여러개 user는 한명 EAGER : 자동으로 user 정보 가져옴 LAZY : 자동으로 가져오지 않음
	@JoinColumn(name="userId")  //실제로 생서되는 컬럼 이름
	private User user;
	
	@CreationTimestamp
	private Timestamp indate;
}
