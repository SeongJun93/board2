package com.company.DAO;

import java.util.List;
import com.company.Domain.BookVO;
import com.company.Domain.SearchVO;

public interface BookDAO {
	void insertBook(BookVO book);
	List<BookVO> getBookList(SearchVO search) throws Exception;
	public int getBookListCnt(SearchVO search) throws Exception;
}
