package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.qg.BLL.UserBLL;
import com.qg.model.Message;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class LiuyanPageDivide {
	private int sumRecord;
	private int rowsPerPage = 6;
	private int totalPageNum;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public LiuyanPageDivide(String sql) throws Exception{
		new DblHelper();
		conn = DblHelper.getConnection();
		try{
			this.setSql(sql);
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
				int liuyan_id =  rs.getInt(1);
				int user_id = rs.getInt(2);
				String username = "";
				Object [] obj = {user_id};
				ResultSet rs1 = DblHelper.executeQueryRS("select * from tb_user where reg_ID = ?", obj);
				if(rs1.next()){
					username = rs1.getString("reg_Name");
				}
				String msg_name = rs.getString(3);
				String msg_content = rs.getString(4); 			
				Date date = rs.getTimestamp(5);
				String datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
				Message liulan = new Message();
				liulan.setMsgId(liuyan_id);;
				liulan.setUsername(username);
				liulan.setMsgName(msg_name);
				liulan.setMsgContent(msg_content);
				liulan.setMsgPubDate(datetime);
				list.add(liulan);
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
