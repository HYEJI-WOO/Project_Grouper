package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jafa.domain.BoardVO;
import com.jafa.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("list", boardList);
		return "index";
	}

}
