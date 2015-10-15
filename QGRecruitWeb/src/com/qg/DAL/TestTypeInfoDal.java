package com.qg.DAL;

import java.sql.ResultSet;

import com.qg.Common.DblHelper;
import com.qg.model.*;
import java.util.*;

public class TestTypeInfoDal {
	public TestTypeInfo getAllTestTypeInfoById(String id){
		String sql="select * from tb_testtype where testType_ID=?";
		Integer[] params={Integer.parseInt(id)};
		TestTypeInfo testType=new TestTypeInfo();
		ResultSet rs=null;
		try {
			rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				testType.setTestTypeId(rs.getInt(1));
				testType.setTestTypeName(rs.getString(2));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return testType;
	}
	//获取所有的类型名称
	public List<TestTypeInfo> getAllTestTypeInfo(){
		String sql="select * from tb_testtype";
		Integer[] params={};
		List<TestTypeInfo> list=new ArrayList<TestTypeInfo>();
		ResultSet rs=null;
		try {
			rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				TestTypeInfo testType=new TestTypeInfo();
				testType.setTestTypeId(rs.getInt(1));
				testType.setTestTypeName(rs.getString(2));
				list.add(testType);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
}
