package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.DownLoadHW;

public class DownLoadHWDAL {
	public List<DownLoadHW> getHWList(int userid) throws SQLException{
		String sqlStr = "select * from downhw where user_ID = ? ";
		Object [] aa = {userid};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		 List<DownLoadHW> list = new ArrayList<DownLoadHW>();
		 while(rs.next()){
			 DownLoadHW dhw = new DownLoadHW();
			 dhw.setHw_id(rs.getInt(1));
			 dhw.setHw_title(rs.getString(2));
			 dhw.setHw_author(rs.getString(3));
			 dhw.setGroup_id(rs.getInt(4));
			 dhw.setHw_uptime(rs.getDate(5).toString());
			 dhw.setHw_path(rs.getString(6));
			 dhw.setUser_id(rs.getString(7));
			 dhw.setUsername(rs.getString(8));
			 list.add(dhw);
		 }
		return list;
	}
}
