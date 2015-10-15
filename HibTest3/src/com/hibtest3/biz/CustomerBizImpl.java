package com.hibtest3.biz;

import com.hibtest3.dao.CustomerDAO;
import com.hibtest3.entity.CustomerInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class CustomerBizImpl implements  CustomerBiz {
    public CustomerBizImpl(CustomerDAO customerDAO){
        this.customerDAO=customerDAO;
    }
    private CustomerDAO customerDAO;
    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }
    public List<CustomerInfo> getCustomerInfo(CustomerInfo customerInfos){
        //CustomerInfo customerInfo=null;
        List<CustomerInfo> list=customerDAO.search(customerInfos);
        return list;
    }

    public void addCustomerInfo(CustomerInfo customerInfo){
        customerDAO.addCustomerInfo(customerInfo);
    }
    public CustomerInfo getCustomerByCno(String cno){
        return customerDAO.getCustomerInfo(cno);
    }
}
