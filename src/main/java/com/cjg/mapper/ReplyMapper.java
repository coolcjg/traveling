package com.cjg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjg.domain.Criteria;
import com.cjg.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	

}
