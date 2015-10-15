package com.hibtest3.dao;

import com.hibtest3.entity.CustomerInfo;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class CustomerDAOImpl extends DAOSupport implements CustomerDAO{

    public CustomerDAOImpl(HibernateTemplate template){
        super(template);
    }
    public List search(final CustomerInfo customerInfo) {
        return template.executeFind(
        new HibernateCallback(){
            public Object doInHibernate(Session session) throws HibernateException,SQLException{
                Criteria criteria=session.createCriteria(CustomerInfo.class);
                if(null!=customerInfo){
                    criteria.add(Example.create(customerInfo));
                }
                return criteria.list();
            }
        });
    }
    public void addCustomerInfo(CustomerInfo customerInfo){
        template.save(customerInfo);
    }
    public CustomerInfo getCustomerInfo(String Cno){
        CustomerInfo customerInfo=template.get(CustomerInfo.class, Cno);
        return customerInfo;
    }


}

