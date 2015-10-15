package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.NewBMTable;

public class NewBMTableDAL {
	public List<NewBMTable> getAllNewBMTableinfo() throws SQLException{
		String sqlStr = "select * from tb_newbmtable";
		Object [] aa = {};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		 List<NewBMTable> list = new ArrayList<NewBMTable>();
		 while(rs.next()){
			 NewBMTable bmtb = new NewBMTable();
			 bmtb.setTb_ID(rs.getInt(1));
			 bmtb.setTb_filename(rs.getString(2));
			 bmtb.setTb_url(rs.getString(3));
			 bmtb.setUptime(rs.getDate(4).toString());
			 list.add(bmtb);
		 }
		return list;
	}
	
	//插入空报名表信息
	public int AddNewBMTableInfo(NewBMTable bmtb){
		String sql="insert into tb_newbmtable(tb_id,tb_filename,tb_url,tb_uptime) values(?,?,?,?)";
		Object [] params={null,bmtb.getTb_filename(),bmtb.getTb_url(),bmtb.getUptime()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//根据报名表文件名和ID号删除空报名信息
	public int deleteNewBMTB(String filename,int tbid){
		String sqlStr = "delete from tb_newbmtable where tb_filename = ? and tb_id = ?";
		Object [] obj = {filename,tbid};
		return DblHelper.ExcuteNonQuery(sqlStr, obj);	
	}
}
