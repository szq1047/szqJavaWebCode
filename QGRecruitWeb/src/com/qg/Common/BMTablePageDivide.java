package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.DAL.UserDAL;
import com.qg.model.BM;

public class BMTablePageDivide {
	private int sumRecord;
	private int rowsPerPage = 10;
	private int totalPageNum;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	UserDAL userdal = new UserDAL();
	
	public BMTablePageDivide(String sql) throws Exception{
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
	
	//��ȡ�ܼ�¼��
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
		int begin = (n-1)*rowsPerPage + 1;//��ȡ��Nҳ�ĵ�һ����¼��λ��
		try{
			rs = pstmt.executeQuery();
			rs.absolute(begin);//��������α궨λ����Nҳ�ĵ�һ����¼
			for(int i = 0;i<rowsPerPage&&(begin+i)<=sumRecord;i++){
				BM bmtb = new BM();
				bmtb.setFormId(rs.getInt(1));
				bmtb.setFormName(rs.getString(2));
				String sql = "select * from tb_user where reg_ID = ?";
				int uid = rs.getInt(3);
				Object [] obj = {uid};
 				ResultSet userrs = DblHelper.executeQueryRS(sql, obj);
 				if(userrs.next())
 					bmtb.setRealname(userrs.getString("real_Name"));
 				bmtb.setReason(rs.getString(4));
				if(rs.getInt(5) == 1){
					bmtb.setGroup("网络组");
				}
				if(rs.getInt(5) == 2){
					bmtb.setGroup("嵌入式组");
				}
				if(rs.getInt(5) == 3){
					bmtb.setGroup("手游组");
				}
				if(rs.getInt(5) == 4){
					bmtb.setGroup("美工组");
				}
				if(rs.getInt(5) == 5){
					bmtb.setGroup("移动组");
				}
				bmtb.setForm_Date(rs.getDate(6).toString());
				bmtb.setForm_path(rs.getString(7));
				bmtb.setForm_Status(rs.getString(8));
				list.add(bmtb);
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
