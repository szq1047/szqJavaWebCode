package com.hibtest3.action;

import com.hibtest3.biz.CustomerBiz;
import com.hibtest3.biz.CustomerLivingBiz;
import com.hibtest3.biz.RoomBiz;
import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.CustomerLivingInfo;
import com.hibtest3.entity.RoomInfo;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2015/10/8.
 */
public class CustomerLivingAction extends BaseAction {
    public RoomInfo getRoomInfos() {
        return roomInfos;
    }

    public void setRoomInfos(RoomInfo roomInfos) {
        this.roomInfos = roomInfos;
    }

    public CustomerInfo getCustomerInfos() {
        return customerInfos;
    }

    public void setCustomerInfos(CustomerInfo customerInfos) {
        this.customerInfos = customerInfos;
    }

    public CustomerLivingInfo getCustomerLivingInfos() {
        return customerLivingInfos;
    }

    public void setCustomerLivingInfos(CustomerLivingInfo customerLivingInfos) {
        this.customerLivingInfos = customerLivingInfos;
    }

    private RoomInfo roomInfos;
    private CustomerInfo customerInfos;
    private CustomerLivingInfo customerLivingInfos;

    public String getRno() {
        return Rno;
    }

    public void setRno(String rno) {
        Rno = rno;
    }

    public String getCno() {
        return Cno;
    }

    public void setCno(String cno) {
        Cno = cno;
    }

    private String Rno;
    private String Cno;
    public String addCustomerLiving(){
        //System.out.println("customerLivingInfos="+roomInfos.getRno());
        RoomBiz roomBiz=serviceManager.getRoomBiz();
        CustomerBiz customerBiz=serviceManager.getCustomerBiz();
        CustomerLivingBiz customerLivingBiz=serviceManager.getCustomerLivingBiz();
        RoomInfo roomInfo=roomBiz.getRoomByRno(roomInfos.getRno());
        customerLivingInfos.setRoomInfo(roomInfo);
        CustomerInfo customerInfo=customerBiz.getCustomerByCno(customerInfos.getCno());
        customerLivingInfos.setCustomerInfo(customerInfo);
        customerLivingBiz.addCustomerLivingInfo(customerLivingInfos);
        return "query_CustomerLivingInfo";
    }

    public String getCustomerLivingInfo(){
        ActionContext actionContext=ActionContext.getContext();
        CustomerLivingBiz customerLivingBiz=serviceManager.getCustomerLivingBiz();
        try{
            List<CustomerLivingInfo> customerLivingInfoList=customerLivingBiz.getCustomerLivingInfo(customerLivingInfos);
            if(null!=customerLivingInfoList){
                actionContext.put("customerLivingInfoList",customerLivingInfoList);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return "getAllCustomerLiving";
    }

    public String getCustomerLivingByCno(){
        //System.out.println(",rno=  "+roomInfos.getRno()+",cno====="+customerInfos.getCno());
        CustomerLivingBiz customerLivingBiz=serviceManager.getCustomerLivingBiz();
        CustomerBiz customerBiz=serviceManager.getCustomerBiz();
        RoomBiz roomBiz=serviceManager.getRoomBiz();
        ActionContext actionContext=ActionContext.getContext();
        try{
            RoomInfo roomInfo=roomBiz.getRoomByRno(roomInfos.getRno());
            CustomerInfo customerInfo=customerBiz.getCustomerByCno(customerInfos.getCno());
            CustomerLivingInfo customerLivingInfo=customerLivingBiz.getCustomerLivingByCno(roomInfo, customerInfo);
            if(customerLivingInfo!=null){
                actionContext.put("customerLiving",customerLivingInfo);
            }
            if(roomInfo!=null){
                actionContext.put("room",roomInfo);
            }
            if(customerInfo!=null){
                actionContext.put("customer",customerInfo);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return "query_CusLivingByCno";
    }

    //思想：先根据从jsp页面中获取的cno和rno得到其customerLivingInfo信息，在此的目的就是要将押金设为0即可，所以使用customerLivingInfo.setTdeposit(0)即可，
    //然后通过传递真个customerLivingInfo到Biz层进行修改处理
    public String CheckOutRoom(){
        CustomerLivingBiz customerLivingBiz=serviceManager.getCustomerLivingBiz();
        CustomerLivingInfo customerLivingInfo=customerLivingBiz.getCustomerLivingByCno(roomInfos, customerInfos);
        System.out.println("tmoney= "+customerLivingInfo.getTdeposit());
        customerLivingInfo.setTdeposit(BigDecimal.valueOf(0));
        try{
            customerLivingBiz.updateCustomerLivingInfo(customerLivingInfo);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return "query_checkRoom";
    }

}
