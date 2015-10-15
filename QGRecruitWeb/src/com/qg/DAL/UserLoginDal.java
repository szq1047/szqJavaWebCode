package com.qg.DAL;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.*;

public class UserLoginDal {
	public UserLoginDal() {
	}

	public boolean Exists(String name) {
		String sql = "select count(*) from tb_user where reg_Name=?";
		String[] params = { name };
		return DblHelper.Exists(sql, params);
	}

	public boolean Exists(String name, String pwd) {
		String sql = "select count(*) from tb_user where reg_Name=? and reg_Pwd=?";
		String[] params = { name, pwd };
		return DblHelper.Exists(sql, params);
	}

	public int Add(User model){
		String sql="insert into tb_user(stu_ID,reg_Name,real_Name,reg_Pwd,reg_Gender,reg_BomDate,tel_Number,qq,e_Mail,major,college,class,bmPass,testPass,isJoin) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String[] params={model.getStuId(),model.getRegName(),model.getRealName(),model.getRegPwd(),model.getRegGender(),model.getRegBomDate(),model.getTelNumber(),model.getQq(),model.geteMail(),model.getMajor(),model.getCollege(),model.getClassName(),"0","0","0"};
		return DblHelper.ExcuteNonQuery(sql, params);
	}
	//根据用户名和密码获取用户编号
	public List getUserId(String name,String pwd){
		//System.out.println("name,"+name+",pwd="+pwd);
		String sql="select reg_ID,bmPass,testPass,isJoin from tb_user where reg_Name=? and reg_Pwd=?";
		String[] params={name,pwd};
		List status=new ArrayList();
		try {
			ResultSet rs = DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				status.add(rs.getInt(1));
				status.add(rs.getString(2));
				status.add(rs.getString(3));
				status.add(rs.getString(4));
			}
			//System.out.println("regId="+status.get(0)+",bmPass="+status.get(1)+",testPass="+status.get(2)+",isJoin="+status.get(3));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return status;
	}
	
	//根据姓名修改用户的状态
	public int updateUserStatus(String name){
		String sql="update tb_user set testPass='1' where reg_Name=?";
		String params[]={name};
		int result=DblHelper.ExcuteNonQuery(sql, params);
		return result;
	}
	
	public int updateUserStatus(String sql,Object[] params){
		int result=DblHelper.ExcuteNonQuery(sql, params);
		return result;
	}
	
	//根据用户的登陆名获得是否通过考试状态
	public String getTestPassStatus(String userName){
		String sql = "select testPass from tb_user where reg_Name=? ";
		String[] params = { userName };
		String testPass = null;
		try {
			ResultSet rs = DblHelper.executeQueryRS(sql, params);
			while (rs.next()) {
				testPass=rs.getString(1);
			}
			// System.out.println("regId="+status.get(0)+",bmPass="+status.get(1)+",testPass="+status.get(2)+",isJoin="+status.get(3));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			DblHelper.closeAll();
		}
		return testPass;
	}
	
	//根据用户的登陆名获得是否通过考试状态
	public List<User> getUserInfo(String sql,Object[] params){
		List<User> list=new ArrayList<User>();
		ResultSet rs=DblHelper.executeQueryRS(sql, params);
		try {
			while(rs.next()){
				User user=new User();
				user.setRegId(rs.getInt(1));
				user.setStuId(rs.getString(2));
				user.setRegName(rs.getString(3));
				user.setRealName(rs.getString(4));
				user.setRegPwd(rs.getString(5));
				user.setRegGender(rs.getString(6));
				user.setRegBomDate(rs.getString(7));
				user.setTelNumber(rs.getString(8));
				user.setQq(rs.getString(9));
				user.seteMail(rs.getString(10));
				user.setMajor(rs.getString(11));
				user.setCollege(rs.getString(12));
				user.setClassName(rs.getString(13));
				user.setBmPass(rs.getString(14));
				user.setTestPass(rs.getString(15));
				user.setIsJoin(rs.getString(16));
				user.setGroupId(rs.getInt(17));
				list.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			DblHelper.closeAll();
		}
		return list;
	}
	//获取用户真实姓名
	public String getUserNameInfo(String sql,Object[] params){
		String str=null;
		try {
			ResultSet rs=DblHelper.executeQueryRS(sql, params);
			while(rs.next()){
				str=rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DblHelper.closeAll();
		}
		return str;
	}
	
	
}
