package com.hibtest3.biz;

import com.hibtest3.dao.RoomDAO;
import com.hibtest3.entity.RoomInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class RoomBizImpl implements RoomBiz {
    private RoomDAO roomDAO;
    public RoomBizImpl(RoomDAO roomDAO){
        this.roomDAO=roomDAO;
    }

    public void setUserDAO(RoomDAO roomDAO){
        this.roomDAO=roomDAO;
    }
    public List<RoomInfo> getRoomInfo(RoomInfo roomInfos,int startIndex,int rows){
        RoomInfo roomInfo=null;
        List<RoomInfo> list=roomDAO.search(roomInfos,startIndex,rows);
        //Iterator iter=list.iterator();
        //List<RoomInfo> roomList=new ArrayList<RoomInfo>();
        /*if(iter.hasNext()){
            roomInfo=(RoomInfo)iter.next();
            list.add(roomInfo);
        }*/
        return list;
    }

    public List<RoomInfo> getRoomInfo(String str){
        System.out.println("str=========="+str);
        List<RoomInfo> roomlist=roomDAO.search(str);
        return roomlist;
    }

    public void addRoomInfo(RoomInfo roomInfo){
        roomDAO.addRoomInfo(roomInfo);
    }

    public void deleteRoomByRno(String rno){
        roomDAO.deleteRoomByRno(rno);
    }
    public RoomInfo getRoomByRno(String rno){
        RoomInfo roomInfo=roomDAO.searchByRno(rno);
        return roomInfo;
    }

    public void updateRoomInfo(RoomInfo roomInfo){
        roomDAO.updateRoomInfo(roomInfo);
    }
    public int  rowsCount(RoomInfo roomInfo){return roomDAO.rowsCount(roomInfo);}
}
