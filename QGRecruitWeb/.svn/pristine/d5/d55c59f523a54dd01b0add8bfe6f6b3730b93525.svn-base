package com.qg.BLL;
import com.qg.DAL.*;

import java.util.*;

import com.qg.model.*;
public class TestInfoBll {
	TestInfoDal dal=new TestInfoDal();
	public List<TestInfo> getAllTestInfo(){
		return dal.getAllTestInfo();
	}
	//根据组号查到对应的记录
	public List<TestInfo> getPartTestInfo(String sql,Object[] params){
		return dal.getPartTestInfo(sql,params);
	}
	
	public List<TestInfo> getPartTestFrontInfo(String sql,String[] params){
		return dal.getPartTestFrontInfo(sql, params);
	}
	
	//添加一条试题记录
	public int AddTestInfo(TestInfo testInfo){
		return dal.AddTestInfo(testInfo);
	}
	//根据testId删除一条记录
	public int deleteTestInfoById(String id){
		return dal.deleteTestInfoById(id);
	}
	
	// 根据传来的用户名，看试题表中是否存在此用户名
	public boolean isExistName(String sql, Object[] params) {
		return dal.isExistName(sql, params);
	}
	

}
