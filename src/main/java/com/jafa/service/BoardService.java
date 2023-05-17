package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.ApplyVO;
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
	
	public void delete(int bno) {
        boardRepository.deleteById(bno);
    }

	public void update(BoardVO vo) {
		boardRepository.updateById(vo);
	}
	
	public void apply(ApplyVO applyVO) {
		boardRepository.applyById(applyVO);
	}

	public List<ApplyVO> joinedGroup(String memberId) {
		return boardRepository.joinedGroup(memberId);
	}

	public void cancelJoinGroup(ApplyVO vo) {
		boardRepository.cancelJoinGroup(vo);
		
	}

	public List<BoardVO> getMyGroup(String memberId) {
		return boardRepository.getMyGroup(memberId);
	}


	public List<ApplyVO> getApplyMember(String memberId) {
		
		return boardRepository.getApplyMember(memberId);
	}

	public void joinEnd(ApplyVO applyVO) {
		boardRepository.joinEnd(applyVO);
	}

	public void countUp(BoardVO boardVO) {
		boardRepository.countUp(boardVO);
	}

	public void reject(ApplyVO applyVO) {
		boardRepository.reject(applyVO);
	}

	public int checkDuplicateApply(ApplyVO applyVO) {
	    return boardRepository.checkDuplicateApply(applyVO);
	}

	
			
}
