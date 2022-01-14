package com.company.DAO;

import java.util.List;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

public interface BoardDAO {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList();
	BoardVO getBoard(BoardVO vo);
}
