package com.company.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard",vo);
	}
	@Override
	public List<BoardVO> getBoardList() {
		return mybatis.selectList("BoardDAO.getBoardList");
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {	
		return mybatis.selectOne("BoardDAO.getBoard",vo);
	}
}
