package com.company.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.DAO.UserDAO;
import com.company.Domain.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void UserInsert(UserVO vo){
		userDAO.UserInsert(vo);	
		System.out.println("회원가입SERVICE");
	}

	//유저 로그인 아이디체크
	@Override
	public UserVO UserId_Login_Chk(UserVO vo) {
		return userDAO.UserId_Login_Chk(vo);
	}
}

