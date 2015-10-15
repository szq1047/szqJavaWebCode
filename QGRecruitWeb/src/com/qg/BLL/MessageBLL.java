package com.qg.BLL;

import java.sql.SQLException;
import java.util.List;

import com.qg.DAL.MessageDAL;
import com.qg.model.Message;

public class MessageBLL {
	MessageDAL dal = new MessageDAL();
	public List<Message> getAllNotifyInfo(String sql) throws SQLException{
		return dal.getMessageList(sql);
	}
}
