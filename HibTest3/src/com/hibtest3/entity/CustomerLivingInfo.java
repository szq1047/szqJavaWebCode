package com.hibtest3.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2015/10/1.
 */
public class CustomerLivingInfo implements Serializable{
    private static final long serialVersionUID = 1L;
    private RoomInfo roomInfo;
    private CustomerInfo customerInfo;

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }

    public CustomerInfo getCustomerInfo() {
        return customerInfo;
    }

    public void setCustomerInfo(CustomerInfo customerInfo) {
        this.customerInfo = customerInfo;
    }



    private Date TenrollDate;

    public Date getTleftDate() {
        return TleftDate;
    }

    public void setTleftDate(Date tleftDate) {
        TleftDate = tleftDate;
    }

    public Date getTenrollDate() {
        return TenrollDate;
    }

    public void setTenrollDate(Date tenrollDate) {
        TenrollDate = tenrollDate;
    }

    private Date TleftDate;

    public BigDecimal getTdeposit() {
        return Tdeposit;
    }

    public void setTdeposit(BigDecimal tdeposit) {
        Tdeposit = tdeposit;
    }

    public BigDecimal getTmoney() {
        return Tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        Tmoney = tmoney;
    }

    private BigDecimal Tmoney;
    private BigDecimal Tdeposit;
}
