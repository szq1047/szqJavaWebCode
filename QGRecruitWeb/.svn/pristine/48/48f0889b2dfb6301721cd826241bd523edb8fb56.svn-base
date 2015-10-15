package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.HWDAL;
import com.qg.model.HW;

public class HWBLL {
	HWDAL dal = new HWDAL();
	
	public List<HW> getHWList() throws SQLException{
		return dal.getHWList();
	}
	
	public int AddHWInfo(HW hw){
		return dal.AddHWInfo(hw);
	}
	
	public int deleteNewHW(String filename,int hwid){
		return dal.deleteNewHW(filename, hwid);
	}
}
