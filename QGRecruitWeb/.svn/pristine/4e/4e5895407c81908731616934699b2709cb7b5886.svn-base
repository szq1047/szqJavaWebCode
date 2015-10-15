package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.BMDAL;
import com.qg.model.BM;

public class BMBLL {
	BMDAL dal = new BMDAL();
	public List<BM> getBMTableinfo() throws SQLException{
		return dal.getBMTableList();
	}
	
	public int AddBMInfo(BM bm){
		return dal.AddBMInfo(bm);
	}
	
	public boolean BMIsExit(int uid){
		return dal.BMIsExit(uid);
	}
	
	public int getFormStatus(int formid) throws SQLException{
		return dal.getFormStatus(formid);
	}
	
	public int LetBMPass(int formid){
		return dal.LetBMPass(formid);
	}
	
	//获得BM信息
	public BM getBMInfoByUserId(int userId){
		return dal.getBMInfoByUserId(userId);
	}
}
