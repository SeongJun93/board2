package com.company.Service;

import java.util.List;

import com.company.Domain.AuthorVO;
import com.company.Domain.CateVO;
import com.company.Domain.SearchVO;

public interface AuthorService {
	
	void insertAuthor(AuthorVO author);
	List<AuthorVO> getAuthorList(SearchVO search);
	AuthorVO authorDetail(AuthorVO author);
	public int getAuthorListCnt(SearchVO search);
	void updateAuthor(AuthorVO author);
	void deleteAuthor(AuthorVO author);
	List<CateVO> getCateList();
}
