package com.jafa.repository;

import java.util.List;

import com.jafa.domain.BoardVO;

public interface BoardRepository {
	
	// 등록
	void save(BoardVO vo);
	
	// 목록
	List<BoardVO> boardList();
}
