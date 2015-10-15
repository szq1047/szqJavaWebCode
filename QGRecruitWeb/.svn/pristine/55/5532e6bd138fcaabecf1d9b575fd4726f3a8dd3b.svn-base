package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.qg.model.HWFinish;

public class HWFDownPageDivide {
	private int sumRecord;
	private int rowsPerPage = 10;
	private int totalPageNum;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	private int adminid = 0;
	public HWFDownPageDivide(String sql,int adminid) throws Exception{
		this.adminid = adminid;
		new DblHelper();
		conn = DblHelper.getConnection();
		try{
			this.setSql(sql);
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstmt.setInt(1,adminid);
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
			pstmt.setInt(1, this.adminid);
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
				HWFinish hwf = new HWFinish();
				hwf.setUsername(rs.getString(1));;
				hwf.setHwTitle(rs.getString(2));
				hwf.setHwUptime(rs.getDate(3).toString());
				if(rs.getInt(4) == 1){
					hwf.setGroup("网络组");
				} 
				if(rs.getInt(4) == 2){
					hwf.setGroup("嵌入式组");
				}
				if(rs.getInt(4) == 3){
					hwf.setGroup("手游组"); 
				}
				if(rs.getInt(4) == 4){
					hwf.setGroup("美工组"); 
				}
				if(rs.getInt(4) == 5){
					hwf.setGroup("移动组"); 
				}
				hwf.setHwPath(rs.getString(5));
				hwf.setIsCheck(rs.getInt(6));
				list.add(hwf);
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
