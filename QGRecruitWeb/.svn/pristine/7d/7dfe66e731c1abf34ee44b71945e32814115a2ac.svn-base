package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.BM;

public class BMDAL {
	public List<BM> getBMTableList() throws SQLException{
		String sqlStr = "select * from tb_bm where form_path not like ''";
		Object [] aa = {};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		 List<BM> list = new ArrayList<BM>();
		 while(rs.next()){
			 BM bm = new BM();
			 bm.setFormId(rs.getInt(1));
			 bm.setFormName(rs.getString(2));
			 bm.setUserID(rs.getInt(3));
			 bm.setReason(rs.getString(4));
			 bm.setGroupID(rs.getInt(5));
			 bm.setForm_Date(rs.getString(6));
			 bm.setForm_path(rs.getString(7));
			 bm.setForm_Status(rs.getString(8));
			 list.add(bm);
		 }
		return list;
	}
	
	//插入一条报名信息
	public int AddBMInfo(BM bm){
		String sql="insert into tb_bm(form_ID,form_Name,user_ID,reason,groupID,form_Date,form_path,form_status) values(?,?,?,?,?,?,?,?)";
		Object [] params={null,bm.getFormName(),bm.getUserID(),bm.getReason(),bm.getGroupID(),
				bm.getForm_Date(),bm.getForm_path(),bm.getForm_Status()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//根据报名表中的user_ID判断用户的报名信息是否已经存在
	public boolean BMIsExit(int uid){
		String sql="select * from tb_bm where user_ID = ?";
		Object [] params={uid};
		return DblHelper.Exists(sql, params);
	}
	//根据报名表中的form_ID设置报名表的审核状态
	public int LetBMPass(int formid){
		String sql="update tb_bm set form_status = '1' where form_ID = ?";
		Object [] params={formid};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//根据报名表中的form_ID获取报名表的审核状态
	public int getFormStatus(int formid) throws SQLException{
		String sql="select form_status from tb_bm where form_ID = ?";
		Object [] obj = {formid};
		ResultSet rs = DblHelper.executeQueryRS(sql, obj);
		if(rs.next()){
			return rs.getInt("form_status");
		}
		else{
			return -1;
		}
	}
	//获取根据userId获得BM信息
	public BM getBMInfoByUserId(int userId){
		String sql="select *from tb_bm where user_ID=?";
		Integer[] params={userId};
		BM bm=new BM();
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				bm.setFormId(rs.getInt(1));
				bm.setFormName(rs.getString(2));
				bm.setUserID(rs.getInt(3));
				bm.setReason(rs.getString(4));
				bm.setGroupID(rs.getInt(5));
				bm.setForm_Date(rs.getString(6));
				bm.setForm_path(rs.getString(7));
				bm.setForm_Status(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return bm;
	}	
}
