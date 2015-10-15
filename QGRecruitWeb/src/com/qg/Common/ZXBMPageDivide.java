package com.qg.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.model.ZXBMInfo;

public class ZXBMPageDivide {
	private int sumRecord;//�����ܼ�¼��Ŀ
	private int rowsPerPage = 6;//����ÿҳ��ʾ�ļ�¼��
	private int totalPageNum;//�����ܵ�ҳ��	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public ZXBMPageDivide(String sql) throws Exception{
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
				ZXBMInfo zxbm = new ZXBMInfo();
				zxbm.setForm_id(rs.getInt(1));
				zxbm.setStu_id(rs.getString(2));
				zxbm.setReg_name(rs.getString(3));
				zxbm.setReal_name(rs.getString(4));
				zxbm.setReg_gender(rs.getString(5));
				zxbm.setBirth(rs.getDate(6).toString());
				zxbm.setTel(rs.getString(7));
				zxbm.setQq(rs.getString(8));
				zxbm.setEmail(rs.getString(9));
				zxbm.setMajor(rs.getString(10));
				zxbm.setCollege(rs.getString(11));
				zxbm.set_class(rs.getString(12));
				zxbm.setReason(rs.getString(13));
				if(rs.getInt(14) == 1){
					zxbm.setGroup("网络组");
				}
				if(rs.getInt(14) == 2){
					zxbm.setGroup("嵌入式组");
				}
				if(rs.getInt(14) == 3){
					zxbm.setGroup("手游组");
				}
				if(rs.getInt(14) == 4){
					zxbm.setGroup("美工组");
				}
				if(rs.getInt(14) == 5){
					zxbm.setGroup("移动组");
				}
				list.add(zxbm);
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
