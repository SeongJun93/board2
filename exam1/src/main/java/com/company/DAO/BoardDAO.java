package com.company.DAO;

import java.util.List;

import com.company.Domain.BoardVO;

public interface BoardDAO {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList();
	BoardVO getBoard(BoardVO vo);
}
