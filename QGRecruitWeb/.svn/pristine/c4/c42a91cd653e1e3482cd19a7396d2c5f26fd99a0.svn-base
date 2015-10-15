package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.qg.Common.DblHelper;

public class AdminDAL {
	public int getGroupID(String user) throws SQLException{
		String sqlStr = "select groupID from tb_admin where admin_Name = ? ";
		Object [] obj = {user};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, obj);
		if(rs.next())
			return rs.getInt(1);	
		else return 0;
	}
}
