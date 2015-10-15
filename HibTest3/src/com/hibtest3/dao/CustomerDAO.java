package com.hibtest3.dao;

import com.hibtest3.entity.CustomerInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public interface CustomerDAO {
    public List search(CustomerInfo customerInfo);
    public void addCustomerInfo(CustomerInfo customerInfo);
    public CustomerInfo getCustomerInfo(String Cno);

}
