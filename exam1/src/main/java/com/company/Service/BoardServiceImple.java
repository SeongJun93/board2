package com.company.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.DAO.BoardDAO;
import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

@Service("boardService")
public class BoardServiceImple implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
}

