package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.ZJ;

public class ZJDAL {
	public List<ZJ> getZJList(String realname) throws SQLException{
		//根据周记上传人获取周记信息
		String sqlStr = "select * from tb_zj where wr_Author = ?";
		Object [] aa = {realname};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		List<ZJ> list = new ArrayList<ZJ>();
		while(rs.next()){
			ZJ zj = new ZJ();
			zj.setWrID(rs.getInt(1));
			zj.setWrTitle(rs.getString(2));
			zj.setWrAuthor(rs.getString(3));
			zj.setWrUptime(rs.getDate(4).toString());
			zj.setWrGroupID(rs.getInt(5));
			zj.setWrPath(rs.getString(6));
			list.add(zj);
		}
		return list;
	}
	//插入一条周记信息
	public int AddZJInfo(ZJ zj){
		String sql="insert into tb_zj(wr_ID,wr_Title,wr_Author,wr_PubDate,wr_groupID,wr_Path) values(?,?,?,?,?,?)";
		Object [] params={null,zj.getWrTitle(),zj.getWrAuthor(),zj.getWrUptime(),zj.getWrGroupID(),zj.getWrPath()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
}
