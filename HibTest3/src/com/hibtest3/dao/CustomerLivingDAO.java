package com.hibtest3.dao;

import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.CustomerLivingInfo;
import com.hibtest3.entity.RoomInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public interface CustomerLivingDAO {
    public List search(CustomerLivingInfo customerLivingInfo);
    public void addCustomerLivingInfo(CustomerLivingInfo customerLivingInfo);
    public CustomerLivingInfo getCustomerLivingInfoByCno(RoomInfo roomInfo,CustomerInfo customerInfo);
    public void updateCustomerLivingInfo(CustomerLivingInfo customerLivingInfo);

}
