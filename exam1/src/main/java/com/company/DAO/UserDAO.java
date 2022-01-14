package com.company.DAO;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

public interface UserDAO {
	void UserInsert(UserVO vo);

	//로그인 유저아이디 체크
	UserVO UserId_Login_Chk(UserVO vo);

	UserVO getUser(BoardVO vo);
	
}
