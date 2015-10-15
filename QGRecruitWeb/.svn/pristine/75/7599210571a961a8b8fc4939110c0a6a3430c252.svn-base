package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.model.ZJ;

public class ZJDownPageDivide {
	private int sumRecord;
	private int rowsPerPage = 10;
	private int totalPageNum;	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	private int ad_groupid = 0;
	
	public ZJDownPageDivide(String sql,int ad_groupid) throws Exception{
		new DblHelper();
		this.ad_groupid = ad_groupid;
		conn = DblHelper.getConnection();
		try{
			this.setSql(sql);
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstmt.setInt(1, ad_groupid);
			rs = pstmt.executeQuery();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		this.sumRecord = this.getSumRecord();
		this.totalPageNum = this.getTotalPageNum();
	}
	public int getSumRecord() {
		try{
			rs = pstmt.executeQuery();
			pstmt.setInt(1, this.ad_groupid);
			rs.last();
			sumRecord = rs.getRow();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return sumRecord;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getData(int n){
		List list = new ArrayList();
		if(n<1)
			n = 1;
		if(n>totalPageNum)
			n = totalPageNum;
		int begin = (n-1)*rowsPerPage + 1;
		try{
			rs = pstmt.executeQuery();
			rs.absolute(begin);
			for(int i = 0;i<rowsPerPage&&(begin+i)<=sumRecord;i++){
				ZJ zj = new ZJ();
				zj.setWrID(rs.getInt(1));
				zj.setWrTitle(rs.getString(2));
				zj.setWrAuthor(rs.getString(3));
				zj.setWrUptime(rs.getString(4));
				if(rs.getInt(5) == 1){
					zj.setGroup("网络组");
				}
				if(rs.getInt(5) == 2){
					zj.setGroup("嵌入式组");
				}
				if(rs.getInt(5) == 3){
					zj.setGroup("手游组");
				}
				if(rs.getInt(5) == 4){
					zj.setGroup("美工组");
				}
				if(rs.getInt(5) == 5){
					zj.setGroup("移动组");
				}
				zj.setWrPath(rs.getString(6));
				list.add(zj);
				rs.next();
			}
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
			rs.close();
			pstmt.close();
			conn.close();
		}catch(SQLException ex){}
		return list;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	
	public int getTotalPageNum() {
		if(sumRecord%rowsPerPage == 0)
			totalPageNum = sumRecord/rowsPerPage;
		else
			totalPageNum = sumRecord/rowsPerPage + 1;
		return totalPageNum;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
}
