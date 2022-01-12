package com.company.Service;

import com.company.Domain.UserVO;

public interface UserService  {
	void UserInsert(UserVO vo);
	
	//로그인 회원정보 조회
	public UserVO UserId_Login_Chk(UserVO vo);
}
