package com.hibtest3.dao;

import com.hibtest3.entity.RoomInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public interface RoomDAO {
    public List search(RoomInfo roomInfo,int startIndex,int rows);
    //计算总的行数
    public int rowsCount(RoomInfo roomInfo);
    public List search(String str);
    public void addRoomInfo(RoomInfo roomInfo);
    //public boolean exists(RoomInfo roomInfo);
    public void deleteRoomByRno(String rno);
    public RoomInfo searchByRno(String rno);
    public void updateRoomInfo(RoomInfo roomInfo);
}
