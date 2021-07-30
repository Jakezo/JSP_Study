package ch1.domain.userinfo.dao.oracle;

import ch1.domain.userinfo.UserInfo;
import ch1.domain.userinfo.dao.UserInfoDao;

public class UserInfoOracle implements UserInfoDao{
	
	@Override
	public void insertUserInfo(UserInfo userInfo) {
		System.out.println("Insert into Oracle DB userID = " + userInfo.getUserId());
		
	}

	@Override
	public void updateUserInfo(UserInfo userInfo) {
		System.out.println("Update into Oracle DB userID = " + userInfo.getUserId());
		
	}

	@Override
	public void deleteUserInfo(UserInfo userInfo) {
		System.out.println("Delete from Oracle DB userID = " + userInfo.getUserId());
		
	}




}
