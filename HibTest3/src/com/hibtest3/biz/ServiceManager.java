package com.hibtest3.biz;

/**
 * Created by Administrator on 2015/9/29.
 */
public class ServiceManager {
    public UserBiz getUserBiz() {
        return userBiz;
    }

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }

    private UserBiz userBiz;

    public RoomBiz getRoomBiz() {
        return roomBiz;
    }

    public void setRoomBiz(RoomBiz roomBiz) {
        this.roomBiz = roomBiz;
    }

    private RoomBiz roomBiz;

    public CustomerBiz getCustomerBiz() {
        return customerBiz;
    }

    public void setCustomerBiz(CustomerBiz customerBiz) {
        this.customerBiz = customerBiz;
    }

    private CustomerBiz customerBiz;

    public CustomerLivingBiz getCustomerLivingBiz() {
        return customerLivingBiz;
    }

    public void setCustomerLivingBiz(CustomerLivingBiz customerLivingBiz) {
        this.customerLivingBiz = customerLivingBiz;
    }

    private CustomerLivingBiz customerLivingBiz;
}
