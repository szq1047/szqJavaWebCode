package com.qg.DAL;

import com.qg.Common.DblHelper;
import com.qg.model.AdminAndUser;

import java.sql.ResultSet;
import java.util.*;

public class AdminAndUserDal {
	public int AddAdminAndUser(AdminAndUser aduser){
		String sql="insert into tb_admin_user(admin_ID,admin_Name,user_ID,user_Name,groupId) values(?,?,?,?,?)";
		Object[] params={aduser.getAdminId(),aduser.getAdminName(),aduser.getUserId(),aduser.getUserName(),aduser.getGroupId()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	public List<AdminAndUser> getAllInfo(String groupId){
		String sql="select *from tb_admin_user where groupId=?";
		Object[] params={Integer.parseInt(groupId)};
		ResultSet rs=DblHelper.executeQueryRS(sql, params);
		List<AdminAndUser> list=new ArrayList<AdminAndUser>();
		try {
			while(rs.next()){
				AdminAndUser aduser=new AdminAndUser();
				aduser.settId(rs.getInt(1));
				aduser.setAdminId(rs.getInt(2));
				aduser.setAdminName(rs.getString(3));
				aduser.setUserId(rs.getInt(4));
				aduser.setUserName(rs.getString(5));
				aduser.setGroupId(rs.getInt(6));
				list.add(aduser);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
}
