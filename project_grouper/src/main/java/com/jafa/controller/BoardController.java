package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.BoardVO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberVO;
import com.jafa.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 등록
	@GetMapping("/write")
	public void writeForm() {
		
	}
	
	//등록 처리
	@PostMapping(value = "/write")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		boardService.write(vo);
		return "redirect:/";
	}
	
}
