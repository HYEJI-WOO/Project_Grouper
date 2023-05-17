package com.jafa.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ApplyVO {
	private Long ano;
	private Long bno;
	private String memberId;
	private String name;
	private int year;
	private int month;
	private int day;
	private String phone;
	private String promise;
	private String approve;
	private String author;
	private String groupName;
	private String location;
	private Date startDate;
	private String category;
}
