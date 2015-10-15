package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.NewBMTableDAL;
import com.qg.model.NewBMTable;;

public class NewBMTableBLL {
	NewBMTableDAL dal = new NewBMTableDAL();
	public List<NewBMTable> getAllNewBMTableinfo() throws SQLException{
		return dal.getAllNewBMTableinfo();
	}
	
	public int AddNewBMTableInfo(NewBMTable bm){
		return dal.AddNewBMTableInfo(bm);
	}
	
	public int deleteNewBMTB(String filename,int tbid){
		return dal.deleteNewBMTB(filename,tbid);
	}
}
