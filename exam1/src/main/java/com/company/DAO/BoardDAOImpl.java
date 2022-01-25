package com.company.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.Domain.BoardVO;
import com.company.Domain.SearchVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard",vo);
	}
	@Override
	public List<BoardVO> getBoardList(SearchVO search) throws Exception {
		return mybatis.selectList("BoardDAO.getBoardList",search);
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {	
		return mybatis.selectOne("BoardDAO.getBoard",vo);
	}
	@Override
	public int getBoardListCnt(SearchVO search) throws Exception {
		return mybatis.selectOne("BoardDAO.getBoardListCnt",search);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard",vo);
	}
	@Override
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard",vo);
	}
}
