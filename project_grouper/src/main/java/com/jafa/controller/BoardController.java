package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/detail")
	public void detail(Authentication auth, Long bno, Model model) {
		BoardVO vo = boardService.detail(bno);
		model.addAttribute("b", vo);
	}
	
	@PostMapping("/delete/{bno}")
	public String delete(@PathVariable int bno) {
		boardService.delete(bno);
		return "redirect:/";
	}
	
	@GetMapping("/update/{bno}")
	public String updateForm(@PathVariable Long bno, Model model) {
	    BoardVO vo = boardService.detail(bno);
	    model.addAttribute("b", vo);
	    return "board/update";
	}
	
	@PostMapping("/update")
	public String update(BoardVO vo, RedirectAttributes rttr) {
	    boardService.update(vo);
	    rttr.addFlashAttribute("msg", "게시글이 수정되었습니다.");
	    return "redirect:/board/detail?bno=" + vo.getBno();
	}


	
}
