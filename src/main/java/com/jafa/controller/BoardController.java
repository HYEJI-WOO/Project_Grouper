package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.ApplyVO;
import com.jafa.domain.BoardVO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberVO;
import com.jafa.domain.ReplyVO;
import com.jafa.service.BoardService;
import com.jafa.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	ReplyService replyService;
	
	// 등록
	@GetMapping("/write")
	public void writeForm() {
		
	}
	
	//등록 처리
	@PostMapping(value = "/write")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		boardService.write(vo);
		return "redirect:/";
	}
	
	@GetMapping("/detail")
	public void detail(Authentication auth, Long bno, Model model) {
	    BoardVO vo = boardService.detail(bno);
	    List<ReplyVO> replies = replyService.getRepliesByBno(bno); // 해당 게시글의 댓글 조회
	    model.addAttribute("b", vo);
	    model.addAttribute("replies", replies); // 조회한 댓글 모델에 추가
	}
	
	@PostMapping("/apply")
	public ResponseEntity<String> apply(@RequestParam Long bno, 
            @RequestParam String memberId,
            @RequestParam String promise,
            @RequestParam String author) {
        ApplyVO applyVO = new ApplyVO();
        applyVO.setBno(bno);
        applyVO.setMemberId(memberId);
        applyVO.setPromise(promise);
        applyVO.setAuthor(author);
        boardService.apply(applyVO);
        
        
        
		return ResponseEntity.ok("success");
	}
	

	@RequestMapping("/joinedGroup")
	public String MyGroup(Model model, Authentication  auth) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		String memberId = memberVO.getMemberId();
		List<ApplyVO> vo = boardService.joinedGroup(memberId);
		model.addAttribute("groupInfo", vo);

	    return "member/joinedGroup";
	}
	
	@RequestMapping("/createdGroup")
	public String createdGroup(Model model, Authentication  auth) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		String memberId = memberVO.getMemberId();
		List<BoardVO> boardVO = boardService.getMyGroup(memberId);
		List<ApplyVO> applyVO = boardService.getApplyMember(memberId);
		model.addAttribute("groupInfo", boardVO);
		model.addAttribute("memberInfo", applyVO);

	    return "member/createdGroup";
	}
	
	@PostMapping("/cancelJoinGroup")
	public ResponseEntity<String> cancelJoinGroup(@RequestParam("bno") Long bno, @RequestParam("memberId") String memberId) {
		ApplyVO vo = new ApplyVO();
		vo.setBno(bno);
		vo.setMemberId(memberId);
		boardService.cancelJoinGroup(vo);
		
	    return ResponseEntity.ok("success");
	}
	
	@PostMapping("/joinEnd")
	public ResponseEntity<String> joinEnd(@RequestParam("bno") Long bno, @RequestParam("memberId") String memberId) {
		ApplyVO applyVO = new ApplyVO();
		BoardVO boardVO = new BoardVO();
		applyVO.setBno(bno);
		applyVO.setMemberId(memberId);
		boardVO.setBno(bno);
		boardService.joinEnd(applyVO);
		boardService.countUp(boardVO);
		
		return ResponseEntity.ok("success");
		
	}
	
	@PostMapping("reject")
	public ResponseEntity<String> reject(@RequestParam("bno") Long bno, @RequestParam("memberId") String memberId) {
		ApplyVO applyVO = new ApplyVO();
		applyVO.setBno(bno);
		applyVO.setMemberId(memberId);
		boardService.reject(applyVO);
		
		return ResponseEntity.ok("success");
		
	}
	
	
	@PostMapping("/delete/{bno}")
	public String delete(@PathVariable int bno) {
		boardService.delete(bno);
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String updateForm(Long bno, Model model) {
	    BoardVO vo = boardService.detail(bno);
	    model.addAttribute("b", vo);
	    return "board/updateForm";
	}
	
	@PostMapping("/update")
	public String updateForm(BoardVO vo, @RequestParam int page, RedirectAttributes rttr) {
	    boardService.update(vo);
	    rttr.addAttribute("bno", vo.getBno());
	    rttr.addAttribute("page", page);
	    return "redirect:/board/detail";
	}



	
	@PostMapping("/replyWrite")
	public ResponseEntity<String> replyWrite(@RequestParam Long bno, 
	                                         @RequestParam String writer,
	                                         @RequestParam String content) {
	  ReplyVO replyVO = new ReplyVO();
	  replyVO.setBno(bno);
	  replyVO.setWriter(writer);
	  replyVO.setContent(content);
	  replyService.addReply(replyVO);

	  return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@PostMapping("/delReply")
	@ResponseBody
	public String deleteReply(@RequestParam("rno") int rno) {
	    replyService.delReply(rno);
	    
	    return "success";
	}

	
	@GetMapping("/myInfo")
	@ResponseBody
	public Object myInfo(Authentication auth, @RequestParam("bno") Long bno, @RequestParam("memberId") String memberId) {
	    // 첫번째 SQL문 실행
		
		System.out.println("-dfefefzzzzz");
		System.out.println(bno);
		System.out.println(memberId);
		
		
		ApplyVO applyVO = new ApplyVO();
			applyVO.setBno(bno);
			applyVO.setMemberId(memberId);
		
	    int count = boardService.checkDuplicateApply(applyVO);
	    System.out.println("-ldkfokeofe");
	    System.out.println(count);
	    
	    if (count > 0) {
	        return "duplicated";
	    } else {
	        // 두번째 SQL문 실행
	        MemberDetail principal = (MemberDetail) auth.getPrincipal();
	        MemberVO memberVO = principal.getMemberVO();
	        return memberVO;
	    }
	}	
}