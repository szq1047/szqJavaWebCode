package com.hibtest3.biz;

import com.hibtest3.dao.CustomerLivingDAO;
import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.CustomerLivingInfo;
import com.hibtest3.entity.RoomInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class CustomerLivingBizImpl implements  CustomerLivingBiz {
    public CustomerLivingBizImpl(CustomerLivingDAO customerLivingDAO){
        this.customerLivingDAO=customerLivingDAO;
    }
    private CustomerLivingDAO customerLivingDAO;
    public void setCustomerDAO(CustomerLivingDAO customerLivingDAO) {
        this.customerLivingDAO = customerLivingDAO;
    }
    public List<CustomerLivingInfo> getCustomerLivingInfo(CustomerLivingInfo customerLivingInfos){
        //CustomerInfo customerInfo=null;
        List<CustomerLivingInfo> list=customerLivingDAO.search(customerLivingInfos);
        return list;
    }

    public void addCustomerLivingInfo(CustomerLivingInfo customerLivingInfo) {
        customerLivingDAO.addCustomerLivingInfo(customerLivingInfo);
    }
    public CustomerLivingInfo getCustomerLivingByCno(RoomInfo roomInfo, CustomerInfo customerInfo){
        return customerLivingDAO.getCustomerLivingInfoByCno(roomInfo, customerInfo);
    }
    public void updateCustomerLivingInfo(CustomerLivingInfo customerLivingInfo){
        customerLivingDAO.updateCustomerLivingInfo(customerLivingInfo);
    }
}
