package com.hibtest3.biz;

import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.CustomerLivingInfo;
import com.hibtest3.entity.RoomInfo;

import java.util.List;


/**
 * Created by Administrator on 2015/9/26.
 */
public interface CustomerLivingBiz {

    public List<CustomerLivingInfo> getCustomerLivingInfo(CustomerLivingInfo customerLivingInfo);
    public void addCustomerLivingInfo(CustomerLivingInfo customerInfo);
    public CustomerLivingInfo getCustomerLivingByCno(RoomInfo roomInfo,CustomerInfo customerInfo);
    public void updateCustomerLivingInfo(CustomerLivingInfo customerLivingInfo);
}
