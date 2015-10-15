package com.hibtest3.action;

import com.hibtest3.biz.CustomerBiz;
import com.hibtest3.biz.RoomBiz;
import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.RoomInfo;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class CustomerAction extends BaseAction {

    public CustomerBiz getCustomerBiz() {
        return customerBiz;
    }

    public void setCustomerBiz(CustomerBiz customerBiz) {
        this.customerBiz = customerBiz;
    }

    CustomerBiz customerBiz;

    public RoomBiz getRoomBiz() {
        return roomBiz;
    }

    public void setRoomBiz(RoomBiz roomBiz) {
        this.roomBiz = roomBiz;
    }

    RoomBiz roomBiz;


    public CustomerInfo getCustomerInfos() {
        return customerInfos;
    }

    public void setCustomerInfos(CustomerInfo customerInfos) {
        this.customerInfos = customerInfos;
    }

    private CustomerInfo customerInfos;


    public List<CustomerInfo> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<CustomerInfo> customerList) {
        this.customerList = customerList;
    }

    private List<CustomerInfo> customerList;

    public String getCno() {
        return Cno;
    }

    public void setCno(String cno) {
        Cno = cno;
    }

    private String Cno;

    public String getCustomerInfo(){
        //boolean result=false;
        //List<RoomInfo> roomList=null;
        customerBiz=serviceManager.getCustomerBiz();
        ActionContext actionContext= ActionContext.getContext();
        try{
            customerList=customerBiz.getCustomerInfo(customerInfos);
           // System.out.println("room=========" + roomList.get(1).getRno());
            if(null!=customerList){
                actionContext.put("customerList", customerList);
                //System.out.println("actionContext=========="+actionContext.get("roomList"));
            }
        }catch (Exception e){
            System.out.print("error=========="+e.getMessage());
        }
       if(customerList!=null){
           return "getAllCustomer";
       }else{
           return "error";
       }
    }

    public String addCustomerInfo(){
        customerBiz=serviceManager.getCustomerBiz();
        customerBiz.addCustomerInfo(customerInfos);
        return "query_CustomerInfo";
    }

    public String getCustomerByCno(){
        customerBiz=serviceManager.getCustomerBiz();
        CustomerInfo customerInfo=customerBiz.getCustomerByCno(Cno);
        roomBiz=serviceManager.getRoomBiz();
        List<RoomInfo> roomInfolist=roomBiz.getRoomInfo("未占用");
        ActionContext actionContext= ActionContext.getContext();
        actionContext.put("customer",customerInfo);
        actionContext.put("roomlist",roomInfolist);
        return "query_CustomerByCno";
    }

}
