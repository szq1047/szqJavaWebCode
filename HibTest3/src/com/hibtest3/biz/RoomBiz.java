package com.hibtest3.biz;

import com.hibtest3.entity.RoomInfo;

import java.util.List;


/**
 * Created by Administrator on 2015/9/26.
 */
public interface RoomBiz {

    public List<RoomInfo> getRoomInfo(RoomInfo roomInfo,int startIndex,int rows);
    public List<RoomInfo> getRoomInfo(String str);
    //public boolean exists(UserInfo userInfos);
    public void addRoomInfo(RoomInfo roomInfo);
    public void deleteRoomByRno(String rno);
    //����rno���RoomInfo
    public RoomInfo getRoomByRno(String rno);
    public void updateRoomInfo(RoomInfo roomInfo);
    //��ȡRoom��Ϣ�ܵ�����
    public int  rowsCount(RoomInfo roomInfo);
}
