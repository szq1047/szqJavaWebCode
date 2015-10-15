package com.qg.BLL;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qg.DAL.UserDAL;

public class UserBLL {
	UserDAL dal = new UserDAL();
	public int getUserGroupID(String name,int uid) throws SQLException{
		return dal.getUserGroupID(name,uid);
	}
	
	public ResultSet getUserInfo(String name) throws SQLException{
		return dal.getUserInfo(name);
	}
	public int LetBMPass(int formid){
		return dal.LetBMPass(formid);
	}
	
	public String getUserRealName(String name,int uid) throws SQLException{
		return dal.getUserRealName(name,uid);
	}
}
