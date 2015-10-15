package com.qg.DAL;
import java.sql.ResultSet;
import java.util.*;

import com.qg.Common.DblHelper;
import com.qg.model.*;

public class GroupInfoDal {
	public GroupInfo getGroupInfoById(String id){
		String sql="select *from tb_group where group_ID=?";
		Integer[] params={Integer.parseInt(id)};
		GroupInfo group=new GroupInfo();
		ResultSet rs=null;
		try {
			rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				group.setGroupId(rs.getInt(1));
				group.setGroupName(rs.getString(2));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return group;
	}
	//获得所有组别信息
	public List<GroupInfo> getAllGroupInfo() {
		String sql="select *from tb_group";
		String[] params={};
		List<GroupInfo> list=new ArrayList<GroupInfo>();
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				GroupInfo group=new GroupInfo();
				group.setGroupId(rs.getInt(1));
				group.setGroupName(rs.getString(2));
				list.add(group);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
}
