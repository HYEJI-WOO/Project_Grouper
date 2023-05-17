package com.jafa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AuthListDTO;
import com.jafa.domain.AuthVO;
import com.jafa.domain.BoardVO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService; 
	
	@PreAuthorize("isAuthenticated()") // 인증된 사용자 
	@GetMapping("/myPage")
	public String myPage(Authentication auth, Model model) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		model.addAttribute("memberInfo", memberVO);
		return "member/myPage";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@GetMapping("/admin")
	public void doAdmin(Model model) {
		log.info("관리자만 접근가능");
		List<MemberVO> memberList = memberService.memberList();
		model.addAttribute("list", memberList);
		model.addAttribute("mType", MemberType.values());
	}
	
	@GetMapping("/accessError")
	public void accessError() {
		log.info("접근이 거부됨.");
		
	}
	
	@GetMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("id") String id) {
	    int result = 0;
	    // 아이디 중복 체크 로직 수행
	    if (memberService.idCheckService(id)) {
	        result = 1;
	    }
	    
	    return result;
	}
	
	@PostMapping("/modMember")
	public String modMember(Authentication auth, @RequestParam String memberId, @RequestParam String email, @RequestParam String address, @RequestParam String phone, RedirectAttributes rttr) {
	    // 회원 정보 업데이트
	    MemberDetail principal = (MemberDetail) auth.getPrincipal();
	    MemberVO memberVO = principal.getMemberVO();
	    memberVO.setMemberId(memberId);
	    memberVO.setEmail(email);
	    memberVO.setAddress(address);
	    memberVO.setPhone(phone);
	    memberService.updateMemberInfo(memberVO);

	    return "redirect:/member/myPage";
	}

	
	@RequestMapping("/login")
	public String login(Authentication authentication, RedirectAttributes rttr) {
		log.info("로그인 페이지");
		if(authentication!=null && authentication.isAuthenticated()) { // 인증된 사용자가 있을 때 
			rttr.addFlashAttribute("loginOn", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}
		return "/member/login";
	}
	
	// 회원가입폼
	@GetMapping("/join")
	public void joinForm() {
		
	}
	
	//회원가입처리
	@PostMapping(value = "/join")
	public String join(MemberVO vo, RedirectAttributes rttr) {
		memberService.join(vo);
		return "redirect:/";
	}
	
	// 회원등급변경 
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@PostMapping("/updateMemberType")
	public String updateMemberType(AuthListDTO authListDTO, RedirectAttributes rttr) {
		log.info(authListDTO.getAuthList());
		List<AuthVO> authList = authListDTO.getAuthList();
		for(AuthVO vo : authList) {
			if(vo.getMemberId()!=null&&vo.getMemberType()!=null){
				memberService.updateMemberType(vo);
			}
		}
		rttr.addFlashAttribute("updateMember", "등급변경");
		return "redirect:/member/admin";
	}
}
