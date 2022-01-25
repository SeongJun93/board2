package com.company.Service;

import java.util.List;

import com.company.Domain.BoardVO;
import com.company.Domain.SearchVO;
import com.company.Domain.UserVO;

public interface BoardService {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList(SearchVO search) throws Exception;
	public int getBoardListCnt(SearchVO search) throws Exception;
	BoardVO getBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
}