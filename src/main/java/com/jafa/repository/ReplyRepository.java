package com.jafa.repository;

import java.util.List;

import com.jafa.domain.ReplyVO;

public interface ReplyRepository {
	
	void save(ReplyVO replyVO);
	
	List<ReplyVO> getRepliesByBno(Long bno);
	
	void delReply(int rno);
}
