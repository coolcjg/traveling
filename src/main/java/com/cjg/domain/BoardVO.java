package com.cjg.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private Long likeCnt;
	private Long viewCnt;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;

}
