package com.jafa.repository;

import java.util.List;

import com.jafa.domain.ApplyVO;
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

	void updateById(BoardVO vo);

	void applyById(ApplyVO applyVO);

	List<ApplyVO> joinedGroup(String memberId);

	void cancelJoinGroup(ApplyVO vo);

	List<BoardVO> getMyGroup(String memberId);

	List<ApplyVO> getApplyMember(String memberId);

	void joinEnd(ApplyVO applyVO);

	void countUp(BoardVO boardVO);

	void reject(ApplyVO applyVO);

	int checkDuplicateApply(ApplyVO applyVO);
	
}
