package com.company.DAO;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

public interface UserDAO {
	void UserInsert(UserVO vo);

	//�α��� �������̵� üũ
	UserVO UserId_Login_Chk(UserVO vo);

	UserVO getUser(BoardVO vo);
	
}
