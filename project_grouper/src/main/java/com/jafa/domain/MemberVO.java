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
	private String email;
	private String phone;
	private int birth;
	private String address;
	private String gender;
	private boolean enabled;
	private List<AuthVO> authList;
}
