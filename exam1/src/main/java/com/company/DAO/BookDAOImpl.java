package com.company.DAO;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.Domain.BookVO;
import com.company.Domain.SearchVO;

@Repository("BookDAO")
public class BookDAOImpl implements BookDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertBook(BookVO book) {
		mybatis.insert("BookDAO.insertBook",book);
	}
	@Override
	public List<BookVO> getBookList(SearchVO search) throws Exception{
		return mybatis.selectList("BookDAO.getBookList",search);
	}
	@Override
	public int getBookListCnt(SearchVO search)throws Exception{
		return mybatis.selectOne("BookDAO.getBookListCnt",search);
	}
}

