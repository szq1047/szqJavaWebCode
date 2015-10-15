package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.HW;

public class HWDAL {
	public List<HW> getHWList() throws SQLException{
		String sqlStr = "select * from tb_hw";
		Object [] aa = {};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		List<HW> list = new ArrayList<HW>();
		while(rs.next()){
			HW hw = new HW();
			hw.setHwID(rs.getInt(1));
			hw.setHwTitle(rs.getString(2));
			hw.setHwAuthor(rs.getString(3));
			hw.setHwUptime(rs.getString(4));
			hw.setHwGroupID(rs.getInt(5));
			hw.setHwPath(rs.getString(6));
			list.add(hw);
		}
		return list;
	}
	
	//插入一条作业信息
	public int AddHWInfo(HW hw){
		String sql="insert into tb_hw(hw_ID,hw_Title,hw_Author,hw_PubDate,hw_groupID,hw_Path) values(?,?,?,?,?,?)";
		Object [] params={null,hw.getHwTitle(),hw.getHwAuthor(),hw.getHwUptime(),hw.getHwGroupID(),hw.getHwPath()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	//根据表文件名和ID号删除文件
	public int deleteNewHW(String filename,int hwid){
		String sqlStr = "delete from tb_hw where hw_ID = ? and hw_Title = ?";
		Object [] obj = {hwid,filename};
		return DblHelper.ExcuteNonQuery(sqlStr, obj);	
	}
	
}
