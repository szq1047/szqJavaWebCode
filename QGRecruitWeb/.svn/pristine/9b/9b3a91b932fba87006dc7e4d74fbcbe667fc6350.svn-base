package com.qg.BLL;

import java.util.List;

import com.qg.DAL.UserLoginDal;
import com.qg.model.*;

public class UserLoginBll {
	private UserLoginDal dal=new UserLoginDal();
	public UserLoginBll(){}
	public boolean Exists(String name){
		return dal.Exists(name);
	}
	public boolean Exists(String name,String pwd){
		return dal.Exists(name,pwd);
	}
	public boolean Add(User model){
		int result=dal.Add(model);
		if(result!=0){
			return true;
		}else{
			return false;
		}
	}
	
	//根据用户名和密码获得User的编号
	public List getUserId(String name,String pwd){
		return dal.getUserId(name,pwd);
	}
	
	//修改用户考试的状态值
	public int updateUserStatus(String name){
		return dal.updateUserStatus(name);
	}
	public int updateUserStatus(String sql,Object[] params){
		return dal.updateUserStatus(sql, params);
	}
	//根据用户登录名来获取试题通过状态
	public String getTestPassStatus(String userName){
		return dal.getTestPassStatus(userName);
	}
	//获取用户信息
	public List<User> getUserInfo(String sql,Object[] params){
		return dal.getUserInfo(sql, params);
	}
	public String getUserNameInfo(String sql,Object[] params){
		return dal.getUserNameInfo(sql, params);
	}
}
