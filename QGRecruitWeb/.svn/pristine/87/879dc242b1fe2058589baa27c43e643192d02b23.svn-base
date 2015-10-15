package com.qg.BLL;

import com.qg.DAL.NotifyManageDal;
import java.util.*;
import com.qg.model.*;

public class NotifyManageBll {
	NotifyManageDal dal = new NotifyManageDal();

	// 判断是否是总组长，只有总组长才有权限发布通知
	public boolean isAdminTop(String adminName) {
		return dal.isAdminTop(adminName);
	}

	// 获得所有的通知信息
	public List<Notify> getAllNotifyInfo() {
		return dal.getAllNotifyInfo();
	}

	// 根据传过来的条数，获得部分信息
	public List<Notify> getPartNotifyInfo(String num) {
		return dal.getPartNotifyInfo(num);
	}

	// 添加一条记录
	public int AddNotifyInfo(Notify notify) {
		return dal.AddNotifyInfo(notify);
	}

	// 根据ntfId获得一条记录信息
	public Notify getSingle(String ntfId) {
		return dal.getSingle(ntfId);
	}

	// 更新一条记录
	public int updateNotifyById(Notify notify) {
		return dal.updateNotifyById(notify);
	}

	// 删除一条记录
	public int deleteNotifyById(String ntfId) {
		return dal.deleteNotifyById(ntfId);
	}

	// 返回总的页数
	public int getTotalpageNum() {
		return dal.getTotalpageNum();
	}

	// 返回总的页数
	public int getCurPage(String n) {
		return dal.getCurPage(n);
	}
	//获取分页信息
	public List<Notify> getPageDivideInfo(String n){
		return dal.getPageDivideInfo(n);
	}
}
