package com.qg.Common;

import java.sql.ResultSet;
import java.sql.SQLException;
public class PageDivide {
	private int sumRecord;//总的记录数
	private int rowsPerPage = 8;//每页共有多少条记录数
	private int totalPageNum;//总页数	
	//private String strPage=null;//page参数变量
	private int curPages;//page参数内部的值，当前页数
	private ResultSet rs=null;
	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	public int getcurPage(String n){
		if(n==null || n.equals("")){
			curPages=1;
		}else{
			curPages=Integer.parseInt(n);
			if(curPages<1){
				curPages=1;
			}
		}
		return curPages;
	}
	public PageDivide(){}
	//获得总的记录数
	public PageDivide(String sql) {
		try{
			String[] params={};
			this.setRs(DblHelper.executeQueryRS(sql, params));
			rs.last();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		this.sumRecord = this.getSumRecord(rs);
		this.totalPageNum = this.getTotalPageNum(sumRecord);
	}
	
	public int getSumRecord(ResultSet rs) {
		try{
			rs.last();
			sumRecord = rs.getRow();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return sumRecord;
	}
	public ResultSet getData(String sql,int n){//n表示第几页
		//List list = new ArrayList();
		totalPageNum=this.getTotalPageNum(sumRecord);
		ResultSet rs=null;
		if(n<1)
			n = 1;
		if(n>totalPageNum)
			n = totalPageNum;
		int begin = (n-1)*rowsPerPage ;//根据传过来的页数得到该页数开始的数
		Integer[] params={begin,rowsPerPage};
		try{
			rs=DblHelper.executeQueryRS(sql, params);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return rs;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	
	//计算总的页数
	public int getTotalPageNum(int sumRecord) {
		
		if(sumRecord%rowsPerPage == 0)
			totalPageNum = sumRecord/rowsPerPage;
		else
			totalPageNum = sumRecord/rowsPerPage + 1;
		return totalPageNum;
	}

}
