package com.company.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.DAO.AuthorDAO;
import com.company.Domain.AuthorVO;
import com.company.Domain.CateVO;
import com.company.Domain.SearchVO;
@Service
public class AuthorServiceImpl implements AuthorService{

	@Autowired
	private AuthorDAO authorDAO;
	
	@Override
	public void insertAuthor(AuthorVO author) {
		authorDAO.insertAuthor(author);
	}
	@Override
	public List<AuthorVO> getAuthorList(SearchVO search) {
		return authorDAO.getAuthorList(search);
	}
	@Override
	public int getAuthorListCnt(SearchVO search) {
		return authorDAO.getAuthorListCnt(search);
		
	}
	@Override
	public AuthorVO authorDetail(AuthorVO author) {
		return authorDAO.authorDetal(author);
	}
	@Override
	public void updateAuthor(AuthorVO author) {
		authorDAO.updateAuthor(author);
	}
	@Override
	public void deleteAuthor(AuthorVO author) {
		authorDAO.deleteAuthor(author);
	}
	@Override
	public List<CateVO> getCateList() {
		return authorDAO.getCateList();
		
	}
}
