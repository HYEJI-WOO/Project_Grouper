package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	BoardRepository boardRepository;
	
	// 등록
	@Transactional
	public void write(BoardVO vo) {
		boardRepository.save(vo);
	}
	
	public List<BoardVO> boardList(Criteria criteria) {
		return boardRepository.boardList(criteria);
	}
	
	public BoardVO detail(Long bno) {
		return boardRepository.get(bno);
	}

	public Pagination getPagination(Criteria criteria) {
	    Pagination pagination = new Pagination(criteria, boardRepository.getTotalCount(criteria));
	    return pagination;
	  }
			
}
