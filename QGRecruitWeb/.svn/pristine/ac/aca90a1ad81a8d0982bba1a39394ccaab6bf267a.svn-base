package com.qg.BLL;

import java.util.List;

import com.qg.DAL.AdminLoginDal;
import com.qg.model.Admin;

public class AdminLoginBll {
	AdminLoginDal dal=new AdminLoginDal();
	public AdminLoginBll(){}
	public boolean Exists(String name){
		return dal.Exists(name);
	}
	public boolean Exists(String name,String pwd){
		return dal.Exists(name, pwd);
	}
	
	public Admin getAdminInfo(String name,String pwd){
		return dal.getAdminInfo(name,pwd);
	}
	//获得总组长的名字
	public String getLeaderName(String isTop){
		return dal.getLeaderName(isTop);
	}
	//获取管理员信息列表
	public List<Admin> getAdminInfo(String sql,Object[] params){
		return dal.getAdminInfo(sql, params);
	}
	
	public String getAdminNameInfo(String sql,Object[] params){
		return dal.getAdminNameInfo(sql, params);
	}
}
