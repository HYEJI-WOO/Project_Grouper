package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping(value={"/", "/category={category}", "/location={location}", "/region={region}", 
			                      "/location={location}/category={category}/region={region}"})
	public String home(@ModelAttribute("cri") Criteria criteria, Model model, 
	                   @PathVariable(required = false) String category, 
	                   @PathVariable(required = false) String location,
	                   @PathVariable(required = false) String region) {
	    criteria.setCategory(category);
	    criteria.setLocation(location);
	    criteria.setRegion(region);
	    List<BoardVO> boardList = boardService.boardList(criteria);
	    Pagination pagination = boardService.getPagination(criteria);
	    model.addAttribute("list", boardList);
	    model.addAttribute("p", pagination);
	    return "index";
	}

}