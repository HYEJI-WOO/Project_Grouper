package com.jafa.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
	private Long mno; 
	private String memberId; 
	private String password; 
	private String pwdCheck;
	private String name;
	private String email;
	private String phone;
	private int year;
	private int month;
	private int day;
	private String address;
	private String gender;
	private List<AuthVO> authList;
}
