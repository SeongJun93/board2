package com.company.Service;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;

public interface UserService  {
	void UserInsert(UserVO vo);
	
	//�α��� ȸ������ ��ȸ
	public UserVO UserId_Login_Chk(UserVO vo);

	UserVO getUser(BoardVO vo);
}
