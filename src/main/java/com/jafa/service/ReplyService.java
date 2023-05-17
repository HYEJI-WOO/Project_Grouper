package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ReplyVO;
import com.jafa.repository.ReplyRepository;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;
	
	public void addReply(ReplyVO replyVO) {
		replyRepository.save(replyVO);
	}
	
	public List<ReplyVO> getRepliesByBno(Long bno) {
		return replyRepository.getRepliesByBno(bno);
	}

	public void delReply(int rno) {
		replyRepository.delReply(rno);
		
	}
}
