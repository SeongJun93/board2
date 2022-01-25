package com.company.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.DAO.BookDAO;
import com.company.Domain.BookVO;
import com.company.Domain.SearchVO;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;

	@Override
	public void insertBook(BookVO book) {
		bookDAO.insertBook(book);
	}
	@Override 
	public List<BookVO> getBookList(SearchVO search) throws Exception{
		return bookDAO.getBookList(search);
	}
	@Override
	public int getBookListCnt(SearchVO search) throws Exception {
		return bookDAO.getBookListCnt(search);
	}
}
