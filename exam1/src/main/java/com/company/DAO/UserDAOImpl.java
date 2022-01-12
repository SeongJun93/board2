package com.company.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.Domain.UserVO;

@Repository("UserDAO")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void UserInsert(UserVO vo) {
		mybatis.insert("UserDAO.UserInsert",vo);
		System.out.println("ȸ������DAO");
	}


	//�α��� ���̵�üũ
	@Override
	public UserVO UserId_Login_Chk(UserVO vo) {
		return mybatis.selectOne("UserDAO.UserId_Login_Chk",vo);
	}
}
