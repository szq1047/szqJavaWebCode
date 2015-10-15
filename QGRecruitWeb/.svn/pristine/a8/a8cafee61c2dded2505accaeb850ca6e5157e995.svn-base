package com.qg.BLL;
import com.qg.DAL.*;
import com.qg.model.*;
import java.util.*;

public class ResourceBll {
	ResourceDal dal=new ResourceDal();
	public List<Resource> getAllResourceInfo(){
		return dal.getAllResourceInfo();
	}
	//添加一条资源信息
	public int AddResInfo(Resource res){
		return dal.AddResInfo(res);
	}
	//删除一台哦资料信息
	public int deleteResInfoById(String id){
		return dal.deleteResInfoById(id);
	}
	//根据分组号来查资源信息
	public List<Resource> getAllResourceInfoByGroupId(int groupId){
		return dal.getAllResourceInfoByGroupId(groupId);
	}
}
