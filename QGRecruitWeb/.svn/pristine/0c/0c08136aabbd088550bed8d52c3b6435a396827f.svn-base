package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.HWFinishDAL;
import com.qg.model.HWFinish;

public class HWFinishBLL {
	HWFinishDAL dal = new HWFinishDAL();
	public List<HWFinish> getHWFList() throws SQLException{
		return dal.getHWFList();
	}
	public int AddHWFInfo(HWFinish hwf){
		return dal.AddHWFInfo(hwf);
	}
	public int deleteNewHWF(String title,int uid){
		return dal.deleteNewHWF(title, uid);
	}
}
