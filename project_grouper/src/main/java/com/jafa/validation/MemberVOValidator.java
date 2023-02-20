package com.jafa.validation;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jafa.domain.MemberVO;

public class MemberVOValidator implements Validator{

	// 검증 대상의 객체 타입 정의
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	// 검증 작업 수행
	@Override
	public void validate(Object target, Errors errors) {
		MemberVO VO = (MemberVO) target;
		
		// 이름
		if(VO.getName()==null || VO.getName().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("memberName", "required.name");
		} else { // 값이 있는 경우
			String memberName = VO.getName();
			if(memberName.length()<2 || memberName.length()>6) { // 이름은 2~6자
				errors.rejectValue("memberName", "length.name");
			} else if(!Pattern.matches("^[가-힣|a-z|A-Z]*$", memberName)) { // 한글 또는 영문
				errors.rejectValue("memberName", "nameChar.name");
			}
		}
		
		// 아이디
		if(VO.getMemberId()==null || VO.getMemberId().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("memberId", "required.memberId");
			// 4~16자, 영문 또는 숫자만 허용
		} else {
			String memberId = VO.getMemberId();
			if(memberId.length()<4 || memberId.length()>16) {
				errors.rejectValue("memberId", "length.memberId");
			} else if(!Pattern.matches("^[a-z|A-Z|0-9]*$", memberId)) {
				errors.rejectValue("memberId", "idChar.id");
			}
		}
		
		// 비밀번호
		if(VO.getPassword()==null || VO.getPassword().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("password", "required.password");
		} else {
			String password = VO.getPassword();
			if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&=])[A-Za-z\\d@$!%*#?&=]{8,}$", password)) {
				errors.rejectValue("password", "limit.password");
			} else if(!password.equals(VO.getPwdCheck())) { 
				// 비밀번호와 비밀번호 확인이 일치 하지않을 경우 
				errors.rejectValue("password", "notMatching.password");
				errors.rejectValue("confirmPassword", "notMatching.password");
			}
		}
		
		// 이메일
		if(VO.getEmail()==null || VO.getEmail().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("email", "required.email");
		} else {
			String email = VO.getEmail();
			if(!Pattern.matches("^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", email)) {
				errors.rejectValue("email", "limit.eamil");
			} 
		}
		
		// 휴대폰번호
		if(VO.getPhone()==null || VO.getPhone().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("phoneNumber", "required.phoneNumber");
		} else {
			String phoneNumber = VO.getPhone();
			if(!Pattern.matches("^01([0|1]{1})([0-9]{4})([0-9]{4})$", phoneNumber)) {
				errors.rejectValue("phoneNumber", "limit.phoneNumber");
			}
		}
	}

}
