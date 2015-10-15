package com.qg.DAL;

import java.sql.ResultSet;

import com.qg.Common.DblHelper;

import java.util.*;

import com.qg.model.*;

public class TestInfoDal {
	public List<TestInfo> getAllTestInfo(){
		String sql="select * from tb_test";
		String[] params={};
		List<TestInfo> list=new ArrayList<TestInfo>();
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				TestInfo test=new TestInfo();
				test.setTestId(rs.getInt(1));
				test.setTesttypeId(rs.getInt(2));
				test.setTestPublisher(rs.getString(3));
				test.setTestPubDate(rs.getString(4));
				test.setTestPath(rs.getString(5));
				test.setTestGroupId(rs.getString(6));
				list.add(test);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	
	public List<TestInfo> getPartTestInfo(String sql,Object[] params){
		/*String sql="select * from tb_test where test_GroupID=?";
		Integer[] params={Integer.parseInt(param)};*/
		List<TestInfo> list=new ArrayList<TestInfo>();
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				TestInfo test=new TestInfo();
				test.setTestId(rs.getInt(1));
				test.setTesttypeId(rs.getInt(2));
				test.setTestPublisher(rs.getString(3));
				test.setTestPubDate(rs.getString(4));
				test.setTestPath(rs.getString(5));
				test.setTestGroupId(rs.getString(6));
				list.add(test);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	
	public List<TestInfo> getPartTestFrontInfo(String sql,String[] params){
		//String sql="select * from tb_test where test_GroupID=?";
		//Integer[] params={Integer.parseInt(param)};
		List<TestInfo> list=new ArrayList<TestInfo>();
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				TestInfo test=new TestInfo();
				test.setTestId(rs.getInt(1));
				test.setTesttypeId(rs.getInt(2));
				test.setTestPublisher(rs.getString(3));
				test.setTestPubDate(rs.getString(4));
				test.setTestPath(rs.getString(5));
				test.setTestGroupId(rs.getString(6));
				list.add(test);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	
	//添加一条试题记录
	public int AddTestInfo(TestInfo testInfo){
		String sql = "insert into tb_test(testtype_ID,test_Publisher,test_PubDate,test_Path,test_GroupID) values(?,?,?,?,?)";
		String[] params = { String.valueOf(testInfo.getTesttypeId()),testInfo.getTestPublisher(),testInfo.getTestPubDate(),testInfo.getTestPath(),testInfo.getTestGroupId()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//根据id来删除一条记录
	public int deleteTestInfoById(String id){
		String sql = "delete from tb_test where test_ID=?";
		Integer[] params = { Integer.parseInt(id) };
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//根据传来的用户名，看试题表中是否存在此用户名
	public boolean isExistName(String sql,Object[] params){
		return DblHelper.Exists(sql, params);
	}
}
