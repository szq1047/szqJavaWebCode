package com.qg.BLL;
import java.util.List;

import com.qg.DAL.*;
import com.qg.model.*;

public class GroupInfoBll {
	GroupInfoDal dal=new GroupInfoDal();
	public GroupInfo getGroupInfoById(String id){
		return dal.getGroupInfoById(id);
	}
	//获得所有组别信息
	public List<GroupInfo> getAllGroupInfo() {
		return dal.getAllGroupInfo();
	}
}
