package com.hibtest3.action;

import com.hibtest3.biz.RoomBiz;
import com.hibtest3.entity.RoomInfo;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class RoomAction extends BaseAction {


    public RoomBiz getRoomBiz() {
        return roomBiz;
    }

    public void setRoomBiz(RoomBiz roomBiz) {
        this.roomBiz = roomBiz;
    }

    RoomBiz roomBiz;

    public RoomInfo getRoomInfos() {
        return roomInfos;
    }

    public void setRoomInfos(RoomInfo roomInfos) {
        this.roomInfos = roomInfos;
    }

    private RoomInfo roomInfos;

    public List<RoomInfo> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<RoomInfo> roomList) {
        this.roomList = roomList;
    }

    private List<RoomInfo> roomList;

    public String getRno() {
        return Rno;
    }

    public void setRno(String rno) {
        Rno = rno;
    }

    private String Rno;

    //实现分页功能
    private int rows;//每页多少行

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    private int currentPage;//当前页
    private int pageCount;//共有多少页

    public String getRoomInfo(){
        roomBiz=serviceManager.getRoomBiz();
        ActionContext actionContext= ActionContext.getContext();
        try{
            int startIndex=(currentPage-1)*rows;
            roomList=roomBiz.getRoomInfo(roomInfos,startIndex,rows);
            pageCount=(roomBiz.rowsCount(roomInfos)-1)/rows+1;
            // System.out.println("room=========" + roomList.get(1).getRno());
            if(null!=roomList){
                actionContext.put("roomList", roomList);
                actionContext.put("pageCount",pageCount);
                //System.out.println("actionContext=========="+actionContext.get("roomList"));
            }
        }catch (Exception e){
            System.out.print("error=========="+e.getMessage());
        }
       if(roomList!=null){
           return "roomManager";
       }else{
           return "error";
       }
    }

    public String addRoomInfo(){
        System.out.println("roomInfos=="+roomInfos.getRno()+",roomRstyle="+roomInfos.getRstyle());
        roomBiz=serviceManager.getRoomBiz();
        roomBiz.addRoomInfo(roomInfos);
        return "query_roomInfo";
    }

    public String deleteRoom(){
        roomBiz=serviceManager.getRoomBiz();
        roomBiz.deleteRoomByRno(Rno);
        return "delete_success";
    }

    public String getRoomByRno(){
        System.out.println("Rno=================="+Rno);
        roomBiz=serviceManager.getRoomBiz();
        RoomInfo roomInfo=roomBiz.getRoomByRno(Rno);
        ActionContext actionContext= ActionContext.getContext();
        actionContext.put("room",roomInfo);
        return "query_roomInfoByRno";
    }

    public String updateRoomInfo(){
        roomBiz=serviceManager.getRoomBiz();
        roomBiz.updateRoomInfo(roomInfos);
        return "updateRoom";
    }
}
