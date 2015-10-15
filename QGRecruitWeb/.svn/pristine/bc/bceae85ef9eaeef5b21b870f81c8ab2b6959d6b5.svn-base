package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.model.HW;

public class NewWorkPageDivide {
	private int sumRecord;//�����ܼ�¼��Ŀ
	private int rowsPerPage = 10;//����ÿҳ��ʾ�ļ�¼��
	private int totalPageNum;//�����ܵ�ҳ��	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public NewWorkPageDivide(String sql) throws Exception{
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
				HW hw = new HW();
				hw.setHwID(rs.getInt(1));
				hw.setHwTitle(rs.getString(2));
				hw.setHwAuthor(rs.getString(3));
				hw.setHwUptime(rs.getDate(4).toString());
				if(rs.getInt(5) == 1){
					hw.setGroup("网络组");
				}
				if(rs.getInt(5) == 2){
					hw.setGroup("嵌入式组");
				}
				if(rs.getInt(5) == 3){
					hw.setGroup("手游组");
				}
				if(rs.getInt(5) == 4){
					hw.setGroup("美工组");
				}
				if(rs.getInt(5) == 5){
					hw.setGroup("移动组");
				}
				hw.setHwPath(rs.getString(6));
				list.add(hw);
				rs.next();
			}
			//�ر���Դ
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
		//��ȡÿҳ��ʾ�ļ�¼��
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		//����ÿҳ��ʾ�ļ�¼��
		this.rowsPerPage = rowsPerPage;
	}
	
	//���㲢������ҳ��
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
