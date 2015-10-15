package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.qg.Common.DblHelper;

public class UserDAL {
	public int getUserGroupID(String name,int uid) throws SQLException{
		String sqlStr = "select * from tb_user where reg_Name = ? and reg_ID = ?";
		Object [] obj = {name,uid};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, obj);
		if(rs.next())
			return rs.getInt("groupId");
		else
			return 0;
	}
	
	public String getUserRealName(String name,int uid) throws SQLException{
		String sqlStr = "select * from tb_user where reg_Name = ? and reg_ID = ?";
		Object [] obj = {name,uid};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, obj);
		if(rs.next())
			return rs.getString("real_Name");
		else
			return null;
	}
	
	public ResultSet getUserInfo(String name) throws SQLException{
		String sqlStr = "select * from tb_user where reg_Name = ? ";
		Object [] obj = {name};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, obj);
		if(rs.next())
			return rs;
		else
			return null;
	}
	
	public int LetBMPass(int formid){
		String sqlStr = "update tb_user set bmPass = '1' where reg_ID = (select user_ID from tb_bm where form_ID = ?)";
		Object [] params={formid};
		return DblHelper.ExcuteNonQuery(sqlStr, params);
	}
	
}
