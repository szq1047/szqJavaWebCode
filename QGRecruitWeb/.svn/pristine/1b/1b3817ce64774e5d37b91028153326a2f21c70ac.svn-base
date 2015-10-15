package com.qg.DAL;
import java.sql.ResultSet;
import java.util.*;

import com.qg.Common.DblHelper;
import com.qg.model.*;

public class ResourceDal {
	public List<Resource> getAllResourceInfo(){
		String sql="select*from tb_res";
		String[] params={};
		List<Resource> list=new ArrayList<Resource>();
		ResultSet rs=DblHelper.executeQueryRS(sql, params);
		try {
			while(rs.next()){
				Resource res=new Resource();
				res.setInfoId(rs.getInt(1));
				res.setInfoTitle(rs.getString(2));
				res.setAdminId(rs.getInt(3));
				res.setAdminName(rs.getString(4));
				res.setInfoPubDate(rs.getString(5));
				res.setInfoGroupId(rs.getString(6));
				res.setInPath(rs.getString(7));
				list.add(res);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	
	//添加一条资源信息
	public int AddResInfo(Resource res){
		String sql="insert into tb_res(Info_Title,admin_ID,admin_Name,Info_PubDate,Info_groupID,Info_Path) values(?,?,?,?,?,?)";
		Object[] params={res.getInfoTitle(),res.getAdminId(),res.getAdminName(),res.getInfoPubDate(),res.getInfoGroupId(),res.getInPath()};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	
	//删除一条资料信息
	public int deleteResInfoById(String id){
		String sql = "delete from tb_res where Info_ID=?";
		Integer[] params = { Integer.parseInt(id) };
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	//根据分组号来查询所有资源信息
	public List<Resource> getAllResourceInfoByGroupId(int groupId){
		String sql="select*from tb_res where Info_groupID=?";
		Integer[] params={groupId};
		List<Resource> list=new ArrayList<Resource>();
		ResultSet rs=DblHelper.executeQueryRS(sql, params);
		try {
			while(rs.next()){
				Resource res=new Resource();
				res.setInfoId(rs.getInt(1));
				res.setInfoTitle(rs.getString(2));
				res.setAdminId(rs.getInt(3));
				res.setAdminName(rs.getString(4));
				res.setInfoPubDate(rs.getString(5));
				res.setInfoGroupId(rs.getString(6));
				res.setInPath(rs.getString(7));
				list.add(res);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DblHelper.closeAll();
		}
		return list;

	}
	
}
