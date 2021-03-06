﻿package com.qg.Common;

import java.sql.*;
import java.util.*;

public class DblHelper {
	/**
	 * 	mysql数据库驱动类名称
	 */
	private static final String DRIVER="com.mysql.jdbc.Driver";
	/**
	 * url为连接字符串
	 */
	private static final String URL = "jdbc:mysql://120.25.203.158:3306/db_qgrecruitmgr";
	/**
	 * 用户名
	 */
	private static final String USERNAME = "root";
	/**
	 * 密码
	 */
	private static final String PASSWORD = "123456";
	private static Connection conn=null;
	private static PreparedStatement st=null;
	private static ResultSet rs=null;
	static{
		try{
			Class.forName(DRIVER);
		}catch(ClassNotFoundException e){
			System.out.println("加载数据驱动错误！");
			System.out.println(e.getMessage());
		}
	}
	
	//建立数据库连接
	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	/**
	 * 查询是否存在该记录
	 * @param strSql语句
	 * @param params 返回参数集，也就是带参数的PreparedStatement后的参数
	 * @return 存在返回true,不存在返回false
	 */
	public static boolean Exists(String strSql, Object[] params) {
		int cmdresult=0;
		ResultSet rs1 = null;
		try {
			rs1=DblHelper.executeQueryRS(strSql, params);
			if (rs1.next()) {
				if(rs1.getInt(1)!=0)
					cmdresult = 1;
			} 
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(rs1!=null){
				try {
					rs1.close();
				} catch (Exception e2) {
					// TODO: handle exception
					System.out.println(e2.getMessage());
				}
			}
			closeAll();
		}
		if(cmdresult==0){
			return false;
		}else{
			return true;
		}
	}

	/**
	 * 执行一条带参数的查询语句，返回查询结果ResultSet
	 * @param strSql
	 * @param params
	 * @return ResultSet
	 */
	public static ResultSet executeQueryRS(String strSql, Object[] params) {
		try {
			conn=DblHelper.getConnection();
			st = conn.prepareStatement(strSql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}
			rs = st.executeQuery();
			//return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 用于执行增加，修改，删除，如果执行成功则返回大于0的数，执行失败返回0
	 * @param strSql Sql语句
	 * @param params 参数
	 * @return result影响的条数
	 */
	
	public static int ExcuteNonQuery(String strSql,Object[] params){
		int result=0;
		try {
			conn = DblHelper.getConnection();
			st = conn.prepareStatement(strSql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i+1, params[i]);
			}
			result = st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return result;
	}
	
	/**
	 * 获得model层的Object对象
	 * Object是一个Map对象，对象中存放的是查询出的一条记录的每一个字段的信息，以键值对表示。<key,value>
	 * key表示的是字段的名称，value保存的是model对象的值，整个map的value值合起来就是一个Model层的一个对象
	 */
	public static Object getSingle(String sql,Object[] params){
		ResultSet rs1=DblHelper.executeQueryRS(sql, params);
		Map<String,Object> map=new HashMap<String,Object>();
		ResultSetMetaData rsmd=null;
		int columnCount=0;
		//Object b=new Object();
		try{
			rsmd=rs1.getMetaData();
			columnCount=rsmd.getColumnCount();
			while(rs1.next()){
				
				for(int i=1;i<=columnCount;i++){
					map.put(rsmd.getColumnLabel(i), rs.getObject(i));	
				}
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			closeAll();
		}
		return map;
	}
	
	/**
	 * 获得List<Object>对象
	 * 
	 */
	public static List<Object> getList(String sql,Object[] params){
		List<Object> list=new ArrayList<Object>();
		ResultSet resultset=executeQueryRS(sql, params);
		try {
			while(resultset.next()){
				list.add(DblHelper.getSingle(sql, params));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return list;
	}
	

	
	/**
	 * 关闭连接
	 */
	public static void closeAll(){
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		if(st!=null){
			try {
				st.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	} 
	
}
