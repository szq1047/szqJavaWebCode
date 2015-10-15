package com.qg.DAL;

import com.qg.Common.DblHelper;
import com.qg.Common.PageDivide;

import java.util.*;

import com.qg.model.*;

import java.sql.*;

public class NotifyManageDal {
	public boolean isAdminTop(String adminName) {
		String sql = "select count(*) from tb_admin where admin_Name=? and admin_Top='1'";
		String[] params = { adminName };
		return DblHelper.Exists(sql, params);
	}

	// 获取List<Notfiy>列表
	public List<Notify> getAllNotifyInfo() {
		String sql = "select * from tb_Notify";
		List<Notify> list = null;
		Notify notify = null;
		String[] params = {};
		ResultSet rs1 = DblHelper.executeQueryRS(sql, params);

		try {
			list = new ArrayList<Notify>();
			while (rs1.next()) {
				// System.out.println("hello=="+rs1.getString("ntfTitle"));
				notify = new Notify();
				notify.setNtfId(rs1.getInt(1));
				notify.setNtfTitle(rs1.getString(2));
				notify.setNtfContent(rs1.getString(3));
				notify.setNtfPublisher(rs1.getString(4));
				notify.setNtfPubDate(rs1.getString(5));
				list.add(notify);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DblHelper.closeAll();
		}
		return list;
	}

	// 根据传递的条数，获得部分信息
	public List<Notify> getPartNotifyInfo(String num) {
		String sql = "select * from tb_Notify limit 0,?";
		List<Notify> list = null;
		Notify notify = null;
		Integer[] params = { Integer.parseInt(num) };
		ResultSet rs1 = DblHelper.executeQueryRS(sql, params);
		try {
			list = new ArrayList<Notify>();
			while (rs1.next()) {
				// System.out.println("hello=="+rs1.getString("ntfTitle"));
				notify = new Notify();
				notify.setNtfId(rs1.getInt(1));
				notify.setNtfTitle(rs1.getString(2));
				notify.setNtfContent(rs1.getString(3));
				notify.setNtfPublisher(rs1.getString(4));
				notify.setNtfPubDate(rs1.getString(5));
				list.add(notify);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DblHelper.closeAll();
		}
		return list;
	}

	// 插入一条通知信息
	public int AddNotifyInfo(Notify notify) {
		String sql = "insert into tb_notify(ntf_Title,ntf_Content,ntf_Publisher,ntf_PubDate) values(?,?,?,?)";
		String[] params = { notify.getNtfTitle(), notify.getNtfContent(),
				notify.getNtfPublisher(), notify.getNtfPubDate() };
		return DblHelper.ExcuteNonQuery(sql, params);
	}

	// 根据Id获取一条通知信息
	public Notify getSingle(String ntfId) {
		String sql = "select *from tb_notify where ntf_ID=?";
		String[] params = { ntfId };
		ResultSet rs1 = DblHelper.executeQueryRS(sql, params);
		Notify notify = null;
		try {
			notify = new Notify();
			while (rs1.next()) {
				notify.setNtfId(rs1.getInt(1));
				notify.setNtfTitle(rs1.getString(2));
				notify.setNtfContent(rs1.getString(3));
				notify.setNtfPublisher(rs1.getString(4));
				notify.setNtfPubDate(rs1.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DblHelper.closeAll();
		}
		return notify;
	}

	// 更新一条记录
	public int updateNotifyById(Notify notify) {
		String sql = "update tb_notify set ntf_Title=?,ntf_Content=?,ntf_PubDate=? where ntf_ID=?";
		String ntfId = String.valueOf(notify.getNtfId());
		// System.out.println("ntfId="+ntfId);
		String[] params = { notify.getNtfTitle(), notify.getNtfContent(),
				notify.getNtfPubDate(), ntfId };
		return DblHelper.ExcuteNonQuery(sql, params);
	}

	// 删除一条通知记录
	public int deleteNotifyById(String ntfId) {
		String sql = "delete from tb_notify where ntf_ID=?";
		String[] params = { ntfId };
		return DblHelper.ExcuteNonQuery(sql, params);
	}

	// 返回总的页数
	public int getTotalpageNum() {
		int pageNum = 0;
		try {
			String sql = "select *from tb_Notify";
			PageDivide pg = new PageDivide(sql);
			int sumRecord = pg.getSumRecord(pg.getRs());
			pageNum = pg.getTotalPageNum(sumRecord);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally{
			DblHelper.closeAll();
		}
		return pageNum;
	}
	//返回当前页数
	public int getCurPage(String n){
		PageDivide pg = new PageDivide();
		return pg.getcurPage(n);
	}
	//获取分页信息
	public List<Notify> getPageDivideInfo(String n){
		String sql="select * from tb_notify";
		PageDivide pg = new PageDivide(sql);
		String sql1="select *from tb_notify limit ?,?";
		ResultSet rs1=pg.getData(sql1, Integer.parseInt(n));
		List<Notify> list=new ArrayList<Notify>();
		try {
			while(rs1.next()){
				Notify notify=new Notify();
				notify.setNtfId(rs1.getInt(1));
				notify.setNtfTitle(rs1.getString(2));
				notify.setNtfContent(rs1.getString(3));
				notify.setNtfPublisher(rs1.getString(4));
				notify.setNtfPubDate(rs1.getString(5));
				list.add(notify);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
}
