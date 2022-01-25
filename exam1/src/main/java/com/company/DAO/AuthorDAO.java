package com.company.DAO;

import java.util.List;

import com.company.Domain.AuthorVO;
import com.company.Domain.CateVO;
import com.company.Domain.SearchVO;

public interface AuthorDAO {
	void insertAuthor(AuthorVO author);
	List<AuthorVO> getAuthorList(SearchVO search);
	AuthorVO authorDetal(AuthorVO author);
	public int getAuthorListCnt(SearchVO search);
	void updateAuthor (AuthorVO author);
	void deleteAuthor(AuthorVO author);
	List<CateVO> getCateList(CateVO cate);
}
