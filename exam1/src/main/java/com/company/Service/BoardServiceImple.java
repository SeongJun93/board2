package com.company.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.DAO.BoardDAO;
import com.company.Domain.BoardVO;
import com.company.Domain.SearchVO;
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
	public List<BoardVO> getBoardList(SearchVO search) throws Exception {
		return boardDAO.getBoardList(search);
	}
	@Override
	public int getBoardListCnt(SearchVO search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
}

