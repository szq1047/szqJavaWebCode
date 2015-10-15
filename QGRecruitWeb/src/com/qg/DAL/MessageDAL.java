package com.qg.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qg.Common.DblHelper;
import com.qg.model.Message;

public class MessageDAL {
	public List<Message> getMessageList(String sql) throws SQLException{
		String sqlStr = "select * from tb_message";
		Object [] aa = {};
		ResultSet rs = DblHelper.executeQueryRS(sqlStr, aa);
		 List<Message> list = new ArrayList<Message>();
		 while(rs.next()){
			 Message message = new Message();
			 message.setMsgId(rs.getInt("msg_ID"));
			 message.setUserId(rs.getInt("user_ID"));
			 message.setMsgName(rs.getString("msg_Name"));
			 message.setMsgContent(rs.getString("msg_Content"));
			 message.setMsgPubDate(rs.getString("msg_PubDate"));
			 list.add(message);
		 }
		return list;
	}
}
