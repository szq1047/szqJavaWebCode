package com.qg.model;

public class Message {
	private int msgId;
	private int userId;
	private String msgName;
	private String msgContent;
	private String msgPubDate;
	private String username;
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMsgName() {
		return msgName;
	}
	public void setMsgName(String msgName) {
		this.msgName = msgName;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getMsgPubDate() {
		return msgPubDate;
	}
	public void setMsgPubDate(String msgPubDate) {
		this.msgPubDate = msgPubDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
