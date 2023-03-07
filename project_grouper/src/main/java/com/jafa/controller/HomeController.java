package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.repository.BoardRepository;
import com.jafa.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String home(@ModelAttribute("cri") Criteria criteria, Model model) {
		List<BoardVO> boardList = boardService.boardList(criteria);
		Pagination pagination = boardService.getPagination(criteria);
		model.addAttribute("list", boardList);
		model.addAttribute("p", pagination);
		return "index";
	}

}
