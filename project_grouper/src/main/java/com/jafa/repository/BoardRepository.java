package com.jafa.repository;

import java.util.List;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;

public interface BoardRepository {
	
	// 등록
	void save(BoardVO vo);
	
	// 목록
	List<BoardVO> boardList(Criteria criteria);
	
	int getTotalCount(Criteria criteria);
	
	BoardVO get(Long bno);

	void deleteById(int bno);
	
	
	
}
