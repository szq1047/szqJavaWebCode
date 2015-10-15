package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.HWFinish;

public class HWFinishDAL {
	public List<HWFinish> getHWFList() throws SQLException{
		String sqlStr = "select * from tb_hwfinish";
		Object [] aa = {};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		List<HWFinish> list = new ArrayList<HWFinish>();
		while(rs.next()){
			HWFinish hwf = new HWFinish();
			hwf.setUserID(rs.getInt(1));
			hwf.setHwTitle(rs.getString(2));
			hwf.setUsername(rs.getString(3));
			hwf.setHwUptime(rs.getDate(4).toString());
			hwf.setHwGroupID(rs.getInt(5));
			hwf.setHwPath(rs.getString(6));
			hwf.setIsCheck(rs.getInt(7));
			list.add(hwf);
		}
		return list;
	}
	
	//插入一条作业信息
	public int AddHWFInfo(HWFinish hwf){
		String sql="insert into tb_hwfinish(userID,hw_Title,user_Name,hw_PubDate,hw_groupID,hw_Path,hw_isCheck) values(?,?,?,?,?,?,?)";
		Object [] params={hwf.getUserID(),hwf.getHwTitle(),hwf.getUsername(),
				hwf.getHwUptime(),hwf.getHwGroupID(),hwf.getHwPath(),null};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	//根据UserID和作业ID号删除文件
	public int deleteNewHWF(String title,int uid){
		String sqlStr = "delete from tb_hwfinish where userID = ? and hw_Title = ?";
		Object [] obj = {uid,title};
		return DblHelper.ExcuteNonQuery(sqlStr, obj);	
	}
}
