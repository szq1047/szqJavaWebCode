package com.hibtest3.action;

import com.hibtest3.biz.RoomBiz;
import com.hibtest3.entity.RoomInfo;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/10/7.
 */
public class MyJson extends BaseAction{
    public String getRno() {
        return Rno;
    }

    public void setRno(String rno) {
        Rno = rno;
    }

    private String Rno;

    public RoomBiz getRoomBiz() {
        return roomBiz;
    }

    public void setRoomBiz(RoomBiz roomBiz) {
        this.roomBiz = roomBiz;
    }

    RoomBiz roomBiz;

    public List<RoomInfo> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<RoomInfo> roomList) {
        this.roomList = roomList;
    }

    private List<RoomInfo> roomList;

    public String getRoomByRnoByJson() throws Exception {
        roomList=new ArrayList<RoomInfo>();
        System.out.println("Rno=================="+Rno);
        roomBiz=serviceManager.getRoomBiz();
        RoomInfo roomInfo=roomBiz.getRoomByRno(Rno);
        roomList.add(roomInfo);
        System.out.println("roomList=============" + roomList.get(0).getRtel());
        return "success";
    }
}
