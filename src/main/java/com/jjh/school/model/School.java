package com.jjh.school.model;

import lombok.AllArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class School {

	@Id
	@Column(name = "school_id")
	private String id;
	
	private String schoolName;
	
	private String schoolType;
	
	private String schoolCreate;
	
	@Column(nullable = false, length = 5)
	private String type;
	
	@Column(nullable = false, length = 5)
	private String state;
	
	private String address;
	
	private String latitude;
	
	private String longitude;
}
