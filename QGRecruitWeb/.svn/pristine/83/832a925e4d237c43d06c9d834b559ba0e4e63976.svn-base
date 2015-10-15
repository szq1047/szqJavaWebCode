package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.Admin;

public class AdminLoginDal {
	public AdminLoginDal(){}
	public boolean Exists(String name){
		String sql="select count(*) from tb_admin where admin_Name=?";
		String[] params={name};
		return DblHelper.Exists(sql, params);
	}
	public boolean Exists(String name,String pwd){
		String sql="select count(*) from tb_admin where admin_Name=? and admin_Pwd=?";
		String[] params={name,pwd};
		return DblHelper.Exists(sql, params);
	}
	public Admin getAdminInfo(String name,String pwd){
		String sql="select * from tb_admin where admin_Name=? and admin_Pwd=?";
		String[] params={name,pwd};
		ResultSet rs= DblHelper.executeQueryRS(sql, params);
		Admin admin=null;
		try {
			while(rs.next()){
				admin=new Admin();
				admin.setAdminId(rs.getInt(1));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPwd(rs.getString(3));
				admin.setAdminTop(rs.getString(4));
				admin.setAdminMid(rs.getString(5));
				admin.setAdminBot(rs.getString(6));
				admin.setAdminGroupId(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return admin;
	}
	//获得总组长的名字
	public String getLeaderName(String isTop){
		String sql="select admin_Name from tb_admin where admin_Top=?";
		String[] params={isTop};
		ResultSet rs= DblHelper.executeQueryRS(sql, params);
		String name=null;
		try {
			while(rs.next()){
				name=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return name;
	}
	
	//根据组名获取用户管理员信息
	public List<Admin> getAdminInfo(String sql,Object[] params){
		List<Admin> list=new ArrayList<Admin>();
		ResultSet rs=DblHelper.executeQueryRS(sql, params);
		try {
			while(rs.next()){
				Admin admin=new Admin();
				admin.setAdminId(rs.getInt(1));
				admin.setAdminId(rs.getInt(1));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPwd(rs.getString(3));
				admin.setAdminTop(rs.getString(4));
				admin.setAdminMid(rs.getString(5));
				admin.setAdminBot(rs.getString(6));
				admin.setAdminGroupId(rs.getString(7));
				list.add(admin);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	//获得姓名
	public String getAdminNameInfo(String sql,Object[] params){
		String str=null;
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				str=rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DblHelper.closeAll();
		}
		return str;
	}
	
}
