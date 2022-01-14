package com.company.Service;

import java.util.List;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

public interface BoardService {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList();
	BoardVO getBoard(BoardVO vo);

}