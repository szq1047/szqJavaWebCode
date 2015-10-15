package com.hibtest3.biz;

import com.hibtest3.entity.CustomerInfo;

import java.util.List;


/**
 * Created by Administrator on 2015/9/26.
 */
public interface CustomerBiz {

    public List<CustomerInfo> getCustomerInfo(CustomerInfo customerInfo);
    public void addCustomerInfo(CustomerInfo customerInfo);
    public CustomerInfo getCustomerByCno(String cno);
}
