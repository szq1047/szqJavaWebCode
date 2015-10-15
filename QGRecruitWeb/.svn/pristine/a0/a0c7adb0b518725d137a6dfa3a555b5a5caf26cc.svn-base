package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.ZJDAL;
import com.qg.model.ZJ;

public class ZJBLL {
	ZJDAL dal = new ZJDAL(); 
	public List<ZJ> getZJList(String realname) throws SQLException{
		return dal.getZJList(realname);
	}
	public int AddZJInfo(ZJ zj){
		return dal.AddZJInfo(zj);
	}
}
