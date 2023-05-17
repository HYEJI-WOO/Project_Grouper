package com.jafa.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ReplyVO {
  private Long rno;            // 댓글 번호
  private Long bno;            // 게시물 번호
  private String content;     // 댓글 내용
  private String writer;      // 댓글 작성자
  private Date replyDate;     // 댓글 작성 시간
  private Date modifyDate;    // 댓글 수정 시간

}


