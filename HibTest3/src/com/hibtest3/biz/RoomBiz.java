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
    //根据rno获得RoomInfo
    public RoomInfo getRoomByRno(String rno);
    public void updateRoomInfo(RoomInfo roomInfo);
    //获取Room信息总的行数
    public int  rowsCount(RoomInfo roomInfo);
}
