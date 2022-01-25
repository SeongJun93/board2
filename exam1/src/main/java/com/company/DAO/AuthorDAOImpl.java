package com.company.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.Domain.AuthorVO;
import com.company.Domain.CateVO;
import com.company.Domain.SearchVO;
@Service
public class AuthorDAOImpl implements AuthorDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertAuthor(AuthorVO author) {
		mybatis.insert("AuthorDAO.insertAuthor",author);
	}

	@Override
	public List<AuthorVO> getAuthorList(SearchVO search) {
		return mybatis.selectList("AuthorDAO.getAuthorList",search);
	}
	@Override
	public int getAuthorListCnt(SearchVO search) {
		return mybatis.selectOne("AuthorDAO.getAuthorListCnt",search);
	}

	@Override
	public AuthorVO authorDetal(AuthorVO author) {
		return mybatis.selectOne("AuthorDAO.authorDetail",author);
	}

	@Override
	public void updateAuthor(AuthorVO author) {
		mybatis.update("AuthorDAO.updateAuthor",author);		
	}
	@Override
	public void deleteAuthor(AuthorVO author) {
		mybatis.delete("AuthorDAO.deleteAuthor",author);
	}
	@Override
	public List<CateVO> getCateList(CateVO cate) {
		return mybatis.selectList("AuthorDAO.getCateList",cate);
	}
}
